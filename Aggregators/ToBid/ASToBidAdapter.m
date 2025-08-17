#import "ASToBidAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASToBidAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"ToBid"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    [ASLogger i:@"[ToBid] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.tobid" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}
- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void (^)(ASBidResponse * _Nullable, NSError * _Nullable))completion {
    ASBidResponse *resp = [ASBidResponse new];
    resp.network = @"ToBid";
    resp.ecpm = 0;
    if (completion) completion(resp, nil);
}
@end