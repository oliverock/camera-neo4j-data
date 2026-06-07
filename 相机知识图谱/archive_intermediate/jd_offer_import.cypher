// JD current search-page product offers import
CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;

MERGE (n:Entity {id: 'cam_xt30iii'})
SET n:CameraModel
SET n.name = 'X-T30III'
SET n.brand = '富士'
SET n.category = 'APS-C画幅微单'
SET n.price = 7449
SET n.releaseYear = 2025
SET n.marketHotScore = 79
SET n.sourcePlatform = '京东登录态搜索页'
SET n.sourceTitle = '富士（FUJIFILM）富士XT30三代 XT30III 三代入门微单数码相机 4KVlog摄影摄像机 X-T30III银+XC15-45mm变焦镜头 官方标配（机身+肩带+原装电池）'
SET n.sourceUrl = 'https://item.jd.com/10137496294268.html'
SET n.marketNote = '京东搜索页出现的富士入门复古微单，适合入门、街拍和Vlog'
;

MERGE (n:Entity {id: 'offer_jd_10202282356480'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 索尼zve10/ZV-10 创意滤镜 E10K黑色 套机 官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10202282356480'
SET n.title = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 索尼zve10/ZV-10 创意滤镜 E10K黑色 套机 官方标配'
SET n.price = 3446.1
SET n.shop = 'SONY数码专卖店'
SET n.sold = '已售1000+'
SET n.soldScore = 1000
SET n.rank = '索尼E卡口微单相机热卖榜第7名'
SET n.url = 'https://item.jd.com/10202282356480.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10110724739640'})
SET n:ProductOffer
SET n.name = '入门级微单相机 旅行家用学生vlog视频 4k小巧便携半画幅 人像 初学者 半画幅相机 数码相机 R100 RF-S 18-45STM 套机 官方标配【不含内存'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10110724739640'
SET n.title = '入门级微单相机 旅行家用学生vlog视频 4k小巧便携半画幅 人像 初学者 半画幅相机 数码相机 R100 RF-S 18-45STM 套机 官方标配【不含内存卡相机包等必要...'
SET n.price = 2589
SET n.shop = '佳能（Canon）相机官方旗舰店'
SET n.sold = '已售100万+'
SET n.soldScore = 1000000
SET n.url = 'https://item.jd.com/10110724739640.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'EOS R100'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_100013051295'})
SET n:ProductOffer
SET n.name = '索尼ZV-E10半画幅微黑色单机身'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100013051295'
SET n.title = '索尼ZV-E10半画幅微黑色单机身'
SET n.price = 3018.6
SET n.shop = 'SONY京东自营旗舰店'
SET n.sold = '已售9万+'
SET n.soldScore = 90000
SET n.rank = '微单相机热卖榜第1名'
SET n.url = 'https://item.jd.com/100013051295.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10158296775136'})
SET n:ProductOffer
SET n.name = '【大促底价】富士XT5 16 55二代 全新官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10158296775136'
SET n.title = '【大促底价】富士XT5 16 55二代 全新官方标配'
SET n.price = 19698
SET n.shop = '乐严选数码买手店'
SET n.sold = '已售2000+'
SET n.soldScore = 2000
SET n.url = 'https://item.jd.com/10158296775136.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'X-T5'
;

