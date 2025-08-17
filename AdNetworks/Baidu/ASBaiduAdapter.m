#import "ASBaiduAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASBaiduAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"Baidu"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    [ASLogger i:@"[Baidu] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.baidu" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}
- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
@end