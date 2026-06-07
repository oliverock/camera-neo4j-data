// Incremental market data import for camera knowledge graph
CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;

MERGE (n:Entity {id: 'cam_a7c2'})
SET n:CameraModel
SET n.name = 'Alpha 7C II'
SET n.brand = '索尼'
SET n.category = '全画幅微单'
SET n.price = 13999
SET n.releaseYear = 2023
SET n.weight = 514
SET n.marketHotScore = 96
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceRank = 4
SET n.sourceTitle = '索尼 Alpha 7C II 全画幅微单相机 AI智能芯片 4K视频'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '轻便全画幅机身，适合旅行、人像和视频创作'
;

MERGE (n:Entity {id: 'cam_zve10'})
SET n:CameraModel
SET n.name = 'ZV-E10'
SET n.brand = '索尼'
SET n.category = 'APS-C画幅微单'
SET n.price = 4599
SET n.releaseYear = 2021
SET n.weight = 343
SET n.marketHotScore = 93
SET n.sourcePlatform = '京东自营数码微单排行榜'
SET n.sourceRank = 7
SET n.sourceTitle = '索尼 ZV-E10K 半画幅直播4K视频 Vlog美颜神器'
SET n.sourceUrl = 'https://www.jd.com/phb/key_65248aeaf2fae7926b5.html'
SET n.marketNote = 'Vlog和入门视频创作热销机型'
;

MERGE (n:Entity {id: 'cam_zve10m2'})
SET n:CameraModel
SET n.name = 'ZV-E10 II'
SET n.brand = '索尼'
SET n.category = 'APS-C画幅微单'
SET n.price = 6999
SET n.releaseYear = 2024
SET n.weight = 377
SET n.marketHotScore = 88
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '索尼 ZV-E10 II Vlog 微单相机'
SET n.sourceUrl = 'https://www.sony.com.cn/'
SET n.marketNote = '新一代Vlog入门机，适合视频和直播'
;

MERGE (n:Entity {id: 'cam_a6400'})
SET n:CameraModel
SET n.name = 'Alpha 6400'
SET n.brand = '索尼'
SET n.category = 'APS-C画幅微单'
SET n.price = 5999
SET n.releaseYear = 2019
SET n.weight = 403
SET n.marketHotScore = 82
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '索尼 Alpha 6400 APS-C 微单相机'
SET n.sourceUrl = 'https://www.sony.com.cn/'
SET n.marketNote = '入门到进阶用户常见选择'
;

MERGE (n:Entity {id: 'cam_a7cr'})
SET n:CameraModel
SET n.name = 'Alpha 7CR'
SET n.brand = '索尼'
SET n.category = '全画幅微单'
SET n.price = 20999
SET n.releaseYear = 2023
SET n.weight = 515
SET n.marketHotScore = 84
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '索尼 Alpha 7CR 高像素轻便全画幅微单'
SET n.sourceUrl = 'https://www.sony.com.cn/'
SET n.marketNote = '轻便高像素全画幅，适合旅行风光'
;

MERGE (n:Entity {id: 'cam_r100'})
SET n:CameraModel
SET n.name = 'EOS R100'
SET n.brand = '佳能'
SET n.category = 'APS-C画幅微单'
SET n.price = 3999
SET n.releaseYear = 2023
SET n.weight = 356
SET n.marketHotScore = 91
SET n.sourcePlatform = '京东自营数码微单排行榜'
SET n.sourceTitle = '佳能 EOS R100 入门级微单相机 旅行家用学生vlog'
SET n.sourceUrl = 'https://www.jd.com/phb/key_65248aeaf2fae7926b5.html'
SET n.marketNote = '低价入门微单，适合学生和家庭记录'
;

MERGE (n:Entity {id: 'cam_r10'})
SET n:CameraModel
SET n.name = 'EOS R10'
SET n.brand = '佳能'
SET n.category = 'APS-C画幅微单'
SET n.price = 6799
SET n.releaseYear = 2022
SET n.weight = 429
SET n.marketHotScore = 86
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 EOS R10 APS-C 微单相机'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = '对焦和连拍表现较好，适合入门进阶'
;

MERGE (n:Entity {id: 'cam_r8'})
SET n:CameraModel
SET n.name = 'EOS R8'
SET n.brand = '佳能'
SET n.category = '全画幅微单'
SET n.price = 10499
SET n.releaseYear = 2023
SET n.weight = 461
SET n.marketHotScore = 89
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 EOS R8 轻量全画幅微单相机'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = '轻量全画幅，适合人像、旅行和视频'
;

