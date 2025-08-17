#import "ASAdTypes.h"

@implementation ASAdRequest
+ (instancetype)requestWithPlacementId:(NSString *)placementId
                               formats:(NSArray<NSNumber *> *)formats
                                extras:(NSDictionary *)extras {
    ASAdRequest *req = [ASAdRequest new];
    req.placementId = placementId;
    req.formats = formats;
    req.extras = extras;
    return req;
}
@end