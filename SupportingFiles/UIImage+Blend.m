//
//  UIImage+Blend.m
//  Cinemarun
//
//  Created by Yun Sun on 8/6/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import "UIImage+Blend.h"

@implementation UIImage(Blend)

- (UIImage *)imageWithBlend:(CGFloat)opacity {
    
    UIGraphicsBeginImageContextWithOptions(self.size, YES, [[UIScreen mainScreen] scale]);
    
    CGRect contextRect;
    
    contextRect.origin.x = 0.0f;
    contextRect.origin.y = 0.0f;
    contextRect.size = [self size];
    
    UIGraphicsBeginImageContextWithOptions(contextRect.size, NO, [[UIScreen mainScreen] scale]);
    
    [self drawInRect:contextRect blendMode:kCGBlendModeNormal alpha:opacity];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
