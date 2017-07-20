//
//  ViewController.m
//  QMKG
//
//  Created by 王涛 on 2017/7/17.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "ViewController.h"
#import "QMNavigationViewController.h"

#import "QMToolbar.h"
#import "MainConstomTableViewCell.h"


@interface ViewController ()<QMToolbarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)QMNavigationViewController *QMNav;
@property (nonatomic, strong)UIScrollView              *scrollView;
@property (nonatomic, strong)UITableView               *tableView;
@property (nonatomic, assign)NSInteger                 currentIndex;

@property (nonatomic, strong)NSMutableArray            *likeArray;
@property (nonatomic, strong)NSMutableArray            *friendArray;
@property (nonatomic, strong)NSMutableArray            *hotArray;
@property (nonatomic, strong)NSMutableArray            *nearlyArray;
@property (nonatomic, strong)NSMutableArray            *dataArray;
@end

@implementation ViewController

-(NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray *)likeArray {

    if (!_likeArray) {
        _likeArray = [[NSMutableArray alloc] init];
    }
    return _likeArray;
}

- (NSMutableArray *)friendArray {

    if (!_friendArray) {
        _friendArray = [NSMutableArray array];
    }
    return _friendArray;
}

- (NSMutableArray *)hotArray {

    if (!_hotArray) {
        _hotArray = [NSMutableArray array];
    }
    return _hotArray;
}

- (NSMutableArray *)nearlyArray {

    if (!_nearlyArray) {
        _nearlyArray = [NSMutableArray array];
    }
    return _nearlyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _QMNav = (QMNavigationViewController *)self.navigationController;
        
        _QMNav.mqToolbar.toolbarDelegate = self;
    });
}

- (void)setupUI {

    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载

-(UIScrollView *)scrollView {

    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, QM_WIDTH, QM_HEIGHT)];
        _scrollView.contentSize = CGSizeMake( QM_WIDTH * 4, QM_HEIGHT);
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.scrollEnabled = NO;
        _scrollView.bounces = NO;
        
    }
    return _scrollView;
}

-(UITableView *)tableView {

    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, QM_WIDTH, QM_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 100;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    MainConstomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MainConstomTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//        cell.backgroundColor = RANDOM_COLOR;
    }
    return cell;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}


#pragma mark - QMToolbarDelegate

- (void)segmentClicked:(QMToolbar *)toolBar atIndex:(NSInteger)index {

    if (_currentIndex == index) {
        NSLog(@"刷新");
    }else if (_currentIndex < index) {
        self.tableView.alpha = 0;
        self.tableView.frame = CGRectMake(- QM_WIDTH, 0, QM_WIDTH, QM_HEIGHT);
        self.tableView.alpha = 1;
    }else {
        self.tableView.alpha = 0;
        self.tableView.frame = CGRectMake(2 * QM_WIDTH, 0, QM_WIDTH, QM_HEIGHT);
        self.tableView.alpha = 1;
    }
    [self.tableView reloadData];
    [UIView animateWithDuration:0.28 animations:^{
        self.tableView.frame = CGRectMake( 0, 0, QM_WIDTH, QM_HEIGHT);
    }];
    _currentIndex = index;
}

- (void)scrollViewScrolledToIndex:(NSInteger)index {

//    [_scrollView setContentOffset:CGPointMake(QM_WIDTH * index + QM_WIDTH/2, QM_HEIGHT/2) animated:YES];
    [_scrollView scrollRectToVisible:CGRectMake(QM_WIDTH * index,0, QM_WIDTH, QM_HEIGHT) animated:NO];
}

- (void)searchButtonClicked:(UIButton *)searchButton {

    NSLog(@"搜索");
}

-(void)missionButtonClicked:(UIButton *)missionButton {

    NSLog(@"任务");
}

@end
