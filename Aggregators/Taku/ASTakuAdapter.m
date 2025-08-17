#import "ASTakuAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASTakuAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"Taku"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    [ASLogger i:@"[Taku] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.taku" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}
- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void (^)(ASBidResponse * _Nullable, NSError * _Nullable))completion {
    ASBidResponse *resp = [ASBidResponse new];
    resp.network = @"Taku";
    resp.ecpm = 0;
    if (completion) completion(resp, nil);
}
@end