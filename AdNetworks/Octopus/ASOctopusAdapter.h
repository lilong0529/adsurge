#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASOctopusAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end