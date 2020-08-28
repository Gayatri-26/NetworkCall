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
//{
//    NSString *mainstr;
////    NSMutableArray *arrid;
////    NSMutableArray *arrname;
////    NSMutableArray *arrsalary;
////    NSMutableArray *arrage;
////    NSMutableArray *arrEmployee;
////    EmployeeDetails *arrEmployee;
//}

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestdata];
    
    self.arrEmployee = [[NSMutableArray alloc]init];
}

-(void)requestdata
{
    _mainstr = [NSString stringWithFormat:@"http://dummy.restapiexample.com/api/v1/employees"];
    //Function Pointers
    //blocks
    //callbacks
    //closures
    //returnType(^<blockName>)(parameters)
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
            [self.EmployeeDataTableView reloadData];
        }
    };
    [EmployeeDetailsVC executequery:_mainstr strpremeter:nil withblock:EmployeeListCallback];
//    [EmployeeDetailsVC executequery:_mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
//        NSLog(@"Data: %@", dbdata);
//        if (dbdata!=nil)
//        {
//            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"Response Data: %@", maindic);
//
//
//            _arrEmployee = [[NSMutableArray alloc]init];
//
//            NSDictionary *dict1 = [maindic objectForKey:@"data"];
//            for(NSDictionary *dict in dict1){
//
//               EmployeeDetails *EmpDetails = [[EmployeeDetails alloc]init];
//                NSString *strid = [dict objectForKey:@"id"];
//                EmpDetails.EmpId = strid;
//
//                NSString *strname = [dict objectForKey:@"employee_name"];
//                EmpDetails.Name = strname;
//
//                NSString *strsalary = [dict objectForKey:@"employee_salary"];
//                EmpDetails.Salary = strsalary;
//
//                 NSString *strage = [dict objectForKey:@"employee_age"];
//                EmpDetails.Age = strage;
//                [self.arrEmployee addObject:EmpDetails];
//            }
//            [self.EmployeeDataTableView reloadData];
//        }
//    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrEmployee.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EmployeeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil){

        cell = [[EmployeeDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.LblId.text = [self.arrEmployee[indexPath.row]EmpId];
    cell.LblName.text = [self.arrEmployee[indexPath.row]Name];
    cell.LblSalary.text = [self.arrEmployee[indexPath.row]Salary];
    cell.LblAge.text = [self.arrEmployee[indexPath.row]Age];
    
//    cell.LblId.text = self.arrEmployee.Id;
//    cell.LblName.text = self.arrEmployee.Name;
//    cell.LblSalary.text = self.arrEmployee.Salary;
//    cell.LblAge.text = self.arrEmployee.Age;
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  180;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
