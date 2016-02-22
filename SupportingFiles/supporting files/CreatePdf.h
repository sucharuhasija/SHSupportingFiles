//
//  CreatePdf.h
//  rehabbudgeter
//
//  Created by Sucharu hasija on 19/10/15.
//  Copyright © 2015 crayonLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <Parse/Parse.h>

@interface CreatePdf : NSObject

@property(nonatomic)CGContextRef currentContext;

+(NSMutableArray *) CreateHeaderForThePDFForSelectedState:(int) state;
+(NSMutableArray *) CreatePDFContentForTheRoomTotalOnlyWithObject:(PFObject*) object WithRowDataForPDF:(NSMutableArray *) rowData;
+(NSMutableArray *) CreatePDFContentForTheOtherTotalWithObject:(PFObject *)object hasNumberOfRows:(int) rows numberofColumns:(int) columns WithRowData:(NSMutableArray *) rowData;





@end
