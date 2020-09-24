//
//  SecondVC.h
//  Json Parsing 2
//
//  Created by Mac on 27/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonDetail.h"
#import <CoreData/CoreData.h>

@interface SecondVC : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property( strong) NSManagedObject *contactdb;

@end

