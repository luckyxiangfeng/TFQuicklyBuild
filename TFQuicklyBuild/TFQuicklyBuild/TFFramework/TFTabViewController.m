//
//  TFTabViewController.m
//  TFQuicklyBuild
//
//  Created by zengxiangfeng on 16/1/11.
//  Copyright © 2016年 zengxiangfeng. All rights reserved.
//

#import "TFTabViewController.h"
#import "TFTabBarItem.h"
#import "TFValueParser.h"
@interface TFTabViewController ()

@end

@implementation TFTabViewController

- (instancetype)initWithArray:(NSArray *)array navDic:(NSDictionary *)navDic{
    
    self = [super init];
    if (self) {
        NSMutableArray *viewCtrlAry = [[NSMutableArray alloc] init];
        BOOL isNav = [navDic objectForKey:@"isHaveNav"];
        for (NSDictionary *dic in array) {
            UIViewController *viewCtr;
            if (isNav) {
                
                viewCtr = [self setNavClassName:[dic objectForKey:@"class"] navTitleFont:[navDic objectForKey:@"navBarTitleFont"] navBarColor:[navDic objectForKey:@"navBarColor"] navBarTitleColor:[navDic objectForKey:@"navBarTitleColor"]];
                viewCtr.tabBarItem = [[TFTabBarItem alloc] initWithTabBarItemTitle:[dic objectForKey:@"title"] titleFont:[dic objectForKey:@"barItemFont"] unSelectTitleColor:[dic objectForKey:@"unselectTitleColor"] selectTitleColor:[dic objectForKey:@"selectTitleColor"] imageName:[dic objectForKey:@"unselectImg"] selImageName:[dic objectForKey:@"selectImg"]];
                
            }
            else{
          
                viewCtr = [self setClassName:[dic objectForKey:@"class"]];
            }
            [viewCtrlAry addObject:viewCtr];
            self.viewControllers = viewCtrlAry;
        }
        
    }
    return self;
    
}

- (UIViewController *)setClassName:(NSString *)className{

    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    return viewController;
}
- (UINavigationController *)setNavClassName:(NSString *)className navTitleFont:(NSString *)navTitleFont navBarColor:(NSString *)navBarColor navBarTitleColor:(NSString *)navBarTitleColor{
    
    UIViewController *viewController = [[NSClassFromString(className) alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [navigationController.navigationBar setBarTintColor:[TFValueParser valueWithString:navBarColor]];
    [navigationController.navigationBar setTintColor:[TFValueParser valueWithString:navBarTitleColor]];

    [navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [TFValueParser valueWithString:navBarTitleColor],NSForegroundColorAttributeName,
                                                          [TFValueParser valueWithString:navTitleFont],NSFontAttributeName,
                                                          nil]];
    
    
    return navigationController;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
