//
//  UIViewController+AlertView.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertView)
-(void)showSimpleAlertViewWithTitle:(NSString *) title Message:(NSString *)message andSecondaryButtonTitle:(NSString *) buttonTitle;
@end
