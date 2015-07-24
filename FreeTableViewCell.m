//
//  FreeTableViewCell.m
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/19.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "FreeTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation FreeTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _appImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];         //app图片
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 10, 120, 20)];              //app名字
        _starBackImageView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 40, 65, 23)];      //星级
        _starForeImageView = [[UIImageView alloc] init];
        _starOverallLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 70, 120, 20)];         //评分
        
        _sharesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 80, 30)];
        _favoritesLabel = [[UILabel alloc] initWithFrame:CGRectMake(110, 110, 80, 30)];
        _downloadsLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 110, 80, 30)];
        
        [self.contentView addSubview:_appImageView];
        [self.contentView addSubview:_nameLabel];
        [_starBackImageView addSubview:_starForeImageView];
        [self.contentView addSubview:_starBackImageView];
        [self.contentView addSubview:_starOverallLabel];
        [self.contentView addSubview:_sharesLabel];
        [self.contentView addSubview:_favoritesLabel];
        [self.contentView addSubview:_downloadsLabel];
        
    }
    
    return self;
}

- (void)showDepreciateCell:(FreeModel *)cellMode
{
    
    //利用url异步加载图片
    [_appImageView setImageWithURL:[NSURL URLWithString:[cellMode.freeDict objectForKey:@"iconUrl"]]];
    
    _nameLabel.text = [cellMode.freeDict objectForKey:@"name"];
    _nameLabel.font = [UIFont boldSystemFontOfSize:18];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.adjustsFontSizeToFitWidth = YES;
    
    //设置星级
    _starBackImageView.image = [UIImage imageNamed:@"StarsBackground"];
    //剪裁前景图片
    float starCurrent = [[cellMode.freeDict objectForKey:@"starCurrent"] floatValue];
    if (starCurrent) {
        UIImage *foreImage = [UIImage imageNamed:@"StarsForeground"];
        CGRect rect = CGRectMake(0, 0, 13*starCurrent, 23);
        CGImageRef foreImageRef = CGImageCreateWithImageInRect(foreImage.CGImage, rect);
        UIImage *foreImageClip = [UIImage imageWithCGImage:foreImageRef];
        _starForeImageView.image = foreImageClip;
        _starForeImageView.frame = CGRectMake(0, 0, 13*starCurrent, 23);
    }
    
    _starOverallLabel.text = [NSString stringWithFormat:@"评分: %@分",[cellMode.freeDict objectForKey:@"starOverall"]];
    _starOverallLabel.adjustsFontSizeToFitWidth = YES;
    
    
    _sharesLabel.text = [NSString stringWithFormat:@"分享: %@次",[cellMode.freeDict objectForKey:@"shares"]];
    _sharesLabel.adjustsFontSizeToFitWidth = YES;
    
    
    _favoritesLabel.text = [NSString stringWithFormat:@"收藏: %@次",[cellMode.freeDict objectForKey:@"favorites"]];
    _favoritesLabel.adjustsFontSizeToFitWidth = YES;
    
    _downloadsLabel.text = [NSString stringWithFormat:@"下载: %@次",[cellMode.freeDict objectForKey:@"downloads"]];
    _downloadsLabel.adjustsFontSizeToFitWidth = YES;
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
