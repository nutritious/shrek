//
//  ShrekModel.m
//  Shrek
//
//  Created by Andrey Yegorov on 4/17/13.
//  Copyright (c) 2013 Andrey Yegorov. All rights reserved.
//

#import "ShrekModel.h"
#import "AFNetworking.h"

@interface ShrekModel()
@property (nonatomic, strong) NSArray *deals;
@end

@implementation ShrekModel

- (id)init {
    self = [super init];
    return self;
}

- (void)fetchDealsWithSuccess:(void (^)())success failure:(void(^)(NSError *error))failure {

    AFHTTPClient *httpClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:@"http://api.groupon.com/v2/"]];
    
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"GET"
                                                            path:@"deals"
                                                      parameters:@{@"client_id"   : @"1f9fd0bc3d6992f459336cd4525d4e58c8283c71",
                                                                   @"division_id" : @"san-francisco"}];
    
    AFJSONRequestOperation *jsonOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                            success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                                                                                self.deals = [JSON objectForKey:@"deals"];
                                                                                                if (success) {
                                                                                                    success();
                                                                                                }
                                                                                            }
                                                                                            failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                                                                                self.deals = nil;
                                                                                                
                                                                                                if (failure) {
                                                                                                    failure(error);
                                                                                                }
                                                                                            }];
    [httpClient enqueueHTTPRequestOperation:jsonOperation];
}

@end
