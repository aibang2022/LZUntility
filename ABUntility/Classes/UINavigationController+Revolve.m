//
//  UINavigationController+Revolve.m
//  LZReader
//
//  Created by liuzhao on 2020/5/19.
//  Copyright © 2020 liuzhao. All rights reserved.
//

#import "UINavigationController+Revolve.h"

@implementation UINavigationController (Revolve)

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//是否自动旋转,返回YES可以自动旋转
- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}
//返回支持的方向
- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}
//这个是返回优先方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
