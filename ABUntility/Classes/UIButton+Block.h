//
//  UIButton+Block.h
//  RuntimeLearn
//
//  Created by Liu Zhao on 16/5/31.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Block)

- (void)handlerClickedButton:(void (^)(UIButton *sender))aBlock;

@end
