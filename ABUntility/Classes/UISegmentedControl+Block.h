//
//  UISegmentedControl+Block.h
//  Untils
//
//  Created by Liu Zhao on 16/6/8.
//  Copyright © 2016年 Liu Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (Block)

- (void)handlerSegmentedChange:(void (^)(UISegmentedControl *sender))aBlock;

@end
