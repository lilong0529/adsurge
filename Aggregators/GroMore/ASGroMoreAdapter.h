#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"
#import "ASBidderProtocol.h"

@interface ASGroMoreAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter, ASBidder>
@end