MERGE (n:Entity {id: 'offer_jd_10220073054348'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 颜值机身 精准对焦 VLOG APS-C画幅 ZV-E10黑色单机身 (上海、江苏专享) 官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10220073054348'
SET n.title = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 颜值机身 精准对焦 VLOG APS-C画幅 ZV-E10黑色单机身 (上海、江苏专享) 官方标配'
SET n.price = 2940
SET n.shop = '克尔数码专营店'
SET n.sold = '已售600+'
SET n.soldScore = 600
SET n.url = 'https://item.jd.com/10220073054348.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10165137640802'})
SET n:ProductOffer
SET n.name = '佳能Canon [官方旗舰店] EOS R100套机入门微单相机照相机 买家秀晒图赢20元E卡 至高24期免息 EOS R100 套机 RF-S18-45mm'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10165137640802'
SET n.title = '佳能Canon [官方旗舰店] EOS R100套机入门微单相机照相机 买家秀晒图赢20元E卡 至高24期免息 EOS R100 套机 RF-S18-45mm'
SET n.price = 2499
SET n.shop = '官方旗舰店'
SET n.sold = '已售1000+'
SET n.soldScore = 1000
SET n.rank = '佳能RF卡口微单相机热卖榜第8名'
SET n.url = 'https://item.jd.com/10165137640802.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'EOS R100'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_100207538579'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K APS-C画幅微单相机 新升级标准镜头套装 黑色 新套机镜头E PZ 16-50mm F3.5-5.6 OSS II'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100207538579'
SET n.title = '索尼（SONY）ZV-E10K APS-C画幅微单相机 新升级标准镜头套装 黑色 新套机镜头E PZ 16-50mm F3.5-5.6 OSS II'
SET n.price = 3599.1
SET n.shop = 'SONY京东自营旗舰店'
SET n.sold = '已售9万+'
SET n.soldScore = 90000
SET n.url = 'https://item.jd.com/100207538579.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'ZV-E10'
SET n.lensModel = 'E PZ 16-50mm F3.5-5.6 OSS'
;

MERGE (n:Entity {id: 'offer_jd_10033910239285'})
SET n:ProductOffer
SET n.name = 'Canon佳能r100入门级微单相机 旅行家用学生vlog视频送礼物 4k小巧便携半画幅数码相机 R100 套机 送礼好物 【国家补贴至高立省15%】 官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10033910239285'
SET n.title = 'Canon佳能r100入门级微单相机 旅行家用学生vlog视频送礼物 4k小巧便携半画幅数码相机 R100 套机 送礼好物 【国家补贴至高立省15%】 官方标配【不含内存卡配件 推荐购买套餐】'
SET n.price = 2599
SET n.shop = '佳能（Canon）数码影像旗舰店'
SET n.sold = '已售1万+'
SET n.soldScore = 10000
SET n.rank = '主推微单相机热卖榜第4名'
SET n.url = 'https://item.jd.com/10033910239285.html'
SET n.capturedAt = '2026-06-06T07:20:34.772Z'
SET n.cameraModel = 'EOS R100'
;

MERGE (n:Entity {id: 'offer_jd_100064843454'})
SET n:ProductOffer
SET n.name = '索尼A7C2微单套机'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100064843454'
SET n.title = '索尼A7C2微单套机'
SET n.price = 11449
SET n.shop = 'SONY京东自营旗舰店'
SET n.sold = '已售8万+'
SET n.soldScore = 80000
SET n.url = 'https://item.jd.com/100064843454.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'Alpha 7C II'
;

