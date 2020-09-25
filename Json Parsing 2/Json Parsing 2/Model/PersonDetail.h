//
//  PersonDetail.h
//  Json Parsing 2
//
//  Created by Mac on 24/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PersonDetail : NSObject


@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *gender;

+(NSMutableArray < PersonDetail *> *)modelArrayFromDict:(NSDictionary *) d;

@end

