//
//  UIImageView+SupportingFiles.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "UIImageView+SupportingFiles.h"
#import "UIImage+SupportingFiles.h"

CGFloat const kLBBlurredImageDefaultBlurRadius            = 20.0;
CGFloat const kLBBlurredImageDefaultSaturationDeltaFactor = 1.0;

@implementation UIImageView (SupportingFiles)





#pragma mark - LBBlurredImage Additions

- (void)setImageToBlur:(UIImage *)image
       completionBlock:(LBBlurredImageCompletionBlock)completion
{
    [self setImageToBlur:image
              blurRadius:kLBBlurredImageDefaultBlurRadius
         completionBlock:completion];
}

- (void)setImageToBlur:(UIImage *)image
            blurRadius:(CGFloat)blurRadius
       completionBlock:(LBBlurredImageCompletionBlock) completion
{
    NSParameterAssert(image);
    NSParameterAssert(blurRadius >= 0);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        UIImage *blurredImage = [image applyBlurWithRadius:blurRadius
                                                 tintColor:nil
                                     saturationDeltaFactor:kLBBlurredImageDefaultSaturationDeltaFactor
                                                 maskImage:nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = blurredImage;
            if(completion) {
                completion();
            }
        });
    });
}
-(void)downloadFromURL:(NSString *)url withPlaceholder:(UIImage *)placehold
{
    if (placehold) {
        [self setImage:placehold];
    }
    if (url) {
        //
        if ([url rangeOfString:@"/Caches/"].location != NSNotFound) {
            NSData *imageData=[NSData dataWithContentsOfFile:url];
            UIImage* image = [[UIImage alloc] initWithData:imageData];
            if (image) {
                [self setImage:image];
                [self setNeedsLayout];
            }
            return;
        }
        
        NSString *strImgName = [[[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] componentsSeparatedByString:@"/"] lastObject];
       
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        NSString *cacheDirectory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        
        NSString *imagePath = [NSString stringWithFormat:@"%@/%@",cacheDirectory,strImgName];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSString *aURL=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        if ([fileManager fileExistsAtPath:imagePath]==NO)
        {
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
            dispatch_async(queue, ^(void) {
                
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:aURL]];
                [imageData writeToFile:imagePath atomically:YES];
                
                UIImage* image = [[UIImage alloc] initWithData:imageData];
                if (image) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self setImage:image];
                        [self setNeedsLayout];
                        
                    });
                }
            });
        }
        else{
            NSData *imageData=[NSData dataWithContentsOfFile:imagePath];
            UIImage* image = [[UIImage alloc] initWithData:imageData];
            if (image) {
                [self setImage:image];
                [self setNeedsLayout];
            }
        }
    }
}

@end
