//
//  ShrekTableViewCell.m
//  Shrek
//
//  Created by Andrey Yegorov on 4/17/13.
//  Copyright (c) 2013 Andrey Yegorov. All rights reserved.
//

#import "ShrekTableViewCell.h"

@implementation ShrekTableViewCell

+ (int)cellHeight {
    return 120.0;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"ShrekTableViewCellView" owner:self options:nil];
        [self.contentView addSubview:self.cellView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
