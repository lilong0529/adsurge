#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASAdSurge : NSObject
+ (instancetype)shared;
- (void)startWithConfig:(NSDictionary *)config completion:(void(^_Nullable)(BOOL success, NSError *_Nullable error))completion;
@property (nonatomic, strong, readonly) NSDictionary *config;
@end

NS_ASSUME_NONNULL_END