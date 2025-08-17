#import <Foundation/Foundation.h>
#import "ASAdTypes.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ASAdapter <NSObject>
@property (nonatomic, copy, readonly) NSString *adapterVersion;
@property (nonatomic, copy, readonly) NSString *networkName;
- (void)initializeWithConfig:(NSDictionary *)config completion:(void(^)(BOOL success, NSError *_Nullable error))completion;
- (BOOL)isInitialized;
@end

@protocol ASRewardedAdapter <ASAdapter>
- (void)loadRewardedWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate;
@end

@protocol ASInterstitialAdapter <ASAdapter>
- (void)loadInterstitialWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate;
@end

@protocol ASBannerAdapter <ASAdapter>
- (void)loadBannerWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate;
@end

@protocol ASNativeAdapter <ASAdapter>
- (void)loadNativeWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate;
@end

@protocol ASSplashAdapter <ASAdapter>
- (void)loadSplashWithRequest:(ASAdRequest *)request delegate:(id<ASAdLoadDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END