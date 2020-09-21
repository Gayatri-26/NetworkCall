//
//  JSONDownloadOperation.m
//  Json Parsing 2
//
//  Created by Mac on 21/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "JSONDownloadOperation.h"
#import "DogDetailVC.h"
#import "DogModel.h"

@implementation JSONDownloadOperation

+(void)dataDownload:(NSString *)strurl strparameter:(NSString *)parameter withblock:(void(^)(NSData *, NSError*))block{
        
        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"]];
        [urlRequest setHTTPMethod:@"GET"];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            if(data != nil){
                NSDictionary *responsedic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                        NSLog(@"The response is - %@",responsedic);
                _arrDog = [DogModel modelArrayFromDict: responsedic];
                
                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                    [self->DogsDetailsTableView reloadData];
                }];
            }
            else{
                NSLog(@"Error");
            }
        }];
        [dataTask resume];
    }

    
    
    
    
    
}



@end
