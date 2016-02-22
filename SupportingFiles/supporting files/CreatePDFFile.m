//
//  CreatePDFFile.m
//  rehabbudgeter
//
//  Created by Sucharu hasija on 28/10/15.
//  Copyright © 2015 crayonLabs. All rights reserved.
//

#import "CreatePDFFile.h"
#import "CreatePdf.h"


@implementation CreatePDFFile



+(void) initializeDefaultValuesForRows:(int)rows columns:(int)Columns object:(PFObject *) object
{



    



}


+(NSURL*) CreatePDFFileForEmailWithData:(NSMutableArray *) rowData andParseObject:(PFObject*) object andProjectDate:(NSString*) date withSelectedState:(int) selectedState andNumberOfColumns:(int)numberOfColumns andNumberOfRows:(int) Rows andPageCountInTheTable:(BOOL)PageCountMoreThanOne
{




    NSDictionary * addressDetails = [object valueForKey:@"addressPageDict"];
    
    NSString *messageBody = [NSString stringWithFormat:@"\n \n Project Name: %@\n Address: %@\n Date of Visit: %@ \n Area: %@ \n No. of Beds: %@ \nNo. of Full Baths: %@ \n No. of Half Baths: %@ \n Basement Type: %@ \n Garage Type: %@ \n \n \n " ,addressDetails[@"projectName"],addressDetails[@"address"],date, addressDetails[@"sqft"], addressDetails[@"beds"] ,addressDetails[@"fullBaths"],addressDetails[@"halfBaths"], addressDetails[@"basementType"],addressDetails[@"garageType"]];
    
    
    NSLog(@"%@",messageBody);
    
    
    NSString* fileName = @"Test.pdf";
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    NSURL *pdfFileURL = [NSURL URLWithString: pdfFileName ];
    NSString* textToDraw = messageBody;
    CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
    
    // Prepare the text using a Core Text Framesetter.
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    CGRect frameRect = CGRectMake(0, -50, 400, 170);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    
    
    
    
    
    
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(pdfFileName, CGRectZero, nil);
    
    
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    
    
    
    int xOrigin = 30;
    int yOrigin = 200;
    
    int rowHeight = 30;
    int columnWidth = 80;
    
    int numberOfRows = (Rows+2>=19)?19:Rows+2;
    //int numberOfColumns = numberOfColumns;
    
    [self drawTableDataAt:CGPointMake(xOrigin, yOrigin)
            withRowHeight:rowHeight
           andColumnWidth:columnWidth
              andRowCount:numberOfRows
           andColumnCount:numberOfColumns
             andPageCount:PageCountMoreThanOne
               andRowData:rowData
       andSelectedState:selectedState];
//    [self drawTableDataAt:CGPointMake(xOrigin, yOrigin) withRowHeight:rowHeight andColumnWidth:columnWidth andRowCount:numberOfRows andColumnCount:numberOfColumns wi];
    [self drawTableAt:CGPointMake(xOrigin, yOrigin) withRowHeight:rowHeight andColumnWidth:columnWidth andRowCount:numberOfRows andColumnCount:numberOfColumns];
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 100);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    
    //    CGContextScaleCTM(currentContext, 1.0, -1.0);
    //    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
    
    
    for (int i=0; i< numberOfRows/20;i++ ) {
        PageCountMoreThanOne = YES;
        [self numberofPagesinPDF:frameRef   andRowCount:numberOfRows
                 andColumnCount:numberOfColumns
                   andPageCount:PageCountMoreThanOne
                     andRowData:rowData
         andSelectedState:selectedState];
        
        
    }
    
    
    
    CFRelease(frameRef);
    CFRelease(stringRef);
    CFRelease(framesetter);
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();





    return pdfFileURL;

}


+(void)drawTableAt:(CGPoint)origin
     withRowHeight:(int)rowHeight
    andColumnWidth:(int)columnWidth
       andRowCount:(int)numberOfRows
    andColumnCount:(int)numberOfColumns

{
    for (int i = 0; i <= numberOfRows; i++)
    {
        int newOrigin = origin.y + (rowHeight*i);
        
        CGPoint from = CGPointMake(origin.x, newOrigin);
        CGPoint to = CGPointMake(origin.x + (numberOfColumns*columnWidth), newOrigin);
        
        [self drawLineFromPoint:from toPoint:to];
    }
    
    for (int i = 0; i <= numberOfColumns; i++)
    {
        int newOrigin = origin.x + (columnWidth*i);
        
        CGPoint from = CGPointMake(newOrigin, origin.y);
        CGPoint to = CGPointMake(newOrigin, origin.y +(numberOfRows*rowHeight));
        
        [self drawLineFromPoint:from toPoint:to];
    }
}



+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.2, 0.2, 0.2, 0.3};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
}



