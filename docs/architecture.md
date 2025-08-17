# 架构设计

## 总览
- ASAdapter：统一的广告加载/展示协议，按广告位类型扩展子协议
- ASBidder：统一实时竞价接口（header bidding/parallel bidding）
- ASWaterfallManager：瀑布流编排与请求控制
- ASAuctionManager：竞价聚合与胜出逻辑
- ASDeduper：去重服务（跨ADN/聚合）
- ASConsentManager：隐私合规模块
- 日志、监控与事件总线：ASLogger/ASEvent

## 扩展点
- 新增 ADN：实现对应 Adapter 与（可选）Bidder
- 新增聚合：实现聚合适配器；如果使用其SDK进行请求，遵循其生命周期与回调映射
- 新增广告形式：新增对应的子协议与管理器路由

## 关键流程
1. 初始化：各适配器注册 → 拉取远端配置 → 初始化必要ADN
2. 请求：根据 placement 策略决定走瀑布/竞价/混合
3. 去重：候选广告集进入 Deduper 筛选
4. 展示：统一回调转发（曝光/点击/关闭/奖励发放）
5. 上报：eCPM、填充、收益、错误码标准化