//
//  QMNavigationViewController.m
//  QMKG
//
//  Created by 王涛 on 2017/7/17.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "QMNavigationViewController.h"
#import "QMToolbar.h"
@interface QMNavigationViewController ()

@end

@implementation QMNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mqToolbar];
    
}

-(QMToolbar *)mqToolbar {

    if (!_mqToolbar) {
        _mqToolbar = [[QMToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64)];
        _mqToolbar.backgroundColor = [UIColor redColor];
    }

    return _mqToolbar;
}


@end
