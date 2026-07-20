---
layout: default
title: 示例报告：每日风险简报 2026-05-23
nav_exclude: true
description: Trading Brain 每日风险简报的企业示例输出。
---

# GridMind Daily Risk Brief Report

Generated at: `2026-07-20T19:12:18+08:00`
Trade date: `2026-05-23`
Analysis cutoff: `2026-05-22T10:00:00+08:00`

## Trader Summary

- Status: **关注**
- Summary: 发现可能影响预测基线的外部信息：价差、价格结构、价格异动，可能影响 全日 的预测判断；请结合最新 Energyun 预测基线查看。
- Risk factors: 价差、价格结构、价格异动
- Baseline impact: 电价预测可能受影响
- Affected periods: 全日

## Forecast Context

- Baseline available: `True`
- Latest version: `Energyun 最新可用预测`
- Available series: 日前预测电价, 日前预测准确率, 实时预测电价, 实时预测准确率
- Version comparison: 当前接口只提供最新可用预测；D-4、D-3、D-2、D-1 版本对比待企业接口提供。
- Note: 预测版本变化仅作解释，不会单独提升提醒状态。 负荷预测序列未取得：Energyun API returned status=5: Required String parameter 'regionPkId' is not present

## Evidence

| Title | Source tier | Published at | Factors | Link |
|---|---|---|---|---|
| 最高实时均价逼近1元/度，广东电力现货价格飙升 | 行业/财经媒体 | 待确认 | 价差、价格结构、价格异动 | https://finance.sina.com.cn/wm/2026-04-17/doc-inhuutzh3270572.shtml?cre=tianyi&mod=pchp&loc=33&r=0&rfunc=13&tj=cxvertical_pc_hp&tr=12 |
| 当广东电力现货价格涨到1元之后 | 行业/财经媒体 | 待确认 | 价差、价格结构、价格异动、阻塞/检修 | https://news.qq.com/rain/a/20260425A0481U00 |

## Data Quality

- News available: `True`
- Forecast baseline available: `True`
- Time-uncertain evidence count: `1`
- Note: 部分新闻发布时间或事件时间待确认，已按较低确定性展示。

## Audit (for technical review only)

