//
//  PersonDetail.h
//  Json Parsing 2
//
//  Created by Mac on 24/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <CoreData/CoreData.h>


@interface PersonDetail : NSManagedObject

@property (nonatomic,strong) NSString *Pid;
@property (nonatomic,strong) NSString *Pname;
@property (nonatomic,strong) NSString *Pemail;
@property (nonatomic,strong) NSString *Paddress;
@property (nonatomic,strong) NSString *Pgender;

+(NSMutableArray < PersonDetail *> *)modelArrayFromDict:(NSDictionary *) d;

@end

