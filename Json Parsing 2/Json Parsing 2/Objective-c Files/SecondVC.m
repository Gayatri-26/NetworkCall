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
// #import "AppDelegate.swift"

@interface SecondVC ()

@property (strong,nonatomic) NSMutableArray<PersonDetail *> *arrPerson;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) NSDictionary *PersonData;

@end

@implementation SecondVC
{
    UITableView *PersonDataTableView;
    
}
@synthesize contactdb;

- (void)viewDidLoad {
    [super viewDidLoad];
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
        [self->PersonDataTableView reloadData];
        
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
//
//- (id)initWithCompletionBlock:(CallbackBlock)callback;
//{
//    self = [super init];
//    if (!self) return nil;
//
//    //This resource is the same name as your xcdatamodeld contained in your project
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Workspace" withExtension:@"momd"];
//    NSAssert(modelURL, @"Failed to locate momd bundle in application");
//    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    NSAssert(mom, @"Failed to initialize mom from URL: %@", modelURL);
//
//    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
//
//    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    [moc setPersistentStoreCoordinator:coordinator];
//    [self setManagedObjectContext:moc];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] lastObject];
//        // The directory the application uses to store the Core Data store file. This code uses a file named "DataModel.sqlite" in the application's documents directory.
//        NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
//
//        NSError *error = nil;
//        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
//        if (!store) {
//            NSLog(@"Failed to initalize persistent store: %@\n%@", [error localizedDescription], [error userInfo]);
//            abort();
//            //A more user facing error message may be appropriate here rather than just a console log and an abort
//        }
//        if (!callback) {
//            //If there is no callback block we can safely return
//            return;
//        }
//        //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            callback();
//        });
//    });
//    return self;
//}


@end



