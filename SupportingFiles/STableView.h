//
//  STableView.h
//  SupportingFiles
//
//  Created by Sucharu hasija on 10/02/16.
//  Copyright © 2016 SucharuHasija. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STableView : UITableView<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray *data;
@end
