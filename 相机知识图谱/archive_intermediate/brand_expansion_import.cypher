// Brand expansion import
CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;

MERGE (n:Entity {id: 'brand_panasonic'})
SET n:Brand
SET n.name = '松下'
SET n.country = '日本'
SET n.foundedYear = 1918
SET n.marketPositioning = '视频创作与M43/全画幅混合系统'
;

MERGE (n:Entity {id: 'brand_leica'})
SET n:Brand
SET n.name = '徕卡'
SET n.country = '德国'
SET n.foundedYear = 1914
SET n.marketPositioning = '高端便携与旁轴影像'
;

MERGE (n:Entity {id: 'brand_om'})
SET n:Brand
SET n.name = 'OM System'
SET n.country = '日本'
SET n.foundedYear = 2021
SET n.marketPositioning = '轻量化M43户外生态系统'
;

MERGE (n:Entity {id: 'brand_ricoh'})
SET n:Brand
SET n.name = '理光'
SET n.country = '日本'
SET n.foundedYear = 1936
SET n.marketPositioning = '街拍便携相机'
;

MERGE (n:Entity {id: 'brand_hasselblad'})
SET n:Brand
SET n.name = '哈苏'
SET n.country = '瑞典'
SET n.foundedYear = 1941
SET n.marketPositioning = '中画幅高端影像'
;

MERGE (n:Entity {id: 'brand_dji'})
SET n:Brand
SET n.name = '大疆'
SET n.country = '中国'
SET n.foundedYear = 2006
SET n.marketPositioning = '影像稳定器与便携视频设备'
;

MERGE (n:Entity {id: 'cat_m43'})
SET n:CameraCategory
SET n.name = 'M43微单'
;

MERGE (n:Entity {id: 'cat_compact'})
SET n:CameraCategory
SET n.name = '便携固定镜头相机'
;

MERGE (n:Entity {id: 'cat_vlog_compact'})
SET n:CameraCategory
SET n.name = 'Vlog便携相机'
;

MERGE (n:Entity {id: 'cam_s9'})
SET n:CameraModel
SET n.name = 'Lumix S9'
SET n.price = 7999
SET n.releaseYear = 2024
SET n.weight = 486
SET n.brand = '松下'
SET n.category = '全画幅微单'
SET n.marketHotScore = 86
SET n.sourcePlatform = '京东登录态搜索页'
SET n.sourceTitle = '松下S9N 银色丨12期免息丨下单送好礼！'
SET n.sourceUrl = 'https://item.jd.com/10121433099690.html'
SET n.marketNote = '全画幅轻便视频机，适合Vlog、旅行和日常创作'
;

MERGE (n:Entity {id: 'cam_s5m2'})
SET n:CameraModel
SET n.name = 'Lumix S5 II'
SET n.price = 10999
SET n.releaseYear = 2023
SET n.weight = 740
SET n.brand = '松下'
SET n.category = '全画幅微单'
SET n.marketHotScore = 84
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '松下 Lumix S5 II 全画幅微单相机'
SET n.sourceUrl = 'https://www.panasonic.cn/'
SET n.marketNote = '全画幅视频和照片均衡机型'
;

MERGE (n:Entity {id: 'cam_gh7'})
SET n:CameraModel
SET n.name = 'Lumix GH7'
SET n.price = 14999
SET n.releaseYear = 2024
SET n.weight = 805
SET n.brand = '松下'
SET n.category = 'M43微单'
SET n.marketHotScore = 82
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '松下 Lumix GH7 M43视频旗舰'
SET n.sourceUrl = 'https://www.panasonic.cn/'
SET n.marketNote = 'M43视频旗舰，适合专业视频创作'
;

MERGE (n:Entity {id: 'cam_g100d'})
SET n:CameraModel
SET n.name = 'Lumix G100D'
SET n.price = 2798
SET n.releaseYear = 2024
SET n.weight = 346
SET n.brand = '松下'
SET n.category = 'M43微单'
SET n.marketHotScore = 88
SET n.sourcePlatform = '京东登录态搜索页'
SET n.sourceTitle = '松下G100DK 微单套机12-32mm 4K视频 专业收音'
SET n.sourceUrl = 'https://item.jd.com/100083084229.html'
SET n.marketNote = '入门Vlog和轻量旅行相机'
;

