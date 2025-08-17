#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ASAdFormat) {
    ASAdFormatBanner,
    ASAdFormatInterstitial,
    ASAdFormatRewarded,
    ASAdFormatSplash,
    ASAdFormatNative,
    ASAdFormatFeedVideo
};

NS_ASSUME_NONNULL_BEGIN

@interface ASAdRequest : NSObject
@property (nonatomic, copy) NSString *placementId;
@property (nonatomic, strong) NSArray<NSNumber *> *formats;
@property (nonatomic, strong, nullable) NSDictionary *extras;
+ (instancetype)requestWithPlacementId:(NSString *)placementId
                               formats:(NSArray<NSNumber *> *)formats
                                extras:(nullable NSDictionary *)extras;
@end

@protocol ASAdLoadDelegate <NSObject>
@optional
- (void)didFailToLoadWithError:(NSError *)error;
- (void)didLoadAd:(id)ad;
@end

@protocol ASRewardedAd <NSObject>
- (void)presentFromViewController:(UIViewController *)vc completion:(void(^_Nullable)(BOOL success, NSError *_Nullable error))completion;
@end

@protocol ASInterstitialAd <NSObject>
- (void)presentFromViewController:(UIViewController *)vc completion:(void(^_Nullable)(BOOL success, NSError *_Nullable error))completion;
@end

@protocol ASBannerViewProvider <NSObject>
- (UIView *)bannerView;
@end

@protocol ASNativeAdViewProvider <NSObject>
- (UIView *)renderedView;
@end

NS_ASSUME_NONNULL_END