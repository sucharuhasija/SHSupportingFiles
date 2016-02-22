//
//  UIViewController+AlertView.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "UIViewController+AlertView.h"

@implementation UIViewController (AlertView)


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

@end
