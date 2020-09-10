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

@interface SecondVC ()

@property (strong,nonatomic) NSMutableArray<PersonDetail *> *arrPerson;
@property (nonatomic,strong) NSString *mainstr;

@end

@implementation SecondVC
{
    UITableView *PersonDataTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestdata];
    
    self.arrPerson = [[NSMutableArray alloc]init];
    
    PersonDataTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:PersonDataTableView];
    
    [PersonDataTableView registerClass:[PersonViewCell class] forCellReuseIdentifier:@"pcell"];
    
    PersonDataTableView.dataSource = self;
    PersonDataTableView.delegate = self;
    
}

-(void)requestdata
{
    _mainstr = [NSString stringWithFormat:@"https://api.androidhive.info/contacts/"];
    
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
    dispatch_queue_t dispdata = dispatch_get_main_queue();
    
    dispatch_async(dispdata, ^{
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
    PersonDetail *pdetails = _arrPerson[indexPath.row];
    cell.Pid.text = [pdetails Pid];
    cell.Pname.text = [pdetails Pname];
    cell.Pemail.text = [pdetails Pemail];
    cell.Paddress.text = [pdetails Paddress];
    cell.Pgender.text = [pdetails Pgender];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end



