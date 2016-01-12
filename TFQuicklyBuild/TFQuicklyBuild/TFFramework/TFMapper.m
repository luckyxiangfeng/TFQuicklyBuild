//
//  TFMapper.m
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/11.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import "TFMapper.h"
#import "TFTabViewController.h"

@interface TFMapper()

@property (nonatomic, retain) NSArray *mapAry;
@property (nonatomic, retain) NSDictionary *navDic;
@property (nonatomic, retain) TFTabViewController *tfTabbarCtrl;

@end

@implementation TFMapper
- (void)mapperWithContentsUrl:(NSURL *)url toWindow:(id)window{
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:url];
    if (dictionary == nil) {
        return;
    }
    self.mapAry = [[NSArray alloc] initWithArray:[dictionary objectForKey:@"Tab"]];
    self.navDic = [[NSDictionary alloc] initWithDictionary:[dictionary objectForKey:@"Nav"]];
    [self TF_tabBarViewCtrlToWindow:window];
}

- (void)TF_tabBarViewCtrlToWindow:(id)window{

    if (self.tfTabbarCtrl == nil) {
        self.tfTabbarCtrl = [[TFTabViewController alloc] initWithArray:self.mapAry navDic:self.navDic];
        UIWindow *myWindow = (UIWindow *)window;
        myWindow.rootViewController = self.tfTabbarCtrl;
    }
    
}


@end
