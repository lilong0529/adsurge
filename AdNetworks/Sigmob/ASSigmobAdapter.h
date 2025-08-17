#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASSigmobAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end