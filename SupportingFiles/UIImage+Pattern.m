//
//  UIImage+Pattern.m
//  Talentt
//
//  Created by Yun Sun on 5/30/15.
//  Copyright (c) 2015 Talentt. All rights reserved.
//

#import "UIImage+Pattern.h"

@implementation UIImage (Pattern)

+ (UIImage *)patternImageWithSize:(CGSize)size
{
    UIColor *patternColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dots_staggered_blue"]];
    
    return [UIImage imageWithColor:patternColor size:size];
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

@end
