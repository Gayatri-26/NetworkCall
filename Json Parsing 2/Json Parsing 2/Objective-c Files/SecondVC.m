//
//  SecondVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.

#import "SecondVC.h"
#import "PersonViewController.h"
#import "PersonViewCell.h"

@interface SecondVC ()
{
    NSString *mainstr;
    NSMutableArray *arrid;
    NSMutableArray * arraddress;
    NSMutableArray * arrname;
    NSMutableArray * arrgender    ;
    NSMutableArray * arremail;
}
@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestdata];
}

-(void)requestdata
{
    mainstr = [NSString stringWithFormat:@"https://api.androidhive.info/contacts/"];
     [PersonViewController executequery:mainstr strpremeter:nil withblock:^(NSData * dbdata, NSError *error) {
    NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
             arrid = [[NSMutableArray alloc] init];
             arrname = [[NSMutableArray alloc] init];
             arraddress = [[NSMutableArray alloc] init];
             arrgender = [[NSMutableArray alloc] init];
             arremail = [[NSMutableArray alloc] init];
            
            NSDictionary *dic1 = [maindic objectForKey:@"contacts"];
            for (NSDictionary *dict in dic1)
            {
                NSString *strid = [dict objectForKey:@"id"];
                [arrid addObject:strid];
                NSLog(@"Strid: %@", strid);
                
                NSString *strname = [dict objectForKey:@"name"];
                [arrname addObject:strname];
                NSLog(@"Strname: %@", strname);
                
                NSString *straddress = [dict objectForKey:@"address"];
                [arraddress addObject:straddress];
                NSLog(@"Straddress: %@", straddress);
                
                NSString *strgender = [dict objectForKey:@"gender"];
                [arrgender addObject:strgender];
                NSLog(@"Strgender: %@", strgender);
                
                NSString *stremail = [dict objectForKey:@"email"];
                [arremail addObject:stremail];
                NSLog(@"Stremail: %@", stremail);
                
            }
            [self.PersonTableView reloadData];
        }
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arremail.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[PersonViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
        cell.Pid.text = arrid[indexPath.row];
        cell.Pname.text = arrname[indexPath.row];
        cell.Pemail.text = arremail[indexPath.row];
        cell.Paddress.text = arraddress[indexPath.row];
        cell.Pgender.text = arrgender[indexPath.row];
    
        return cell;
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end

