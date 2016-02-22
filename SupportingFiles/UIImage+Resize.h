//
//  UIImage+Resize.h
//  Cinemarun
//
//  Created by MaheepK on 19/08/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Resize)

+ (UIImage*)resizeImage:(UIImage*)image withWidth:(CGFloat)width withHeight:(CGFloat)height;
+ (UIImage *)croppIngimageByImageName:(UIImage *)imageToCrop toRect:(CGRect)rect;

@end
