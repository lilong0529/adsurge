#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"
#import "ASBidderProtocol.h"

@interface ASPangleAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter, ASBidder>
@end