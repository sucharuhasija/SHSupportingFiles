//
//  UIViewController+SHSupportingFiles.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 22/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+SupportingFiles.h"
#import "LocationHelper.h"
#import "APTimeZones.h"
#import <CoreLocation/CoreLocation.h>





typedef  void (^ LocationDetails)(NSDictionary * objectcompletionBlock);

@interface UIViewController (SHSupportingFiles) <LocationDidUpdateProtocol>
{

}

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


#pragma mark - Current Date With Format

-(NSString *) currentDateString;
-(NSString *) currentDateStringWithFormat:(NSString *) format;

#pragma mark - Get Age Year and total days in String

-(NSString *)getAgeFromDateString:(NSString *)date;
-(NSString *) getFullAgeDetailFromDateString:(NSString *) date;

#pragma mark - Location Call Blocks
-(void)getLocationDetailsWithCompletionBlock:(void (^)(NSDictionary * object))completionBlock;



@end