MERGE (n:Entity {id: 'offer_jd_10068864908740'})
SET n:ProductOffer
SET n.name = '佳能r50相机 入门级微单 旅行家用学生vlog视频 4k小巧便携 半画幅 记录 高清便携 R50数码照相机 EOSR50 18-45 STM白色套机 送礼好物'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10068864908740'
SET n.title = '佳能r50相机 入门级微单 旅行家用学生vlog视频 4k小巧便携 半画幅 记录 高清便携 R50数码照相机 EOSR50 18-45 STM白色套机 送礼好物 官方标配【不含内存卡相机包等必要配件'
SET n.price = 5799
SET n.shop = '佳能（Canon）相机官方旗舰店'
SET n.sold = '已售200万+'
SET n.soldScore = 2000000
SET n.url = 'https://item.jd.com/10068864908740.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'EOS R50'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_10054809857901'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K APS-C半画微单 ZV-E10 vlog直播4K视频侧翻式ZV-E10L/zv-e10/ZV-E10K 黑色单机 官方标配（不'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10054809857901'
SET n.title = '索尼（SONY）ZV-E10K APS-C半画微单 ZV-E10 vlog直播4K视频侧翻式ZV-E10L/zv-e10/ZV-E10K 黑色单机 官方标配（不含内存卡）'
SET n.price = 3130.2
SET n.shop = '索尼（SONY）数码相机旗舰店'
SET n.sold = '已售2万+'
SET n.soldScore = 20000
SET n.url = 'https://item.jd.com/10054809857901.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10202282356481'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 索尼zve10/ZV-10 创意滤镜 E10K白色 套机 官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10202282356481'
SET n.title = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 索尼zve10/ZV-10 创意滤镜 E10K白色 套机 官方标配'
SET n.price = 3446.1
SET n.shop = 'SONY数码专卖店'
SET n.sold = '已售1000+'
SET n.soldScore = 1000
SET n.url = 'https://item.jd.com/10202282356481.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10070240860330'})
SET n:ProductOffer
SET n.name = '佳能（Canon）EOS R50 微单半画幅相机 r50小巧便携 Vlog拍摄直播相机 4K短视频 学生微单相机 R50白色 RF-S18-45套机【日常家用】'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10070240860330'
SET n.title = '佳能（Canon）EOS R50 微单半画幅相机 r50小巧便携 Vlog拍摄直播相机 4K短视频 学生微单相机 R50白色 RF-S18-45套机【日常家用】 官方标配【京东多仓发~快可次日达】'
SET n.price = 5799
SET n.shop = '佳能（Canon）数码旗舰店'
SET n.sold = '已售100万+'
SET n.soldScore = 1000000
SET n.url = 'https://item.jd.com/10070240860330.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'EOS R50'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_100262353621'})
SET n:ProductOffer
SET n.name = '索尼（SONY）【618专享】ZV-E10K APS-C画幅微单相机 黑色机身+新16-50人像+55-210长焦超值双镜头套装'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100262353621'
SET n.title = '索尼（SONY）【618专享】ZV-E10K APS-C画幅微单相机 黑色机身+新16-50人像+55-210长焦超值双镜头套装'
SET n.price = 4653.9
SET n.shop = 'SONY京东自营旗舰店'
SET n.sold = '已售9万+'
SET n.soldScore = 90000
SET n.rank = '双镜头套装微单相机热卖榜第5名'
SET n.url = 'https://item.jd.com/100262353621.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'ZV-E10'
SET n.lensModel = 'E PZ 16-50mm F3.5-5.6 OSS'
;

MERGE (n:Entity {id: 'offer_jd_10096485342065'})
SET n:ProductOffer
SET n.name = '佳能（Canon）r100微单相机 4K数码高清旅游vlog视频 R100学生入门级微单 R100 18-45 STM套机【日常热款】 官方标配【不含内存卡基础'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10096485342065'
SET n.title = '佳能（Canon）r100微单相机 4K数码高清旅游vlog视频 R100学生入门级微单 R100 18-45 STM套机【日常热款】 官方标配【不含内存卡基础配件 推荐购买套餐】'
SET n.price = 2589
SET n.shop = '佳能（Canon）影像旗舰店'
SET n.sold = '已售100万+'
SET n.soldScore = 1000000
SET n.rank = '主推微单相机热卖榜第10名'
SET n.url = 'https://item.jd.com/10096485342065.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'EOS R100'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_10183298551057'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 ZVE10/ZV-10 ZV-E10黑色单机 标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10183298551057'
SET n.title = '索尼（SONY）ZV-E10K 半画幅微单相机 美肤拍照 精准对焦 VLOG APS-C画幅 ZVE10/ZV-10 ZV-E10黑色单机 标配'
SET n.price = 3124
SET n.shop = '索尼（SONY）数码旗舰店'
SET n.sold = '已售8000+'
SET n.soldScore = 8000
SET n.rank = '纯机身入门级微单相机折扣榜第6名'
SET n.url = 'https://item.jd.com/10183298551057.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10137496244596'})
SET n:ProductOffer
SET n.name = '富士（FUJIFILM）富士XT30三代 XT30III 三代入门微单数码相机 4KVlog摄影摄像机 X-T30III 复古黑（单机身） 官方标配（机身+肩带'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10137496244596'
SET n.title = '富士（FUJIFILM）富士XT30三代 XT30III 三代入门微单数码相机 4KVlog摄影摄像机 X-T30III 复古黑（单机身） 官方标配（机身+肩带+原装电池）'
SET n.price = 6049
SET n.shop = '甄选数码买手店'
SET n.sold = '已售7000+'
SET n.soldScore = 7000
SET n.url = 'https://item.jd.com/10137496244596.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'X-T30III'
;

