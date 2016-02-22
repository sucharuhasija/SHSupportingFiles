//
//  STableView.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "STableView.h"

@implementation STableView


-(instancetype)initWithArray:(NSMutableArray *) array
{
    self.data = [[NSMutableArray alloc] initWithArray:array];
    if(self != nil)
    {
    return self;
    }
    
    STableView * table = [[STableView alloc] init];
    return table;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(NSInteger)numberOfRowsInSection:(NSInteger)section
{

    return self.data.count;

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
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return self.data.count;
}
-(UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

      UITableViewCell * cell = [[UITableViewCell alloc] init];
 
    cell.textLabel.text = @"Hello";
    
    return cell;



}

@end
