#import <Foundation/Foundation.h>
#import "ASAdTypes.h"

NS_ASSUME_NONNULL_BEGIN

@interface ASBidResponse : NSObject
@property (nonatomic, copy) NSString *network;
@property (nonatomic, assign) double ecpm; // in cents or standard currency
@property (nonatomic, copy, nullable) NSString *creativeId;
@property (nonatomic, strong, nullable) NSDictionary *payload; // token/sign
@end

@protocol ASBidder <NSObject>
@property (nonatomic, copy, readonly) NSString *networkName;
- (void)fetchBidForRequest:(ASAdRequest *)request completion:(void(^)(ASBidResponse *_Nullable bid, NSError *_Nullable error))completion;
@end

NS_ASSUME_NONNULL_END