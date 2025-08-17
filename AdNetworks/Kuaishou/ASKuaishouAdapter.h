#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"
#import "ASBidderProtocol.h"

@interface ASKuaishouAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter, ASBidder>
@end