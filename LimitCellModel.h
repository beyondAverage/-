//
//  LimitCellModel.h
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSONModel.h"

@protocol ApplicationInfoModel
@end

@interface ApplicationInfoModel : JSONModel

@property (nonatomic,strong)UIImage<Optional> *appIcon;
@property (nonatomic,copy)NSString<Optional> *starCurrent;
@property (nonatomic,copy)NSString<Optional> *downloads;
@property (nonatomic,copy)NSString<Optional> *currentPrice;
@property (nonatomic,copy)NSString<Optional> *lastPrice;
@property (nonatomic,copy)NSString<Optional> *priceTrend;
@property (nonatomic,copy)NSString<Optional> *expireDatetime; //终止时间
@property (nonatomic,copy)NSString<Optional> *fileSize;
@property (nonatomic,copy)NSString<Optional> *shares;
@property (nonatomic,copy)NSString<Optional> *favorites;
@property (nonatomic,copy)NSString<Optional> *version;
@property (nonatomic,copy)NSString<Optional> *descrip;
@property (nonatomic,copy)NSString<Optional> *releaseDate;
@property (nonatomic,copy)NSString<Optional> *name;
@property (nonatomic,copy)NSString<Optional> *applicationId;
@property (nonatomic,copy)NSString<Optional> *slug;
@property (nonatomic,copy)NSString<Optional> *iconUrl;


@end

@interface LimitCellModel : JSONModel

@property (nonatomic,strong)NSArray<Optional,ApplicationInfoModel> *applications;

@end
