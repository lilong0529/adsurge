#import <Foundation/Foundation.h>
#import "ASAdapterProtocol.h"
#import "ASBidderProtocol.h"

@interface ASTakuAdapter : NSObject <ASRewardedAdapter, ASBidder>
@end