//
//  UIButton+Block.m
//  RuntimeLearn
//
//  Created by Liu Zhao on 16/5/31.
//  Copyright © 2016年 MIMO. All rights reserved.
//

#import "UIButton+Block.h"
#import <objc/runtime.h>

#define UIBUTTON_key_clicked	"UIButton.clicked"

@implementation UIButton (Block)

- (void)handlerClickedButton:(void (^)(UIButton *sender))aBlock {
    objc_setAssociatedObject(self, UIBUTTON_key_clicked, aBlock, OBJC_ASSOCIATION_COPY);
    
    [self removeTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    if (aBlock) {
        [self addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)buttonClick:(UIButton *)sender {
    void (^block)(UIButton *sender) = objc_getAssociatedObject(self, UIBUTTON_key_clicked);
    
    if (block) block(sender);
}

@end
