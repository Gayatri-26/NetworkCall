//
//  SecondVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.

#import "SecondVC.h"
#import "PersonViewCell.h"
#import "PersonDetail.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"
#import <CoreData/CoreData.h>
#import "Json_Parsing_2-Swift.h"
#import "DatabaseHelper.h"

@interface SecondVC ()

@property (strong,nonatomic) NSMutableArray<PersonDetail *> *arrPerson;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) NSDictionary *PersonData;
@property (nonatomic,strong) AppDelegate *appDelegate;
@property( strong,nonatomic) NSManagedObjectContext *context;

@end

@implementation SecondVC
{
    UITableView *PersonDataTableView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableViewData];
    [self afnetworkingdata];
    
    self.arrPerson = [[NSMutableArray alloc]init];
  
}

-(void)tableViewData{
    
    PersonDataTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [PersonDataTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:PersonDataTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:PersonDataTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:PersonDataTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:PersonDataTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:PersonDataTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [PersonDataTableView registerClass:[PersonViewCell class] forCellReuseIdentifier:@"pcell"];
    
    PersonDataTableView.dataSource = self;
    PersonDataTableView.delegate = self;
}

-(void)afnetworkingdata{
    
    //AFNetworking
    static NSString * const BaseURLString = @"https://api.androidhive.info/contacts/";
    
    NSString *string = [NSString stringWithFormat:@"https://api.androidhive.info/contacts/", BaseURLString];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Response: %@",responseObject);
        
        _arrPerson = [PersonDetail modelArrayFromDict:responseObject];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            for (NSArray *arr in _arrPerson){
                [[DatabaseHelper sharedInstance] save];
                
                
        
            }
            [self->PersonDataTableView reloadData];
            
        });
        
   //     [self->PersonDataTableView reloadData];
        
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"Error: %@",error);
                                     }];
    
    [operation start];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrPerson.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pcell"];
    if (cell == nil) {
        cell = [[PersonViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pcell"];
    }
    PersonDetail *pDetails = _arrPerson[indexPath.row];
    cell.Pid.text = [pDetails Pid];
    cell.Pname.text = [pDetails Pname];
    cell.Pemail.text = [pDetails Pemail];
    cell.Paddress.text = [pDetails Paddress];
    cell.Pgender.text = [pDetails Pgender];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end



