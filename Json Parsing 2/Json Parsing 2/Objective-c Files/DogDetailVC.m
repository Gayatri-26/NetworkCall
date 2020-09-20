//
//  DogDetailVC.m
//  Json Parsing 2
//
//  Created by Mac on 18/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogDetailVC.h"
#import "DogModel.h"
#import "DogTableViewCell.h"

@interface DogDetailVC ()

@property(strong,nonatomic) NSMutableArray<DogModel *> *arrDog;

@end

@implementation DogDetailVC
{
    UITableView *DogsDetailsTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    NSOperation *op1 = [[NSOperation alloc]init];
    
    [op1 setCompletionBlock:^{
        NSLog(@"i am from op1");
    }];
//    [operationQueue addOperationWithBlock:^{
//        NSLog(@"i am from operation addOperationWithBlock");
//    }];
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
           [ DogsDetailsTableView reloadData];
       }];
    
    NSInvocationOperation *iOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(NSdata) object:nil];
    
 //   NSInvocationOperation *iOperation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(DownloadImage1) object:nil];
    
    [operationQueue addOperation: op1];
    [operationQueue addOperation: iOperation];
  //  [operationQueue addOperation: iOperation1];

    
    
    
    self.arrDog = [[NSMutableArray alloc]init];
    
    DogsDetailsTableView = [[UITableView alloc]init];
    [DogsDetailsTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:DogsDetailsTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [DogsDetailsTableView registerClass:[DogTableViewCell class] forCellReuseIdentifier:@"DCell"];
    DogsDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    DogsDetailsTableView.dataSource = self;
    DogsDetailsTableView.delegate = self;
}

-(void)NSdata{
    
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




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrDog.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCell"];
    
    if (cell == nil){
        
        cell = [[DogTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DCell"];
    }
    DogModel *dogDetails = _arrDog[indexPath.row];
    cell.breed.text = [dogDetails Breed];
    cell.highclass.text = [dogDetails HigherClass];
    cell.lifespam.text = [dogDetails LifeSpan];
    cell.colors.text = [dogDetails Colors];
    cell.imgview.image = [dogDetails img];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
