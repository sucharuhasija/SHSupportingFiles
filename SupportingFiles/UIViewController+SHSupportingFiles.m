//
//  UIViewController+SHSupportingFiles.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 22/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "UIViewController+SHSupportingFiles.h"

@implementation UIViewController (SHSupportingFiles)



#pragma mark - AlertView
-(void)showSimpleAlertViewWithTitle:(NSString *) title Message:(NSString *)message andSecondaryButtonTitle:(NSString *) buttonTitle
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:buttonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self closeAlertview];
    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
    
}
-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - NSUserDefaults Storing and Retreival

-(void)saveValueInUserDefaults:(NSString *) value forKey:(NSString *) key
{
    
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:key];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *) GetValueForKeyInUserDefaults:(NSString *) key
{
    
    return [[NSUserDefaults standardUserDefaults] valueForKey:key];
    
}

-(void)saveObjectInUserDefaults:(id) object forKey:(NSString *) key
{
    
    
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(id ) GetObjectForKeyInUserDefaults:(NSString *) key
{
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
}

#pragma mark - Directory Path Methods

- (NSString *)applicationDocumentDirectoryString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (NSString *)applicationCacheDirectoryString
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return cacheDirectory;
}

#pragma mark - Test Email and password

-(BOOL) isValidEmail:(NSString *) email
{

    return [email isValidEmail];
}
-(BOOL) isValidPassword:(NSString *) password
{


    return [password isValidPassword];
}

#pragma mark - get Current Date And Time 

-(NSString *) currentDateString
{


    NSDate *latest = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd:HH:mm:ss"];
    return [dateFormatter stringFromDate:latest];

}
-(NSString *) currentDateStringWithFormat:(NSString *) format
{

    NSDate *latest = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:latest];



}

-(NSString *)getAgeFromDateString:(NSString *)date
{



return [NSString stringWithFormat:@"%li",[date getAge]];
}
-(NSString *) getFullAgeDetailFromDateString:(NSString *) date
{



return @"";
}
-(void)getLocationDetailsWithCompletionBlock:(void (^)(NSDictionary * object))completionBlock
{
    
 

    [[LocationHelper sharedObject] startLocationUpdating];
    [LocationHelper sharedObject].delegate = self;
  
 [[LocationHelper sharedObject] getLocationDetailsWithCompletionBlock:^(NSDictionary *objectcompletionBlock) {
    
     completionBlock(objectcompletionBlock);
 
 
 }];
    
}
-(void)locationUpdatedWithBlock:(NSDictionary *)dict
{




}
-(NSString *)getTimeZoneFromLocation:(CLLocation *) location;
{


    
    NSTimeZone* localTimeZone = [[APTimeZones sharedInstance] timeZoneWithLocation:location];
   return  [localTimeZone abbreviation];
}

@end
