//
//  KIVFPSManager.m
//  AppPerformanceManagement
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "KIVFPSManager.h"
#import <UIKit/UIKit.h>

@interface KIVFPSManager ()
@property(nonatomic, strong)CADisplayLink *displayLink;
@property(nonatomic, assign, readwrite) NSInteger fps;

@property(nonatomic, assign)NSInteger refreshCount;
@property(nonatomic, assign)CFTimeInterval allRefreshDurationTime;

@property(nonatomic, strong)UILabel *fpsLabel;

@end

@implementation KIVFPSManager

+ (instancetype)sharedInstence{
    static KIVFPSManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KIVFPSManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (CADisplayLink *)displayLink{
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayLinkAction:)];
    }
    return _displayLink;
}

- (UILabel *)fpsLabel{
    if(!_fpsLabel){
        _fpsLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 100, 50, 20)];
        _fpsLabel.textColor = [UIColor blackColor];
        _fpsLabel.font = [UIFont systemFontOfSize:12];
        _fpsLabel.textAlignment = NSTextAlignmentCenter;
        _fpsLabel.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.6];
    }
    return _fpsLabel;
}

#pragma mark - Actions
- (void)displayLinkAction:(CADisplayLink *)aDisplaylink{
    self.refreshCount++;
    if(self.allRefreshDurationTime == 0){
        self.allRefreshDurationTime = aDisplaylink.timestamp;
        return;
    }
    
    if (self.allRefreshDurationTime >= 1) {
        self.fps = ceil(self.refreshCount/(aDisplaylink.timestamp - self.allRefreshDurationTime));
        self.fpsLabel.text  = [NSString stringWithFormat:@"%@",@(self.fps)];
        self.refreshCount = 0;
        self.allRefreshDurationTime = aDisplaylink.timestamp;
    }
}

- (void)setShowFPSLabel:(BOOL)showFPSLabel{
    _showFPSLabel = showFPSLabel;
    if (showFPSLabel) {
        if (!self.fpsLabel.superview) {
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            [keyWindow addSubview:self.fpsLabel];
        }
    }else{
        [self.fpsLabel removeFromSuperview];
    }
}

@end