MERGE (n:Entity {id: 'cam_z30'})
SET n:CameraModel
SET n.name = 'Z 30'
SET n.brand = '尼康'
SET n.category = 'APS-C画幅微单'
SET n.price = 4999
SET n.releaseYear = 2022
SET n.weight = 405
SET n.marketHotScore = 90
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '尼康 Z30 Vlog 微单相机'
SET n.sourceUrl = 'https://www.nikon.com.cn/'
SET n.marketNote = '入门视频和日常记录机型'
;

MERGE (n:Entity {id: 'cam_z50m2'})
SET n:CameraModel
SET n.name = 'Z 50II'
SET n.brand = '尼康'
SET n.category = 'APS-C画幅微单'
SET n.price = 6999
SET n.releaseYear = 2024
SET n.weight = 550
SET n.marketHotScore = 91
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceRank = 8
SET n.sourceTitle = '尼康 Z50II 18-140mm VR 微单套机 Z50二代'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '适合新手和旅行，套机焦段覆盖广'
;

MERGE (n:Entity {id: 'cam_z5m2'})
SET n:CameraModel
SET n.name = 'Z5 II'
SET n.brand = '尼康'
SET n.category = '全画幅微单'
SET n.price = 10999
SET n.releaseYear = 2025
SET n.weight = 700
SET n.marketHotScore = 86
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '尼康 Z5 II 全画幅微单相机'
SET n.sourceUrl = 'https://www.nikon.com.cn/'
SET n.marketNote = '入门全画幅升级选择'
;

MERGE (n:Entity {id: 'cam_xs20'})
SET n:CameraModel
SET n.name = 'X-S20'
SET n.brand = '富士'
SET n.category = 'APS-C画幅微单'
SET n.price = 9199
SET n.releaseYear = 2023
SET n.weight = 491
SET n.marketHotScore = 98
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceRank = 1
SET n.sourceTitle = '富士 X-S20 微单相机 AI智能对焦 750张续航 Vlog模式'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '热销便携视频机，适合旅行、Vlog和直出'
;

MERGE (n:Entity {id: 'cam_xm5'})
SET n:CameraModel
SET n.name = 'X-M5'
SET n.brand = '富士'
SET n.category = 'APS-C画幅微单'
SET n.price = 5999
SET n.releaseYear = 2024
SET n.weight = 355
SET n.marketHotScore = 89
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceRank = 9
SET n.sourceTitle = '富士 X-M5 微单相机 2610万像素 AI智能对焦 胶片模拟'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '轻量复古入门机，适合街拍和旅行'
;

MERGE (n:Entity {id: 'cam_xs10'})
SET n:CameraModel
SET n.name = 'X-S10'
SET n.brand = '富士'
SET n.category = 'APS-C画幅微单'
SET n.price = 6999
SET n.releaseYear = 2020
SET n.weight = 465
SET n.marketHotScore = 80
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '富士 X-S10 微单相机'
SET n.sourceUrl = 'https://www.fujifilm.com.cn/'
SET n.marketNote = '具备防抖和胶片模拟，性价比较好'
;

MERGE (n:Entity {id: 'cam_a7c'})
SET n:CameraModel
SET n.name = 'Alpha 7C'
SET n.brand = '索尼'
SET n.category = '全画幅微单'
SET n.price = 9999
SET n.releaseYear = 2020
SET n.weight = 509
SET n.marketHotScore = 85
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '索尼 Alpha 7C 轻便全画幅微单'
SET n.sourceUrl = 'https://www.sony.com.cn/'
SET n.marketNote = '轻便全画幅老款，二手和促销市场常见'
;

MERGE (n:Entity {id: 'cam_rp'})
SET n:CameraModel
SET n.name = 'EOS RP'
SET n.brand = '佳能'
SET n.category = '全画幅微单'
SET n.price = 6999
SET n.releaseYear = 2019
SET n.weight = 485
SET n.marketHotScore = 78
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 EOS RP 入门全画幅微单'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = '低价全画幅入门选择'
;

MERGE (n:Entity {id: 'lens_s2860'})
SET n:Lens
SET n.name = 'FE 28-60mm F4-5.6'
SET n.brand = '索尼'
SET n.price = 2999
SET n.weight = 167
SET n.focalLength = '28-60mm'
SET n.maxAperture = 'F4-5.6'
SET n.mount = '索尼E卡口'
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceTitle = '索尼 Alpha 7C II 含2860镜头套装'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '轻便全画幅套机镜头'
;

