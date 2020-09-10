//
//  FirstVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "FirstVC.h"
#import "EmployeeDetailsVC.h"
#import "EmployeeDetailsCell.h"
#import "EmployeeDetails.h"

@interface FirstVC ()

@property (strong,nonatomic) NSMutableArray<EmployeeDetails *> *arrEmployee;
@property (nonatomic,strong) NSString *mainstr;

@end

@implementation FirstVC
{
    UITableView *EmployeeDataTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
         [self requestdata];
    }];

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

-(void)requestdata
{
    _mainstr = [NSString stringWithFormat:@"http://dummy.restapiexample.com/api/v1/employees"];
  
    void(^EmployeeListCallback)(NSData *data, NSError *error) = ^(NSData *dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
    
            _arrEmployee = [[NSMutableArray alloc]init];
            
            NSDictionary *dict1 = [maindic objectForKey:@"data"];
            for(NSDictionary *dict in dict1){
                EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
                
                NSString *strid = [dict objectForKey:@"id"];
                EmpDetails.EmpId = strid;
                
                NSString *strname = [dict objectForKey:@"employee_name"];
                EmpDetails.Name = strname;
                
                NSString *strsalary = [dict objectForKey:@"employee_salary"];
                EmpDetails.Salary = strsalary;
                
                NSString *strage = [dict objectForKey:@"employee_age"];
                EmpDetails.Age = strage;
                
                [self.arrEmployee addObject:EmpDetails];
            }
           
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->EmployeeDataTableView reloadData];
            });
        }
    };
    dispatch_queue_t downloadData = dispatch_get_main_queue();
  
    dispatch_async(downloadData, ^{
        NSData *Ddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:_mainstr]];
        EmployeeListCallback(Ddata,nil);
    });
    
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
