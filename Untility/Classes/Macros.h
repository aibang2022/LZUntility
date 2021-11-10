//
//  Macros.h
//  InvisibleCamera
//
//  Created by Liu Zhao on 16/4/21.
//  Copyright © 2016年 Liu Zhao. All rights reserved.
//

#import "UIColor+Extensions.h"

/** 获取APP名称 */
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])

/** 程序版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/** 获取APP build版本 */
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

#define HEXCOLOR(hexColor) [UIColor colorWithHex:hexColor]

// 屏幕高度
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
// 导航栏高度
#define NAVITIONBAR_HIGHT 44

// iPhoneX的底部安全高度
#define IPHONE_X_BOTTOM 34

// 状态栏高度
#define STATUS_HIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

#define IS_IPHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

#define IS_IPAD [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define IS_IOS8 [[UIDevice currentDevice].systemVersion floatValue] >= 8.0 ? YES : NO

#define IS_IOS7 [[UIDevice currentDevice].systemVersion floatValue] >= 7.0 ? YES : NO

#define IS_IOS13 [[UIDevice currentDevice].systemVersion floatValue] >= 13.0 ? YES : NO

#define IS_IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE6_Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

#define IS_IPHONE_X_SERIES kIPhoneX_SERIES

///通过安全区判断刘海屏手机 如果launch设置对应的机型 可能高度不是812
#define kIPhoneX_SERIES ({\
BOOL isiPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
UIWindow *window = [UIApplication sharedApplication].delegate.window;\
if (window.safeAreaInsets.bottom > 0.0) {\
isiPhoneX = YES;\
}\
}\
isiPhoneX;\
})
