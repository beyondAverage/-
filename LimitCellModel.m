//
//  LimitCellModel.m
//  LoveLimitedTimeFreeOfApps
//
//  Created by qianfeng on 15/7/17.
//  Copyright (c) 2015年 QF_Lpj. All rights reserved.
//

#import "LimitCellModel.h"

@implementation ApplicationInfoModel

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:[NSDictionary dictionaryWithObjects:@[@"descrip"] forKeys:@[@"description"]]];
}

@end


@implementation LimitCellModel

@end
