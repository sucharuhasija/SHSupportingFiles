//
//  LocationHelper.m
//  Tinder
//
//  Created by Elluminati - macbook on 11/04/14.
//  Copyright (c) 2014 AppDupe. All rights reserved.
//

#import "LocationHelper.h"

@implementation LocationHelper

#pragma mark -
#pragma mark - Init

-(id)init
{
    if((self = [super init]))
    {
        //get current location
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
    }
    return self;
}

+(LocationHelper *)sharedObject
{
    static LocationHelper *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[LocationHelper alloc] init];
    });
    return obj;
}

-(void)locationPermissionAlert
{
    BOOL locationAllowed = [CLLocationManager locationServicesEnabled];
    if (locationAllowed==NO)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Service Disabled"
                                                        message:@"To re-enable, please go to Settings and turn on Location Service for this app."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

-(void)startLocationUpdating
{
    if (![CLLocationManager locationServicesEnabled])
    {
//        [[NSUserDefaults standardUserDefaults] setLocationDisable:@"1"];
//        [Helper showAlertWithTitle:@"Location Services disabled" Message:@"App requires location services to find your current city weather.Please enable location services in Settings."];
    }
    else
    {
        [self stopLocationUpdating];
        if (locationManager==nil)
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            
            if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
            {
                [locationManager requestWhenInUseAuthorization];
            }
        }
        [locationManager startUpdatingLocation];
    }
}

-(void)stopLocationUpdating
{
    [locationManager stopUpdatingLocation];
    locationManager.delegate=nil;
    if (locationManager)
    {
        locationManager=nil;
    }
}

-(void)startLocationUpdatingWithBlock:(DidUpdateLocation)block
{
    blockDidUpdate=[block copy];
    [self startLocationUpdating];
}

#pragma mark -
#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    switch([error code])
    {
        case kCLErrorLocationUnknown: // location is currently unknown, but CL will keep trying
            break;
            
        case kCLErrorDenied: // CL access has been denied (eg, user declined location use)
            //message = @"Sorry, flook has to know your location in order to work. You'll be able to see some cards but not find them nearby";
            break;
            
        case kCLErrorNetwork: // general, network-related error
            //message = @"Flook can't find you - please check your network connection or that you are not in airplane mode";
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    NSLog(@"didUpdateToLocation: %@", currentLocation);
    if (currentLocation != nil) {
        
        
        CLLocation *currentLocation = newLocation;
        [manager stopUpdatingLocation];
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (!(error))
             {
                 CLPlacemark *placemark = [placemarks objectAtIndex:0];
                 NSLog(@"\nCurrent Location Detected\n");
                 NSLog(@"placemark %@",placemark);
                 // NSString *locatedAt = [[placemark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                 NSString  *strForCurrentLongitude= [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
                 NSString  *strForCurrentLatitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
                 //NSString *Address = [[NSString alloc]initWithString:locatedAt];
                 NSString *Zipcode = [[NSString alloc]initWithString:placemark.postalCode];
                 NSLog(@"%@",Zipcode);
                 NSString * city = [[NSString alloc] initWithString:placemark.locality];
  
             }
             else
             {
                 NSLog(@"Geocode failed with error %@", error); // Error handling must required
             }
         }];
        
        

//        [[NSUserDefaults standardUserDefaults] setCurrentLatitude:strForCurrentLatitude];
//        [[UserDefaultHelper sharedObject]setCurrentLongitude:strForCurrentLongitude];
    
}
}
//
//- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager
//{
//    NSLog(@"Paused Updatting");
//}
//
//- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager
//{
//    NSLog(@"Resumed Updatting");
//}

@end
