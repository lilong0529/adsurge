#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASGDTAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end