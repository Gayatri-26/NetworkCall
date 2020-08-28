//
//  EmployeeDetailsCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetailsCell.h"

@implementation EmployeeDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];

    UILabel *LblId = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 0, 0)];
    LblId.textAlignment = NSTextAlignmentCenter;
    LblId.textColor = [UIColor blackColor];
    LblId.adjustsFontSizeToFitWidth = YES;
    LblId.adjustsLetterSpacingToFitWidth = YES;
    LblId.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
