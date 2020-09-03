//
//  PersonViewCell.h
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *Pname;
@property (weak, nonatomic) IBOutlet UILabel *Pid;
@property (weak, nonatomic) IBOutlet UILabel *Paddress;
@property (weak, nonatomic) IBOutlet UILabel *Pemail;
@property (weak, nonatomic) IBOutlet UILabel *Pgender;

@end
