





#import "PersonViewController.h"

@interface PersonViewController ()

@end

@implementation PersonViewController

+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void (^)(NSData *, NSError *))block
{
    //Step:-1 Session Create
    NSURLSessionConfiguration *defaultconfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:defaultconfiguration delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURL *urlrequest = [NSURL URLWithString:strurl];
    
    NSMutableURLRequest*mutablerequest = [NSMutableURLRequest requestWithURL:urlrequest];

    [mutablerequest setHTTPMethod:@"GET"];
 
    NSURLSessionDataTask * task = [session dataTaskWithRequest:mutablerequest completionHandler:^(NSData *  data, NSURLResponse * response, NSError *  error) {
        if (data!=nil)
        {
            NSLog(@"Response %@", data);
            block(data,error);//
        }
        else
        {
            NSLog(@"error");
            block(nil,error);
        }
    }];
    [task resume];
}

@end