MERGE (n:Entity {id: 'cam_dlux8'})
SET n:CameraModel
SET n.name = 'D-LUX 8'
SET n.price = 13000
SET n.releaseYear = 2024
SET n.weight = 397
SET n.brand = '徕卡'
SET n.category = '便携固定镜头相机'
SET n.marketHotScore = 80
SET n.sourcePlatform = '京东登录态搜索页'
SET n.sourceTitle = '徕卡 D-LUX8 多功能便携式数码相机'
SET n.sourceUrl = 'https://item.jd.com/100118069914.html'
SET n.marketNote = '高端便携固定镜头相机，适合旅行和街拍'
;

MERGE (n:Entity {id: 'cam_q3'})
SET n:CameraModel
SET n.name = 'Q3'
SET n.price = 46900
SET n.releaseYear = 2023
SET n.weight = 743
SET n.brand = '徕卡'
SET n.category = '便携固定镜头相机'
SET n.marketHotScore = 76
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '徕卡 Q3 全画幅便携相机'
SET n.sourceUrl = 'https://leica-camera.com/'
SET n.marketNote = '高端全画幅固定镜头相机'
;

MERGE (n:Entity {id: 'cam_om5'})
SET n:CameraModel
SET n.name = 'OM-5'
SET n.price = 7999
SET n.releaseYear = 2022
SET n.weight = 414
SET n.brand = 'OM System'
SET n.category = 'M43微单'
SET n.marketHotScore = 78
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = 'OM System OM-5 M43微单'
SET n.sourceUrl = 'https://explore.omsystem.com/'
SET n.marketNote = '轻量户外旅行与生态题材'
;

MERGE (n:Entity {id: 'cam_om1m2'})
SET n:CameraModel
SET n.name = 'OM-1 Mark II'
SET n.price = 16999
SET n.releaseYear = 2024
SET n.weight = 599
SET n.brand = 'OM System'
SET n.category = 'M43微单'
SET n.marketHotScore = 80
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = 'OM System OM-1 Mark II M43旗舰'
SET n.sourceUrl = 'https://explore.omsystem.com/'
SET n.marketNote = '高速连拍、防护和生态拍摄'
;

MERGE (n:Entity {id: 'cam_gr3'})
SET n:CameraModel
SET n.name = 'GR III'
SET n.price = 6999
SET n.releaseYear = 2019
SET n.weight = 257
SET n.brand = '理光'
SET n.category = '便携固定镜头相机'
SET n.marketHotScore = 89
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '理光 GR III 街拍相机'
SET n.sourceUrl = 'https://www.ricoh-imaging.com/'
SET n.marketNote = '街拍经典机型，小巧高画质'
;

MERGE (n:Entity {id: 'cam_gr3x'})
SET n:CameraModel
SET n.name = 'GR IIIx'
SET n.price = 7499
SET n.releaseYear = 2021
SET n.weight = 262
SET n.brand = '理光'
SET n.category = '便携固定镜头相机'
SET n.marketHotScore = 86
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '理光 GR IIIx 街拍相机'
SET n.sourceUrl = 'https://www.ricoh-imaging.com/'
SET n.marketNote = '40mm视角街拍便携机'
;

MERGE (n:Entity {id: 'cam_x2d'})
SET n:CameraModel
SET n.name = 'X2D 100C'
SET n.price = 54800
SET n.releaseYear = 2022
SET n.weight = 895
SET n.brand = '哈苏'
SET n.category = '中画幅微单'
SET n.marketHotScore = 74
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '哈苏 X2D 100C 中画幅无反'
SET n.sourceUrl = 'https://www.hasselblad.com/'
SET n.marketNote = '高端中画幅高像素机型，适合商业和风光'
;

MERGE (n:Entity {id: 'cam_pocket3'})
SET n:CameraModel
SET n.name = 'Osmo Pocket 3'
SET n.price = 3499
SET n.releaseYear = 2023
SET n.weight = 179
SET n.brand = '大疆'
SET n.category = 'Vlog便携相机'
SET n.marketHotScore = 94
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '大疆 Osmo Pocket 3 便携云台相机'
SET n.sourceUrl = 'https://www.dji.com/cn/osmo-pocket-3'
SET n.marketNote = '口袋云台相机，适合Vlog、直播和旅行记录'
;

