//
//  UILabel+Moving.m
//  SupportingUtilities
//
//  Created by Sucharu hasija on 28/01/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "UILabel+Moving.h"
static int value = 10;
#define ARC4RANDOM_MAX  0x100000000

@implementation UILabel (Moving)
-(void) changeColorOfLabalWithDuration:(NSInteger ) time
{
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(ChangeColorInLabel) userInfo:nil repeats:YES];


}


-(void)ChangeColorInLabel
{
    
    [UIView animateKeyframesWithDuration:2.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        if(self.frame.origin.x <  250)
        {
            
            
            
            
            
            
            // Set vertical effect
            UIInterpolatingMotionEffect *verticalMotionEffect =
            [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.y"
             type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
            verticalMotionEffect.minimumRelativeValue = @(-100);
            verticalMotionEffect.maximumRelativeValue = @(100);
            
            // Set horizontal effect
            UIInterpolatingMotionEffect *horizontalMotionEffect =
            [[UIInterpolatingMotionEffect alloc]
             initWithKeyPath:@"center.x"
             type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
            horizontalMotionEffect.minimumRelativeValue = @(-10);
            horizontalMotionEffect.maximumRelativeValue = @(10);
            
            // Create group to combine both
            UIMotionEffectGroup *group = [UIMotionEffectGroup new];
            group.motionEffects = @[horizontalMotionEffect, verticalMotionEffect];
            
            // Add both effects to your view
            [self addMotionEffect:group];
            [self setFrame:CGRectMake(self.frame.origin.x + 20, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
           
        // self.frame.origin  = CGPointMake(self.frame.origin.x + 10 , self.frame.origin.y);
          [self setAlpha:arc4random()*10];
            NSLog(@"%f",(double)arc4random() / ARC4RANDOM_MAX);
        }
        else
        {
        
         [self setFrame:CGRectMake(30, self.frame.origin.y, self.frame.size.width, self.frame.size.height)];
            NSString *lastPart = [self.text substringFromIndex:self.text.length-1];
            NSString * remaingPart = [self.text substringToIndex:self.text.length-1];
            lastPart = [lastPart stringByAppendingString:remaingPart];
            self.text = lastPart;
          
        }
        value++;
       // [self setFont:[UIFont boldSystemFontOfSize:value]];
        self.textColor = [self randomColor];
      //  [self setShadowColor:[self randomColor]];
    
    } completion:nil];
    
    
}
- (UIColor*) randomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

-(void)RotateString
{
    
    //NSMutableString * string = [[NSMutableString alloc] initWithString:self.text];
    
    [UIView animateKeyframesWithDuration:2.0 delay:0.0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{

        

        } completion:nil];



}
@end
