//
//  NSString+SupportingFiles.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSDate+StartTime.h"

@interface NSString (SupportingFiles)


// Email and password
- (BOOL)isValidEmail;
- (BOOL)isValidPassword;


// Custom Height
+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font;
+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font withLabel:(UILabel *)label setLabelTextColor:(UIColor *)color;
+ (NSMutableAttributedString *)setAttributeWithString:(NSString *)string withLineSpacing:(int)lineSpacing withFont:(UIFont *)font;


// URL Encode

- (NSString *)URLEncode;
- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)URLDecode;
- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding;

// trim String
-(NSString*) trimString:(NSString *)theString;
-(NSString *) removeNull:(NSString *) string;


//Getting Date From String

- (NSString *)DateToString:(NSDate *)date;

-(NSString *) CurrentDateString;
-(NSString *)stringFromDateString:(NSString *)dateString fromFormat:(NSString*)fromFormat toFormat:(NSString *)toFormat;

-(NSString *)DateToString:(NSDate *)date withFormate:(NSString *)format;
-(NSString *)DateToStringForScanQueue:(NSDate *)date;
-(int)dateDiffrenceFromDateInString:(NSString *)date1 second:(NSString *)date2;
-(int)dateDiffrenceFromDate:(NSDate *)startDate second:(NSDate *)endDate;
- (NSString*)prettyTimestampSinceDate:(NSDate*)date;



-(NSString *) gettingStartTimeFromCurrentWithGivenDate:(NSDate *) date;

@end
