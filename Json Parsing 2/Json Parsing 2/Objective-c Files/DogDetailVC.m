//
//  DogDetailVC.m
//  Json Parsing 2
//
//  Created by Mac on 18/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import "DogDetailVC.h"
#import "DogBreedsDetails.h"
#import "DogDetailsCell.h"

@interface DogDetailVC ()

@property(strong,nonatomic) NSMutableArray<DogBreedsDetails *> *dogsdetailarr;

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
    
    self.dogsdetailarr = [[NSMutableArray alloc]init];
    
    DogsDetailsTableView = [[UITableView alloc]init];
    [DogsDetailsTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    DogsDetailsTableView.allowsSelection = UITableViewCellSelectionStyleNone;
    [self.view addSubview:DogsDetailsTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:DogsDetailsTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [DogsDetailsTableView registerClass:[DogDetailsCell class] forCellReuseIdentifier:@"DCell"];
    DogsDetailsTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    DogsDetailsTableView.dataSource = self;
    DogsDetailsTableView.delegate = self;
}

-(void)DownloadData{
    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"]];
    
    [urlRequest setHTTPMethod:@"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        if(data != nil)
        {
                                              
         NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
                    NSLog(@"The response is - %@",responseArray);
                                              
            _dogsdetailarr = [DogBreedsDetails modelArrayFromDict:responseArray];
            
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

-(void)DownloadImage{
   
//    NSURL *url = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    NSURL *url = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/images/doberman.jpg"];
    
    NSURLSessionDownloadTask *downloadImageTask = [[NSURLSession sharedSession]
    downloadTaskWithURL:url completionHandler:^(NSURL *path, NSURLResponse *response, NSError *error) {
        
        UIImage *ImageDownload = [UIImage imageWithData:
        [NSData dataWithContentsOfURL:path]];
        NSLog(@"Url = %@",ImageDownload);
        DogBreedsDetails *dog = [_dogsdetailarr firstObject];
        dog.dogimg = ImageDownload;

        dispatch_queue_t imagedata = dispatch_get_main_queue();
        dispatch_async(imagedata, ^{
            [self->DogsDetailsTableView reloadData];
        });

    }];
    [downloadImageTask resume];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dogsdetailarr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DogDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DCell"];
    
    if (cell == nil){
        
        cell = [[DogDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DCell"];
    }
    DogBreedsDetails *dogDetails = _dogsdetailarr[indexPath.row];
    cell.breed.text = [dogDetails Breed];
    cell.highclass.text = [dogDetails HigherClass];
    cell.lifespam.text = [dogDetails LifeSpan];
    cell.colors.text = [dogDetails Colors];
    cell.imageview.image = [dogDetails dogimg];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
