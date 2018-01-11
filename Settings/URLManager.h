//
//  URLManager.h
//  YourNews
//
//  Created by 康凯 on 2018/1/9.
//  Copyright © 2018年 kai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface URLManager : NSObject

@property NSString *urlStr;
@property NSData *data;
@property NSString *typeStr;

-(instancetype)initURLManagerWithPage:(int)page andMaxResult:(int)maxResult andTag:(int)tag;
+(instancetype)URLManageWithPage:(int)page andMaxResult:(int)maxResult andTag:(int)tag;

-(NSData *)getData;

@end
