//
//  UITableView+helper.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "UITableView+helper.h"

@implementation UITableView (helper)
@dynamic data;
+ (UITableView *)sharedManager
{
    static UITableView *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
        
    });
    
    return _sharedManager;
}
-(void)setData:(NSMutableArray *)data
{

    self.data = data;
    self.dataSource = self;
    self.delegate = self;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{



    return self.data.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{


    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil)
    {
        
        cell = [[UITableViewCell alloc] init];
        
    }
    cell.textLabel.text = @"Hello";
    
    return cell;

}

@end
