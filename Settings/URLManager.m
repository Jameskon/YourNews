//
//  URLManager.m
//  YourNews
//
//  Created by 康凯 on 2018/1/9.
//  Copyright © 2018年 kai. All rights reserved.
//

#import "URLManager.h"

@implementation URLManager

-(instancetype)initURLManagerWithPage:(int)page andMaxResult:(int)maxResult andTag:(int)tag{
    if (self = [super init]) {
        //获得系统时间
        NSDate * senddate=[NSDate date];
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"yyyyMMddHHmmss"];
        NSString * currentDate=[dateformatter stringFromDate:senddate];
        
        switch (tag) {
            case 1:
                _typeStr = TEXTHEADURL;
                break;
            case 2:
                _typeStr = IMGHEADURL;
                break;
            case 3:
                _typeStr = GIFHEADURL;
                break;
            default:
                NSLog(@"type input erro.");
                break;
        }
        _urlStr = [NSString stringWithFormat:@"%@?maxResult=%d&page=%d&showapi_appid=%@&showapi_test_draft=false&showapi_timestamp=%@&showapi_sign=%@",_typeStr,maxResult,page,APPID,currentDate,SIGNID];
    }
    return self;
}

+(instancetype)URLManageWithPage:(int)page andMaxResult:(int)maxResult andTag:(int)tag{
    return [[self alloc]initURLManagerWithPage:page andMaxResult:maxResult andTag:tag];
}

-(NSData *)getData{
    self.data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.urlStr]];
    return self.data;
}

@end
