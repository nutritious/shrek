//
//  ShrekViewController.m
//  Shrek
//
//  Created by Andrey Yegorov on 4/17/13.
//  Copyright (c) 2013 Andrey Yegorov. All rights reserved.
//

#import "ShrekViewController.h"
#import "ShrekModel.h"

static NSString * const kDealCellId = @"dealCell";

@interface ShrekViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) ShrekModel *model;
@end

@implementation ShrekViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.model = [[ShrekModel alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model.deals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDealCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDealCellId];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

@end
