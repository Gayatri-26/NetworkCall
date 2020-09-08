

#import "PersonViewController.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperation.h"


@interface PersonViewController ()

@end

@implementation PersonViewController

//returnType ^ (parameters) <blockname>
//(void (^)(NSData *, NSError *))block

+(void)executequery:(NSString *)strurl strpremeter:(NSString *)premeter withblock:(void (^)(NSData *, NSError *))block
{
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
