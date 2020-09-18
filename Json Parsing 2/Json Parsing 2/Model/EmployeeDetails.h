//
//  EmployeeDetails.h
//  Json Parsing 2
//
//  Created by Mac on 28/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EmployeeDetails : NSObject

//@property (nonatomic,strong) NSString *EmpId;
//@property (nonatomic,strong) NSString *Name;
//@property (nonatomic,strong) NSString *Salary;
//@property (nonatomic,strong) NSString *Age;

@property (strong,nonatomic) NSString *Breed;
@property (strong,nonatomic) NSString *HigherClass;
@property (strong,nonatomic) NSString *LifeSpan;
@property (strong,nonatomic) NSString *Colors;
@property (strong, nonatomic) UIImageView *img;

+(NSMutableArray < EmployeeDetails *> *)modelArrayFromDict:(NSDictionary *) d;


@end
