//
//  NSString+SupportingFiles.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "NSString+SupportingFiles.h"

@implementation NSString (SupportingFiles)






- (BOOL)isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,5}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
- (BOOL)isValidPassword
{
    
    NSCharacterSet *cs = [NSCharacterSet characterSetWithCharactersInString:@"$%&@_-#!"];
    
    return (([self rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
            &&([self rangeOfCharacterFromSet:[NSCharacterSet lowercaseLetterCharacterSet]].location != NSNotFound)
            &&([self rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet] ].location != NSNotFound )
            &&([self rangeOfCharacterFromSet:cs ].location != NSNotFound ));
    
    
}
+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font
{
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString * attributeString = [self setAttributeWithString:string withLineSpacing:lineSpacing withFont:font];
    NSStringDrawingContext * con = [NSStringDrawingContext new];
    
    CGRect descriptionRect = [attributeString.string
                              boundingRectWithSize:sizeMake
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              attributes:attributeDictionary
                              context:con];
    
    CGFloat additionHeight = 0.0f;
    CGFloat noOfLine = ceilf(descriptionRect.size.height / font.pointSize);
    
    CGRect newRect = descriptionRect;
    newRect.size.height = ceilf(noOfLine * lineSpacing + descriptionRect.size.height + additionHeight);
    descriptionRect = newRect;
    
    return descriptionRect;
}

+ (NSMutableAttributedString *)setAttributeWithString:(NSString *)string withLineSpacing:(int)lineSpacing withFont:(UIFont *)font
{
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributeDictionary];
    NSMutableParagraphStyle *paragrahStyle = [[NSMutableParagraphStyle alloc] init];
    [paragrahStyle setLineSpacing:lineSpacing];
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragrahStyle range:NSMakeRange(0, [string length])];
    
    return attributedString;
}

+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font withLabel:(UILabel *)label setLabelTextColor:(UIColor *)color;
{
    
    NSDictionary *attributeDictionary = @{NSFontAttributeName:font};
    
    NSMutableAttributedString *attributeString = [self setAttributeWithString:string withLineSpacing:lineSpacing withFont:font];
    [attributeString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributeString.length)];
    label.font = font;
    label.attributedText = attributeString;
    
    CGRect descriptionRect = [attributeString.string
                              boundingRectWithSize:sizeMake
                              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                              attributes:attributeDictionary
                              context:nil];
    
    CGFloat noOfLine = ceilf(descriptionRect.size.height / font.pointSize);
    CGFloat additionHeight = 0.0f;
    
    CGRect newRect = descriptionRect;
    newRect.size.height = ceilf(noOfLine * lineSpacing + descriptionRect.size.height + additionHeight);
    descriptionRect = newRect;
    
    return descriptionRect;
}





- (NSString *)URLEncode {
    return [self URLEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                 (__bridge CFStringRef)self,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)URLDecode {
    return [self URLDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding {
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                 (__bridge CFStringRef)self,
                                                                                                 CFSTR(""),
                                                                                                 CFStringConvertNSStringEncodingToEncoding(encoding));
}
#pragma mark - String Utillity Functions

-(NSString*) trimString:(NSString *)theString
{
    NSString *theStringTrimmed = [theString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return theStringTrimmed;
}

-(NSString *) removeNull:(NSString *) string
{
    NSRange range = [string rangeOfString:@"null"];
    if (range.length > 0 || string == nil) {
        string = @"";
    }
    string = [self trimString:string];
    return string;
}
#pragma mark - datetime helper

- (NSDate *)stringToDate:(NSString *)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd:HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: dateString];
    return date;
}

- (NSDate *)stringToDate:(NSString *)dateString withFormate:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString: dateString];
    return date;
}

- (NSString *)DateToString:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd:HH:mm:ss"];//2013-07-15:10:00:00
    NSString * strdate = [formatter stringFromDate:date];
    return strdate;
}

-(NSString *)DateToString:(NSDate *)date withFormate:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];//2013-07-15:10:00:00
    NSString * strdate = [formatter stringFromDate:date];
    return strdate;
}

-(NSString *)DateToStringForScanQueue:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    NSString * strdate = [formatter stringFromDate:date];
    int dd=[[self trimString:strdate]intValue];
    NSString *format=@"";
    if (dd==1 || dd==21 || dd==31) {
        format=@"ddst MMMM yyyy, hh:mm:ss a";
    }
    else if (dd==2 || dd==22)
    {
        format=@"ddnd MMMM yyyy, hh:mm:ss a";
    }
    else if (dd==3)
    {
        format=@"ddrd MMMM yyyy, hh:mm:ss a";
    }
    else{
        format=@"ddth MMMM yyyy, hh:mm:ss a";
    }
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:format];
    strdate= [formatter2 stringFromDate:date];
    return strdate;
}

-(NSString *)DateToString:(NSDate *)date withFormateSufix:(NSString *)format{
    
    NSDateFormatter *prefixDateFormatter = [[NSDateFormatter alloc] init];
    [prefixDateFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [prefixDateFormatter setDateFormat:format];
    NSString * prefixDateString = [prefixDateFormatter stringFromDate:date];
    NSDateFormatter *monthDayFormatter = [[NSDateFormatter alloc] init];
    [monthDayFormatter setFormatterBehavior:NSDateFormatterBehavior10_4];
    [monthDayFormatter setDateFormat:@"d"];
    int date_day = [[monthDayFormatter stringFromDate:date] intValue];
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:date_day];
    
    prefixDateString = [prefixDateString stringByReplacingOccurrencesOfString:@"." withString:suffix];
    NSString *dateString =prefixDateString;
    
    return dateString;
}

