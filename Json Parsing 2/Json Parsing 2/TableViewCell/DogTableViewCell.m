//
//  DogTableViewCell.m
//  Json Parsing 2
//
//  Created by Mac on 17/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogTableViewCell.h"


@implementation DogTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
   {
       self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
       if (self) {
           // configure control(s)
           self.Dbreed = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 395, 25)];
           self.Dbreed.textColor = [UIColor blackColor];
           self.Dbreed.textAlignment = NSTextAlignmentCenter;
           self.Dbreed.backgroundColor = [UIColor lightGrayColor];
           self.Dbreed.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dbreed];
           
           self.DTemperament = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 395, 25)];
           self.DTemperament.textColor = [UIColor blackColor];
           self.DTemperament.textAlignment = NSTextAlignmentCenter;
           self.DTemperament.backgroundColor = [UIColor lightGrayColor];
           self.DTemperament.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.DTemperament];
           
       }
            return self;
       }

           - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
               [super setSelected:selected animated:animated];

           }

           @end

