//
//  EmployeeDetailsCell.h
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeDetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *LblId;
@property (weak, nonatomic) IBOutlet UILabel *LblName;
@property (weak, nonatomic) IBOutlet UILabel *LblSalary;
@property (weak, nonatomic) IBOutlet UILabel *LblAge;

@end
