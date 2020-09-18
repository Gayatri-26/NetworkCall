//
//  DogTableViewCell.m
//  Json Parsing 2
//
//  Created by Mac on 18/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogTableViewCell.h"

@implementation DogTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //Image
        self.imgview = [[UIImageView alloc]initWithFrame:CGRectMake(10, 37, 130, 130)];
        [_imgview setImage:[UIImage imageNamed:@"7EE509HU_330x370.jpg"]];
        [_imgview setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:self.imgview];
        
        //Breed
        self.breed = [[UILabel alloc] init];
        self.breed.textColor = [UIColor blackColor];
        self.breed.textAlignment = NSTextAlignmentCenter;
        self.breed.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.breed.font = [UIFont fontWithName:@"Arial" size:19.0f];
        [_breed setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addSubview:self.breed];
        
        NSLayoutConstraint *leftbreed = [NSLayoutConstraint constraintWithItem:_breed attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:140];
        NSLayoutConstraint *topbreed = [NSLayoutConstraint constraintWithItem:_breed attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:20];
        
        NSLayoutConstraint *heightbreed = [NSLayoutConstraint constraintWithItem:_breed attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightbreed = [NSLayoutConstraint constraintWithItem:_breed attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftbreed, topbreed, heightbreed, rightbreed]];
        
        
        //HigherClassification
        self.highclass = [[UILabel alloc] init];
        self.highclass.textColor = [UIColor blackColor];
        self.highclass.textAlignment = NSTextAlignmentCenter;
        self.highclass.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.highclass.font = [UIFont fontWithName:@"Arial" size:19.0f];
        [_highclass setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [self addSubview:self.highclass];
        
        NSLayoutConstraint *lefthighclass = [NSLayoutConstraint constraintWithItem:_highclass attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:140];
        NSLayoutConstraint *tophighclass = [NSLayoutConstraint constraintWithItem:_highclass attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:60];
        
        NSLayoutConstraint *heighthighclass = [NSLayoutConstraint constraintWithItem:_highclass attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *righthighclass = [NSLayoutConstraint constraintWithItem:_highclass attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[lefthighclass, tophighclass, heighthighclass, righthighclass]];
        
        //LifeSpam
        self.lifespam = [[UILabel alloc] init];
        self.lifespam.textColor = [UIColor blackColor];
        self.lifespam.textAlignment = NSTextAlignmentCenter;
        self.lifespam.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.lifespam.font = [UIFont fontWithName:@"Arial" size:19.0f];
        [_lifespam setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.lifespam];
        
        NSLayoutConstraint *leftlifespam = [NSLayoutConstraint constraintWithItem:_lifespam attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:140];
        NSLayoutConstraint *toplifespam = [NSLayoutConstraint constraintWithItem:_lifespam attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:100];
        
        NSLayoutConstraint *heightlifespam = [NSLayoutConstraint constraintWithItem:_lifespam attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:25];
        NSLayoutConstraint *rightlifespam = [NSLayoutConstraint constraintWithItem:_lifespam attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftlifespam, toplifespam, heightlifespam, rightlifespam]];
        
        //Colors
        self.colors = [[UILabel alloc] init];
        self.colors.textColor = [UIColor blackColor];
        self.colors.textAlignment = NSTextAlignmentCenter;
        self.colors.numberOfLines = 0;
        self.colors.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:228.0/255.0 blue:238.0/255.0 alpha:1];
        self.colors.font = [UIFont fontWithName:@"Arial" size:19.0f];
        [_colors setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.colors];
        
        NSLayoutConstraint *leftcolors = [NSLayoutConstraint constraintWithItem:_colors attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:140];
        NSLayoutConstraint *topcolors = [NSLayoutConstraint constraintWithItem:_colors attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:140];
        
        NSLayoutConstraint *rightcolors = [NSLayoutConstraint constraintWithItem:_colors attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1 constant:-20];
        
        [self addConstraints:@[leftcolors, topcolors, rightcolors]];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
