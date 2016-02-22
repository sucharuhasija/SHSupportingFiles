//
//  STableViewFile.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 12/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface STableViewFile : NSObject <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong,readonly) NSMutableArray* sectionDescriptors;

-(id)init;
-(void)addSectionDescriptor:(NSMutableArray*)sectionDescriptor;

// dataSource and delegate
// messages are sent before block treatment if method implemented (override block calls)
@property (nonatomic,weak) NSObject<UITableViewDataSource>* dataSource;
@property (nonatomic,weak) NSObject<UITableViewDelegate>* delegate;
@end
