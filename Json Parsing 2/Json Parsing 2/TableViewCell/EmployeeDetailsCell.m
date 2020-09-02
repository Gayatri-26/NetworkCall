//
//  EmployeeDetailsCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetailsCell.h"

@implementation EmployeeDetailsCell

@synthesize LblId,LblName,LblAge,LblSalary,Lbl1;

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //First way
        UILabel *LblSalary = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, 200, 20)];
        LblSalary.textAlignment = NSTextAlignmentCenter;
//        LblSalary.text = @"Description";
        LblSalary.backgroundColor = [UIColor cyanColor];
        LblSalary.textColor = [UIColor blackColor];
        LblSalary.adjustsFontSizeToFitWidth = YES;
        [LblSalary setTranslatesAutoresizingMaskIntoConstraints:YES];
        LblSalary.clipsToBounds = YES;
        [self addSubview:LblSalary];
    
    //Second Way
        UILabel *Lbl1 = [UILabel new];
        Lbl1.numberOfLines = 0;
        Lbl1.lineBreakMode = NSLineBreakByWordWrapping;
//        [Lbl1 sizeToFit];
        Lbl1.textAlignment = NSTextAlignmentCenter;
        Lbl1.backgroundColor = [UIColor lightGrayColor];
        Lbl1.textColor = [UIColor blackColor];
        [Lbl1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
        [self addSubview:Lbl1];
    
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:Lbl1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:Lbl1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:100];
    
        NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:Lbl1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:20];
        NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:Lbl1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:350];
    
        [self addConstraints:@[left, top]];
        [Lbl1 addConstraints:@[height, width]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
