//
//  UIView+Appearance.m
//  StartKit
//
//  Created by Abhinay on 18/12/15.
//  Copyright © 2015 Dipen. All rights reserved.
//

#import "UIView+Appearance.h"

@implementation UIView (Appearance)

-(void)drawShadowPathWithSize:(CGSize)size andRadius:(CGFloat)radius
{
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = size;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.layer.bounds] CGPath];
}


-(void)drawShadowPathWithOffSet:(CGSize)offset shadowRadius:(CGFloat)shadowRadius cornerRadius:(CGFloat)radius
{
    [self makeCornerRadius:radius maskToBounds:NO];
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOpacity = 0.50;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
}


-(void)drawBorderWithColor:(UIColor *)color radius:(CGFloat)radius borderWidth:(CGFloat)width maskToBounds:(BOOL)maskToBounds
{
    [self makeCornerRadius:radius maskToBounds:maskToBounds];
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
}

-(void)makeCornerRadius:(CGFloat)cornerRadius maskToBounds:(BOOL)maskToBounds{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = maskToBounds;
}

- (void)addLinearGradientWithColor:(UIColor *)theColor transparentToOpaque:(BOOL)transparentToOpaque
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    //the gradient layer must be positioned at the origin of the view
//    CGRect gradientFrame = self.frame;
//    gradientFrame.origin.x = 0;
//    gradientFrame.origin.y = 0;
    gradient.frame = self.bounds;
    
    //build the colors array for the gradient
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[theColor CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.9f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.8f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.7f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.6f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.5f] CGColor],
                       (id)[[UIColor clearColor] CGColor],
                       nil];
    
    //reverse the color array if needed
    if(transparentToOpaque){
        colors = [[colors reverseObjectEnumerator] allObjects];
    }
    
    //apply the colors and the gradient to the view
    gradient.colors = colors;
    
    [self.layer insertSublayer:gradient atIndex:0];
}

-(void)drawCircle{
    [self makeCornerRadius:self.frame.size.width/2 maskToBounds:YES];
}

-(void)drawCircleWithBorderColor:(UIColor *)color{
    [self drawBorderWithColor:color radius:self.frame.size.width/2 borderWidth:1.0 maskToBounds:YES];
}


@end
