//
//  PersonViewCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonViewCell.h"

@implementation PersonViewCell

// @synthesize Pid, Pname, Pemail, Pgender, Paddress;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //Pid
        self.Pid = [[UILabel alloc] init];
        self.Pid.textColor = [UIColor blackColor];
        self.Pid.textAlignment = NSTextAlignmentCenter;
        self.Pid.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.Pid.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_Pid setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addSubview:self.Pid];
        
        NSLayoutConstraint *leftId = [NSLayoutConstraint constraintWithItem:_Pid attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topId = [NSLayoutConstraint constraintWithItem:_Pid attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20];
        
        NSLayoutConstraint *heightId = [NSLayoutConstraint constraintWithItem:_Pid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightId = [NSLayoutConstraint constraintWithItem:_Pid attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftId, topId, heightId, rightId]];
        
        
        //Pname
        self.Pname = [[UILabel alloc] init];
        self.Pname.textColor = [UIColor blackColor];
        self.Pname.textAlignment = NSTextAlignmentCenter;
        self.Pname.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.Pname.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_Pname setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addSubview:self.Pname];
        
        NSLayoutConstraint *leftName = [NSLayoutConstraint constraintWithItem:_Pname attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topName = [NSLayoutConstraint constraintWithItem:_Pname attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:60];
        
        NSLayoutConstraint *heightName = [NSLayoutConstraint constraintWithItem:_Pname attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightName = [NSLayoutConstraint constraintWithItem:_Pname attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftName, topName, heightName, rightName]];
        
        // Paddress
        self.Paddress = [[UILabel alloc] init];
        self.Paddress.textColor = [UIColor blackColor];
        self.Paddress.textAlignment = NSTextAlignmentCenter;
        self.Paddress.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.Paddress.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_Paddress setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.Paddress];
        
        NSLayoutConstraint *leftaddress = [NSLayoutConstraint constraintWithItem:_Paddress attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topaddress = [NSLayoutConstraint constraintWithItem:_Paddress attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:100];
        
        NSLayoutConstraint *heightaddress = [NSLayoutConstraint constraintWithItem:_Paddress attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightaddress = [NSLayoutConstraint constraintWithItem:_Paddress attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftaddress, topaddress, heightaddress, rightaddress]];
        
        // Pemail
        self.Pemail = [[UILabel alloc] init];
        self.Pemail.textColor = [UIColor blackColor];
        self.Pemail.textAlignment = NSTextAlignmentCenter;
        self.Pemail.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.Pemail.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_Pemail setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.Pemail];
        
        NSLayoutConstraint *leftemail = [NSLayoutConstraint constraintWithItem:_Pemail attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topemail = [NSLayoutConstraint constraintWithItem:_Pemail attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:140];
        
        NSLayoutConstraint *heightemail = [NSLayoutConstraint constraintWithItem:_Pemail attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightemail = [NSLayoutConstraint constraintWithItem:_Pemail attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftemail, topemail, heightemail, rightemail]];
        
        //Pgender
        self.Pgender = [[UILabel alloc] init];
        self.Pgender.textColor = [UIColor blackColor];
        self.Pgender.textAlignment = NSTextAlignmentCenter;
        self.Pgender.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.Pgender.font = [UIFont fontWithName:@"Arial" size:20.0f];
        [_Pgender setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.Pgender];
        
        NSLayoutConstraint *leftgender = [NSLayoutConstraint constraintWithItem:_Pgender attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:20];
        NSLayoutConstraint *topgender = [NSLayoutConstraint constraintWithItem:_Pgender attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:180];
        
        NSLayoutConstraint *heightgender = [NSLayoutConstraint constraintWithItem:_Pgender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightgender = [NSLayoutConstraint constraintWithItem:_Pgender attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftgender, topgender, heightgender, rightgender]];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
