//
//  UILabelWithFexibleHeight.h
//  Cinemarun
//
//  Created by MaheepK on 28/08/15.
//  Copyright (c) 2015 Ergun Development LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabelWithFexibleHeight : UILabel

@property (nonatomic, assign) int lineSpacing;

@property (nonatomic, assign) CGRect updatedFrame;

@property (nonatomic, weak) IBOutlet NSLayoutConstraint * height;

@end
