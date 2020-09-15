//
//  FirstVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "FirstVC.h"
#import "EmployeeDetailsCell.h"
#import "EmployeeDetails.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import <CoreData/CoreData.h>

@interface FirstVC ()

@property (strong,nonatomic) NSMutableArray<EmployeeDetails *> *arrEmployee;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) NSDictionary *EmployeeData;

@end

@implementation FirstVC
{
    UITableView *EmployeeDataTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self afnetworkingcode];
    self.arrEmployee = [[NSMutableArray alloc]init];
    
    EmployeeDataTableView = [[UITableView alloc]init];
    [EmployeeDataTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:EmployeeDataTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [EmployeeDataTableView registerClass:[EmployeeDetailsCell class] forCellReuseIdentifier:@"ECell"];
    EmployeeDataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    EmployeeDataTableView.dataSource = self;
    EmployeeDataTableView.delegate = self;
    
}

-(void)afnetworkingcode{
    
    //AFNetworking
    static NSString * const BaseURLString = @"http://dummy.restapiexample.com/api/v1/employees";
    
    NSString *string = [NSString stringWithFormat:@"http://dummy.restapiexample.com/api/v1/employees",BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@",responseObject);
      
        self.EmployeeData = [responseObject valueForKey:@"data"];
        
        for (NSDictionary *dict in _EmployeeData)
        {
            EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
            
            NSString *strid = [dict valueForKey:@"id"];
            EmpDetails.EmpId = strid;
            
            NSString *strname = [dict valueForKey:@"employee_name"];
            EmpDetails.Name = strname;
            
            NSString *strsalary = [dict valueForKey:@"employee_salary"];
            EmpDetails.Salary = strsalary;
            
            NSString *strage = [dict valueForKey:@"employee_age"];
            EmpDetails.Age = strage;
            
            [self.arrEmployee addObject:EmpDetails];
        }
        [self->EmployeeDataTableView reloadData];
        
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"Error: %@",error);
                                     }];
    
    [operation start];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrEmployee.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EmployeeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ECell"];
    
    if (cell == nil){
        
        cell = [[EmployeeDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ECell"];
    }
    EmployeeDetails *empDetails = _arrEmployee[indexPath.row];
    cell.LblId.text = [empDetails EmpId];
    cell.LblName.text = [empDetails Name];
    cell.LblSalary.text = [empDetails Salary];
    cell.LblAge.text = [empDetails Age];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