MERGE (n:Entity {id: 'offer_jd_100216074669'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K微单相机 半画幅直播4K视频 Vlog美颜神器 侧翻液晶屏数码相机 新升级标准镜头'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100216074669'
SET n.title = '索尼（SONY）ZV-E10K微单相机 半画幅直播4K视频 Vlog美颜神器 侧翻液晶屏数码相机 新升级标准镜头'
SET n.price = 3498.3
SET n.shop = '索尼（SONY）影像京东自营专区'
SET n.sold = '已售4000+'
SET n.soldScore = 4000
SET n.rank = '单镜头套装微单相机好评榜第5名'
SET n.url = 'https://item.jd.com/100216074669.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'ZV-E10'
;

MERGE (n:Entity {id: 'offer_jd_10097041537048'})
SET n:ProductOffer
SET n.name = '佳能（Canon）EOS R100 迷你微单 小巧轻便微单相机 Vlog拍摄日常记录 4K视频家用直播旅游r100照相机 学生微单 R100+RF-S18-45'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10097041537048'
SET n.title = '佳能（Canon）EOS R100 迷你微单 小巧轻便微单相机 Vlog拍摄日常记录 4K视频家用直播旅游r100照相机 学生微单 R100+RF-S18-45套机【日常家用】 官方标配【京东多仓发~'
SET n.price = 2589
SET n.shop = '佳能（Canon）数码旗舰店'
SET n.sold = '已售50万+'
SET n.soldScore = 500000
SET n.rank = '美颜拍摄微单相机热卖榜第7名'
SET n.url = 'https://item.jd.com/10097041537048.html'
SET n.capturedAt = '2026-06-06T07:20:34.773Z'
SET n.cameraModel = 'EOS R100'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MERGE (n:Entity {id: 'offer_jd_100207538577'})
SET n:ProductOffer
SET n.name = '索尼（SONY）ZV-E10K APS-C画幅微单相机 新升级标准镜头套装 白色 新套机镜头E PZ 16-50mm F3.5-5.6 OSS II'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '100207538577'
SET n.title = '索尼（SONY）ZV-E10K APS-C画幅微单相机 新升级标准镜头套装 白色 新套机镜头E PZ 16-50mm F3.5-5.6 OSS II'
SET n.price = 3599.1
SET n.shop = 'SONY京东自营旗舰店'
SET n.sold = '已售9万+'
SET n.soldScore = 90000
SET n.url = 'https://item.jd.com/100207538577.html'
SET n.capturedAt = '2026-06-06T07:20:34.774Z'
SET n.cameraModel = 'ZV-E10'
SET n.lensModel = 'E PZ 16-50mm F3.5-5.6 OSS'
;

MERGE (n:Entity {id: 'offer_jd_10039419624359'})
SET n:ProductOffer
SET n.name = '【佳能旗舰店】r100入门相机'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10039419624359'
SET n.title = '【佳能旗舰店】r100入门相机'
SET n.price = 2889
SET n.shop = '佳能旗舰店'
SET n.sold = '已售100万+'
SET n.soldScore = 1000000
SET n.url = 'https://item.jd.com/10039419624359.html'
SET n.capturedAt = '2026-06-06T07:20:34.774Z'
SET n.cameraModel = 'EOS R100'
;

MERGE (n:Entity {id: 'offer_jd_10137496294268'})
SET n:ProductOffer
SET n.name = '富士（FUJIFILM）富士XT30三代 XT30III 三代入门微单数码相机 4KVlog摄影摄像机 X-T30III银+XC15-45mm变焦镜头 官方标配'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10137496294268'
SET n.title = '富士（FUJIFILM）富士XT30三代 XT30III 三代入门微单数码相机 4KVlog摄影摄像机 X-T30III银+XC15-45mm变焦镜头 官方标配（机身+肩带+原装电池）'
SET n.price = 7449
SET n.shop = '甄选数码买手店'
SET n.sold = '已售7000+'
SET n.soldScore = 7000
SET n.url = 'https://item.jd.com/10137496294268.html'
SET n.capturedAt = '2026-06-06T07:20:34.774Z'
SET n.cameraModel = 'X-T30III'
SET n.lensModel = 'XC 15-45mm F3.5-5.6 OIS PZ'
;

MERGE (n:Entity {id: 'offer_jd_10066504677198'})
SET n:ProductOffer
SET n.name = '佳能r50相机 入门级微单 旅行家用学生vlog视频 4k小巧便携 半画幅 记录 高清便携 R50数码照相机 EOSR50 18-45 STM黑色套机 送礼好物'
SET n.platform = '京东'
SET n.keyword = '微单相机'
SET n.sku = '10066504677198'
SET n.title = '佳能r50相机 入门级微单 旅行家用学生vlog视频 4k小巧便携 半画幅 记录 高清便携 R50数码照相机 EOSR50 18-45 STM黑色套机 送礼好物 官方标配【不含内存...'
SET n.price = 5799
SET n.shop = '佳能（Canon）相机官方旗舰店'
SET n.sold = '已售100万+'
SET n.soldScore = 1000000
SET n.url = 'https://item.jd.com/10066504677198.html'
SET n.capturedAt = '2026-06-06T07:20:34.774Z'
SET n.cameraModel = 'EOS R50'
SET n.lensModel = 'RF-S 18-45mm F4.5-6.3 IS STM'
;

MATCH (a:Entity {id: 'offer_jd_10202282356480'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10110724739640'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10110724739640'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_100013051295'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10158296775136'}), (b:Entity {id: 'cam_xt5'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10220073054348'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10165137640802'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10165137640802'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_100207538579'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_100207538579'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_10033910239285'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_100064843454'}), (b:Entity {id: 'cam_a7c2'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10068864908740'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10068864908740'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_10054809857901'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10202282356481'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10070240860330'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10070240860330'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_100262353621'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_100262353621'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_10096485342065'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10096485342065'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_10183298551057'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10137496244596'}), (b:Entity {id: 'cam_xt30iii'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.note = '复古入门微单，适合新手'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.note = '轻便适合街拍旅行'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'offer_jd_100216074669'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10097041537048'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10097041537048'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_100207538577'}), (b:Entity {id: 'cam_zve10'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_100207538577'}), (b:Entity {id: 'lens_s1650p'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'offer_jd_10039419624359'}), (b:Entity {id: 'cam_r100'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10137496294268'}), (b:Entity {id: 'cam_xt30iii'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10137496294268'}), (b:Entity {id: 'lens_f1545'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.note = '复古入门微单，适合新手'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.note = '轻便适合街拍旅行'
;

MATCH (a:Entity {id: 'cam_xt30iii'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'offer_jd_10066504677198'}), (b:Entity {id: 'cam_r50'})
MERGE (a)-[r:OFFER_FOR_CAMERA]->(b)
SET r.note = '京东搜索页采集商品报价'
;

MATCH (a:Entity {id: 'offer_jd_10066504677198'}), (b:Entity {id: 'lens_c1845'})
MERGE (a)-[r:OFFER_INCLUDES_LENS]->(b)
SET r.note = '标题识别出的套机镜头'
;

MATCH (n:ProductOffer) RETURN count(n) AS 京东报价节点数;