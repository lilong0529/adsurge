#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"

@interface ASMeishuAdapter : NSObject <ASRewardedAdapter, ASInterstitialAdapter, ASBannerAdapter, ASNativeAdapter, ASSplashAdapter>
@end