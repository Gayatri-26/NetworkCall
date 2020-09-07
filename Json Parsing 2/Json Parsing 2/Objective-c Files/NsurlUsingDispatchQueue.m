//
//  NsurlUsingDispatchQueue.m
//  Json Parsing 2
//
//  Created by Mac on 07/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "NsurlUsingDispatchQueue.h"
#import "DogBreedsDetails.h"
#import "DogDetailsCell.h"

@interface NsurlUsingDispatchQueue ()
@property(strong,nonatomic) NSMutableArray<DogBreedsDetails *> *dogsdetailarr;

@end

@implementation NsurlUsingDispatchQueue
{
    UITableView *DogsDetailsTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self NsUrldata];
    });
    
    
    self.dogsdetailarr = [[NSMutableArray alloc]init];
    
    DogsDetailsTableView = [[UITableView alloc]init];
    [DogsDetailsTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:DogsDetailsTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [DogsDetailsTableView registerClass:[DogDetailsCell class] forCellReuseIdentifier:@"DCell"];
    DogsDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    DogsDetailsTableView.delegate = self;
    DogsDetailsTableView.dataSource = self;
}

-(void)NsUrldata{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"]];
    
    //create the Method "GET"
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//        if(httpResponse.statusCode == 200)
        if(data != nil)
        {
//
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"The response is - %@",responseArray);
            
            _dogsdetailarr = [[NSMutableArray alloc]init];
            
            for(NSDictionary *dict in responseArray){
                
                DogBreedsDetails *dogdetails = [[DogBreedsDetails alloc]init];
                
                NSString *strbreed = [dict objectForKey:@"breed"];
                dogdetails.Breed = strbreed;
                
                NSString *strhighclass = [dict objectForKey:@"Higher classification"];
                dogdetails.HigherClass = strhighclass;
                
                NSString *strlifespan = [dict objectForKey:@"Life span"];
                dogdetails.LifeSpan = strlifespan;
                
                NSString *strcolor = [dict objectForKey:@"Colors"];
                dogdetails.Colors = strcolor;
                
                [self.dogsdetailarr addObject:dogdetails];
            }
            dispatch_queue_t dogdetailsdata = dispatch_get_main_queue();
            dispatch_async(dogdetailsdata, ^{
                [self->DogsDetailsTableView reloadData];
            });
            
        }
        else
        {
            NSLog(@"Error");
        }
    }];
    [dataTask resume];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dogsdetailarr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCell"];
    
    if (cell == nil){
        
        cell = [[DogDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DCell"];
    }

    cell.breed.text = [self.dogsdetailarr[indexPath.row]Breed];
    cell.highclass.text = [self.dogsdetailarr[indexPath.row]HigherClass];
    cell.lifespam.text = [self.dogsdetailarr[indexPath.row]LifeSpan];
    cell.colors.text = [self.dogsdetailarr[indexPath.row]Colors];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 185;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
