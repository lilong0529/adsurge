# AdSurge iOS（Objective‑C）广告聚合SDK

AdSurge 旨在为媒体侧提供统一、可插拔的广告聚合能力，兼容常见国内ADN与聚合平台，支持短视频/短剧场景，并可与媒体既有GroMore等聚合共存，进行非重复广告源的瀑布/竞价补量。

## 特性
- 统一的Objective‑C接口（Adapter/Bidder/Waterfall/Auction/Deduper）
- 支持ADN：
  - 穿山甲 Pangle（含 GroMore）、快手、优量汇（GDT）、Sigmob、百度联盟、Meishu、美数、Beizi（倍孜）、章鱼、Funlink
- 支持聚合工具：
  - taku、ToBid、GroMore
- 支持广告形式：
  - Banner、插屏、激励视频、开屏、信息流（含短视频/短剧Feed）
- 竞价与瀑布：
  - 混合策略（Bidding + Waterfall）、素材/广告源去重、eCPM/收益上报
- 隐私合规：
  - ATT/IDFA、GDPR/CCPA 开关、青少年模式、用户同意管理

## 目录结构
- AdSurgeCore：核心协议与管理
- AdNetworks：各ADN适配器（Pangle/KS/GDT/Sigmob/Baidu/Meishu/Beizi/Octopus/Funlink）
- Aggregators：聚合平台适配器（GroMore/Taku/ToBid）
- ShortVideo：短视频/短剧能力包装（Pangle/KS）
- ExampleApp：Objective‑C示例工程

## 快速开始
1. 集成方式（任选其一）
   - CocoaPods：后续提供 Podspec；也可先将源码直接引入项目
   - 源码：将 AdSurgeCore、AdNetworks、Aggregators、ShortVideo 拖入你的工程
2. 初始化
   - 在 AppDelegate 中调用 `ASAdSurge.shared` 的 `startWithConfig:completion:`
   - 分别为每个ADN/聚合提供 appId/appKey/slot 等配置（见 docs/integration_guide_ios.md）
3. 加载广告
   - 通过 `ASWaterfallManager` 或 `ASAuctionManager` 下发请求
   - 使用统一的 Adapter 接口进行加载与展示
4. 去重策略
   - 启用 `ASDeduper`，按 creativeId、adn+slot、payload 等维度去重

## 文档
- docs/requirements.md：需求清单与范围
- docs/architecture.md：架构设计与扩展点
- docs/integration_guide_ios.md：接入指引（配置、初始化、各ADN参数）

## 兼容 GroMore 的 ADN补量
当媒体已有 GroMore，我们以「兼容」姿态接入：读取其已有瀑布/竞价，排除重复广告源后按配置接入未覆盖ADN，以达到补量与竞价增益。

## 版本与要求
- iOS 11.0+
- Xcode 14+
- Objective‑C 主项目（Swift 项目也可桥接）
- 需配置 ATT 与相关隐私权限声明

---
如需我直接在本仓库创建初始化PR，请回复确认，我会基于当前骨架开PR并补充 Podspec 与 Example.