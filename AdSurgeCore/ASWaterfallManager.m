#import "ASWaterfallManager.h"
#import "ASLogger.h"

@implementation ASWaterfallManager

+ (instancetype)shared {
    static ASWaterfallManager *s; static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ s = [ASWaterfallManager new]; });
    return s;
}

- (void)loadWithRequest:(ASAdRequest *)request delegate:(id)delegate {
    [ASLogger i:@"[Waterfall] start load: %@", request.placementId];
    // TODO: 1) 读取策略 2) 构建line items 3) 顺序/并行请求 4) 首个返回即命中
    // 当前先占位直接回调失败
    if ([delegate respondsToSelector:@selector(didFailToLoadWithError:)]) {
        NSError *err = [NSError errorWithDomain:@"adsurge" code:-1 userInfo:@{NSLocalizedDescriptionKey: @"Waterfall not implemented"}];
        [delegate didFailToLoadWithError:err];
    }
}

@end