-(NSString *)stringFromDateString:(NSString *)dateString fromFormat:(NSString*)fromFormat toFormat:(NSString *)toFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:fromFormat];
    NSDate *date = [formatter dateFromString:dateString];
    [formatter setDateFormat:toFormat];
    NSString *strToDate = [formatter stringFromDate:date];
    return strToDate;
}

-(int)dateDiffrenceFromDateInString:(NSString *)date1 second:(NSString *)date2
{
    // Manage Date Formation same for both dates
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy"];
    NSDate *startDate = [formatter dateFromString:date1];
    NSDate *endDate = [formatter dateFromString:date2];
    
    
    unsigned flags = NSCalendarUnitDay;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = (int)[difference day];
    
    return dayDiff;
}

-(int)dateDiffrenceFromDate:(NSDate *)startDate second:(NSDate *)endDate
{
    unsigned flags = NSCalendarUnitDay;
    NSDateComponents *difference = [[NSCalendar currentCalendar] components:flags fromDate:startDate toDate:endDate options:0];
    
    int dayDiff = (int)[difference day];
    if (dayDiff<1) {
        NSInteger hourDiff = [difference hour];
        if (hourDiff > 12) {
            return 1;
        }
    }
    return dayDiff;
}


- (NSString*)prettyTimestampSinceDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitWeekOfMonth | NSCalendarUnitMonth | NSCalendarUnitYear;
    NSDate *earliest = date;
    NSDate *latest = [NSDate date];
    NSDateComponents *components = [calendar components:unitFlags fromDate:earliest toDate:latest options:0];
    if (components.year >= 1) {
        return NSLocalizedString(@"over a year ago", nil);
    }
    if (components.month >= 1) {
        return [self stringForComponentValue:components.month withName:@"month" andPlural:@"months"];
    }
    if (components.weekOfMonth >= 1) {
        return [self stringForComponentValue:components.weekOfMonth withName:@"week" andPlural:@"weeks"];
    }
    if (components.day >= 1) {
        return [self stringForComponentValue:components.day withName:@"day" andPlural:@"days"];
    }
    if (components.hour >= 1) {
        return [self stringForComponentValue:components.hour withName:@"hour" andPlural:@"hours"];
    }
    if (components.minute >= 1) {
        return [self stringForComponentValue:components.minute withName:@"minute" andPlural:@"minutes"];
    }
    return NSLocalizedString(@"just now", nil);
}

- (NSString*)stringForComponentValue:(NSInteger)componentValue withName:(NSString*)name andPlural:(NSString*)plural
{
    NSString *timespan = NSLocalizedString(componentValue == 1 ? name : plural, nil);
    return [NSString stringWithFormat:@"%d %@ %@", (int)componentValue, timespan, NSLocalizedString(@"ago", nil)];
}
-(NSString *) CurrentDateString
{

    NSDate *latest = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd:HH:mm:ss"];
    return [dateFormatter stringFromDate:latest];
}

-(NSString *) CurrentDateStringWithFormat:(NSString *)dateString
{
    NSDate *latest = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateString];
    return [dateFormatter stringFromDate:latest];


}


// NSDate+startTime dependant
-(NSString *) gettingStartTimeFromCurrentWithGivenDate:(NSDate *) date
{
    
   return [date startTime];


}

-(NSInteger)getAge
{
    // Get current date time
    
    //NSDate *currentDateTime = [NSDate date];
    
    // Instantiate a NSDateFormatter
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Set the dateFormatter format
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    
    
    // Get the date time in NSString
    
    NSDate *dateInStringFormated = [dateFormatter dateFromString:self];
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:dateInStringFormated
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents year];
    return age;
}

-(NSString*)getBirthDate :(NSString*)date
{
    // Get current date time
    
    //NSDate *currentDateTime = [NSDate date];
    
    // Instantiate a NSDateFormatter
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
  
    
    
    
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    
    
    // Get the date time in NSString
    
    NSDate *dateInStringFormated = [dateFormatter dateFromString:date];
    NSDate* now = [NSDate date];
    NSDateComponents* yearComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitYear
                                       fromDate:dateInStringFormated
                                       toDate:now
                                       options:0];
    NSDateComponents* monthComponents = [[NSCalendar currentCalendar]
                                        components:NSCalendarUnitMonth
                                        fromDate:dateInStringFormated
                                        toDate:now
                                        options:0];
    NSDateComponents* dayComponent = [[NSCalendar currentCalendar]
                                        components:NSCalendarUnitDay
                                        fromDate:dateInStringFormated
                                        toDate:now
                                        options:0];
  
    
    
    
    
    NSString *dateInString = [NSString stringWithFormat:@" %li Years, %li Months, %li Days",[yearComponents year],[monthComponents month],[dayComponent day]];
    
    return dateInString;
      
}




@end
