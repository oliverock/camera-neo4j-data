// Domain expansion import: prices, use cases, profiles, reviews, specs
CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;

MERGE (n:Entity {id: 'use_landscape'})
SET n:UseCase
SET n.name = '风光摄影'
SET n.description = '重视高像素、宽容度、广角镜头和三脚架工作流'
;

MERGE (n:Entity {id: 'use_live'})
SET n:UseCase
SET n.name = '直播带货'
SET n.description = '重视视频追焦、翻转屏、采集卡兼容和连续供电'
;

MERGE (n:Entity {id: 'use_street'})
SET n:UseCase
SET n.name = '街拍扫街'
SET n.description = '重视轻便、低侵扰、直出色彩和快速启动'
;

MERGE (n:Entity {id: 'use_studio'})
SET n:UseCase
SET n.name = '商业棚拍'
SET n.description = '重视高像素、色彩、灯光同步和稳定工作流'
;

MERGE (n:Entity {id: 'profile_beginner_low'})
SET n:UserProfile
SET n.name = '新手低预算用户'
SET n.description = '预算有限、第一次买相机，重视易用、价格和轻便'
SET n.minBudget = 0
SET n.maxBudget = 5000
SET n.experience = '新手'
SET n.mainUse = '入门学习'
SET n.portabilityNeed = '高'
;

MERGE (n:Entity {id: 'profile_beginner_video'})
SET n:UserProfile
SET n.name = '新手视频/Vlog用户'
SET n.description = '想拍短视频、直播或Vlog，希望操作简单'
SET n.minBudget = 3000
SET n.maxBudget = 8000
SET n.experience = '新手'
SET n.mainUse = '视频创作'
SET n.portabilityNeed = '高'
;

MERGE (n:Entity {id: 'profile_travel_light'})
SET n:UserProfile
SET n.name = '旅行轻便用户'
SET n.description = '旅行随拍和街拍，重视重量和便携'
SET n.minBudget = 5000
SET n.maxBudget = 15000
SET n.experience = '进阶'
SET n.mainUse = '旅行随拍'
SET n.portabilityNeed = '高'
;

MERGE (n:Entity {id: 'profile_portrait_ff'})
SET n:UserProfile
SET n.name = '人像全画幅用户'
SET n.description = '想拍人像和虚化，偏好全画幅与镜头生态'
SET n.minBudget = 8000
SET n.maxBudget = 20000
SET n.experience = '进阶'
SET n.mainUse = '人像摄影'
SET n.portabilityNeed = '中'
;

MERGE (n:Entity {id: 'profile_video_pro'})
SET n:UserProfile
SET n.name = '专业视频创作者'
SET n.description = '重视视频规格、防抖、码率、散热和接口'
SET n.minBudget = 12000
SET n.maxBudget = 40000
SET n.experience = '专业'
SET n.mainUse = '视频创作'
SET n.portabilityNeed = '中'
;

MERGE (n:Entity {id: 'profile_sports_bird'})
SET n:UserProfile
SET n.name = '体育生态用户'
SET n.description = '重视高速连拍、追焦和长焦生态'
SET n.minBudget = 12000
SET n.maxBudget = 50000
SET n.experience = '专业'
SET n.mainUse = '体育生态摄影'
SET n.portabilityNeed = '低'
;

MERGE (n:Entity {id: 'profile_studio_commercial'})
SET n:UserProfile
SET n.name = '商业棚拍用户'
SET n.description = '重视高像素、色彩、可靠性和专业工作流'
SET n.minBudget = 20000
SET n.maxBudget = 80000
SET n.experience = '专业'
SET n.mainUse = '商业棚拍'
SET n.portabilityNeed = '低'
;

MERGE (n:Entity {id: 'price_jd_zve10'})
SET n:PriceRecord
SET n.name = 'ZV-E10 京东当前价'
SET n.priceType = '京东'
SET n.price = '当前价'
SET n.priceDate = 2940
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_official_zve10'})
SET n:PriceRecord
SET n.name = 'ZV-E10 官方参考价'
SET n.priceType = '品牌官网'
SET n.price = '官方参考价'
SET n.priceDate = 4599
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_used_zve10'})
SET n:PriceRecord
SET n.name = 'ZV-E10 二手参考价'
SET n.priceType = '二手市场'
SET n.price = '二手价'
SET n.priceDate = 2600
SET n.condition = '2026-06-06'
SET n.mediaScore = '二手良品'
;

