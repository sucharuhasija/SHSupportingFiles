//
//  UIView+Appearance.h
//  StartKit
//
//  Created by Abhinay on 18/12/15.
//  Copyright © 2015 Dipen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Appearance)

-(void)drawShadowPathWithSize:(CGSize)size andRadius:(CGFloat)radius;
-(void)drawShadowPathWithOffSet:(CGSize)offset shadowRadius:(CGFloat)shadowRadius cornerRadius:(CGFloat)radius;
-(void)drawBorderWithColor:(UIColor *)color radius:(CGFloat)radius borderWidth:(CGFloat)width maskToBounds:(BOOL)maskToBounds;
-(void)makeCornerRadius:(CGFloat)cornerRadius maskToBounds:(BOOL)maskToBounds;

- (void)addLinearGradientWithColor:(UIColor *)theColor transparentToOpaque:(BOOL)transparentToOpaque;

-(void)drawCircle;
-(void)drawCircleWithBorderColor:(UIColor *)color;

@end
