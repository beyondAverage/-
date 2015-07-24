//
//  DepreciateTableViewCell.m
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/18.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "DepreciateTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation DepreciateTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];         //app图片
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 120, 20)];              //app名字
        _starBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 40, 65, 23)];      //星级
        _starForeImageView = [[UIImageView alloc] init];
        _currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 120, 20)];         //剩余
        
        _sharesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 80, 30)];
        _favoritesLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 110, 80, 30)];
        _downloadsLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 110, 80, 30)];
        
        [self.contentView addSubview:_appImageView];
        [self.contentView addSubview:_nameLabel];
        [_starBackImageView addSubview:_starForeImageView];
        [self.contentView addSubview:_starBackImageView];
        [self.contentView addSubview:_currentPriceLabel];
        [self.contentView addSubview:_sharesLabel];
        [self.contentView addSubview:_favoritesLabel];
        [self.contentView addSubview:_downloadsLabel];
        
    }
    
    return self;
}

- (void)showDepreciateCell:(DepreciateModel *)cellMode
{
    
    //利用url异步加载图片
    [_appImageView setImageWithURL:[NSURL URLWithString:[cellMode.depreciateDict objectForKey:@"iconUrl"]]];
    
    _nameLabel.text = [cellMode.depreciateDict objectForKey:@"name"];
    _nameLabel.font = [UIFont boldSystemFontOfSize:18];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    
    //设置星级
    _starBackImageView.image = [UIImage imageNamed:@"StarsBackground"];
    //剪裁前景图片
    float starCurrent = [[cellMode.depreciateDict objectForKey:@"starCurrent"] floatValue];
    if (starCurrent) {
        UIImage *foreImage = [UIImage imageNamed:@"StarsForeground"];
        CGRect rect = CGRectMake(0, 0, 13*starCurrent, 23);
        CGImageRef foreImageRef = CGImageCreateWithImageInRect(foreImage.CGImage, rect);
        UIImage *foreImageClip = [UIImage imageWithCGImage:foreImageRef];
        _starForeImageView.image = foreImageClip;
        _starForeImageView.frame = CGRectMake(0, 0, 13*starCurrent, 23);
    }
    
        _currentPriceLabel.text = [NSString stringWithFormat:@"现价: %@元",[cellMode.depreciateDict objectForKey:@"currentPrice"]];
        _currentPriceLabel.adjustsFontSizeToFitWidth = YES;
        
        
        _sharesLabel.text = [NSString stringWithFormat:@"分享: %@次",[cellMode.depreciateDict objectForKey:@"shares"]];
        _sharesLabel.adjustsFontSizeToFitWidth = YES;
        
        
        _favoritesLabel.text = [NSString stringWithFormat:@"收藏: %@次",[cellMode.depreciateDict objectForKey:@"favorites"]];
        _favoritesLabel.adjustsFontSizeToFitWidth = YES;
        
        _downloadsLabel.text = [NSString stringWithFormat:@"下载: %@次",[cellMode.depreciateDict objectForKey:@"downloads"]];
        _downloadsLabel.adjustsFontSizeToFitWidth = YES;
    
    
}

//给自定义cell赋值
//- (void)showDepreciateCell:(DepreciateModel *)cellMode;
//{
//    //利用url异步加载图片
//    [_appImageView setImageWithURL:[NSURL URLWithString:cellMode.iconUrl]];
//    
//    _nameLabel.text = cellMode.name;
//    _nameLabel.font = [UIFont boldSystemFontOfSize:18];
//    _nameLabel.textAlignment = NSTextAlignmentCenter;
//    _nameLabel.adjustsFontSizeToFitWidth = YES;
//    
//    //星级
//    _starBackImageView.image = [UIImage imageNamed:@"StarsBackground"];
//    //剪裁图片
//    float starCurrent = [cellMode.starCurrent floatValue];
//    if (starCurrent) {
//        UIImage *foreImage = [UIImage imageNamed:@"StarsForeground"];
//        CGRect rect = CGRectMake(0, 0, 13*starCurrent, 23);
//        CGImageRef froeImageRef = CGImageCreateWithImageInRect(foreImage.CGImage, rect);
//        UIImage *foreImageClip = [UIImage imageWithCGImage:froeImageRef];
//        _starForeImageView.image = foreImageClip;
//        _starForeImageView.frame = CGRectMake(0, 0, 13*starCurrent, 23);
//    }
//    
//    //剩余时间
//    _expireDatetimeLabel.text = [NSString stringWithFormat:@"剩余: %@次",[cellMode.expireDatetime substringFromIndex:11]];
//    _expireDatetimeLabel.adjustsFontSizeToFitWidth = YES;
//    
//    _sharesLabel.text = [NSString stringWithFormat:@"分享: %@次",cellMode.shares];
//    _sharesLabel.adjustsFontSizeToFitWidth = YES;
//    _favoritesLabel.text = [NSString stringWithFormat:@"收藏: %@次",cellMode.favorites];
//    _favoritesLabel.adjustsFontSizeToFitWidth = YES;
//    _downloadsLabel.text = [NSString stringWithFormat:@"下载: %@次",cellMode.downloads];
//    _downloadsLabel.adjustsFontSizeToFitWidth = YES;
//}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
