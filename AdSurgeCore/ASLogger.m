#import "ASLogger.h"

static ASLogLevel gLevel = ASLogLevelInfo;

@implementation ASLogger
+ (ASLogLevel)level { return gLevel; }
+ (void)setLevel:(ASLogLevel)level { gLevel = level; }

+ (void)log:(ASLogLevel)lvl tag:(char)tag format:(NSString *)fmt args:(va_list)args {
    if (lvl > gLevel) return;
    NSString *msg = [[NSString alloc] initWithFormat:fmt arguments:args];
    NSLog(@"[AdSurge %c] %@", tag, msg);
}

+ (void)e:(NSString *)fmt, ... { va_list a; va_start(a, fmt); [self log:ASLogLevelError tag:'E' format:fmt args:a]; va_end(a); }
+ (void)w:(NSString *)fmt, ... { va_list a; va_start(a, fmt); [self log:ASLogLevelWarn  tag:'W' format:fmt args:a]; va_end(a); }
+ (void)i:(NSString *)fmt, ... { va_list a; va_start(a, fmt); [self log:ASLogLevelInfo  tag:'I' format:fmt args:a]; va_end(a); }
+ (void)d:(NSString *)fmt, ... { va_list a; va_start(a, fmt); [self log:ASLogLevelDebug tag:'D' format:fmt args:a]; va_end(a); }
+ (void)v:(NSString *)fmt, ... { va_list a; va_start(a, fmt); [self log:ASLogLevelVerbose tag:'V' format:fmt args:a]; va_end(a); }
@end