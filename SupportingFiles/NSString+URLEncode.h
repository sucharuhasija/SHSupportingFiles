//
//  NSString+URLEncode.h
//  Talentt
//
//  Created by Yun Sun on 4/18/15.
//  Copyright (c) 2015 Talentt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLEncode)

- (NSString *)URLEncode;
- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)URLDecode;
- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding;

@end
