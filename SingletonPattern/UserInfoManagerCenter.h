//
//  UserInfoManagerCenter.h
//  SingletonPattern
//
//  Created by wupeng on 2017/2/23.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoManagerCenter : NSObject

@property (nonatomic, copy) NSString *name;

+ (instancetype)managerCenter;

@end
