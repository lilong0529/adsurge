#import "ASMeishuAdapter.h"
#import "ASLogger.h"
#import "ASAdTypes.h"

@implementation ASMeishuAdapter
- (NSString *)adapterVersion { return @"0.1.0"; }
- (NSString *)networkName { return @"Meishu"; }
- (void)initializeWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    [ASLogger i:@"[Meishu] init: %@", config];
    if (completion) completion(YES, nil);
}
- (BOOL)isInitialized { return YES; }
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate {
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        [delegate didFailToLoadWithError:[NSError errorWithDomain:@"adsurge.meishu" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"Not implemented"}]];
    }
}
- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate { [self loadRewardedWithRequest:request delegate:delegate]; }
@end