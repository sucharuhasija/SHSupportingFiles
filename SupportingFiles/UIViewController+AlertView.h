//
//  UIViewController+AlertView.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AlertView)



// UIAlert View
-(void)showSimpleAlertViewWithTitle:(NSString *) title Message:(NSString *)message andSecondaryButtonTitle:(NSString *) buttonTitle;


// Storing NSString in User Defaults
-(void)saveValueInUserDefaults:(NSString *) value forKey:(NSString *) key;
-(NSString *) GetValueForKeyInUserDefaults:(NSString *) key;

// Storing Object In User Defaults
-(void)saveObjectInUserDefaults:(id) object forKey:(NSString *) key;
-(id ) GetObjectForKeyInUserDefaults:(NSString *) key;



@end
