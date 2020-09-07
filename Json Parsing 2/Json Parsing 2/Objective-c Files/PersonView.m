//
//  PersonView.m
//  Json Parsing 2
//
//  Created by Mac on 07/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "PersonView.h"
#import "SecondVC.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface PersonView ()

@end

@implementation PersonView


static NSString * const BaseURLString = @"https://api.androidhive.info/contacts/";


- (void)viewDidLoad {
    [super viewDidLoad];

    [self afdata];
}

- (void)afdata{
    
   
    NSString *string = [NSString stringWithFormat:@"https://api.androidhive.info/contacts/", BaseURLString];
        NSURL *url = [NSURL URLWithString:string];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        // 2
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithCoder:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
         
            NSLog(@"print response");
            // 3
           // self->weather = (NSDictionary *)responseObject;
//            self.title = @"JSON Retrieved";
//            [self.tableView reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            // 4
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }];
        
        // 5
        [operation start];
}

@end