// Present Data in Tables
+(void)drawTableDataAt:(CGPoint)origin
         withRowHeight:(int)rowHeight
        andColumnWidth:(int)columnWidth
           andRowCount:(int)numberOfRows
        andColumnCount:(int)numberOfColumns
          andPageCount:(BOOL)PageCountMoreThanOne
            andRowData:(NSMutableArray *) rowData
      andSelectedState:(int) selectedState
{
    
    int padding = 5;
    
    
    
    NSMutableArray* allInfo = [[NSMutableArray alloc] init];
    
    
    [allInfo addObjectsFromArray:[NSMutableArray arrayWithArray:rowData]];
    
    
    
    if(!PageCountMoreThanOne)
    {
        
        int count1 = allInfo.count>19?19:(int)allInfo.count;
        for(int i = 0; i < count1; i++)
        {
            NSArray* infoToDraw = [allInfo objectAtIndex:i];
            
            
            for (int j = 0; j < infoToDraw.count; j++)
            {
                
                int newOriginX = origin.x + (j*columnWidth);
                int newOriginY = origin.y + ((i+1)*rowHeight);
                
                CGRect frame = CGRectMake(newOriginX + padding, newOriginY + padding, columnWidth, rowHeight);
                
                if((j<2)|| i==0)
                {
                    [self drawText:[infoToDraw objectAtIndex:j] inFrame:frame];
                }
                else
                {
                    if([[infoToDraw objectAtIndex:j] intValue]==0)
                    {
                        [self drawText:@"" inFrame:frame];
                    }
                    else
                    {
                        [self drawText:[[infoToDraw objectAtIndex:j] stringValue] inFrame:frame];
                    }
                    
                }
            }
        }
    }
    
    else
    {
        origin = CGPointMake(30,200);
        int  count = (int)[allInfo count] -19;
        NSMutableArray * headerArray = [[NSMutableArray alloc] initWithArray:[CreatePdf CreateHeaderForThePDFForSelectedState:selectedState]];
        for (int k=0;k <headerArray.count ;k++) {
            
            
            int newOriginX = origin.x + ((k)*columnWidth);
            int newOriginY = origin.y + rowHeight;
            CGRect frame = CGRectMake(newOriginX + padding, newOriginY + padding, columnWidth, rowHeight);
            [self drawText:[headerArray objectAtIndex:k] inFrame:frame];
        }
        
        origin = CGPointMake(30,200+rowHeight);
        
        
        
        
        for(int i = 0; i < count; i++)
        {
            NSArray* infoToDraw = [allInfo objectAtIndex:i+19];
            
            for (int j = 0; j < infoToDraw.count; j++)
            {
                
                int newOriginX = origin.x + (j*columnWidth);
                int newOriginY = origin.y + ((i+1)*rowHeight);
                
                CGRect frame = CGRectMake(newOriginX + padding, newOriginY + padding, columnWidth, rowHeight);
                
                if(j< 2)
                {
                    [self drawText:[infoToDraw objectAtIndex:j] inFrame:frame];
                }
                else
                {
                    if([[infoToDraw objectAtIndex:j] floatValue]==0.0)
                    {
                        [self drawText:@"" inFrame:frame];
                    }
                    else
                    {
                        [self drawText:[[infoToDraw objectAtIndex:j] stringValue] inFrame:frame];
                    }
                    
                }
            }
        }
        
        PageCountMoreThanOne = NO;
        
    }
    
}



+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect
{
    
    NSLog(@"%@",textToDraw);
    CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
    // Prepare the text using a Core Text Framesetter.
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, frameRect.origin.y*2);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    
    // Draw the frame.
    
    CTFrameDraw(frameRef, currentContext);
    
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
    CFRelease(frameRef);
    CFRelease(stringRef);
    CFRelease(framesetter);
}



+(void) numberofPagesinPDF:(CTFrameRef ) frameRef   andRowCount:(int)numberOfRows
            andColumnCount:(int)numberOfColumns
              andPageCount:(BOOL)PageCountMoreThanOne
                andRowData:(NSMutableArray *) rowData
          andSelectedState:(int) selectedState

{
    
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(nil, CGAffineTransformIdentity);
    
    
    int xOrigin = 30;
    int yOrigin = 200;
    
    int rowHeight = 30;
    int columnWidth = 80;
    
    numberOfRows = (numberOfRows+2>19)?19:numberOfRows+2;
    numberOfColumns = numberOfColumns;
    
    
    // [self drawLineFromPoint:CGPointMake(200, 200) toPoint:CGPointMake(200, 400)];
    [self drawTableDataAt:CGPointMake(xOrigin, yOrigin)
            withRowHeight:rowHeight
           andColumnWidth:columnWidth
              andRowCount:numberOfRows
           andColumnCount:numberOfColumns
             andPageCount:PageCountMoreThanOne
               andRowData:rowData
         andSelectedState:selectedState];
    [self drawTableAt:CGPointMake(xOrigin, yOrigin) withRowHeight:rowHeight andColumnWidth:columnWidth andRowCount:numberOfRows andColumnCount:numberOfColumns];
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 100);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
}


@end
