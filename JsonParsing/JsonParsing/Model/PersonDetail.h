//
//  PersonDetail.h
//  Json Parsing 2
//
//  Created by Mac on 04/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

//NS_ASSUME_NONNULL_BEGIN

@interface PersonDetail : NSObject

@property (nonatomic,strong) NSString *Pid;
@property (nonatomic,strong) NSString *Pname;
@property (nonatomic,strong) NSString *Pemail;
@property (nonatomic,strong) NSString *Paddress;
@property (nonatomic,strong) NSString *Pgender;

@end

//NS_ASSUME_NONNULL_END
