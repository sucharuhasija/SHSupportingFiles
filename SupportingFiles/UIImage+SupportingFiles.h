//
//  UIImage+SupportingFiles.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SupportingFiles)
// makes a copy at a different size
- (UIImage *)imageByScalingToSize:(CGSize)size;

// applies filter as described in Friday section
- (UIImage *)imageByApplyingFilterNamed:(NSString *)filterName;
- (UIImage *)imageWithBlend:(CGFloat)opacity;
- (UIImage *)imageWithColorOverlay:(UIColor *)color;

// Image effects
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
+ (UIImage *)patternImageWithSize:(CGSize)size;
+ (UIImage*)resizeImage:(UIImage*)image withWidth:(CGFloat)width withHeight:(CGFloat)height;
+ (UIImage *)croppIngimageByImageName:(UIImage *)imageToCrop toRect:(CGRect)rect;

@end