MERGE (n:Entity {id: 'price_jd_r100'})
SET n:PriceRecord
SET n.name = 'EOS R100 京东当前价'
SET n.priceType = '京东'
SET n.price = '当前价'
SET n.priceDate = 2499
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_official_r100'})
SET n:PriceRecord
SET n.name = 'EOS R100 官方参考价'
SET n.priceType = '品牌官网'
SET n.price = '官方参考价'
SET n.priceDate = 3999
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_used_r100'})
SET n:PriceRecord
SET n.name = 'EOS R100 二手参考价'
SET n.priceType = '二手市场'
SET n.price = '二手价'
SET n.priceDate = 2200
SET n.condition = '2026-06-06'
SET n.mediaScore = '二手良品'
;

MERGE (n:Entity {id: 'price_jd_r50'})
SET n:PriceRecord
SET n.name = 'EOS R50 京东当前价'
SET n.priceType = '京东'
SET n.price = '当前价'
SET n.priceDate = 5799
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_official_r50'})
SET n:PriceRecord
SET n.name = 'EOS R50 官方参考价'
SET n.priceType = '品牌官网'
SET n.price = '官方参考价'
SET n.priceDate = 4599
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_used_r50'})
SET n:PriceRecord
SET n.name = 'EOS R50 二手参考价'
SET n.priceType = '二手市场'
SET n.price = '二手价'
SET n.priceDate = 3800
SET n.condition = '2026-06-06'
SET n.mediaScore = '二手良品'
;

MERGE (n:Entity {id: 'price_jd_a7c2'})
SET n:PriceRecord
SET n.name = 'Alpha 7C II 京东当前价'
SET n.priceType = '京东'
SET n.price = '当前价'
SET n.priceDate = 11449
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_official_a7c2'})
SET n:PriceRecord
SET n.name = 'Alpha 7C II 官方参考价'
SET n.priceType = '品牌官网'
SET n.price = '官方参考价'
SET n.priceDate = 13999
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_used_a7c2'})
SET n:PriceRecord
SET n.name = 'Alpha 7C II 二手参考价'
SET n.priceType = '二手市场'
SET n.price = '二手价'
SET n.priceDate = 10500
SET n.condition = '2026-06-06'
SET n.mediaScore = '二手良品'
;

MERGE (n:Entity {id: 'price_jd_xt5'})
SET n:PriceRecord
SET n.name = 'X-T5 京东当前价'
SET n.priceType = '京东'
SET n.price = '当前价'
SET n.priceDate = 19698
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_official_xt5'})
SET n:PriceRecord
SET n.name = 'X-T5 官方参考价'
SET n.priceType = '品牌官网'
SET n.price = '官方参考价'
SET n.priceDate = 11990
SET n.condition = '2026-06-06'
SET n.mediaScore = '新品'
;

MERGE (n:Entity {id: 'price_used_xt5'})
SET n:PriceRecord
SET n.name = 'X-T5 二手参考价'
SET n.priceType = '二手市场'
SET n.price = '二手价'
SET n.priceDate = 9000
SET n.condition = '2026-06-06'
SET n.mediaScore = '二手良品'
;

MERGE (n:Entity {id: 'review_zve10'})
SET n:ReviewRecord
SET n.name = 'ZV-E10 综合评测'
SET n.userScore = 8.4
SET n.pros = 4.7
SET n.cons = '价格低；Vlog功能完整；轻便'
SET n.reviewDate = '无机身防抖；照片操控一般'
SET n.targetModel = '2026-06-06'
;

MERGE (n:Entity {id: 'review_r100'})
SET n:ReviewRecord
SET n.name = 'EOS R100 综合评测'
SET n.userScore = 7.8
SET n.pros = 4.6
SET n.cons = '价格低；操作简单；佳能色彩'
SET n.reviewDate = '屏幕和连拍较基础；视频裁切明显'
SET n.targetModel = '2026-06-06'
;

MERGE (n:Entity {id: 'review_r50'})
SET n:ReviewRecord
SET n.name = 'EOS R50 综合评测'
SET n.userScore = 8.5
SET n.pros = 4.8
SET n.cons = '对焦好；轻便；适合新手'
SET n.reviewDate = '镜头生态成本需要考虑'
SET n.targetModel = '2026-06-06'
;

MERGE (n:Entity {id: 'review_a7c2'})
SET n:ReviewRecord
SET n.name = 'Alpha 7C II 综合评测'
SET n.userScore = 9.1
SET n.pros = 4.8
SET n.cons = '轻便全画幅；AI对焦强；视频照片均衡'
SET n.reviewDate = '取景器较小；单卡槽'
SET n.targetModel = '2026-06-06'
;

