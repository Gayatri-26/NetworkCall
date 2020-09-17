//
//  OperationViewController.m
//  Json Parsing 2
//
//  Created by Mac on 17/09/20.
//  Copyright © 2020 Mac. All rights reserved.

#import "OperationViewController.h"
#import "PersonViewController.h"
#import "DogTableViewCell.h"
#import "DogModel.h"

@interface OperationViewController ()

@property (strong,nonatomic) NSMutableArray<DogModel *> *arrDog;
@property (nonatomic,strong) NSString *mainstr;

@end

@implementation OperationViewController
{
    UITableView *DogTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestdata];
    
    self.arrDog = [[NSMutableArray alloc]init];
    
    DogTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    [self.view addSubview:DogTableView];
    
    [DogTableView registerClass:[DogTableViewCell class] forCellReuseIdentifier:@"dcell"];
    
    DogTableView.dataSource = self;
    DogTableView.delegate = self;
    
}

-(void)requestdata
{
    _mainstr = [NSString stringWithFormat:@"http://bitcodetech.in/ws_ios_assignment/ws_dog_info.php"];
    
    void(^PersonListCallback)(NSData *data, NSError *error) = ^(NSData *dbdata, NSError *error) {
        NSLog(@"Data: %@", dbdata);
        if (dbdata!=nil)
        {
            NSDictionary *maindic = [NSJSONSerialization JSONObjectWithData:dbdata options:NSJSONReadingAllowFragments error:nil];
            NSLog(@"Response Data: %@", maindic);
            
            _arrDog = [DogModel modelArrayFromDict:maindic];
            
                [self->DogTableView reloadData];
           
        }
    };

    [PersonViewController executequery:_mainstr strpremeter:nil withblock:PersonListCallback];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrDog.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DogTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dcell"];
    if (cell == nil) {
        cell = [[DogTableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dcell"];
    }
     DogModel *dogInfo = _arrDog[indexPath.row];
     cell.Dbreed.text = [dogInfo Dbreed];
     cell.Dtemperament.text = [dogInfo Dtemperament];
     cell.Dcolors.text = [dogInfo Dcolors];
     cell.Dheight.text = [dogInfo Dheight];
     cell.Dweight.text = [dogInfo Dweight];
   //  cell.Dimage.images = [dogInfo Dimage];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 300;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

