//
//  FirstVC.m
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

//https://stackoverflow.com/questions/24062950/updating-ui-labels-while-downloading-images-in-ios
//https://stackoverflow.com/questions/49271515/ios-makimagegalleryview-downloading-photos-using-afnetworking-afimagedownloader
//https://gist.github.com/yannxou/3c4ea943909174ed2792
//https://stackoverflow.com/questions/16352337/how-to-retrieve-images-from-server-asynchronously

#import "FirstVC.h"
#import "EmployeeDetailsVC.h"
#import "EmployeeDetailsCell.h"
#import "EmployeeDetails.h"

@interface FirstVC ()

@property (strong,nonatomic) NSMutableArray<EmployeeDetails *> *arrEmployee;
@property (nonatomic,strong) NSString *mainstr;
@property (nonatomic,strong) NSThread *thread;

@end

@implementation FirstVC
{
    UITableView *EmployeeDataTableView;
}

//- (NSThread*)thread {
//
//    if (!_thread) {
//        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(requestdata) object:nil];
//    }
//    return _thread;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if (!_thread) {
//        _thread = [[NSThread alloc] initWithTarget:self selector:@selector(requestdata) object:nil];
//    }
    NSThread *dataDownloadThread = [[NSThread alloc]initWithTarget:self selector:@selector(requestdata) object:nil];
    [dataDownloadThread start];
//     NSThread *dataDownloadThread = [[NSThread alloc]init];
//    [dataDownloadThread performSelectorInBackground:@selector(requestdata) withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(requestdata) toTarget:self withObject:nil];
    
    self.arrEmployee = [[NSMutableArray alloc]init];
    
    EmployeeDataTableView = [[UITableView alloc]init];
    [EmployeeDataTableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:EmployeeDataTableView];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-0];
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:EmployeeDataTableView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-0];
    
    [self.view addConstraints:@[left, top, bottom, right]];
    
    [EmployeeDataTableView registerClass:[EmployeeDetailsCell class] forCellReuseIdentifier:@"ECell"];
    EmployeeDataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    EmployeeDataTableView.dataSource = self;
    EmployeeDataTableView.delegate = self;
    
}

-(void)requestdata
{
//    while (![self.thread isCancelled]) {
    _mainstr = [NSString stringWithFormat:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    
    void(^EmployeeListCallback)(NSData *data, NSError *error) = ^(NSData *dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
            _arrEmployee = [EmployeeDetails modelArrayFromDict:maindic];
            
            [self->EmployeeDataTableView reloadData];
            
        }
    };
        
    [EmployeeDetailsVC executequery:_mainstr strpremeter:nil withblock:EmployeeListCallback];
//        sleep(1);
//    }
//     self.thread = nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _arrEmployee.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EmployeeDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ECell"];
    
    if (cell == nil){
        
        cell = [[EmployeeDetailsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ECell"];
    }
    EmployeeDetails *emp = _arrEmployee[indexPath.row];
    cell.breed.text = [emp Breed];
    cell.lifespam.text = [emp LifeSpan];
    cell.highclass.text = [emp HigherClass];
    cell.colors.text = [emp Colors];
//    cell.imageview.image = [emp img];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 205;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