```json
{
  "news_analysis": {
    "score": 10,
    "candidate_score": 12,
    "signals": [
      {
        "code": "PRICE_SPREAD_SHIFT",
        "description": "日前/实时价差或价差结构出现变化",
        "weight": 3,
        "evidence_count": 1
      },
      {
        "code": "PRICE_REGIME_SHIFT",
        "description": "现货价格规律或出清结构出现变化",
        "weight": 3,
        "evidence_count": 1
      },
      {
        "code": "ABNORMAL_MOVE",
        "description": "市场出现异常或超预期波动描述",
        "weight": 4,
        "evidence_count": 1
      }
    ],
    "candidate_signals": [
      {
        "code": "PRICE_SPREAD_SHIFT",
        "description": "日前/实时价差或价差结构出现变化",
        "weight": 3,
        "evidence_count": 1
      },
      {
        "code": "PRICE_REGIME_SHIFT",
        "description": "现货价格规律或出清结构出现变化",
        "weight": 3,
        "evidence_count": 1
      },
      {
        "code": "ABNORMAL_MOVE",
        "description": "市场出现异常或超预期波动描述",
        "weight": 4,
        "evidence_count": 1
      },
      {
        "code": "GRID_CONSTRAINT",
        "description": "电网或机组约束可能改变价格形成",
        "weight": 2,
        "evidence_count": 1
      }
    ],
    "background_signals": [
      {
        "code": "PRICE_SPREAD_SHIFT",
        "description": "日前/实时价差或价差结构出现变化",
        "weight": 3,
        "evidence_count": 3
      },
      {
        "code": "PRICE_REGIME_SHIFT",
        "description": "现货价格规律或出清结构出现变化",
        "weight": 3,
        "evidence_count": 3
      },
      {
        "code": "ABNORMAL_MOVE",
        "description": "市场出现异常或超预期波动描述",
        "weight": 4,
        "evidence_count": 1
      },
      {
        "code": "GRID_CONSTRAINT",
        "description": "电网或机组约束可能改变价格形成",
        "weight": 2,
        "evidence_count": 4
      },
      {
        "code": "RULE_OR_PARAMETER_CHANGE",
        "description": "规则、结算或考核参数可能影响申报收益",
        "weight": 3,
        "evidence_count": 2
      },
      {
        "code": "MARKET_SUSPENSION",
        "description": "市场运行机制可能进入特殊状态",
        "weight": 5,
        "evidence_count": 1
      }
    ],
    "gate_reason": "downgraded_due_to_insufficient_live_evidence",
    "review_reason": "no_review_required",
    "raw_result_count": 8,
    "deduplicated_result_count": 2,
    "duplicates": [
      {
        "title": "最高实时均价逼近1元/度，广东电力现货价格为何大涨？",
        "url": "https://www.21jingji.com/article/20260416/herald/70deb3259df2b57258b3d205ccb7576d.html",
        "duplicate_of": "最高实时均价逼近1元/度，广东电力现货价格飙升",
        "reason": "same_event_or_reprint"
      },
      {
        "title": "最高实时均价逼近1元/度，广东电力现货价格为何大涨？",
        "url": "https://www.sohu.com/a/1010487915_122014422",
        "duplicate_of": "最高实时均价逼近1元/度，广东电力现货价格飙升",
        "reason": "same_event_or_reprint"
      }
    ],
    "live_event_count": 1,
    "verified_live_event_count": 0,
    "candidate_live_event_count": 1,
    "background_reference_count": 3,
    "filtered_out_count": 1,
    "evidence": [
      {
        "title": "最高实时均价逼近1元/度，广东电力现货价格飙升",
        "url": "https://finance.sina.com.cn/wm/2026-04-17/doc-inhuutzh3270572.shtml?cre=tianyi&mod=pchp&loc=33&r=0&rfunc=13&tj=cxvertical_pc_hp&tr=12",
        "published_at": null,
        "score": 0.7152057,
        "signals": [
          "PRICE_SPREAD_SHIFT",
          "PRICE_REGIME_SHIFT",
          "ABNORMAL_MOVE"
        ],
        "excerpt": "最高实时均价逼近1元/度，广东电力现货价格飙升 新浪首页 新闻 体育 财经 娱乐 科技 博客 图片 专栏 更多 汽车 教育 时尚 女性 星座 健康 房产历史视频收藏育儿读书 佛学游戏旅游邮箱导航 新浪微博 新浪新闻 新浪财经 新浪体育 新浪众测 新浪博客 新浪视频 新浪游戏 天气通 []( 证券 > 正文 # 最高实时均价逼近1元/度，广东电力现货价格飙升 最高实时均价逼近1元/度，广东电力现货价格飙升 2026年04月17日 13:...",
        "evidence_type": "live_event_evidence",
        "evidence_type_reason": "high_value_candidate_promoted_no_timestamp",
        "timestamp_verified": false,
        "verified_fresh": false,
        "region_match": true,
        "market_match": true,
        "source_domain": "finance.sina.com.cn",
        "effective_published_at": null,
        "inferred_published_at": "2026-04-17T13:12:00",
        "inferred_publish_time_confidence": "page_metadata",
        "mentioned_event_date": "2026-04-17",
        "high_value_candidate": false,
        "trusted_market_source": true,
        "strong_market_move": true,
        "background_like": true,
        "freshness_days": null,
        "freshness_hours": null,
        "freshness_priority": 1,
        "relevance_reasons": [
          "guangdong_region",
          "spot_market",
          "high_value_market_candidate",
          "promoted_live_event_no_timestamp",
          "url_date_within_extended_window"
        ],
        "source_quality": "accepted",
        "source_quality_reason": "passes_rule_quality_checks",
        "source_quality_judge": "rules",
        "source_quality_confidence": 0.65
      },
      {
        "title": "当广东电力现货价格涨到1元之后",
        "url": "https://news.qq.com/rain/a/20260425A0481U00",
        "published_at": null,
        "score": 0.6989468,
        "signals": [
          "PRICE_SPREAD_SHIFT",
          "PRICE_REGIME_SHIFT",
          "ABNORMAL_MOVE",
          "GRID_CONSTRAINT"
        ],
        "excerpt": "当广东电力现货价格涨到1元之后 # 当广东电力现货价格涨到1元之后 头像 2026-04-25 11:44发布于北京经济观察报官方账号 问AI · 电价波动是否标志电力市场进入新阶段？ 记者 潘俊田 大地量子创始人王驰在广东代理一些场站的电力交易，这个月以来，他的策略是让电量更多地走现货交易出清。王驰说，火电机组是广东电力现货价格上涨中最受益的电源。因为火电可以灵活地改变自己的出力曲线，多发电进现货市场就能“躺赚”。 广东电力现货价格...",
        "evidence_type": "candidate_live_event_missing_time",
        "evidence_type_reason": "candidate_live_event_missing_time",
        "timestamp_verified": false,
        "verified_fresh": false,
        "region_match": true,
        "market_match": true,
        "source_domain": "news.qq.com",
        "effective_published_at": null,
        "inferred_published_at": "2026-04-25T11:44:00",
        "inferred_publish_time_confidence": "page_metadata",
        "mentioned_event_date": "2026-04-25",
        "high_value_candidate": false,
        "trusted_market_source": true,
        "strong_market_move": false,
        "background_like": false,
        "freshness_days": null,
        "freshness_hours": null,
        "freshness_priority": 1,
        "relevance_reasons": [
          "guangdong_region",
          "spot_market",
          "candidate_news_like_missing_time",
          "publish_time_unknown"
        ],
        "source_quality": "accepted",
        "source_quality_reason": "passes_rule_quality_checks",
        "source_quality_judge": "rules",
        "source_quality_confidence": 0.65
      },
      {
        "title": "广东电力市场运行规则（征求意见稿）",
        "url": "https://nfj.nea.gov.cn/hdhy/zlxz/202408/P020240809773345980756.pdf",
        "published_at": null,
        "score": 0.6551821,
        "signals": [
          "PRICE_SPREAD_SHIFT",
          "PRICE_REGIME_SHIFT",
          "GRID_CONSTRAINT"
        ],
        "excerpt": "广东电力市场运行规则（征求意见稿） 4．中长期交易（Medium and Long-term Transaction） ：对 未来某一时期内交割电力产品或服务的交易，包含数年、年、 月、周、多日等不同时间维度的交易。中长期交易合同包括实 物合同和财务合同。 5. 差价合约 （Contract for Difference） ： 指根据事先约定的 合约价格以及合约交割对应的现货市场价格之差进行结算的 一种财务合同。 6．安全校核（Pow...",
        "evidence_type": "background_reference",
        "evidence_type_reason": "source_quality_background_only",
        "timestamp_verified": false,
        "verified_fresh": false,
        "region_match": true,
        "market_match": true,
        "source_domain": "nfj.nea.gov.cn",
        "effective_published_at": null,
        "inferred_published_at": null,
        "inferred_publish_time_confidence": "none",
        "mentioned_event_date": null,
        "high_value_candidate": false,
        "trusted_market_source": false,
        "strong_market_move": false,
        "background_like": true,
        "freshness_days": null,
        "freshness_hours": null,
        "freshness_priority": 1,
        "relevance_reasons": [
          "guangdong_region",
          "spot_market",
          "publish_time_unknown"
        ],
        "source_quality": "background_only",
        "source_quality_reason": "stale_event_or_article_date_background_only",
        "source_quality_judge": "rules",
        "source_quality_confidence": 0.92
      },
      {
        "title": "广东电力市场信息披露管理实施细则",
        "url": "https://nfj.nea.gov.cn/file_upload/20220107/89191641528733100_893bc5c7-a731-4a3b-9c3e-3500157d1ad0.pdf",
        "published_at": null,
        "score": 0.6194488,
        "signals": [
          "PRICE_SPREAD_SHIFT",
          "PRICE_REGIME_SHIFT",
          "GRID_CONSTRAINT",
          "RULE_OR_PARAMETER_CHANGE",
          "MARKET_SUSPENSION"
        ],
        "excerpt": "广东电力市场信息披露管理实施细则 信息等。（公开信息） （2）交易计划及其实际执行情况等。（公开信息） （3）市场主体申报信息和交易结果，包括参与交易的 主体数量、交易总申报电量、成交的主体数量、最终成交电 量、成交均价等。（公开信息） （4）零售市场代理关系，场内交易市场主体的最终成 交明细（私有信息） （5）市场边界信息，包括电网安全运行的主要约束条 件、输电通道可用容量、关键输电断面及线路传输限额、必 开必停机组组合及原因、非市...",
        "evidence_type": "background_reference",
        "evidence_type_reason": "source_quality_background_only",
        "timestamp_verified": false,
        "verified_fresh": false,
        "region_match": true,
        "market_match": true,
        "source_domain": "nfj.nea.gov.cn",
        "effective_published_at": null,
        "inferred_published_at": "2022-01-07T00:00:00",
        "inferred_publish_time_confidence": "url_date_only",
        "mentioned_event_date": null,
        "high_value_candidate": false,
        "trusted_market_source": false,
        "strong_market_move": false,
        "background_like": true,
        "freshness_days": null,
        "freshness_hours": null,
        "freshness_priority": 1,
        "relevance_reasons": [
          "guangdong_region",
          "spot_market",
          "publish_time_unknown"
        ],
        "source_quality": "background_only",
        "source_quality_reason": "url_publication_date_stale_background_only",
        "source_quality_judge": "rules",
        "source_quality_confidence": 0.95
      },
      {
        "title": "广东电力市场发电侧日前加权平均电价（2026年一季度）",
        "url": "https://finance.sina.com.cn/money/fund/jjgsgd/2026-05-06/doc-inhwxhnr3497690.shtml",
        "published_at": null,
        "score": 0.58976424,
        "signals": [
          "GRID_CONSTRAINT",
          "RULE_OR_PARAMETER_CHANGE"
        ],
        "excerpt": "广东电力市场发电侧日前加权平均电价（2026年一季度） 新浪首页 新闻 体育 财经 娱乐 科技 博客 图片 专栏 更多 汽车 教育 时尚 女性 星座 健康 房产历史视频收藏育儿读书 佛学游戏旅游邮箱导航 新浪微博 新浪新闻 新浪财经 新浪体育 新浪众测 新浪博客 新浪视频 新浪游戏 天气通 项目主要参与广东电力市场交易，为方便投资者了解项目所处行业市场情况，我们公众号定期汇总并发布广东省电力交易中心公布的每日快报中发电侧日前加权平均电...",
        "evidence_type": "background_reference",
        "evidence_type_reason": "source_quality_background_only",
        "timestamp_verified": false,
        "verified_fresh": false,
        "region_match": true,
        "market_match": true,
        "source_domain": "finance.sina.com.cn",
        "effective_published_at": null,
        "inferred_published_at": "2026-05-06T08:55:00",
        "inferred_publish_time_confidence": "page_metadata",
        "mentioned_event_date": "2026-03-31",
        "high_value_candidate": false,
        "trusted_market_source": true,
        "strong_market_move": true,
        "background_like": true,
        "freshness_days": null,
        "freshness_hours": null,
        "freshness_priority": 1,
        "relevance_reasons": [
          "guangdong_region",
          "spot_market",
          "publish_time_unknown"
        ],
        "source_quality": "background_only",
        "source_quality_reason": "background_policy_or_periodic_summary",
        "source_quality_judge": "rules",
        "source_quality_confidence": 0.9
      }
    ]
  },
  "raw_search_result_count": 8,
  "status_rule": "存在一条当前相关证据，或相关证据的时间仍待确认。",
  "legacy_fields": {
    "alert_level": "MEDIUM",
    "review_level": "NONE",
    "risk_status": "legacy_not_used_by_daily_risk_brief"
  }
}
```
