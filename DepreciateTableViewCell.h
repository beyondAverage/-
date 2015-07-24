//
//  DepreciateTableViewCell.h
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/18.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DepreciateModel.h"

@interface DepreciateTableViewCell : UITableViewCell


@property (nonatomic,strong)UIImageView *appImageView;
@property (nonatomic,strong)UIImageView *starBackImageView;
@property (nonatomic,strong)UIImageView *starForeImageView;
@property (nonatomic,strong)UILabel *nameLabel;
@property (nonatomic,strong)UILabel *sharesLabel;
@property (nonatomic,strong)UILabel *favoritesLabel;
@property (nonatomic,strong)UILabel *downloadsLabel;
@property (nonatomic,strong)UILabel *currentPriceLabel;



- (void)showDepreciateCell:(DepreciateModel *)cellMode;


@end
