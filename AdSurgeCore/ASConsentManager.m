#import "ASConsentManager.h"

static BOOL gPersonalized = YES;
static BOOL gUAC = NO;

@implementation ASConsentManager
+ (BOOL)personalizedAdsAllowed { return gPersonalized; }
+ (void)setPersonalizedAdsAllowed:(BOOL)v { gPersonalized = v; }
+ (BOOL)underAgeOfConsent { return gUAC; }
+ (void)setUnderAgeOfConsent:(BOOL)v { gUAC = v; }
@end