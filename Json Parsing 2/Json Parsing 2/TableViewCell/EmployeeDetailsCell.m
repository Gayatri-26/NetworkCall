//
//  EmployeeDetailsCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "EmployeeDetailsCell.h"

@implementation EmployeeDetailsCell

@synthesize LblId,LblName,LblAge,LblSalary,view;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // configure control(s)
        self.LblId = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 395, 25)];
        self.LblId.textColor = [UIColor blackColor];
        self.LblId.textAlignment = NSTextAlignmentCenter;
        self.LblId.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblId.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [self addSubview:self.LblId];
        
        self.LblName = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 395, 25)];
        self.LblName.textColor = [UIColor blackColor];
        self.LblName.textAlignment = NSTextAlignmentCenter;
        self.LblName.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [self addSubview:self.LblName];
        
        self.LblAge = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 395, 25)];
        self.LblAge.textColor = [UIColor blackColor];
        self.LblAge.textAlignment = NSTextAlignmentCenter;
        self.LblAge.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblName.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [self addSubview:self.LblAge];
        
        self.LblSalary = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, 395, 25)];
        self.LblSalary.textColor = [UIColor blackColor];
        self.LblSalary.textAlignment = NSTextAlignmentCenter;
        self.LblSalary.backgroundColor = [UIColor colorWithRed:241.0/255.0 green:255.0/255.0 blue:228.0/255.0 alpha:1];
        self.LblSalary.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [self addSubview:self.LblSalary];
        
        self.view = [[UIView alloc] initWithFrame:CGRectMake(10, 155, 395, 1)];
        self.view.backgroundColor = [UIColor blackColor];
        [self addSubview:self.view];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
