//
//  UIImage+KTCategory.m
//  PhotoWall
//
//  Created by 钊 刘 on 11-12-5.
//  Copyright (c) 2011年 __MyCompanyName__. All rights reserved.
//

#import "UIImage+KTCategory.h"


@implementation UIImage (KTCategory)

- (UIImage *)imageScaleAspectToMaxSize:(CGFloat)newSize {
    CGSize size = [self size];
    CGFloat ratio;
    if (size.width > size.height) {
        ratio = newSize / size.width;
    } else {
        ratio = newSize / size.height;
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, ratio * size.width, ratio * size.height);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    return scaledImage;
}

/* GCD里不能调用 */
- (UIImage *)imageScaleAndCropToMaxSize:(CGSize)newSize {
    CGFloat largestSize = (newSize.width > newSize.height) ? newSize.width : newSize.height;
    CGSize imageSize = [self size];
    
    //图片压缩
    CGFloat ratio;
    if (imageSize.width > imageSize.height) {
        ratio = largestSize / imageSize.height;
    } else {
        ratio = largestSize / imageSize.width;
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, ratio * imageSize.width, ratio * imageSize.height);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    
    CGFloat offsetX = 0;
    CGFloat offsetY = 0;
    imageSize = [scaledImage size];
    if (imageSize.width < imageSize.height) {
        offsetY = (imageSize.height / 2) - (imageSize.width / 2);
    } else {
        offsetX = (imageSize.width / 2) - (imageSize.height / 2);
    }
    
    CGRect cropRect = CGRectMake(offsetX, offsetY,
                                 imageSize.width - (offsetX * 2),
                                 imageSize.height - (offsetY * 2));
    
    CGImageRef croppedImageRef = CGImageCreateWithImageInRect([scaledImage CGImage], cropRect);
    UIImage *newImage = [UIImage imageWithCGImage:croppedImageRef];
    CGImageRelease(croppedImageRef);
    
    return newImage;
}

- (UIImage *)thumbnailImage:(CGSize)targetSize
{
    UIImage *sourceImage = self;
    
    UIImage *newImage = nil;
    
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width * screenScale;
    
    CGFloat targetHeight = targetSize.height * screenScale;
    
    CGFloat scaleFactor = 0.0;
    
    CGFloat scaledWidth = targetWidth;
    
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        
        scaledWidth  = width * scaleFactor;
        
        scaledHeight = height * scaleFactor;
        
        // center the image
        
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight)); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    
    thumbnailRect.origin = thumbnailPoint;
    
    thumbnailRect.size.width  = scaledWidth;
    
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
