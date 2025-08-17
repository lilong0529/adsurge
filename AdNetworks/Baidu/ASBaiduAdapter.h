#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASBaiduAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end