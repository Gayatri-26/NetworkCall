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
#import  "JSONDownloadOperation.h"
#import "ImageDownloadOperation.h"
 
@interface DogDetailVC ()

@property(strong,nonatomic) NSMutableArray<DogModel *> *arrDog;

@end

@implementation DogDetailVC
{
    UITableView *DogsDetailsTableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableviewData];
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    
    void(^DataDownloadCallBack)(NSData *data, NSError *error) = ^(NSData *dogdata, NSError *error){
           NSLog(@"Data: %@", dogdata);
           if(dogdata != nil){
               
        NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:dogdata options:NSJSONReadingAllowFragments error:nil];
                  NSLog(@"The response is - %@",responseArray);
               
        _arrDog = [DogModel modelArrayFromDict:responseArray];
               
               for(int j=0;j<_arrDog.count;j++){
                   
               void(^ImageDownloadCallBack)(NSString *breed, UIImage *path, NSError *error) = ^(NSString *dogbreed, UIImage *dogpath, NSError *error){
                   
                   DogModel *dogImage = [_arrDog objectAtIndex:j];
                   
                            if([dogImage.Breed isEqualToString:dogbreed]){
                                             dogImage.img = dogpath;
                                         }
               };
                    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                        [self->DogsDetailsTableView reloadData];
                    }];
               
                DogModel *dog = [_arrDog objectAtIndex:j];
                NSURL *u = [NSURL URLWithString:dog.url];
                ImageDownloadOperation *imagedown = [[ImageDownloadOperation alloc]initWithbreed:dog.Breed andWithURL:u andCallBack:ImageDownloadCallBack];
                [imagedown start];
           }
                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                          [self-> DogsDetailsTableView reloadData];
              }];
           }
    };
    
     NSURL *url1 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    JSONDownloadOperation *datadl = [[JSONDownloadOperation alloc]initWithURL: url1 andCallBack: DataDownloadCallBack];
        
    [operationQueue addOperation: datadl];
     
    self.arrDog = [[NSMutableArray alloc]init];

}

-(void) tableviewData{
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _arrDog.count;
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
