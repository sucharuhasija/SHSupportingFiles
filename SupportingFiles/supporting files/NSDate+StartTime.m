//
//  NSDate+StartTime.m
//  Cinemarun
//
//  Created by Yun Sun on 8/5/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import "NSDate+StartTime.h"

@implementation NSDate (StartTime)

- (NSString *)startTime
{
    NSDate *now = [NSDate date];
    BOOL isAgo = ([self compare:now] == NSOrderedAscending);
    double deltaSeconds = fabs([self timeIntervalSinceDate:now]);
    double deltaMinutes = deltaSeconds / 60.0f;
    
    int minutes;
    
    if(deltaSeconds < 5)
    {
        return @"Starts now";
    }
    else if(deltaSeconds < 60)
    {
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d seconds ago", (int)deltaSeconds];
        else
            return [NSString stringWithFormat:@"Starts in %d seconds", (int)deltaSeconds];
    }
    else if(deltaSeconds < 120)
    {
        if (isAgo)
            return @"Started a minute ago";
        else
            return @"Starts in a minute";
    }
    else if (deltaMinutes < 60)
    {
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d minutes ago", (int)deltaMinutes];
        else
            return [NSString stringWithFormat:@"Starts in %d minutes", (int)deltaMinutes];
    }
    else if (deltaMinutes < 120)
    {
        if (isAgo)
            return @"Started an hour ago";
        else
            return @"Starts in an hour";
    }
    else if (deltaMinutes < (24 * 60))
    {
        minutes = (int)floor(deltaMinutes/60);
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d hours ago", (int)minutes];
        else
            return [NSString stringWithFormat:@"Starts in %d hours", (int)minutes];
    }
    else if (deltaMinutes < (24 * 60 * 2))
    {
        if (isAgo)
            return @"Started yesterday";
        else
            return @"Starts tomorrow";
    }
    else if (deltaMinutes < (24 * 60 * 7))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24));
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d days ago", (int)minutes];
        else
            return [NSString stringWithFormat:@"Starts in %d days", (int)minutes];
    }
    else if (deltaMinutes < (24 * 60 * 14))
    {
        if (isAgo)
            return @"Started last week";
        else
            return @"Starts next week";
    }
    else if (deltaMinutes < (24 * 60 * 31))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24 * 7));
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d weeks ago", (int)minutes];
        else
            return [NSString stringWithFormat:@"Starts in %d weeks", (int)minutes];
    }
    else if (deltaMinutes < (24 * 60 * 61))
    {
        if (isAgo)
            return @"Started last month";
        else
            return @"Starts next month";
    }
    else if (deltaMinutes < (24 * 60 * 365.25))
    {
        minutes = (int)floor(deltaMinutes/(60 * 24 * 30));
        if (isAgo)
            return [NSString stringWithFormat:@"Started %d months ago", (int)minutes];
        else
            return [NSString stringWithFormat:@"Starts in %d months", (int)minutes];
    }
    else if (deltaMinutes < (24 * 60 * 731))
    {
        if (isAgo)
            return @"Started last year";
        else
            return @"Starts next year";
    }
    
    minutes = (int)floor(deltaMinutes/(60 * 24 * 365));
    if (isAgo)
        return [NSString stringWithFormat:@"Started %d years ago", (int)minutes];
    else
        return [NSString stringWithFormat:@"Starts in %d years", (int)minutes];
}

- (NSString *) stringFromFormat:(NSString *)format withValue:(NSInteger)value
{
    return [NSString stringWithFormat:format, value];
}
-(NSInteger)getAge :(NSString*)date
{
    // Get current date time
    
    //NSDate *currentDateTime = [NSDate date];
    
    // Instantiate a NSDateFormatter
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    // Set the dateFormatter format
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    
    
    // Get the date time in NSString
    
    NSDate *dateInStringFormated = [dateFormatter dateFromString:date];
    
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
    
    // Set the dateFormatter format
    
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    
    
    // Get the date time in NSString
    
    NSDate *dateInStringFormated = [dateFormatter dateFromString:date];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *dateInString = [dateFormatter stringFromDate:dateInStringFormated];
    
    return dateInString;
    
}


-(NSString*)getCurrentTime
{
    NSDate *currentDateTime = [NSDate date];
    // Instantiate a NSDateFormatter
    NSDateFormatter *dateFormatter = [self dateFormatter];
    // Set the dateFormatter format
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    [dateFormatter setDateFormat:@"HH:mm"];
    // Get the date time in NSString
    NSString *dateInStringFormated = [dateFormatter stringFromDate:currentDateTime];
    return dateInStringFormated;
}
-(NSString *) getCurrentDate
{
   
    // Instantiate a NSDateFormatter
    NSDateFormatter *dateFormatter = [self dateFormatter];
    // Set the dateFormatter format
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    [dateFormatter setDateFormat:@"YYYY:MM:DD"];
    // Get the date time in NSString
   return [dateFormatter stringFromDate:self];


}
-(NSDateFormatter *) dateFormatter
{


return [[NSDateFormatter alloc] init];

}

-(NSString *)getCurrentDateWithFormat:(NSString *) format
{



    NSDateFormatter *dateFormatter = [self dateFormatter];
    // Set the dateFormatter format
    //[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // or this format to show day of the week Sat,11-12-2011 23:27:09
    [dateFormatter setDateFormat:format];
    // Get the date time in NSString
    return [dateFormatter stringFromDate:self];


}
@end
