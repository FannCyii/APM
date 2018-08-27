//
//  FPSTableViewCell.m
//  APMExample
//
//  Created by cheng on 2018/8/27.
//  Copyright © 2018年 cheng. All rights reserved.
//

#import "FPSTableViewCell.h"

@interface FPSTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *aTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *aContentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *aImageView;


@end

@implementation FPSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellData
{
    self.aContentLabel.text = @"这是标题标题";
    self.aContentLabel.layer.cornerRadius = 10;
    self.aContentLabel.layer.masksToBounds = YES;
    self.aContentLabel.layer.shadowOffset = CGSizeMake(10, 10);
    self.aContentLabel.layer.shadowColor = [UIColor blueColor].CGColor;
    self.aContentLabel.layer.shadowOpacity = 1;
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"longmao2" ofType:@"jpg"];
    self.aImageView.image = [UIImage imageWithContentsOfFile:imagePath];
    
    for (int i = 0; i < 100; i++) {
        NSLog(@"%@",@(i));
//        [self.contentView class];
    }
}

@end
