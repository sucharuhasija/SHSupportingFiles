//
//  LocationHelper.h
//  Tinder
//
//  Created by Elluminati - macbook on 11/04/14.
//  Copyright (c) 2014 AppDupe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^DidUpdateLocation)(CLLocation *newLocation,CLLocation *oldLocation,NSError *error);
typedef  void (^ LocationDetails)(NSDictionary * objectcompletionBlock);
@protocol  LocationDidUpdateProtocol

-(void)locationUpdatedWithBlock:(NSDictionary *) dict;


@end

@interface LocationHelper : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    DidUpdateLocation blockDidUpdate;
    LocationDetails blockDetails;
}

@property(retain,nonatomic) id<LocationDidUpdateProtocol> delegate;

-(id)init;

+(LocationHelper *)sharedObject;

-(void)locationPermissionAlert;

-(void)startLocationUpdating;
-(void)stopLocationUpdating;

-(void)startLocationUpdatingWithBlock:(DidUpdateLocation)block;
-(void)getLocationDetailsWithCompletionBlock:(LocationDetails)blockDetails;
@end
