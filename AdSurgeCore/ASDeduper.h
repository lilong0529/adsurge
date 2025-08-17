#import <Foundation/Foundation.h>
#import "ASBidderProtocol.h"

@interface ASDeduper : NSObject
+ (instancetype)shared;
- (NSArray<ASBidResponse *> *)dedupeBids:(NSArray<ASBidResponse *> *)bids;
@end