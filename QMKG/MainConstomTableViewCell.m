//
//  MainConstomTableViewCell.m
//  QMKG
//
//  Created by 王涛 on 2017/7/18.
//  Copyright © 2017年 王涛. All rights reserved.
//

#import "MainConstomTableViewCell.h"

@interface MainConstomTableViewCell ()

@property (nonatomic, strong)UIImageView *vactorImageView;
@property (nonatomic, strong)UILabel     *nameLabel;
@property (nonatomic, strong)UILabel     *timelabel;

@property (nonatomic, strong)UILabel     *userTextLable;
@property (nonatomic, strong)UIImageView *songerImageView;
@property (nonatomic, strong)UILabel     *songName;
@property (nonatomic, strong)UILabel     *infoLable;
@property (nonatomic, strong)UILabel     *numberOfRecive;
@property (nonatomic, strong)UIButton    *gallantsButton;

@property (nonatomic, strong)UIView      *flowerView;
@property (nonatomic, strong)UIView      *line;

@property (nonatomic, strong)UIButton    *giftButton;
@property (nonatomic, strong)UIButton    *commonButton;
@property (nonatomic, strong)UIButton    *transferButton;

@end

@implementation MainConstomTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

    _vactorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 40, 40)];
    _vactorImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_vactorImageView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 80, 20)];
    _nameLabel.text = @"hahahha";
    _nameLabel.backgroundColor = [UIColor cyanColor];
    [self.contentView addSubview:_nameLabel];
    
    _timelabel = [[UILabel alloc] initWithFrame:CGRectMake(250, 5, 80, 20)];
    _timelabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_timelabel];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
