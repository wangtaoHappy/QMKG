//
//  QMToolbar.h
//  QMKG
//
//  Created by 王涛 on 2017/7/17.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QMToolbar;
@protocol QMToolbarDelegate <NSObject>

- (void)segmentClicked:(QMToolbar *)toolBar atIndex:(NSInteger)index;
- (void)searchButtonClicked:(UIButton *)searchButton;
- (void)missionButtonClicked:(UIButton *)missionButton;

@end

@interface QMToolbar : UIToolbar
@property (nonatomic, weak)id<QMToolbarDelegate> toolbarDelegate;
@end