MERGE (n:Entity {id: 'review_xt5'})
SET n:ReviewRecord
SET n.name = 'X-T5 综合评测'
SET n.userScore = 9
SET n.pros = 4.8
SET n.cons = '高像素；胶片模拟；直出好看'
SET n.reviewDate = '视频散热和追焦不如专业视频机'
SET n.targetModel = '2026-06-06'
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'use_landscape'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 84
SET r.note = '轻便高像素全画幅，适合旅行风光'
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '轻便全画幅适合扫街'
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = 'Vlog和直播入门友好'
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 78
SET r.note = '轻便便宜适合日常扫街'
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '低价4K入门直播选择'
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 78
SET r.note = '轻便低价'
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '翻转屏和佳能对焦适合直播短视频'
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '轻便便携'
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'use_landscape'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '高像素和胶片模拟适合风光'
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '复古操作和直出适合街拍'
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '视频能力和续航适合直播Vlog'
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '轻便复古适合扫街'
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '轻便全画幅视频机'
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '专业视频规格适合直播和视频工作流'
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '街拍经典便携机'
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'use_street'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 95
SET r.note = '40mm视角适合街拍和环境人像'
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'use_landscape'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '中画幅高像素适合风光商业'
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'use_studio'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '中画幅高像素适合商业棚拍'
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'use_live'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '云台稳定和便携适合直播Vlog'
;

