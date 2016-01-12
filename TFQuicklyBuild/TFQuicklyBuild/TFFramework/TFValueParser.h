//
//  TFValueParser.h
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/12.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFValueParser : NSObject

+ (id)valueWithString:(NSString *)aString;

+ (void)registerEnums:(NSDictionary *)enums; // <NSString *, NSNumber *>

@end
