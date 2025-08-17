#import <Foundation/Foundation.h>
#import "ASAdTypes.h"

@class ASWaterfallManager;

@protocol ASWaterfallDelegate <NSObject>
@optional
- (void)waterfallManager:(ASWaterfallManager *)mgr didLoadAd:(id)ad;
- (void)waterfallManager:(ASWaterfallManager *)mgr didFailWithError:(NSError *)error;
@end

@interface ASWaterfallManager : NSObject
+ (instancetype)shared;
- (void)loadWithRequest:(ASAdRequest *)request delegate:(id<ASWaterfallDelegate, ASAdLoadDelegate>)delegate;
@end