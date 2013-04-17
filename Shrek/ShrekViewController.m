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
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ShrekViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.model = [[ShrekModel alloc] init];
    
    [self.model fetchDealsWithSuccess:^{
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
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
        NSDictionary *deal = [self.model.deals objectAtIndex:[indexPath row]];
        cell.textLabel.text = [deal objectForKey:@"title"];
    }
    
    return cell;
}


#pragma mark - UITableViewDelegate

@end
