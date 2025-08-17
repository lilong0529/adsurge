#import "ASShortVideoManager.h"
#import "ASLogger.h"

@implementation ASShortVideoManager

+ (instancetype)shared {
    static ASShortVideoManager *s; static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{ s = [ASShortVideoManager new]; });
    return s;
}

- (void)loadFeedWithProvider:(NSString *)provider placementId:(NSString *)placementId completion:(void(^)(UIView *_Nullable feedView, NSError *_Nullable error))completion {
    [ASLogger i:@"[ShortVideo] loading feed from %@ for placement %@", provider, placementId];
    // TODO: 根据 provider（Pangle/KS）选择相应SDK加载短视频feed
    if (completion) {
        NSError *error = [NSError errorWithDomain:@"adsurge.shortvideo" code:-1 userInfo:@{NSLocalizedDescriptionKey:@"ShortVideo not implemented"}];
        completion(nil, error);
    }
}

@end