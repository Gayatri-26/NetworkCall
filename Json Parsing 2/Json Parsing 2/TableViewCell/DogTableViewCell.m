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
          // self.Dbreed.backgroundColor = [UIColor lightGrayColor];
           self.Dbreed.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dbreed];
           
           self.Dtemperament = [[UILabel alloc] initWithFrame:CGRectMake(10, 25, 395, 25)];
           self.Dtemperament.textColor = [UIColor blackColor];
           self.Dtemperament.textAlignment = NSTextAlignmentCenter;
         //  self.Dtemperament.backgroundColor = [UIColor lightGrayColor];
           self.Dtemperament.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dtemperament];
           
           self.Dweight = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 395, 25)];
           self.Dweight.textColor = [UIColor blackColor];
           self.Dweight.textAlignment = NSTextAlignmentCenter;
         //  self.Dweight.backgroundColor = [UIColor lightGrayColor];
           self.Dweight.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dweight];
           
           self.Dheight = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 395, 25)];
           self.Dheight.textColor = [UIColor blackColor];
           self.Dheight.textAlignment = NSTextAlignmentCenter;
        //   self.Dheight.backgroundColor = [UIColor lightGrayColor];
           self.Dheight.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dbreed];
           
           self.Dcolors = [[UILabel alloc] initWithFrame:CGRectMake(10, 85, 395, 25)];
           self.Dcolors.textColor = [UIColor blackColor];
           self.Dcolors.textAlignment = NSTextAlignmentCenter;
        //   self.Dcolors.backgroundColor = [UIColor lightGrayColor];
           self.Dcolors.font = [UIFont fontWithName:@"Arial" size:20.0f];
           [self addSubview:self.Dcolors];
           
//           self.Dimage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 395, 25)];
//           [_Dimage 
//           [self addSubview:self.Dimage];
           
       }
            return self;
       }

           - (void)setSelected:(BOOL)selected animated:(BOOL)animated {
               [super setSelected:selected animated:animated];

           }

           @end

