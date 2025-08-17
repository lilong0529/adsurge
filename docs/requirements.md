# SDK 必备需求与对齐

a. 集成 ADN
- 穿山甲（Pangle / GroMore）
- 快手（KS）
- 优量汇（GDT）
- Sigmob
- 百度联盟
- 美数（Meishu）
- 倍孜（Beizi）
- 章鱼（Octopus）
- Funlink

b. 聚合工具
- taku
- ToBid
- GroMore

c. 支持开发语言
- Objective‑C（作为对外主接口，Swift 可通过桥接使用）

d. 短视频/短剧 SDK
- 穿山甲平台
- 快手平台

e. ADN 合作（共存补量）
- 在媒体已有聚合（如 GroMore）的情况下，排除其已接入的广告源后，接入非重复广告源参与瀑布/竞价补量
- 支持「只竞价/只瀑布/混合」策略
- 去重维度：creativeId、adn+slotId、payload/signature、物料哈希等