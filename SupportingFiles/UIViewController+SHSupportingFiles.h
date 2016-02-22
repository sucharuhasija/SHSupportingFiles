//
//  UIViewController+SHSupportingFiles.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 22/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+SupportingFiles.h"

@interface UIViewController (SHSupportingFiles)
// UIAlert View
-(void)showSimpleAlertViewWithTitle:(NSString *) title Message:(NSString *)message andSecondaryButtonTitle:(NSString *) buttonTitle;


// Storing NSString in User Defaults
-(void)saveValueInUserDefaults:(NSString *) value forKey:(NSString *) key;
-(NSString *) GetValueForKeyInUserDefaults:(NSString *) key;

// Storing Object In User Defaults
-(void)saveObjectInUserDefaults:(id) object forKey:(NSString *) key;
-(id ) GetObjectForKeyInUserDefaults:(NSString *) key;


// Get Document And Cache Directory
- (NSString *)applicationDocumentDirectoryString;
- (NSString *)applicationCacheDirectoryString;



#pragma mark - Test Email and password
-(BOOL) isValidEmail:(NSString *) email;
-(BOOL) isValidPassword:(NSString *) password;



-(NSString *) currentDateString;
-(NSString *) currentDateStringWithFormat:(NSString *) format
@end
