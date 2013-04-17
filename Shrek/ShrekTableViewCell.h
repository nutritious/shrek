//
//  ShrekTableViewCell.h
//  Shrek
//
//  Created by Andrey Yegorov on 4/17/13.
//  Copyright (c) 2013 Andrey Yegorov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShrekTableViewCell : UITableViewCell

+ (int)cellHeight;

@property (nonatomic, weak) IBOutlet UIView *cellView;
@property (nonatomic, weak) IBOutlet UIImageView *dealImage;
@property (nonatomic, weak) IBOutlet UILabel *dealLabel;

@end
