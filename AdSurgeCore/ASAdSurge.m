#import "ASAdSurge.h"
#import "ASLogger.h"

@interface ASAdSurge ()
@property (nonatomic, strong) NSDictionary *config;
@end

@implementation ASAdSurge

+ (instancetype)shared {
    static ASAdSurge *s; static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ s = [ASAdSurge new]; });
    return s;
}

- (void)startWithConfig:(NSDictionary *)config completion:(void (^)(BOOL, NSError * _Nullable))completion {
    self.config = config ?: @{};
    // TODO: 注册并初始化各Adapter/聚合（按需）
    [ASLogger i:@"AdSurge start with config keys: %@", self.config.allKeys];
    if (completion) completion(YES, nil);
}

@end