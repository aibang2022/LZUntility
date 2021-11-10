//
//  ABToast.m
//  AB_RealTimeBus
//
//  Created by Liu Zhao on 15/1/12.
//  Copyright (c) 2015年 Liu Zhao. All rights reserved.
//

#import "ABToast.h"

@implementation ABToast

bool isBottom;

+ (void)showDialog:(NSString *)content
{
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    
    isBottom = NO;
    
    [ABToast showDialog:content inView:window withTime:2.0];
}

+ (void)showNetworkError
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    isBottom = YES;
    
    [ABToast showDialog:@"网络不给力，请检查您的网络" inView:window withTime:3.0];
}

+ (void)showDialog:(NSString *)content inView:(UIView *)view withTime:(float)second
{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
    
    CGSize contentSize = [content boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 100, 380)
                                               options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                            attributes:attribute context:nil].size;
    
    contentSize.height += 15;
    contentSize.width += 30;

    float yPoint = (view.frame.size.height - contentSize.height) / 2; // 居中
    if (isBottom) {
        yPoint = view.frame.size.height - contentSize.height - 30 - 49; // 靠下
    }
    
    CGRect rect = CGRectMake((view.frame.size.width - contentSize.width)/2, yPoint, contentSize.width, contentSize.height);
    
    ABToast *toast = [[ABToast alloc] initWithFrame:rect];
    
    toast.userInteractionEnabled = NO;
    
    toast.layer.cornerRadius = 5;
    
    toast.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    [view addSubview:toast];
    
    [toast setTransform:CGAffineTransformMakeScale(0.8, 0.8)];
    
    toast.alpha = 0.1;
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, contentSize.width,contentSize.height)];
    
    contentLabel.backgroundColor = [UIColor clearColor];
    
    contentLabel.font = [UIFont boldSystemFontOfSize:16];
    
    contentLabel.text = content;
    
    contentLabel.numberOfLines = 0;
    
    contentLabel.textAlignment = NSTextAlignmentCenter;
    
    contentLabel.textColor = [UIColor whiteColor];
    
    [toast addSubview:contentLabel];
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         [toast setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
                         toast.alpha = 1.0;
                     } completion:^(BOOL finished) {
                         [toast setTransform:CGAffineTransformMakeScale(1.0, 1.0)];
                         
                         [toast performSelector:@selector(hiddenDialog) withObject:nil afterDelay:second];
                     }];
}

- (void)hiddenDialog
{
    [UIView animateWithDuration:0.2
                     animations:^{
                         [self setTransform:CGAffineTransformMakeScale(1.4, 1.4)];
                         self.alpha = 0.1;
                     } completion:^(BOOL finished) {
                         [self removeFromSuperview];
                     }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
