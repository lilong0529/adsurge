#import "ASGroMoreAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASGroMoreAdapter

- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"GroMore"; }

- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    // TODO: 调用 GroMore SDK 初始化
    [ASLogger i:@"[GroMore] init with %@", config];
    if (completion) completion(YES, nil);
}

- (BOOL)isInitialized { return YES; }

// Loaders (placeholders)
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.gromore" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}

- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }

// Bidder
- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void (^)(ASBidResponse * _Nullable, NSError * _Nullable))completion {
    // TODO: 调用 GroMore Bidding
    ASBidResponse *resp = [ASBidResponse new];
    resp.network = @"GroMore";
    resp.ecpm = 0;
    if (completion) completion(resp, nil);
}

@end