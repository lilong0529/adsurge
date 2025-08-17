#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ASLogLevel) {
    ASLogLevelError = 0,
    ASLogLevelWarn,
    ASLogLevelInfo,
    ASLogLevelDebug,
    ASLogLevelVerbose
};

@interface ASLogger : NSObject
@property (class, nonatomic, assign) ASLogLevel level;
+ (void)e:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1,2);
+ (void)w:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1,2);
+ (void)i:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1,2);
+ (void)d:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1,2);
+ (void)v:(NSString *)fmt, ... NS_FORMAT_FUNCTION(1,2);
@end