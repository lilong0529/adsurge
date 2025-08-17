#import "ASAuctionManager.h"
#import "ASDeduper.h"

@implementation ASAuctionManager

+ (instancetype)shared {
    static ASAuctionManager *s; static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ s = [ASAuctionManager new]; });
    return s;
}

- (void)runAuctionForRequest:(ASAdRequest *)request
                     bidders:(NSArray<id<ASBidder>> *)bidders
                  completion:(void(^)(ASBidResponse *, NSArray<ASBidResponse *> *, NSError *))completion {
    dispatch_group_t group = dispatch_group_create();
    NSMutableArray<ASBidResponse *> *bids = [NSMutableArray array];
    for (id<ASBidder> b in bidders) {
        dispatch_group_enter(group);
        [b fetchBidForRequest:request completion:^(ASBidResponse * _Nullable bid, NSError * _Nullable error) {
            if (bid) @synchronized (bids) { [bids addObject:bid]; }
            dispatch_group_leave(group);
        }];
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSArray *unique = [[ASDeduper shared] dedupeBids:bids];
        ASBidResponse *winner = [unique sortedArrayUsingComparator:^NSComparisonResult(ASBidResponse *a, ASBidResponse *b) {
            if (a.ecpm == b.ecpm) return NSOrderedSame;
            return a.ecpm > b.ecpm ? NSOrderedAscending : NSOrderedDescending;
        }].firstObject;
        if (completion) completion(winner, unique, nil);
    });
}

@end