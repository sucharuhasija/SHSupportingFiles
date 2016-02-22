//
//  CreatePDFFile.h
//  rehabbudgeter
//
//  Created by Sucharu hasija on 28/10/15.
//  Copyright © 2015 crayonLabs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
#import <Parse/Parse.h>


@interface CreatePDFFile : NSObject


+(void) initializeDefaultValuesForRows:(int)rows columns:(int)Columns object:(PFObject *) object;



+(NSURL*) CreatePDFFileForEmailWithData:(NSMutableArray *) rowData andParseObject:(PFObject*) object andProjectDate:(NSString*) date withSelectedState:(int) selectedState andNumberOfColumns:(int)numberOfColumns andNumberOfRows:(int) Rows andPageCountInTheTable:(BOOL)PageCountMoreThanOne;
+(void)drawTableAt:(CGPoint)origin
     withRowHeight:(int)rowHeight
    andColumnWidth:(int)columnWidth
       andRowCount:(int)numberOfRows
    andColumnCount:(int)numberOfColumns;
+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to;
+(void)drawTableDataAt:(CGPoint)origin
         withRowHeight:(int)rowHeight
        andColumnWidth:(int)columnWidth
           andRowCount:(int)numberOfRows
        andColumnCount:(int)numberOfColumns
          andPageCount:(BOOL)PageCountMoreThanOne
            andRowData:(NSMutableArray *) rowData
            andSelectedState:(int) selectedState;
+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect;

+(void) numberofPagesinPDF:(CTFrameRef ) frameRef   andRowCount:(int)numberOfRows
            andColumnCount:(int)numberOfColumns
              andPageCount:(BOOL)PageCountMoreThanOne
                andRowData:(NSMutableArray *) rowData
          andSelectedState:(int) selectedState;

@end
