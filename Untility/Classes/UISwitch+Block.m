//
//  UISwitch+Block.m
//  Untils
//
//  Created by Liu Zhao on 16/6/8.
//  Copyright © 2016年 Liu Zhao. All rights reserved.
//

#import "UISwitch+Block.h"
#import <objc/runtime.h>

#define UISwitch_key_clicked	"UISegmentedControl.clicked"

@implementation UISwitch (Block)

- (void)handlerSwitchChange:(void (^)(UISwitch *sender))aBlock {
    objc_setAssociatedObject(self, UISwitch_key_clicked, aBlock, OBJC_ASSOCIATION_COPY);
    
    [self removeTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    if (aBlock) {
        [self addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)switchChange:(UISwitch *)sender {
    void (^block)(UISwitch *sender) = objc_getAssociatedObject(self, UISwitch_key_clicked);
    
    if (block) block(sender);
}

@end
