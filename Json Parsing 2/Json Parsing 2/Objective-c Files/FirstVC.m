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
    [self requestdata];
    
    self.arrEmployee = [[NSMutableArray alloc]init];
    
    EmployeeDataTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:EmployeeDataTableView];
    
    [EmployeeDataTableView registerClass:[EmployeeDetailsCell class] forCellReuseIdentifier:@"EmployeeDetailsCell"];
    EmployeeDataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    EmployeeDataTableView.dataSource = self;
    EmployeeDataTableView.delegate = self;
    
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
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->EmployeeDataTableView reloadData];
            });
            
        }
    };
    //    dispatch_queue_t gayatri = dispatch_queue_create("download.data", NULL);
    dispatch_queue_t gayatri = dispatch_get_main_queue();
    
    dispatch_async(gayatri, ^{
        NSData *Ddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:_mainstr]];
        EmployeeListCallback(Ddata,nil);
    });
    //    NSData *Ddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:_mainstr]];
    //    EmployeeListCallback(Ddata,nil);
    
    //    [EmployeeDetailsVC executequery:_mainstr strpremeter:nil withblock:EmployeeListCallback];
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
    //            [self->EmployeeDataTableView reloadData];
    //        }
    //    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrEmployee.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EmployeeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EmployeeDetailsCell"];
    
    if (cell == nil){
        
        cell = [[EmployeeDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"EmployeeDetailsCell"];
    }
    cell.LblId.text = [self.arrEmployee[indexPath.row]EmpId];
    cell.LblName.text = [self.arrEmployee[indexPath.row]Name];
    cell.LblSalary.text = [self.arrEmployee[indexPath.row]Salary];
    cell.LblAge.text = [self.arrEmployee[indexPath.row]Age];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
