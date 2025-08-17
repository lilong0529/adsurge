#import "ASPangleAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASPangleAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"Pangle"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    // TODO: 调用 Pangle 初始化
    [ASLogger i:@"[Pangle] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }

- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    // TODO: Pangle 激励加载封装
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.pangle" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}

- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }

- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void (^)(ASBidResponse * _Nullable, NSError * _Nullable))completion {
    // TODO: Pangle bidding
    ASBidResponse *resp = [ASBidResponse new];
    resp.network = @"Pangle";
    resp.ecpm = 0;
    if (completion) completion(resp, nil);
}
@end