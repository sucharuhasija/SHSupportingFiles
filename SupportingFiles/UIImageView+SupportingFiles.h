//
//  UIImageView+SupportingFiles.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^LBBlurredImageCompletionBlock)(void);

extern CGFloat const kLBBlurredImageDefaultBlurRadius;
@interface UIImageView (SupportingFiles)
-(void)downloadFromURL:(NSString *)url withPlaceholder:(UIImage *)placehold;
@end
