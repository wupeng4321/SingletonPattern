//
//  UserInfoManagerCenter.m
//  SingletonPattern
//
//  Created by wupeng on 2017/2/23.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "UserInfoManagerCenter.h"
static UserInfoManagerCenter *center = nil;

@implementation UserInfoManagerCenter


/**
 每次都会被调用（方法一）
 */
//+ (void)initialize {
//    if (self == [UserInfoManagerCenter class]) {
//        center = [[UserInfoManagerCenter alloc] init];
//    }
//}


/**
 返回对象（方法二）

 @return return self
 */
//+ (instancetype)managerCenter {
//    if (!center) {
//        center = [[UserInfoManagerCenter alloc] init];
//    }
//    return center;
//}


/**
 加入dispatch_once，只执行一次（方法三）

 @return return self
 */
//+ (instancetype)managerCenter {
//    static dispatch_once_t predicate;
//    dispatch_once(&predicate, ^{
//        center = [[UserInfoManagerCenter alloc] init];
//    });
//    return center;
//}


/**
 在方法三的基础上加入，防止子类使用（方法四）

 @return return self
 */
+ (instancetype)managerCenter {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        center = (UserInfoManagerCenter *)@"UserInfoManagerCenter";
        center = [[UserInfoManagerCenter alloc] init];
    });
    //防止子类使用
    if (![NSStringFromClass([self class]) isEqualToString:@"UserInfoManagerCenter"]) {
        //#define NSParameterAssert(condition) NSAssert((condition), @"Invalid parameter not satisfying: %@", @#condition)
        //ios 是这么定义NSParameterAssert的
        //传入nil会导致app崩溃
        NSParameterAssert(nil);
    }
    return center;
}

/**
 和方法四配套使用，禁止子类使用init创建对象

 @return return result
 */
- (instancetype)init {
    NSString *string = (NSString *)center;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:@"UserInfoManagerCenter"]) {
        self = [super init];
        if (self) {
            // 防止子类使用
            NSString *classString = NSStringFromClass([self class]);
            if (![classString isEqualToString:@"UserInfoManagerCenter"]) {
                NSParameterAssert(nil);
            }
        }
        return self;
    } else {
        return nil;
    }
}

@end
