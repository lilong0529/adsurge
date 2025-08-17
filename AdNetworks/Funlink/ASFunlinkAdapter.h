#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASFunlinkAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end