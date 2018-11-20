//
//  LeakVC1.m
//  APMExample
//
//  Created by cheng on 2018/8/30.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "LeakVC1.h"
#import "APMMemoryManager.h"

@interface LeakVC1 ()
@property (nonatomic, strong) UIViewController *vc;

@end

@implementation LeakVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.vc = self;
    
    [[APMMemoryManager sharedInstance] trackObject:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
