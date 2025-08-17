# ExampleApp（Pangle 开屏示例）

本示例展示如何在应用启动时初始化 AdSurge，并以穿山甲（Pangle）开屏广告作为示例广告位进行加载与展示。当前仓库的瀑布与适配器多为占位实现，通常会在加载阶段失败，示例会优雅回退到主界面，用于验证初始化与调用链路。

## 快速开始
1. 打开 ExampleApp 下的源码文件，确认以下文件存在：
   - AppDelegate.h / AppDelegate.m
   - SplashViewController.h / SplashViewController.m
   - MainViewController.h / MainViewController.m
   - main.m
   - Info.plist（如缺失请在你的 App Target 中添加，对应权限说明见下文）
2. 在 `AppDelegate.m` 中替换：
   - `your_pangle_app_id` 为你的穿山甲应用 App ID。
3. 在 `SplashViewController.m` 中替换：
   - `your_pangle_splash_slot_id` 为你的开屏广告位 Slot ID。
4. 运行工程，启动后会尝试加载开屏；占位实现下通常会在 3 秒内失败并进入主界面，表示调用链路正常。

## 必要的权限（Info.plist）
- NSUserTrackingUsageDescription：ATT 权限文案。
- 其他权限按需添加（网络、相机/麦克风等，取决于广告形态与平台要求）。

## 常见问题
- 没有展示广告/加载失败：
  - 目前 ASWaterfallManager 与适配器实现为占位，预期会失败回退。这用于验证接入路径。
  - 要实际展示，请接入穿山甲官方 SDK，并在 Pangle 适配器中实现 `loadSplash` 与展示逻辑。
- 最低系统版本：iOS 11.0+
- 仅 Pangle 初始化：本示例只对 Pangle 进行初始化配置，便于聚焦开屏位验证。
- 如何切换到其他 ADN（如 GDT）：
  - 在 AppDelegate 的 config 中改为目标 ADN 的 appId，并在请求的 extras 中使用对应 slotId；同时实现/替换对应适配器加载逻辑。

## 目录说明
- AppDelegate.*：初始化 AdSurge，并将首屏设置为 `SplashViewController`。
- SplashViewController.*：发起开屏请求，成功则展示，失败/超时回退到主界面。
- MainViewController.*：示例主界面。