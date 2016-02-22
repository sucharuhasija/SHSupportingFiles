//
//  NSString+Email.m
//  Talentt
//
//  Created by Yun Sun on 4/18/15.
//  Copyright (c) 2015 Talentt. All rights reserved.
//

#import "NSString+Email.h"

@implementation NSString (Email)

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
@end