MERGE (n:Entity {id: 'lens_s24105'})
SET n:Lens
SET n.name = 'FE 24-105mm F4 G OSS'
SET n.brand = '索尼'
SET n.price = 7499
SET n.weight = 663
SET n.focalLength = '24-105mm'
SET n.maxAperture = 'F4'
SET n.mount = '索尼E卡口'
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceTitle = '索尼 Alpha 7 IV + SEL24105G 套装'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '一镜走天下全画幅标准变焦'
;

MERGE (n:Entity {id: 'lens_s1650p'})
SET n:Lens
SET n.name = 'E PZ 16-50mm F3.5-5.6 OSS'
SET n.brand = '索尼'
SET n.price = 1299
SET n.weight = 116
SET n.focalLength = '16-50mm'
SET n.maxAperture = 'F3.5-5.6'
SET n.mount = '索尼E卡口'
SET n.sourcePlatform = '京东自营数码微单排行榜'
SET n.sourceTitle = '索尼 ZV-E10K 标准镜头套装'
SET n.sourceUrl = 'https://www.jd.com/phb/key_65248aeaf2fae7926b5.html'
SET n.marketNote = 'APS-C轻便电动变焦套头'
;

MERGE (n:Entity {id: 'lens_s18135'})
SET n:Lens
SET n.name = 'E 18-135mm F3.5-5.6 OSS'
SET n.brand = '索尼'
SET n.price = 3999
SET n.weight = 325
SET n.focalLength = '18-135mm'
SET n.maxAperture = 'F3.5-5.6'
SET n.mount = '索尼E卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '索尼 APS-C 旅行变焦镜头'
SET n.sourceUrl = 'https://www.sony.com.cn/'
SET n.marketNote = 'APS-C旅行大变焦'
;

MERGE (n:Entity {id: 'lens_c1845'})
SET n:Lens
SET n.name = 'RF-S 18-45mm F4.5-6.3 IS STM'
SET n.brand = '佳能'
SET n.price = 1499
SET n.weight = 130
SET n.focalLength = '18-45mm'
SET n.maxAperture = 'F4.5-6.3'
SET n.mount = '佳能RF卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 RF-S 入门套机镜头'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = 'R50/R100常见套机镜头'
;

MERGE (n:Entity {id: 'lens_c18150'})
SET n:Lens
SET n.name = 'RF-S 18-150mm F3.5-6.3 IS STM'
SET n.brand = '佳能'
SET n.price = 3299
SET n.weight = 310
SET n.focalLength = '18-150mm'
SET n.maxAperture = 'F3.5-6.3'
SET n.mount = '佳能RF卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 RF-S 旅行变焦镜头'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = 'APS-C一镜走天下'
;

MERGE (n:Entity {id: 'lens_c24105'})
SET n:Lens
SET n.name = 'RF 24-105mm F4-7.1 IS STM'
SET n.brand = '佳能'
SET n.price = 2999
SET n.weight = 395
SET n.focalLength = '24-105mm'
SET n.maxAperture = 'F4-7.1'
SET n.mount = '佳能RF卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '佳能 RF 全画幅轻量标准变焦'
SET n.sourceUrl = 'https://www.canon.com.cn/'
SET n.marketNote = '轻便全画幅标准变焦'
;

MERGE (n:Entity {id: 'lens_n1650'})
SET n:Lens
SET n.name = 'NIKKOR Z DX 16-50mm f/3.5-6.3 VR'
SET n.brand = '尼康'
SET n.price = 1699
SET n.weight = 135
SET n.focalLength = '16-50mm'
SET n.maxAperture = 'f/3.5-6.3'
SET n.mount = '尼康Z卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '尼康 Z DX 16-50mm 套机镜头'
SET n.sourceUrl = 'https://www.nikon.com.cn/'
SET n.marketNote = 'Z30/Z50系列轻便套头'
;

MERGE (n:Entity {id: 'lens_n18140'})
SET n:Lens
SET n.name = 'NIKKOR Z DX 18-140mm f/3.5-6.3 VR'
SET n.brand = '尼康'
SET n.price = 3999
SET n.weight = 315
SET n.focalLength = '18-140mm'
SET n.maxAperture = 'f/3.5-6.3'
SET n.mount = '尼康Z卡口'
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceTitle = '尼康 Z50II 18-140mm VR 微单套机'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '旅行大变焦套机镜头'
;

MERGE (n:Entity {id: 'lens_n2450'})
SET n:Lens
SET n.name = 'NIKKOR Z 24-50mm f/4-6.3'
SET n.brand = '尼康'
SET n.price = 2499
SET n.weight = 195
SET n.focalLength = '24-50mm'
SET n.maxAperture = 'f/4-6.3'
SET n.mount = '尼康Z卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '尼康 Z 全画幅轻便套机镜头'
SET n.sourceUrl = 'https://www.nikon.com.cn/'
SET n.marketNote = '入门全画幅轻便套头'
;

