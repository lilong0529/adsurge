#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ASShortVideoManager : NSObject
+ (instancetype)shared;
- (void)loadFeedWithProvider:(NSString *)provider placementId:(NSString *)placementId completion:(void(^)(UIView *_Nullable feedView, NSError *_Nullable error))completion;
@end