//
//  UIColor+Extensions.h
//  TRUCamera
//
//  Created by liuzhao on 2021/9/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extensions)

+ (UIColor *)colorWithHex:(long)hexColor;

+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
