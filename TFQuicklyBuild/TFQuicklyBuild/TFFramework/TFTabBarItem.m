//
//  TFTabBarItem.m
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/12.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import "TFTabBarItem.h"
#import "TFValueParser.h"
@implementation TFTabBarItem


- (instancetype)initWithTabBarItemTitle:(NSString *)title titleFont:(NSString *)titleFont unSelectTitleColor:(NSString *)unSelectTitleColor selectTitleColor:(NSString *)selectTitleColor imageName:(NSString *)imageName selImageName:(NSString *)selImageName{
    
    self = [super self];
    if (self) {
        UIImage *norImage = [UIImage imageNamed:imageName];
        UIImage *selImage = [UIImage imageNamed:selImageName];
        if ([self respondsToSelector:@selector(initWithTitle:image:selectedImage:)]) {
            // iOS7+
            selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 避免受tintColor影响
            
            norImage = [norImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; // 避免受tintColor影响
            
            self = [self initWithTitle:title image:norImage selectedImage:selImage];
        } else {
            // iOS7-
            [self setTitle:title];
            [self setFinishedSelectedImage:selImage withFinishedUnselectedImage:norImage];
            
        }
        [self __setTabBarItemAppearanceTitleFont:titleFont unSelectTitleColor:unSelectTitleColor selectTitleColor:selectTitleColor];
        
    }
    return self;
}

- (void)__setTabBarItemAppearanceTitleFont:(NSString *)titleFont unSelectTitleColor:(NSString *)unSelectTitleColor selectTitleColor:(NSString *)selectTitleColor{
    
    NSDictionary *normalState = @{
                                  NSFontAttributeName : [TFValueParser valueWithString:titleFont],
                                  NSForegroundColorAttributeName : [TFValueParser valueWithString:unSelectTitleColor],
                                  };
    // Text appearance values for the tab in selected state
    NSDictionary *selectedState = @{
                                    NSFontAttributeName : [TFValueParser valueWithString:titleFont],
                                    NSForegroundColorAttributeName : [TFValueParser valueWithString:selectTitleColor]
                                    };
    [self setTitleTextAttributes:normalState forState:UIControlStateNormal];
    [self setTitleTextAttributes:selectedState forState:UIControlStateSelected];
    [self setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
}




@end
