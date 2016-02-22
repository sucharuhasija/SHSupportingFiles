//
//  NSDate+StartTime.h
//  Cinemarun
//
//  Created by Yun Sun on 8/5/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (StartTime)

- (NSString *) startTime;
-(NSString*)getCurrentTime;
-(NSString *) getCurrentDate;
-(NSString *)getCurrentDateWithFormat:(NSString *) format;
- (UIColor *)getColorFromHexString:(NSString *)hexString :(CGFloat)alphaValue;
-(NSString*)getBirthDate :(NSString*)date;
-(NSInteger)getAge :(NSString*)date;
@end

