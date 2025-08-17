#import "AppDelegate.h"
#import "ASAdSurge.h"
#import "SplashViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化 AdSurge（仅 Pangle 示例，替换为你的真实 appId）
    NSDictionary *config = @{
        @"logLevel": @"info",
        @"enableATTPrompt": @YES,
        @"pangle": @{ @"appId": @"your_pangle_app_id" },
    };

    [[ASAdSurge shared] startWithConfig:config completion:^(BOOL success, NSError * _Nullable error) {
        if (!success) {
            NSLog(@"[AdSurge] init failed: %@", error);
        } else {
            NSLog(@"[AdSurge] initialized");
        }
    }];

    // 设置窗口与首屏控制器（开屏容器）
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = [SplashViewController new];
    [self.window makeKeyAndVisible];

    return YES;
}

@end