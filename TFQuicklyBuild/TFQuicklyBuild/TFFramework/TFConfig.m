//
//  TFConfig.m
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/11.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import "TFConfig.h"
#import "TFMapper.h"
@interface TFConfig()

@property (nonatomic, strong) NSURL *tfPlist;
@property (nonatomic, retain) TFMapper *tfMapper;

@end


@implementation TFConfig




- (void)setPlist:(NSString *)plist window:(id)window
{
    [self setPlist:plist bundle:nil window:window];
}

- (void)setPlist:(NSString *)plist bundle:(NSBundle *)bundle window:(id)window
{
    if (bundle == nil) {
        bundle = [NSBundle mainBundle];
    }
    self.tfPlist = [bundle URLForResource:plist withExtension:@"plist"];
    [[self TF_mapper] mapperWithContentsUrl:self.tfPlist toWindow:window];
}

- (TFMapper *)TF_mapper{

    if (self.tfMapper==nil) {
        self.tfMapper = [[TFMapper alloc] init];
    }
    return self.tfMapper;
}


@end
