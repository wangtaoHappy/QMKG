//
//  BaseNavigationController.m
//  QMKG
//
//  Created by 王涛 on 2017/7/20.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor redColor];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0],  NSForegroundColorAttributeName:[UIColor whiteColor]}];
}


@end
