//
//  QMToolbar.m
//  QMKG
//
//  Created by 王涛 on 2017/7/17.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "QMToolbar.h"

@interface QMToolbar ()

@property (nonatomic, strong) UISegmentedControl *segement;
@property (nonatomic, strong) UIButton           *searchButton;
@property (nonatomic, strong) UIButton           *missionButton;

@end

@implementation QMToolbar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        self.barTintColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.8];
    }
    return self;
}

- (void) setupUI {
    _segement = [[UISegmentedControl alloc] initWithItems:@[@"关注",@"好友",@"热门",@"附近"]];
    _segement.frame = CGRectMake(30, 20, 200, 40);

    [_segement setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:0.5]} forState:UIControlStateNormal];
    [_segement setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
    [_segement addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    _segement.center = CGPointMake(self.center.x, self.center.y + 10);
    _segement.tintColor = [UIColor clearColor];
    [_segement setSelectedSegmentIndex:0];
    [self addSubview:_segement];
    [self addSubview:self.searchButton];
    [self addSubview:self.missionButton];
}

#pragma mark - 懒加载
-(UIButton *)searchButton {

    if (!_searchButton) {
        _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _searchButton.backgroundColor = [UIColor whiteColor];
        _searchButton.frame = CGRectMake(10, 20, 40, 40);
        [_searchButton addTarget:self action:@selector(searcButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
 
    return _searchButton;
}

-(UIButton *)missionButton {

    if (!_missionButton) {
        _missionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _missionButton.backgroundColor = [UIColor whiteColor];
        _missionButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 50, 20, 40, 40);
        [_missionButton addTarget:self action:@selector(missionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _missionButton;
}

#pragma mark - method

- (void)searcButtonClicked:(UIButton *)sender {

    if (self.toolbarDelegate && [self.toolbarDelegate respondsToSelector:@selector(searchButtonClicked:)]) {
        [self.toolbarDelegate searchButtonClicked:sender];
    }

}

- (void)missionButtonClicked:(UIButton *)sender {
    
    if (self.toolbarDelegate && [self.toolbarDelegate respondsToSelector:@selector(missionButtonClicked:)]) {
        [self.toolbarDelegate missionButtonClicked:sender];
    }
}

- (void)segmentClick:(UISegmentedControl *)segment {

    if (self.toolbarDelegate && [self.toolbarDelegate respondsToSelector:@selector(segmentClicked:atIndex:)]) {
        [self.toolbarDelegate segmentClicked:self atIndex:segment.selectedSegmentIndex];
    }
}



@end
