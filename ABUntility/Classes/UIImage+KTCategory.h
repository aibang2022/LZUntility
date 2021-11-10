//
//  UIImage+KTCategory.h
//  PhotoWall
//
//  Created by 钊 刘 on 11-12-5.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (KTCategory)

- (UIImage *)imageScaleAspectToMaxSize:(CGFloat)newSize;
- (UIImage *)imageScaleAndCropToMaxSize:(CGSize)newSize;

- (UIImage*)thumbnailImage:(CGSize)targetSize;

@end
