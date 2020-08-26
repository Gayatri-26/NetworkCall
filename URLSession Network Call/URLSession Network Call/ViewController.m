//
//  ViewController.m
//  URLSession Network Call
//
//  Created by Mac on 26/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "ViewController.h"
#import "EmployeeDetailsVC.h"
#import "EmployeeDetailCell.h"

@interface ViewController ()
{
    NSString *mainstr;
    NSMutableArray *arrid;
    NSMutableArray *arrname;
    NSMutableArray *arrsalary;
    NSMutableArray *arrage;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestdata];
}

-(void)requestdata
{
    mainstr = [NSString stringWithFormat:@"http://dummy.restapiexample.com/api/v1/employees"];
    
    [EmployeeDetailsVC executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
            arrid = [[NSMutableArray alloc]init];
            arrname = [[NSMutableArray alloc]init];
            arrsalary = [[NSMutableArray alloc]init];
            arrage = [[NSMutableArray alloc]init];
            
            NSDictionary *dict1 = [maindic objectForKey:@"data"];
            for(NSDictionary *dict in dict1){
                
                NSString *strid = [dict objectForKey:@"id"];
                [arrid addObject:strid];
                NSLog(@"StrID : %@",strid);
                
                NSString *strname = [dict objectForKey:@"employee_name"];
                [arrname addObject:strname];
                NSLog(@"StrName : %@",strname);
                
                NSString *strsalary = [dict objectForKey:@"employee_salary"];
                [arrsalary addObject:strsalary];
                NSLog(@"StrSalary : %@",strsalary);
                
                NSString *strage = [dict objectForKey:@"employee_age"];
                [arrage addObject:strage];
                NSLog(@"StrAge : %@",strage);
                
            }
            [self.EmployeeDataTableView reloadData];
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrid.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    EmployeeDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil){
        
        cell = [[EmployeeDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.LblId.text = arrid[indexPath.row];
    cell.LblName.text = arrname[indexPath.row];
    cell.LblSalary.text = arrsalary[indexPath.row];
    cell.LblAge.text = arrage[indexPath.row];
    
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
