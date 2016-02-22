//
//  CreatePdf.m
//  rehabbudgeter
//
//  Created by Sucharu hasija on 19/10/15.
//  Copyright © 2015 crayonLabs. All rights reserved.
//

#import "CreatePdf.h"

@implementation CreatePdf

+(NSMutableArray *) CreateHeaderForThePDFForSelectedState:(int) state
{

    NSMutableArray* headers = [[NSMutableArray alloc] initWithObjects:@"Rooms", @"Items", @"Quantity",  nil];
    
      NSMutableArray *roomOnly  =[[NSMutableArray alloc] initWithObjects:@"Room",@" ",@"QTY",@"Total",  nil]; 
    
    switch (state) {
        case 1:
            [headers addObject:@"LabourCost"];
            
            break;
        case 2:
            
            [headers addObject:@"Material Cost"];
            
            break;
        case 3:
            [headers addObject:@"LabourCost"];
            [headers addObject:@"Material Cost"];
            
            break;
        case 10:
            [headers addObject:@"Room Total"];
            
            
            break;
        case 11:
            [headers addObject:@"LabourCost"];
            [headers addObject:@"Room Total"];
            
            break;
        case 12:
            [headers addObject:@"Material Cost"];
            [headers addObject:@"Room Total"];
            
            break;
        case 13:
            [headers addObject:@"LabourCost"];
            [headers addObject:@"Material Cost"];
            [headers addObject:@"Cost Per Item"];
            break;
        case 25:
            return roomOnly;
          
            break;
            
        default:
            break;
    }
    
    
    
    [headers addObject:@"Total"];
    
    NSLog(@"%@",headers);
    
    return headers;


}
+(NSMutableArray *) CreatePDFContentForTheRoomTotalOnlyWithObject:(PFObject*) object WithRowDataForPDF:(NSMutableArray *) rowData
{

    NSArray *components = [object valueForKey:@"components"];

    
    
    [rowData removeAllObjects];
    
    NSMutableArray* headers = [[NSMutableArray alloc] initWithObjects:@"Rooms",@"",@"QTY", @"Total",  nil];
    
    
    
    
    [rowData addObject:headers];
    float totaltotalSum = 0.0;
    float totalSum = 0.0;
    float quantity = 0.0;
    for (int i =0 ; i < components.count; i++) {
        NSString *componentname = [components objectAtIndex:i];
        
        
        
        totalSum = 0;
        quantity = 0;
        
        NSMutableArray * arry = [[NSMutableArray alloc] initWithArray:[object valueForKey:[componentname stringByReplacingOccurrencesOfString:@" " withString:@"_"]]];
        
        
        
        // Sort an array using sort descriptors
        
        NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"itemName" ascending:YES];
        [arry sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
        
        
        if (arry.count !=0) {
            
            
            for (int j = 0; j< arry.count; j++) {
                
                NSMutableDictionary * itemDetails = [[NSMutableDictionary alloc] initWithDictionary:[arry objectAtIndex:j]];
                
                totalSum = [itemDetails[@"totalCost"] floatValue]+totalSum;
                quantity = [itemDetails[@"quantity"] floatValue] +quantity;
             
                 NSLog(@" insisde QUANTITY ---> %f Total Sum -->  %f",quantity,totalSum);
            }
            totaltotalSum = totaltotalSum + totalSum;
            NSLog(@"QUANTITY ---> %f Total Sum -->  %f",quantity,totalSum);
            NSArray *arr = [NSArray arrayWithObjects:componentname,@"",[NSNumber numberWithFloat:quantity],[NSNumber numberWithFloat:totalSum], nil];
            [rowData addObject:arr];
            
        }
        
    }
    
    
    
    
    NSArray *arr1 = [NSArray arrayWithObjects:@"",@"Total Cost",[NSNumber numberWithInt:0],[NSNumber numberWithFloat:totaltotalSum], nil];
    [rowData addObject:arr1];
    
    
    return rowData;
}


