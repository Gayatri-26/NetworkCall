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
    [self tableviewData];
    
    //Data and Image Download
    NSURL *url = [NSURL URLWithString:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    void(^DataDownloadCallBack)(NSData *data, NSError *error) = ^(NSData *dogdata, NSError *error){
        NSLog(@"Data: %@", dogdata);
        
        if(dogdata != nil){
            
            NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:dogdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"The response is - %@",responseArray);
            
            _arrDog = [DogModel modelArrayFromDict:responseArray];
            
            for(int i=0;i<_arrDog.count;i++){
                
                void(^ImageDownloadCallBack)(NSString *breed, UIImage *path, NSError *error) = ^(NSString *dogbreed, UIImage *dogpath, NSError *error){
                    
                    for(int j=0;j<_arrDog.count;j++){
                        
                        DogModel *dogimage = [_arrDog objectAtIndex:j];
                        
                        if([dogimage.Breed isEqualToString:dogbreed]){
                            
                            dogimage.img = dogpath;
                        }
                    }
                    
                };
                
                DogModel *dog = [_arrDog objectAtIndex:i];
                NSURL *u = [NSURL URLWithString:dog.url];
                ImageDownloadThread *imagedown = [[ImageDownloadThread alloc]initWithbreed:dog.Breed andWithURL:u andCallBack:ImageDownloadCallBack];
                [imagedown start];
                
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self->DogsDetailsTableView reloadData];
            });
            
        }
    };
    
    DataDownloadThread * datadl = [[DataDownloadThread alloc]initWithURL:url andCallBack:DataDownloadCallBack];
    [datadl start];
    
    self.arrDog = [[NSMutableArray alloc]init];
    
}

-(void)tableviewData{
    
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
    DogsDetailsTableView.allowsSelection = UITableViewCellSelectionStyleBlue;
    DogsDetailsTableView.dataSource = self;
    DogsDetailsTableView.delegate = self;
    
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
    
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [UIColor colorWithRed:180/255.0
                                                      green:138/255.0
                                                       blue:171/255.0
                                                      alpha:0.5];
    cell.selectedBackgroundView =  customColorView;
    
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 205;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
