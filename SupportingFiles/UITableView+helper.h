//
//  UITableView+helper.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (helper) <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) NSMutableArray * data;
+ (UITableView *)sharedManager;
-(void)setData:(NSMutableArray *)data;
@end
