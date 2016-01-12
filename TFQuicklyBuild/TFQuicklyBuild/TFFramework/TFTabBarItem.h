//
//  TFTabBarItem.h
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/12.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFTabBarItem : UITabBarItem

- (instancetype)initWithTabBarItemTitle:(NSString *)title
                    titleFont:(NSString *)titleFont
           unSelectTitleColor:(NSString *)unSelectTitleColor
             selectTitleColor:(NSString *)selectTitleColor
                    imageName:(NSString *)imageName
                 selImageName:(NSString *)selImageName;

@end
