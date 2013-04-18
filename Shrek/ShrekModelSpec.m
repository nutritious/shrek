#import "ShrekModel.h"
#import "ShrekTestsSpec.h"

@interface ShrekModel()

@property (nonatomic, strong) NSArray *deals;

- (void)showError:(NSError *)error JSON:(NSDictionary *)JSON failure:(void(^)(NSError *error))failure;

@end

SPEC_BEGIN(ShrekModelSpec)

USE_NOCILLA

describe(@"ShrekModel", ^{
    
    __block ShrekModel *model;
    
    beforeEach(^{
        model = [[ShrekModel alloc] init];
    });
    
    context(@"when fetching deals", ^{
        beforeEach(^{
        });
        
        context(@"when bad JSON is returned", ^{
            beforeEach(^{
                stubRequest(@"GET", @"http://api.groupon.com/v2/deals?client_id=1f9fd0bc3d6992f459336cd4525d4e58c8283c71&division_id=san-francisco")
                .andReturn(200)
                .withBody(@"}<-][");
            });
            
            it(@"alerts 'Sorry'", ^{
                [[[model shouldEventually] receive] showError:any() JSON:any() failure:any()];
                
                [model fetchDealsWithSuccess:nil failure:nil];
            });
        });
        
        context(@"when good JSON is returned", ^{
            beforeEach(^{
                stubRequest(@"GET", @"http://api.groupon.com/v2/deals?client_id=1f9fd0bc3d6992f459336cd4525d4e58c8283c71&division_id=san-francisco")
                .andReturn(200)
                .withBody([NSData dataWithContentsOfFile:@"ShrekModelResponse.json"]);
            });
            
            it(@"should set some deals", ^{
                [[[model shouldEventually] receive] setDeals:any()];
                
                [model fetchDealsWithSuccess:nil failure:nil];
            });
        });
    });
});

SPEC_END