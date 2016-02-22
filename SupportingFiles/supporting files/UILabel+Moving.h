//
//  UILabel+Moving.h
//  SupportingUtilities
//
//  Created by Sucharu hasija on 28/01/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Moving)
-(void) changeColorOfLabalWithDuration:(NSInteger ) time;
-(void) createTimeLabel;
-(void)createDateLabel;
-(void) setClock;
-(void)createDateLabelWithFormat:(NSString *)dateFromat;
@end
