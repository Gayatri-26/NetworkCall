//
//  EmployeeDetailsCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetailsCell.h"

@implementation EmployeeDetailsCell

//@synthesize _LblId, LblName, LblAge, LblSalary;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //Image
         self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 30, 100, 100)];
        [_imageview setImage:[UIImage imageNamed:@"7EE509HU_330x370.jpg"]];
        [_imageview setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.imageview];
        
        //LblId
        self.LblId = [[UILabel alloc] init];
        self.LblId.textColor = [UIColor blackColor];
        self.LblId.textAlignment = NSTextAlignmentCenter;
        self.LblId.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblId.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_LblId setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self addSubview:self.LblId];
        
        NSLayoutConstraint *leftId = [NSLayoutConstraint constraintWithItem:_LblId attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:120];
        NSLayoutConstraint *topId = [NSLayoutConstraint constraintWithItem:_LblId attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20];

        NSLayoutConstraint *heightId = [NSLayoutConstraint constraintWithItem:_LblId attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightId = [NSLayoutConstraint constraintWithItem:_LblId attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];

        [self addConstraints:@[leftId, topId, heightId, rightId]];

        //LblName
        self.LblName = [[UILabel alloc] init];
        self.LblName.textColor = [UIColor blackColor];
        self.LblName.textAlignment = NSTextAlignmentCenter;
        self.LblName.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_LblName setTranslatesAutoresizingMaskIntoConstraints:NO];

        [self addSubview:self.LblName];
        
        NSLayoutConstraint *leftName = [NSLayoutConstraint constraintWithItem:_LblName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:120];
        NSLayoutConstraint *topName = [NSLayoutConstraint constraintWithItem:_LblName attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:60];
        
        NSLayoutConstraint *heightName = [NSLayoutConstraint constraintWithItem:_LblName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightName = [NSLayoutConstraint constraintWithItem:_LblName attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftName, topName, heightName, rightName]];

        //LblAge
        self.LblAge = [[UILabel alloc] init];
        self.LblAge.textColor = [UIColor blackColor];
        self.LblAge.textAlignment = NSTextAlignmentCenter;
        self.LblAge.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_LblAge setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.LblAge];
        
        NSLayoutConstraint *leftAge = [NSLayoutConstraint constraintWithItem:_LblAge attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:120];
        NSLayoutConstraint *topAge = [NSLayoutConstraint constraintWithItem:_LblAge attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:100];
        
        NSLayoutConstraint *heightAge = [NSLayoutConstraint constraintWithItem:_LblAge attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightAge = [NSLayoutConstraint constraintWithItem:_LblAge attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftAge, topAge, heightAge, rightAge]];
        
        //salary
        self.LblSalary = [[UILabel alloc] init];
        self.LblSalary.textColor = [UIColor blackColor];
        self.LblSalary.textAlignment = NSTextAlignmentCenter;
        self.LblSalary.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblSalary.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_LblSalary setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.LblSalary];
   
        NSLayoutConstraint *leftSalary = [NSLayoutConstraint constraintWithItem:_LblSalary attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:120];
        NSLayoutConstraint *topSalary = [NSLayoutConstraint constraintWithItem:_LblSalary attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:140];
        
        NSLayoutConstraint *heightSalary = [NSLayoutConstraint constraintWithItem:_LblSalary attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightSalary = [NSLayoutConstraint constraintWithItem:_LblSalary attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftSalary, topSalary, heightSalary, rightSalary]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