MERGE (n:Entity {id: 'lens_fxc35'})
SET n:Lens
SET n.name = 'XC 35mm F2'
SET n.brand = '富士'
SET n.price = 1399
SET n.weight = 130
SET n.focalLength = '35mm'
SET n.maxAperture = 'F2'
SET n.mount = '富士X卡口'
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceTitle = '富士 X-S20/X-M5 XC35 镜头套装'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '富士入门定焦，适合人像和街拍'
;

MERGE (n:Entity {id: 'lens_f1650'})
SET n:Lens
SET n.name = 'XF 16-50mm F2.8-4.8 R LM WR'
SET n.brand = '富士'
SET n.price = 4999
SET n.weight = 240
SET n.focalLength = '16-50mm'
SET n.maxAperture = 'F2.8-4.8'
SET n.mount = '富士X卡口'
SET n.sourcePlatform = '京东自营微单排行榜'
SET n.sourceTitle = '富士 X-T50/X-T5 16-50mm套机'
SET n.sourceUrl = 'https://www.jd.com/phb/key_652c33b950d6af2d7e9.html'
SET n.marketNote = '新款轻便标准变焦套机镜头'
;

MERGE (n:Entity {id: 'lens_f1545'})
SET n:Lens
SET n.name = 'XC 15-45mm F3.5-5.6 OIS PZ'
SET n.brand = '富士'
SET n.price = 1399
SET n.weight = 135
SET n.focalLength = '15-45mm'
SET n.maxAperture = 'F3.5-5.6'
SET n.mount = '富士X卡口'
SET n.sourcePlatform = '市场补充'
SET n.sourceTitle = '富士 XC 15-45mm 电动变焦套头'
SET n.sourceUrl = 'https://www.fujifilm.com.cn/'
SET n.marketNote = '轻便入门套机镜头'
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'lens_s2860'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'lens_s24105'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '轻便全画幅，适合旅行随拍'
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '全画幅画质和对焦适合人像'
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '支持4K视频和轻便创作'
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'lens_s18135'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '价格友好，适合新手视频入门'
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = 'Vlog定位明确'
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'lens_s18135'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '新一代视频入门机'
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '操作简单适合入门'
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'lens_s18135'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 84
SET r.note = '对焦强，入门进阶皆可'
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '机身轻便'
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'lens_s2860'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'lens_s24105'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '轻便高像素'
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '高像素适合商业风光'
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'lens_c18150'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '低价轻便，适合学生家庭'
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 80
SET r.note = '轻便易携带'
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'lens_c18150'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '对焦和连拍表现适合进阶'
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = 'APS-C连拍适合入门运动题材'
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'lens_c24105'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '轻量全画幅适合人像'
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '全画幅视频能力均衡'
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'lens_n1650'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'lens_n18140'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '入门Vlog和日常记录'
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '适合轻量视频'
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'lens_n1650'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'lens_n18140'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '套机焦段覆盖广，新手友好'
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '适合旅行'
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'lens_n2450'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '入门全画幅'
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 80
SET r.note = '适合预算充足的新手升级全画幅'
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'lens_fxc35'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'lens_f1650'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'lens_f1655'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '6K和4K能力强，适合Vlog'
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '轻便续航好'
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '直出色彩好'
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'lens_fxc35'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'lens_f1545'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '轻便复古，适合新手和街拍'
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '重量低适合随身携带'
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'lens_f1545'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'lens_f1655'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '具备防抖，性价比较好'
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'lens_s2860'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'lens_s24105'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '轻便全画幅老款'
;

MATCH (a:Entity {id: 'cam_rp'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_rp'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_rp'}), (b:Entity {id: 'lens_c24105'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_rp'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 78
SET r.note = '低价全画幅入门'
;

MATCH (a:Entity {id: 'lens_s2860'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_s24105'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_s1650p'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_s18135'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_c1845'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_c18150'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_c24105'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_n1650'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_n18140'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_n2450'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_fxc35'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_f1650'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_f1545'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7c2'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_zve10'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_zve10m2'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a6400'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7cr'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r100'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r10'}), (b:Entity {id: 'reason_fast'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r8'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z30'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z50m2'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z5m2'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_xs20'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_xm5'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_xs10'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7c'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_rp'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

// Refresh price-band relations for all camera models.
MATCH (m:CameraModel), (b:PriceBand)
WHERE m.price >= b.minBudget AND m.price < b.maxBudget
MERGE (m)-[:IN_PRICE_BAND]->(b);

MATCH (n:Entity) RETURN labels(n) AS labels, count(*) AS count ORDER BY count DESC;