MERGE (n:Entity {id: 'lens_p1232'})
SET n:Lens
SET n.name = 'Lumix G 12-32mm F3.5-5.6'
SET n.price = 1299
SET n.weight = 70
SET n.focalLength = '12-32mm'
SET n.maxAperture = 'F3.5-5.6'
SET n.category = '松下'
SET n.sourcePlatform = 78
SET n.sourceTitle = '市场补充'
SET n.sourceUrl = '松下 M43 12-32mm 套机镜头'
SET n.marketNote = 'https://www.panasonic.cn/'
;

MERGE (n:Entity {id: 'lens_p2060'})
SET n:Lens
SET n.name = 'Lumix S 20-60mm F3.5-5.6'
SET n.price = 3999
SET n.weight = 350
SET n.focalLength = '20-60mm'
SET n.maxAperture = 'F3.5-5.6'
SET n.category = '松下'
SET n.sourcePlatform = 76
SET n.sourceTitle = '市场补充'
SET n.sourceUrl = '松下 L卡口 20-60mm 套机镜头'
SET n.marketNote = 'https://www.panasonic.cn/'
;

MERGE (n:Entity {id: 'lens_om1245'})
SET n:Lens
SET n.name = 'M.Zuiko 12-45mm F4 PRO'
SET n.price = 3999
SET n.weight = 254
SET n.focalLength = '12-45mm'
SET n.maxAperture = 'F4'
SET n.category = 'OM System'
SET n.sourcePlatform = 76
SET n.sourceTitle = '市场补充'
SET n.sourceUrl = 'OM System 12-45mm F4 PRO'
SET n.marketNote = 'https://explore.omsystem.com/'
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'lens_p2060'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '全画幅轻便视频机'
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '轻便适合旅行随拍'
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_s9'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'lens_p2060'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '全画幅视频能力均衡'
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '全画幅适合人像创作'
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_s5m2'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'cat_m43'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'lens_p1232'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = 'M43视频旗舰'
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '适合专业视频工作流'
;

MATCH (a:Entity {id: 'cam_gh7'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'cat_m43'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'lens_p1232'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '价格低且适合Vlog入门'
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '轻量视频机'
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_g100d'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_dlux8'}), (b:Entity {id: 'brand_leica'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_dlux8'}), (b:Entity {id: 'cat_compact'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_dlux8'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 84
SET r.note = '高端便携旅行机'
;

MATCH (a:Entity {id: 'cam_dlux8'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 72
SET r.note = '固定镜头适合日常人像'
;

MATCH (a:Entity {id: 'cam_dlux8'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_q3'}), (b:Entity {id: 'brand_leica'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_q3'}), (b:Entity {id: 'cat_compact'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_q3'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '高画质便携全画幅'
;

MATCH (a:Entity {id: 'cam_q3'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 80
SET r.note = '高端全画幅固定镜头'
;

MATCH (a:Entity {id: 'cam_q3'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'brand_om'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'cat_m43'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'lens_om1245'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '轻量防护适合旅行户外'
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 76
SET r.note = 'M43长焦生态适合入门生态'
;

MATCH (a:Entity {id: 'cam_om5'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'brand_om'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'cat_m43'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'lens_om1245'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '高速连拍与生态拍摄'
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '户外旗舰机身'
;

MATCH (a:Entity {id: 'cam_om1m2'}), (b:Entity {id: 'reason_fast'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'brand_ricoh'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'cat_compact'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '口袋街拍旅行机'
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 78
SET r.note = '固定镜头培养构图'
;

MATCH (a:Entity {id: 'cam_gr3'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'brand_ricoh'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'cat_compact'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '街拍便携'
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 78
SET r.note = '40mm视角适合环境人像'
;

MATCH (a:Entity {id: 'cam_gr3x'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'brand_hasselblad'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'cat_mf'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '中画幅高像素商业风光'
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '中画幅质感适合高端人像'
;

MATCH (a:Entity {id: 'cam_x2d'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'brand_dji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'cat_vlog_compact'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '云台稳定适合Vlog'
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '轻便口袋设备适合旅行记录'
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '操作简单适合小白视频入门'
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_pocket3'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'lens_p1232'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_p2060'}), (b:Entity {id: 'brand_panasonic'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_om1245'}), (b:Entity {id: 'brand_om'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (m:CameraModel), (b:PriceBand)
WHERE m.price >= b.minBudget AND m.price < b.maxBudget
MERGE (m)-[:IN_PRICE_BAND]->(b);

MATCH (n:Brand) RETURN count(n) AS 品牌数;