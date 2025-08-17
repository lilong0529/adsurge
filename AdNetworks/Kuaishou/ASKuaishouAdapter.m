#import "ASKuaishouAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASKuaishouAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"Kuaishou"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    [ASLogger i:@"[Kuaishou] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.ks" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}
- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void (^)(ASBidResponse * _Nullable, NSError * _Nullable))completion {
    ASBidResponse *resp = [ASBidResponse new];
    resp.network = @"Kuaishou";
    resp.ecpm = 0;
    if (completion) completion(resp, nil);
}
@end