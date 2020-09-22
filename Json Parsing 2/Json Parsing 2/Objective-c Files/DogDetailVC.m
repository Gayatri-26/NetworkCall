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
    
    
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
    
    void(^DataCallback)(NSData *data, NSError *error) = ^(NSData *dogdata, NSError *error){
           NSLog(@"Data: %@", dogdata);
           if(dogdata != nil){
               
               NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:dogdata options:NSJSONReadingAllowFragments error:nil];
                  NSLog(@"The response is - %@",responseDic);
               
               _arrDog = [DogModel modelArrayFromDict:responseDic];
               
                   [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                          [self-> DogsDetailsTableView reloadData];
                      }];
           }
       };
     NSURL *url1 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    JSONDownloadOperation *datadl = [[JSONDownloadOperation alloc]initWithURL: url1 andCallBack: DataCallback];
    
    
    void(^ImageCallBack)(NSURL *path, NSError *error) = ^(NSURL *dogpath, NSError *error){
    UIImage *ImageDownload = [UIImage imageWithData:[NSData dataWithContentsOfURL:dogpath]];
    NSLog(@"Url = %@",ImageDownload);
        
        for(int i=0; i <_arrDog.count; i++){
                      DogModel *dog = [_arrDog objectAtIndex:i];
                      dog.img = ImageDownload;
                  }
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            [self->DogsDetailsTableView reloadData];
        }];    };
    NSURL *url2 = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
    NSURL *url3 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/labrador.jpg"];

         NSURL *url4 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/shefard.jpg"];

         NSURL *url5 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/golden_retriever.jpg"];

         NSURL *url6 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/pug.jpg"];

         NSURL *url7 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/husky.jpg"];

         NSURL *url8 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/rottweiler.jpg"];

         NSURL *url9 = [NSURL URLWithString: @"http://bitcodetech.in/ws_ios_assignment/images/doberman.jpg"];

    ImageDownloadOperation *image1 = [[ImageDownloadOperation alloc]initWithURL: url2 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image2 = [[ImageDownloadOperation alloc]initWithURL: url3 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image3 = [[ImageDownloadOperation alloc]initWithURL: url4 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image4 = [[ImageDownloadOperation alloc]initWithURL: url5 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image5 = [[ImageDownloadOperation alloc]initWithURL: url6 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image6 = [[ImageDownloadOperation alloc]initWithURL: url7 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image7 = [[ImageDownloadOperation alloc]initWithURL: url8 andCallBack1: ImageCallBack];
    ImageDownloadOperation *image8 = [[ImageDownloadOperation alloc]initWithURL: url9 andCallBack1: ImageCallBack];
    
    
                                     
    [operationQueue addOperation: datadl];
    [operationQueue addOperation: image1];
    [operationQueue addOperation: image2];
    [operationQueue addOperation: image3];
    [operationQueue addOperation: image4];
    [operationQueue addOperation: image5];
    [operationQueue addOperation: image6];
    [operationQueue addOperation: image7];
    [operationQueue addOperation: image8];

    
     
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

//-(void)downloadData{

//    void(^DataDownloadCallBack)(NSData *data, NSError *error) = ^(NSData *dogdata, NSError *error){
//        NSLog(@"Data: %@", dogdata);
//        if(dogdata != nil){
//
//            NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:dogdata options:NSJSONReadingAllowFragments error:nil];
//            NSLog(@"The response is - %@",responseDic);
//
//            _arrDog = [DogModel modelArrayFromDict:responseDic];
//
//                [[NSOperationQueue mainQueue]addOperationWithBlock:^{
//                       [self-> DogsDetailsTableView reloadData];
//                   }];
//        }
//    };
//    [JSONDownloadOperation withblock:DataDownloadCallBack];
//
//}

//-(void)downloadImage{
        
//        void(^ImageDownloadCallBack)(NSURL *path, NSError *error) = ^(NSURL *dogpath, NSError *error){
//
//            UIImage *ImageDownload = [UIImage imageWithData:[NSData dataWithContentsOfURL:dogpath]];
//            NSLog(@"Url = %@",ImageDownload);
//            DogModel *dog = [_arrDog firstObject];
//
//            dog.img = ImageDownload;
//
//                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//
//                    [self->DogsDetailsTableView reloadData];
//                }];
//            };
//        [ImageDownloadOperation withblock:ImageDownloadCallBack];
//}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
