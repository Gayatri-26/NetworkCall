//
//  SecondVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.

#import "SecondVC.h"
#import "PersonViewController.h"
#import "PersonViewCell.h"
#import "PersonDetail.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"



@interface SecondVC ()

@property (strong,nonatomic) NSMutableArray<PersonDetail *> *arrPerson;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) NSDictionary *PersonData;

@end

@implementation SecondVC
{
    UITableView *PersonDataTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self requestdata];
    [self afnetworkingdata];
    
    self.arrPerson = [[NSMutableArray alloc]init];
    
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

-(void)requestdata
{
    _mainstr = [NSString stringWithFormat:@"https://api.androidhive.info/contacts/"];

    //  [PersonViewController executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
    void(^PersonListCallback)(NSData *data, NSError *error) = ^(NSData *dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);

            _arrPerson = [[NSMutableArray alloc]init];

            NSDictionary *dic1 = [maindic objectForKey:@"contacts"];
            for (NSDictionary *dict in dic1)
            {
                PersonDetail *PersonDet = [[PersonDetail alloc]init];
                NSString *strid = [dict objectForKey:@"id"];
                PersonDet.Pid = strid;

                NSString *strname = [dict objectForKey:@"name"];
                PersonDet.Pname = strname;

                NSString *stremail = [dict objectForKey:@"email"];
                PersonDet.Pemail= stremail;

                NSString *straddress = [dict objectForKey:@"address"];
                PersonDet.Paddress = straddress;

                NSString *strgender = [dict objectForKey:@"gender"];
                PersonDet.Pgender = strgender;

                [self.arrPerson addObject:PersonDet];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->PersonDataTableView reloadData];
            });
        }
    };
    //    dispatch_queue_t gayatri = dispatch_queue_create("download.data", NULL);
    dispatch_queue_t sonali = dispatch_get_main_queue();

    dispatch_async(sonali, ^{
        NSData *Ddata = [NSData dataWithContentsOfURL:[NSURL URLWithString:_mainstr]];
        PersonListCallback(Ddata, nil);
    });
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
    cell.Pid.text = [self.arrPerson[indexPath.row]Pid];
    cell.Pname.text = [self.arrPerson[indexPath.row]Pname];
    cell.Pemail.text = [self.arrPerson[indexPath.row]Pemail];
    cell.Paddress.text = [self.arrPerson[indexPath.row]Paddress];
    cell.Pgender.text = [self.arrPerson[indexPath.row]Pgender];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 230;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
       
//        self.PersonData = (NSDictionary *)responseObject;
        NSLog(@"Response: %@",responseObject);
//        _arrPerson = [[NSMutableArray alloc]initWithArray:responseObject];
        [self->PersonDataTableView reloadData];
        
//        NSDictionary *maindic = [[NSMutableArray alloc]init];
//         NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
//        NSLog(@"Response Data: %@", maindic);
//        _arrPerson = [[NSMutableArray alloc]init];
        self.PersonData = [responseObject valueForKey:@"contacts"];

        for (NSDictionary *dict in _PersonData)
        {
            PersonDetail *PersonDet = [[PersonDetail alloc]init];
            
            NSString *strid = [dict valueForKey:@"id"];
            PersonDet.Pid = strid;

            NSString *strname = [dict valueForKey:@"name"];
            PersonDet.Pname = strname;

            NSString *stremail = [dict valueForKey:@"email"];
            PersonDet.Pemail= stremail;

            NSString *straddress = [dict valueForKey:@"address"];
            PersonDet.Paddress = straddress;

            NSString *strgender = [dict valueForKey:@"gender"];
            PersonDet.Pgender = strgender;

            [self.arrPerson addObject:PersonDet];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->PersonDataTableView reloadData];
        });

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@",error);
    }];
    
    // 5
    [operation start];
}
@end



