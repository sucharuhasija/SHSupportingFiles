//
//  ViewController.m
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import "ViewController.h"
#import "STableView.h"
#import "UITableView+helper.h"
#import "STableViewFile.h"
#import "UIViewController+SHSupportingFiles.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *testTable;
@property (nonatomic,strong) STableViewFile * tableViewDescriptor;
@end
#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wprotocol"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
 
    self.tableViewDescriptor = [[STableViewFile alloc] init];
    
    // first section
        [self.tableViewDescriptor addSectionDescriptor:arr];
    
    
    
    NSString * dateString = @"04/03/1992";
    NSLog(@"%@",[self getFullAgeDetailFromDateString:dateString]);
    
    [self getLocationDetailsWithCompletionBlock:^(NSDictionary *object) {
        
    }];
    
    self.tableViewDescriptor.dataSource = self;
    self.tableViewDescriptor.delegate = self;
    
    // configure tableview
    self.testTable.delegate = self.tableViewDescriptor;
    self.testTable.dataSource = self.tableViewDescriptor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    
    cell.textLabel.text = @"HELLO";

    return cell;

}
@end
#pragma GCC diagnostic pop