+(NSMutableArray *) CreatePDFContentForTheOtherTotalWithObject:(PFObject *)object hasNumberOfRows:(int) rows numberofColumns:(int) columns WithRowData:(NSMutableArray *) rowData
{

    NSArray *components = [object valueForKey:@"components"];
    [rowData addObject:[self CreateHeaderForThePDFForSelectedState:columns]];
    
    float totalSum = 0.0;
    float quantity = 0.0;
    NSMutableDictionary *itemDetails = [[NSMutableDictionary alloc] init];
    for (int i =0 ; i < components.count; i++) {
        NSString *componentname = [components objectAtIndex:i];
        
        NSLog(@"%i  %lu",i,(unsigned long)components.count);
        
        NSMutableArray * arry = [[NSMutableArray alloc] initWithArray:[object valueForKey:[componentname stringByReplacingOccurrencesOfString:@" " withString:@"_"]]];
        
        // Sort an array using sort descriptors
        
        NSSortDescriptor *lastNameSorter = [[NSSortDescriptor alloc] initWithKey:@"itemName" ascending:YES];
        [arry sortUsingDescriptors:[NSArray arrayWithObject:lastNameSorter]];
        
        
        if (arry.count !=0) {
            NSMutableArray *arr = [NSMutableArray arrayWithObjects:componentname,@"", nil];
            NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"",@"",nil];
            
            
            for (int k=2; k<=columns; k++) {
                [arr addObject:[NSNumber numberWithInt:0]];
                [arr1 addObject:[NSNumber numberWithInt:0]];
            }
            [rowData addObject:arr1];
            [rowData addObject:arr];
            
            
            for (int j = 0; j< arry.count; j++) {
                
                [itemDetails removeAllObjects];
                
                [itemDetails addEntriesFromDictionary:[arry objectAtIndex:j]];
                
                totalSum += [itemDetails[@"totalCost"] floatValue];
                quantity += [itemDetails[@"quantity"] floatValue];
                
                
                
                
                NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"",itemDetails[@"itemName"],itemDetails[@"quantity"],nil ];
                
                switch (columns) {
                    case 1:
                        [arr2 addObject:itemDetails[@"labourCost"]];
                        [arr2 addObject: itemDetails[@"totalCost"] ];
                        break;
                    case 2:
                        
                        [arr2 addObject:itemDetails[@"materialCost"]];
                        [arr2 addObject: itemDetails[@"totalCost"] ];
                        break;
                    case 3:
                        [arr2 addObject:itemDetails[@"labourCost"]];
                        [arr2 addObject:itemDetails[@"materialCost"]];
                        [arr2 addObject: itemDetails[@"totalCost"] ];
                        break;
                    case 10:
                        
                        [arr2 addObject:itemDetails[@"costPerItem"]];
                        [arr2 addObject:itemDetails[@"totalCost"]];
                        
                        break;
                    case 11:
                        [arr2 addObject:itemDetails[@"labourCost"]];
                        [arr2 addObject:itemDetails[@"costPerItem"]];
                        [arr2 addObject:itemDetails[@"totalCost"]];
                        
                        break;
                    case 12:
                        [arr2 addObject:itemDetails[@"materialCost"]];
                        [arr2 addObject:itemDetails[@"costPerItem"]];
                        [arr2 addObject:itemDetails[@"totalCost"]];
                        
                        break;
                    case 13:
                        [arr2 addObject:itemDetails[@"labourCost"]];
                        [arr2 addObject:itemDetails[@"materialCost"]];
                        [arr2 addObject:itemDetails[@"costPerItem"]];
                        [arr2 addObject:itemDetails[@"totalCost"]];
                        break;
                    default:
                        break;
                }
                
                
                [rowData addObject:arr2];
                //  NSLog(@"%@",self.rowData);
                NSLog(@"%i  %lu",i,(unsigned long)components.count);
                
                
            }
            
        }        }
    
    
    
    NSArray *arr = [NSArray arrayWithObjects:@"",@"Total Cost",[NSNumber numberWithInt:0],[NSNumber numberWithFloat:totalSum], nil];
    [rowData addObject:arr];
    // NSLog(@"OUT OF THE LOOP %@",rowData);
    
   // self.numberOfRows = (int)self.rowData.count;
    
    
    

    return rowData;

}

@end
