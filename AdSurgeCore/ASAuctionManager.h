#import <Foundation/Foundation.h>
#import "ASAdTypes.h"
#import "ASBidderProtocol.h"

@interface ASAuctionManager : NSObject
+ (instancetype)shared;
- (void)runAuctionForRequest:(ASAdRequest *)request
                     bidders:(NSArray<id<ASBidder>> *)bidders
                  completion:(void(^)(ASBidResponse *_Nullable winner,
                                      NSArray<ASBidResponse *> *allBids,
                                      NSError *_Nullable error))completion;
@end