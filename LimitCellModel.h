//
//  LimitCellModel.h
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LimitCellModel : NSObject

@property (nonatomic,strong)UIImage *appIcon;
@property (nonatomic,copy)NSString *starCurrent;
@property (nonatomic,copy)NSString *downloads;
@property (nonatomic,copy)NSString *currentPrice;
@property (nonatomic,copy)NSString *lastPrice;
@property (nonatomic,copy)NSString *priceTrend;
@property (nonatomic,copy)NSString *expireDatetime; //终止时间
@property (nonatomic,copy)NSString *fileSize;
@property (nonatomic,copy)NSString *shares;
@property (nonatomic,copy)NSString *favorites;
@property (nonatomic,copy)NSString *version;
@property (nonatomic,copy)NSString *descrip;
@property (nonatomic,copy)NSString *releaseDate;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *applicationId;
@property (nonatomic,copy)NSString *slug;
@property (nonatomic,copy)NSString *iconUrl;


@end
