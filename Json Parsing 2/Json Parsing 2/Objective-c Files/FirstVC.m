//
//  FirstVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "FirstVC.h"
#import "EmployeeDetailsCell.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import <CoreData/CoreData.h>
#import "Employee+CoreDataClass.h"
#import "DataBase.h"
#import "Json_Parsing_2-Swift.h"


@interface FirstVC ()

@property (strong,nonatomic) NSMutableArray<Employee *> *arrEmployee;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) AppDelegate *appDelegate;

@end

@implementation FirstVC
{
    UITableView *EmployeeDataTableView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self tableviewData];
    [self afnetworkingcode];
    self.arrEmployee = [[NSMutableArray alloc]init];
}

-(void)tableviewData{
    
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

    NSString *string = [NSString stringWithFormat:@"http://dummy.restapiexample.com/api/v1/employees"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@",responseObject);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSArray *responsearr = [responseObject objectForKey:@"data"];
            
            for (NSDictionary *arr in responsearr){
                
                BOOL isPresent = [[DataBase sharedInstance] isEmpPresentInDB:arr];
                
                if (isPresent == NO) {
                    
                [[DataBase sharedInstance] saveData:arr];

                }
            }
            _arrEmployee = [NSMutableArray arrayWithArray:[[DataBase sharedInstance]getEmployeedb]];
            
            [self->EmployeeDataTableView reloadData];
            
        });
        
    }
        failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@",error);
         _arrEmployee = [NSMutableArray arrayWithArray:[[DataBase sharedInstance]getEmployeedb]];
         [self->EmployeeDataTableView reloadData];
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
    if ([self.arrEmployee count]>0)
    {
        Employee *empDetails = _arrEmployee[indexPath.row];
        cell.LblId.text = [empDetails empId];
        cell.LblName.text = [empDetails name];
        cell.LblSalary.text = [empDetails salary];
        cell.LblAge.text = [empDetails age];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 165;
}


@end
