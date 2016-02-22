//
//  NSString+Height.h
//  Cinemarun
//
//  Created by MaheepK on 26/08/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Height)

+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font;
+ (CGRect ) setAttributeWithString : (NSString *) string withLineSpacing:(int) lineSpacing withSize:(CGSize )sizeMake withFont:(UIFont *)font withLabel:(UILabel *)label setLabelTextColor:(UIColor *)color;

@end