MATCH (a:Entity {id: 'profile_beginner_low'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 95
SET r.note = '低预算新手优先推荐'
;

MATCH (a:Entity {id: 'profile_beginner_low'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 94
SET r.note = '价格低操作简单'
;

MATCH (a:Entity {id: 'profile_beginner_low'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 88
SET r.note = '预算稍高时更均衡'
;

MATCH (a:Entity {id: 'profile_beginner_video'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 96
SET r.note = 'Vlog入门热销'
;

MATCH (a:Entity {id: 'profile_beginner_video'}), (b:Entity {id: 'cam_pocket3'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 94
SET r.note = '最简单的视频记录设备'
;

MATCH (a:Entity {id: 'profile_beginner_video'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 88
SET r.note = '照片视频兼顾'
;

MATCH (a:Entity {id: 'profile_travel_light'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 94
SET r.note = '轻便全画幅旅行'
;

MATCH (a:Entity {id: 'profile_travel_light'}), (b:Entity {id: 'cam_xm5'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 90
SET r.note = '轻便复古街拍'
;

MATCH (a:Entity {id: 'profile_travel_light'}), (b:Entity {id: 'cam_gr3'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 92
SET r.note = '口袋街拍旅行'
;

MATCH (a:Entity {id: 'profile_portrait_ff'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 92
SET r.note = '轻便全画幅人像'
;

MATCH (a:Entity {id: 'profile_portrait_ff'}), (b:Entity {id: 'cam_r8'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 90
SET r.note = '佳能轻量全画幅'
;

MATCH (a:Entity {id: 'profile_portrait_ff'}), (b:Entity {id: 'cam_z5m2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 86
SET r.note = '尼康入门全画幅'
;

MATCH (a:Entity {id: 'profile_video_pro'}), (b:Entity {id: 'cam_fx3'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 96
SET r.note = '专业视频定位'
;

MATCH (a:Entity {id: 'profile_video_pro'}), (b:Entity {id: 'cam_gh7'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 94
SET r.note = 'M43专业视频旗舰'
;

MATCH (a:Entity {id: 'profile_video_pro'}), (b:Entity {id: 'cam_s5m2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 90
SET r.note = '全画幅视频照片均衡'
;

MATCH (a:Entity {id: 'profile_sports_bird'}), (b:Entity {id: 'cam_a9m3'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 98
SET r.note = '高速运动旗舰'
;

MATCH (a:Entity {id: 'profile_sports_bird'}), (b:Entity {id: 'cam_z9'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 96
SET r.note = '旗舰生态和连拍'
;

MATCH (a:Entity {id: 'profile_sports_bird'}), (b:Entity {id: 'cam_om1m2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 90
SET r.note = 'M43长焦生态轻量'
;

MATCH (a:Entity {id: 'profile_studio_commercial'}), (b:Entity {id: 'cam_x2d'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 96
SET r.note = '中画幅商业棚拍'
;

MATCH (a:Entity {id: 'profile_studio_commercial'}), (b:Entity {id: 'cam_gfx100m2'})
MERGE (a)-[r:RECOMMENDED_CAMERA]->(b)
SET r.score = 94
SET r.note = '富士中画幅高像素'
;

MATCH (a:Entity {id: 'price_jd_zve10'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_official_zve10'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_used_zve10'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_jd_r100'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_official_r100'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_used_r100'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_jd_r50'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_official_r50'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_used_r50'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_jd_a7c2'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_official_a7c2'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_used_a7c2'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_jd_xt5'}), (b:Entity {id: 'cam_xt5'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_official_xt5'}), (b:Entity {id: 'cam_xt5'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'price_used_xt5'}), (b:Entity {id: 'cam_xt5'})
MERGE (a)-[r:PRICE_OF]->(b)
;

MATCH (a:Entity {id: 'review_zve10'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:REVIEW_OF]->(b)
;

MATCH (a:Entity {id: 'review_r100'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:REVIEW_OF]->(b)
;

MATCH (a:Entity {id: 'review_r50'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:REVIEW_OF]->(b)
;

MATCH (a:Entity {id: 'review_a7c2'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:REVIEW_OF]->(b)
;

MATCH (a:Entity {id: 'review_xt5'}), (b:Entity {id: 'cam_xt5'})
MERGE (a)-[r:REVIEW_OF]->(b)
;

MATCH (n:Entity {id: 'cam_zve10'})
SET n.effectivePixels = 2420
SET n.ibisStops = 0
SET n.afPoints = 425
SET n.batteryShots = 440
SET n.cardSlots = 1
SET n.screenType = '侧翻屏'
SET n.videoBitrate = '100Mbps'
SET n.mount = '索尼E卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_r100'})
SET n.effectivePixels = 2410
SET n.ibisStops = 0
SET n.afPoints = 143
SET n.batteryShots = 430
SET n.cardSlots = 1
SET n.screenType = '固定屏'
SET n.videoBitrate = '120Mbps'
SET n.mount = '佳能RF卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_r50'})
SET n.effectivePixels = 2420
SET n.ibisStops = 0
SET n.afPoints = 651
SET n.batteryShots = 370
SET n.cardSlots = 1
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '120Mbps'
SET n.mount = '佳能RF卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_a7c2'})
SET n.effectivePixels = 3300
SET n.ibisStops = 7
SET n.afPoints = 759
SET n.batteryShots = 560
SET n.cardSlots = 1
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '200Mbps'
SET n.mount = '索尼E卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_xt5'})
SET n.effectivePixels = 4020
SET n.ibisStops = 7
SET n.afPoints = 425
SET n.batteryShots = 580
SET n.cardSlots = 2
SET n.screenType = '三向翻折屏'
SET n.videoBitrate = '360Mbps'
SET n.mount = '富士X卡口'
SET n.portabilityLevel = '中'
;

MATCH (n:Entity {id: 'cam_xs20'})
SET n.effectivePixels = 2610
SET n.ibisStops = 7
SET n.afPoints = 425
SET n.batteryShots = 750
SET n.cardSlots = 1
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '360Mbps'
SET n.mount = '富士X卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_fx3'})
SET n.effectivePixels = 1210
SET n.ibisStops = 5.5
SET n.afPoints = 627
SET n.batteryShots = 600
SET n.cardSlots = 2
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '600Mbps'
SET n.mount = '索尼E卡口'
SET n.portabilityLevel = '中'
;

MATCH (n:Entity {id: 'cam_gh7'})
SET n.effectivePixels = 2520
SET n.ibisStops = 7.5
SET n.afPoints = 779
SET n.batteryShots = 380
SET n.cardSlots = 2
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '800Mbps'
SET n.mount = '松下M43卡口'
SET n.portabilityLevel = '中'
;

MATCH (n:Entity {id: 'cam_s9'})
SET n.effectivePixels = 2420
SET n.ibisStops = 6.5
SET n.afPoints = 779
SET n.batteryShots = 470
SET n.cardSlots = 1
SET n.screenType = '侧翻触控屏'
SET n.videoBitrate = '200Mbps'
SET n.mount = 'L卡口'
SET n.portabilityLevel = '高'
;

MATCH (n:Entity {id: 'cam_gr3'})
SET n.effectivePixels = 2420
SET n.ibisStops = 3
SET n.afPoints = 0
SET n.batteryShots = 200
SET n.cardSlots = 1
SET n.screenType = '固定触控屏'
SET n.mount = '固定镜头'
SET n.portabilityLevel = '极高'
;

MATCH (n:Entity {id: 'cam_pocket3'})
SET n.effectivePixels = 940
SET n.ibisStops = 0
SET n.afPoints = 0
SET n.batteryShots = 166
SET n.cardSlots = 1
SET n.screenType = '旋转触控屏'
SET n.videoBitrate = '130Mbps'
SET n.mount = '固定镜头云台'
SET n.portabilityLevel = '极高'
;

MATCH (n:Entity {id: 'cam_x2d'})
SET n.effectivePixels = 10000
SET n.ibisStops = 7
SET n.afPoints = 294
SET n.batteryShots = 420
SET n.cardSlots = 2
SET n.screenType = '翻折触控屏'
SET n.mount = '哈苏XCD卡口'
SET n.portabilityLevel = '低'
;

MATCH (n:Entity {id: 'lens_s1650p'})
SET n.mount = '索尼E卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'APS-C'
SET n.price = 1299
SET n.weight = 116
SET n.stabilization = 'OSS'
SET n.ecosystemNote = '索尼APS-C轻便套头'
;

MATCH (n:Entity {id: 'lens_s18135'})
SET n.mount = '索尼E卡口'
SET n.lensType = '旅行变焦'
SET n.coverage = 'APS-C'
SET n.price = 3999
SET n.weight = 325
SET n.stabilization = 'OSS'
SET n.ecosystemNote = '索尼APS-C一镜走天下'
;

MATCH (n:Entity {id: 'lens_s24105'})
SET n.mount = '索尼E卡口'
SET n.lensType = '标准变焦'
SET n.coverage = '全画幅'
SET n.price = 7499
SET n.weight = 663
SET n.stabilization = 'OSS'
SET n.ecosystemNote = '索尼全画幅常用挂机镜头'
;

MATCH (n:Entity {id: 'lens_c1845'})
SET n.mount = '佳能RF卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'APS-C'
SET n.price = 1499
SET n.weight = 130
SET n.stabilization = 'IS'
SET n.ecosystemNote = '佳能RF-S入门套头'
;

MATCH (n:Entity {id: 'lens_c18150'})
SET n.mount = '佳能RF卡口'
SET n.lensType = '旅行变焦'
SET n.coverage = 'APS-C'
SET n.price = 3299
SET n.weight = 310
SET n.stabilization = 'IS'
SET n.ecosystemNote = '佳能RF-S旅行大变焦'
;

MATCH (n:Entity {id: 'lens_c24105'})
SET n.mount = '佳能RF卡口'
SET n.lensType = '标准变焦'
SET n.coverage = '全画幅'
SET n.price = 2999
SET n.weight = 395
SET n.stabilization = 'IS'
SET n.ecosystemNote = '佳能全画幅轻量标准变焦'
;

MATCH (n:Entity {id: 'lens_n1650'})
SET n.mount = '尼康Z卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'APS-C'
SET n.price = 1699
SET n.weight = 135
SET n.stabilization = 'VR'
SET n.ecosystemNote = '尼康Z DX轻便套头'
;

MATCH (n:Entity {id: 'lens_n18140'})
SET n.mount = '尼康Z卡口'
SET n.lensType = '旅行变焦'
SET n.coverage = 'APS-C'
SET n.price = 3999
SET n.weight = 315
SET n.stabilization = 'VR'
SET n.ecosystemNote = '尼康Z DX旅行大变焦'
;

MATCH (n:Entity {id: 'lens_f1545'})
SET n.mount = '富士X卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'APS-C'
SET n.price = 1399
SET n.weight = 135
SET n.stabilization = 'OIS'
SET n.ecosystemNote = '富士轻便电动套头'
;

MATCH (n:Entity {id: 'lens_f1650'})
SET n.mount = '富士X卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'APS-C'
SET n.price = 4999
SET n.weight = 240
SET n.stabilization = '无'
SET n.ecosystemNote = '富士新款轻便变焦'
;

MATCH (n:Entity {id: 'lens_p1232'})
SET n.mount = '松下M43卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'M43'
SET n.price = 1299
SET n.weight = 70
SET n.stabilization = 'MEGA OIS'
SET n.ecosystemNote = '松下M43饼干变焦'
;

MATCH (n:Entity {id: 'lens_p2060'})
SET n.mount = 'L卡口'
SET n.lensType = '标准变焦'
SET n.coverage = '全画幅'
SET n.price = 3999
SET n.weight = 350
SET n.stabilization = '无'
SET n.ecosystemNote = '松下全画幅套头'
;

MATCH (n:Entity {id: 'lens_om1245'})
SET n.mount = 'M43卡口'
SET n.lensType = '标准变焦'
SET n.coverage = 'M43'
SET n.price = 3999
SET n.weight = 254
SET n.stabilization = '无'
SET n.ecosystemNote = 'OM轻便PRO变焦'
;

MATCH (n:PriceRecord) RETURN count(n) AS 价格记录数;
MATCH (n:ReviewRecord) RETURN count(n) AS 评测记录数;
MATCH (n:UserProfile) RETURN count(n) AS 用户画像数;