//
//  UISegmentedControl+Block.m
//  Untils
//
//  Created by Liu Zhao on 16/6/8.
//  Copyright © 2016年 Liu Zhao. All rights reserved.
//

#import "UISegmentedControl+Block.h"
#import <objc/runtime.h>

#define UISegmentedControl_key_clicked	"UISegmentedControl.clicked"

@implementation UISegmentedControl (Block)

- (void)handlerSegmentedChange:(void (^)(UISegmentedControl *sender))aBlock {
    objc_setAssociatedObject(self, UISegmentedControl_key_clicked, aBlock, OBJC_ASSOCIATION_COPY);
    
    [self removeTarget:self action:@selector(segmentedControlChange:) forControlEvents:UIControlEventValueChanged];
    if (aBlock) {
        [self addTarget:self action:@selector(segmentedControlChange:) forControlEvents:UIControlEventValueChanged];
    }
}

- (void)segmentedControlChange:(UISegmentedControl *)sender {
    void (^block)(UISegmentedControl *sender) = objc_getAssociatedObject(self, UISegmentedControl_key_clicked);
    
    if (block) block(sender);
}

@end
