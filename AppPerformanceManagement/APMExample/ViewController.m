//
//  ViewController.m
//  APMExample
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "ViewController.h"
#import "APMConfig.h"

@interface ViewController ()
@property(nonatomic, strong)APMConfig *ampManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ampManager = [APMConfig sharedInstence];
    self.ampManager.showFPS = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
