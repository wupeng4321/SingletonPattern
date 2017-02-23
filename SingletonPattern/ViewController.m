//
//  ViewController.m
//  SingletonPattern
//
//  Created by wupeng on 2017/2/23.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoManagerCenter.h"
#import "NewManagerCenter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UserInfoManagerCenter *center = [UserInfoManagerCenter managerCenter];
    NSLog(@"%@", center.name);
    NSLog(@"%@", [UserInfoManagerCenter managerCenter]);
    //init 方法再也不能创建对象了，符合单例的单一对象原则
    NSLog(@"%@", [[UserInfoManagerCenter alloc] init]);
    
    
    //子类如果通过下面方法来创建的话，就会崩溃,你也可以简单看看crash日志
//    [NewManagerCenter managerCenter];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
