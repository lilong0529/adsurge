#import "AppDelegate.h"
#import "ASAdSurge.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize AdSurge with configuration
    NSDictionary *config = @{
        // Global settings
        @"logLevel": @"info",
        @"enableATTPrompt": @YES,
        
        // ADN/Aggregator configurations (placeholder examples)
        @"pangle": @{ @"appId": @"your_pangle_app_id"},
        @"kuaishou": @{ @"appId": @"your_ks_app_id"},
        @"gdt": @{ @"appId": @"your_gdt_app_id"},
        @"sigmob": @{ @"appId": @"your_sigmob_app_id"},
        @"baidu": @{ @"appId": @"your_baidu_app_id"},
        @"meishu": @{ @"appId": @"your_meishu_app_id"},
        @"beizi": @{ @"appId": @"your_beizi_app_id"},
        @"octopus": @{ @"appId": @"your_octopus_app_id"},
        @"funlink": @{ @"appId": @"your_funlink_app_id"},
        @"gromore": @{ @"appId": @"your_gromore_app_id"},
        @"taku": @{ @"appId": @"your_taku_app_id"},
        @"tobid": @{ @"appId": @"your_tobid_app_id"},
    };
    
    [[ASAdSurge shared] startWithConfig:config completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@"AdSurge initialized successfully");
        } else {
            NSLog(@"AdSurge initialization failed: %@", error);
        }
    }];
    
    // Setup basic window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *rootVC = [UIViewController new];
    rootVC.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end