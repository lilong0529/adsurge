#import "ASDeduper.h"

@implementation ASDeduper

+ (instancetype)shared {
    static ASDeduper *s; static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ s = [ASDeduper new]; });
    return s;
}

- (NSArray<ASBidResponse *> *)dedupeBids:(NSArray<ASBidResponse *> *)bids {
    NSMutableArray *result = [NSMutableArray array];
    NSMutableSet *seenCreative = [NSMutableSet set];
    for (ASBidResponse *b in bids) {
        NSString *slotId = (NSString *)b.payload[@"slotId"];
        NSString *key = b.creativeId.length ? b.creativeId
                    : [NSString stringWithFormat:@"%@-%@", b.network ?: @"", slotId ?: @""];
        if (key.length == 0 || ![seenCreative containsObject:key]) {
            if (key.length) [seenCreative addObject:key];
            [result addObject:b];
        }
    }
    return result;
}

@end