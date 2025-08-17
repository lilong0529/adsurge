# iOS 接入指引（Objective‑C）

## 1. 工程配置
- iOS 11.0+
- 开启 Bitcode（如目标ADN要求）
- 添加必要系统库（各ADN文档要求）
- Info.plist：
  - App Tracking Transparency 文本（NSUserTrackingUsageDescription）
  - 网络权限、相机/麦克风权限（如短视频/激励）
- 隐私合规：ATT/IDFA、GDPR/CCPA 开关（通过 ASConsentManager）

## 2. 初始化（AppDelegate）
```objc
#import "ASAdSurge.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSDictionary *config = @{
        // 全局
        @"logLevel": @"info",
        @"enableATTPrompt": @YES,

        // ADN/聚合配置（示例，占位）
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
        if (!success) {
            NSLog(@"AdSurge init failed: %@", error);
        }
    }];

    return YES;
}
```

## 3. 加载与展示（示例：激励视频）
```objc
ASAdRequest *request = [ASAdRequest requestWithPlacementId:@"reward_001"
                                                   formats:@[@(ASAdFormatRewarded)]
                                                   extras:@{ @"userId": @"123" }];

[[ASWaterfallManager shared] loadWithRequest:request delegate:self];

// delegate 回调里展示
- (void)waterfallManager:(ASWaterfallManager *)mgr didLoadAd:(id<ASRewardedAd>)ad {
    [ad presentFromViewController:self completion:^(BOOL success, NSError * _Nullable error) {
        // 处理展示结果
    }];
}
```

## 4. 短视频/短剧
使用 `ASShortVideoManager` 统一对接 Pangle/KS 的短视频/短剧 feed，支持卡片/全屏、自动播放策略与缓存。

## 5. 与 GroMore 共存补量
- 启用 `compatibility.gromore.enabled = YES`
- 提供「已接入广告源白名单/黑名单」，抽离 GroMore 已接入的源，AdSurge 仅补未覆盖源
- 建议开启 Deduper 的 creativeId 与 payload 策略，避免重复曝光

## 6. 故障与监控
- 开启 ASLogger
- 上报维度：请求、填充、eCPM、展示、点击、奖励、失败（统一错误码）