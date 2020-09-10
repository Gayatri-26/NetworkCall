//
//  PersonViewCell.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonViewCell.h"

    @implementation PersonViewCell

    @synthesize Pid, Pname, Pemail, Pgender, Paddress;

    - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        if (self) {
            // configure control(s)
            self.Pid = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 395, 25)];
            self.Pid.textColor = [UIColor blackColor];
            self.Pid.textAlignment = NSTextAlignmentCenter;
            self.Pid.backgroundColor = [UIColor lightGrayColor];
            self.Pid.font = [UIFont fontWithName:@"Arial" size:20.0f];
            [self addSubview:self.Pid];
            
            self.Pname = [[UILabel alloc] initWithFrame:CGRectMake(10, 45, 395, 25)];
            self.Pname.textColor = [UIColor blackColor];
            self.Pname.textAlignment = NSTextAlignmentCenter;
            self.Pname.backgroundColor = [UIColor lightGrayColor];
            self.Pname.font = [UIFont fontWithName:@"Arial" size:20.0f];
            [self addSubview:self.Pname];
            
            self.Pemail = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 395, 25)];
            self.Pemail.textColor = [UIColor blackColor];
            self.Pemail.textAlignment = NSTextAlignmentCenter;
            self.Pemail.backgroundColor = [UIColor lightGrayColor];
            self.Pemail.font = [UIFont fontWithName:@"Arial" size:20.0f];
            [self addSubview:self.Pemail];
            
            self.Paddress = [[UILabel alloc] initWithFrame:CGRectMake(10, 115, 395, 25)];
            self.Paddress.textColor = [UIColor blackColor];
            self.Paddress.textAlignment = NSTextAlignmentCenter;
            self.Paddress.backgroundColor = [UIColor lightGrayColor];
            self.Paddress.font = [UIFont fontWithName:@"Arial" size:20.0f];
            [self addSubview:self.Paddress];
            
            self.Pgender = [[UILabel alloc] initWithFrame:CGRectMake(10, 145, 395, 25)];
            self.Pgender.textColor = [UIColor blackColor];
            self.Pgender.textAlignment = NSTextAlignmentCenter;
            self.Pgender.backgroundColor = [UIColor lightGrayColor];
            self.Pgender.font = [UIFont fontWithName:@"Arial" size:20.0f];
            [self addSubview:self.Pgender];
        }
       
        return self;
    }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
