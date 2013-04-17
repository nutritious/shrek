//
//  ShrekModel.h
//  Shrek
//
//  Created by Andrey Yegorov on 4/17/13.
//  Copyright (c) 2013 Andrey Yegorov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShrekModel : NSObject

@property (nonatomic, readonly, strong) NSArray *deals;

- (void)fetchDeals;

@end
