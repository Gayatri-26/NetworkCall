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
#import "DataDownloadThread.h"
#import "ImageDownloadThread.h"

@interface DogDetailVC ()

@property(strong,nonatomic) NSMutableArray<DogModel *> *arrDog;

@end

@implementation DogDetailVC
{
    UITableView *DogsDetailsTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSThread *dataDownloadThread = [[NSThread alloc]initWithTarget:self selector:@selector(DownloadData) object:nil];
    [dataDownloadThread start];
    
    NSThread *imageDownloadThread = [[NSThread alloc]initWithTarget:self selector:@selector(DownloadImage) object:nil];
    [imageDownloadThread start];
    
    self.arrDog = [[NSMutableArray alloc]init];
    
    DogsDetailsTableView = [[UITableView alloc]init];
    [DogsDetailsTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    DogsDetailsTableView.allowsSelection = UITableViewCellSelectionStyleNone;
    [self.view addSubview:DogsDetailsTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [DogsDetailsTableView registerClass:[DogTableViewCell class] forCellReuseIdentifier:@"DCell"];
    DogsDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    DogsDetailsTableView.allowsSelection = UITableViewCellSelectionStyleNone;
    DogsDetailsTableView.dataSource = self;
    DogsDetailsTableView.delegate = self;
}

-(void)DownloadData{

    void(^DataDownloadCallBack)(NSData *data, NSError *error) = ^(NSData *dogdata, NSError *error){
        NSLog(@"Data: %@", dogdata);
        if(dogdata != nil){
            
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:dogdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"The response is - %@",responseArray);
            
            _arrDog = [DogModel modelArrayFromDict:responseArray];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->DogsDetailsTableView reloadData];
            });
        }
        
    };
    [DataDownloadThread withblock:DataDownloadCallBack];
    
}

-(void)DownloadImage{
    
    NSURL *url = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/bulldog.jpg"];
    
    NSURLSessionDownloadTask *downloadImageTask = [[NSURLSession sharedSession]
                                                   downloadTaskWithURL:url completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
                                                       
                                                       UIImage *ImageDownload = [UIImage imageWithData:
                                                                                 [NSData dataWithContentsOfURL:path]];
                                                       NSLog(@"Url = %@",ImageDownload);
                                                       DogModel *dog = [_arrDog firstObject];
                                                       dog.img = ImageDownload;
                                                       
                                                       dispatch_queue_t imagedata = dispatch_get_main_queue();
                                                       dispatch_async(imagedata, ^{
                                                           [self->DogsDetailsTableView reloadData];
                                                       });
                                                       
                                                   }];
    [downloadImageTask resume];
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
    return 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
