// Camera knowledge graph import script
// Run all statements in Neo4j Browser.
CREATE CONSTRAINT camera_entity_id IF NOT EXISTS FOR (n:Entity) REQUIRE n.id IS UNIQUE;
MATCH (n:Entity) DETACH DELETE n;

MERGE (n:Entity {id: 'brand_sony'})
SET n:Brand
SET n.name = '索尼'
SET n.country = '日本'
SET n.foundedYear = 1946
SET n.marketPositioning = '专业级'
;

MERGE (n:Entity {id: 'brand_canon'})
SET n:Brand
SET n.name = '佳能'
SET n.country = '日本'
SET n.foundedYear = 1937
SET n.marketPositioning = '专业级'
;

MERGE (n:Entity {id: 'brand_nikon'})
SET n:Brand
SET n.name = '尼康'
SET n.country = '日本'
SET n.foundedYear = 1917
SET n.marketPositioning = '专业级'
;

MERGE (n:Entity {id: 'brand_fuji'})
SET n:Brand
SET n.name = '富士'
SET n.country = '日本'
SET n.foundedYear = 1934
SET n.marketPositioning = '专业级'
;

MERGE (n:Entity {id: 'cat_ff'})
SET n:CameraCategory
SET n.name = '全画幅微单'
;

MERGE (n:Entity {id: 'cat_apsc'})
SET n:CameraCategory
SET n.name = 'APS-C画幅微单'
;

MERGE (n:Entity {id: 'cat_mf'})
SET n:CameraCategory
SET n.name = '中画幅微单'
;

MERGE (n:Entity {id: 'cam_a7m4'})
SET n:CameraModel
SET n.name = 'Alpha 7 IV'
SET n.price = 16999
SET n.releaseYear = 2021
SET n.weight = 658
;

MERGE (n:Entity {id: 'cam_a7m3'})
SET n:CameraModel
SET n.name = 'Alpha 7 III'
SET n.price = 11999
SET n.releaseYear = 2018
SET n.weight = 650
;

MERGE (n:Entity {id: 'cam_a7r5'})
SET n:CameraModel
SET n.name = 'Alpha 7R V'
SET n.price = 25999
SET n.releaseYear = 2022
SET n.weight = 723
;

MERGE (n:Entity {id: 'cam_a9m3'})
SET n:CameraModel
SET n.name = 'Alpha 9 III'
SET n.price = 44999
SET n.releaseYear = 2024
SET n.weight = 617
;

MERGE (n:Entity {id: 'cam_a6700'})
SET n:CameraModel
SET n.name = 'Alpha 6700'
SET n.price = 9999
SET n.releaseYear = 2023
SET n.weight = 493
;

MERGE (n:Entity {id: 'cam_fx3'})
SET n:CameraModel
SET n.name = 'FX3'
SET n.price = 26999
SET n.releaseYear = 2021
SET n.weight = 715
;

MERGE (n:Entity {id: 'cam_r5m2'})
SET n:CameraModel
SET n.name = 'EOS R5 Mark II'
SET n.price = 26999
SET n.releaseYear = 2024
SET n.weight = 746
;

MERGE (n:Entity {id: 'cam_r6m2'})
SET n:CameraModel
SET n.name = 'EOS R6 Mark II'
SET n.price = 15499
SET n.releaseYear = 2022
SET n.weight = 670
;

MERGE (n:Entity {id: 'cam_r6'})
SET n:CameraModel
SET n.name = 'EOS R6'
SET n.price = 12999
SET n.releaseYear = 2020
SET n.weight = 680
;

MERGE (n:Entity {id: 'cam_r7'})
SET n:CameraModel
SET n.name = 'EOS R7'
SET n.price = 8999
SET n.releaseYear = 2022
SET n.weight = 612
;

MERGE (n:Entity {id: 'cam_r50'})
SET n:CameraModel
SET n.name = 'EOS R50'
SET n.price = 4599
SET n.releaseYear = 2023
SET n.weight = 375
;

MERGE (n:Entity {id: 'cam_r3'})
SET n:CameraModel
SET n.name = 'EOS R3'
SET n.price = 36999
SET n.releaseYear = 2021
SET n.weight = 1015
;

MERGE (n:Entity {id: 'cam_z6m3'})
SET n:CameraModel
SET n.name = 'Z 6III'
SET n.price = 16999
SET n.releaseYear = 2024
SET n.weight = 760
;

MERGE (n:Entity {id: 'cam_z8'})
SET n:CameraModel
SET n.name = 'Z 8'
SET n.price = 27999
SET n.releaseYear = 2023
SET n.weight = 910
;

MERGE (n:Entity {id: 'cam_z9'})
SET n:CameraModel
SET n.name = 'Z 9'
SET n.price = 35999
SET n.releaseYear = 2021
SET n.weight = 1340
;

MERGE (n:Entity {id: 'cam_zf'})
SET n:CameraModel
SET n.name = 'Z f'
SET n.price = 13799
SET n.releaseYear = 2023
SET n.weight = 710
;

MERGE (n:Entity {id: 'cam_z50'})
SET n:CameraModel
SET n.name = 'Z 50'
SET n.price = 5599
SET n.releaseYear = 2019
SET n.weight = 450
;

MERGE (n:Entity {id: 'cam_xt5'})
SET n:CameraModel
SET n.name = 'X-T5'
SET n.price = 11990
SET n.releaseYear = 2022
SET n.weight = 557
;

MERGE (n:Entity {id: 'cam_xh2s'})
SET n:CameraModel
SET n.name = 'X-H2S'
SET n.price = 16700
SET n.releaseYear = 2022
SET n.weight = 660
;

MERGE (n:Entity {id: 'cam_xt50'})
SET n:CameraModel
SET n.name = 'X-T50'
SET n.price = 9999
SET n.releaseYear = 2024
SET n.weight = 438
;

MERGE (n:Entity {id: 'cam_gfx100m2'})
SET n:CameraModel
SET n.name = 'GFX100 II'
SET n.price = 53900
SET n.releaseYear = 2023
SET n.weight = 1030
;

MERGE (n:Entity {id: 'cam_x100vi'})
SET n:CameraModel
SET n.name = 'X100VI'
SET n.price = 11390
SET n.releaseYear = 2024
SET n.weight = 521
;

MERGE (n:Entity {id: 'lens_s2470'})
SET n:Lens
SET n.name = 'FE 24-70mm F2.8 GM II'
SET n.price = 14499
SET n.focalLength = '24-70mm'
SET n.maxAperture = 'F2.8'
;

MERGE (n:Entity {id: 'lens_s70200'})
SET n:Lens
SET n.name = 'FE 70-200mm F2.8 GM OSS II'
SET n.price = 18999
SET n.focalLength = '70-200mm'
SET n.maxAperture = 'F2.8'
;

MERGE (n:Entity {id: 'lens_s50'})
SET n:Lens
SET n.name = 'FE 50mm F1.2 GM'
SET n.price = 15999
SET n.focalLength = '50mm'
SET n.maxAperture = 'F1.2'
;

MERGE (n:Entity {id: 'lens_c2470'})
SET n:Lens
SET n.name = 'RF 24-70mm F2.8 L IS USM'
SET n.price = 15999
SET n.focalLength = '24-70mm'
SET n.maxAperture = 'F2.8'
;

MERGE (n:Entity {id: 'lens_c70200'})
SET n:Lens
SET n.name = 'RF 70-200mm F2.8 L IS USM'
SET n.price = 17999
SET n.focalLength = '70-200mm'
SET n.maxAperture = 'F2.8'
;

MERGE (n:Entity {id: 'lens_c50'})
SET n:Lens
SET n.name = 'RF 50mm F1.2 L USM'
SET n.price = 16499
SET n.focalLength = '50mm'
SET n.maxAperture = 'F1.2'
;

MERGE (n:Entity {id: 'lens_n2470'})
SET n:Lens
SET n.name = 'NIKKOR Z 24-70mm f/2.8 S'
SET n.price = 15499
SET n.focalLength = '24-70mm'
SET n.maxAperture = 'f/2.8'
;

MERGE (n:Entity {id: 'lens_n70200'})
SET n:Lens
SET n.name = 'NIKKOR Z 70-200mm f/2.8 VR S'
SET n.price = 17499
SET n.focalLength = '70-200mm'
SET n.maxAperture = 'f/2.8'
;

MERGE (n:Entity {id: 'lens_n50'})
SET n:Lens
SET n.name = 'NIKKOR Z 50mm f/1.2 S'
SET n.price = 14999
SET n.focalLength = '50mm'
SET n.maxAperture = 'f/1.2'
;

MERGE (n:Entity {id: 'lens_f1655'})
SET n:Lens
SET n.name = 'XF 16-55mm F2.8 R LM WR'
SET n.price = 7999
SET n.focalLength = '16-55mm'
SET n.maxAperture = 'F2.8'
;

MERGE (n:Entity {id: 'lens_f1855'})
SET n:Lens
SET n.name = 'XF 18-55mm F2.8-4 R LM OIS'
SET n.price = 2399
SET n.focalLength = '18-55mm'
SET n.maxAperture = 'F2.8-4'
;

MERGE (n:Entity {id: 'comp_bionz_xr'})
SET n:Component
SET n.name = 'BIONZ XR'
SET n.componentType = '图像处理器'
;

MERGE (n:Entity {id: 'comp_exmor_r'})
SET n:Component
SET n.name = 'Exmor R CMOS'
SET n.componentType = '图像传感器'
;

MERGE (n:Entity {id: 'comp_exmor_rs'})
SET n:Component
SET n.name = 'Exmor RS CMOS'
SET n.componentType = '图像传感器'
;

MERGE (n:Entity {id: 'comp_digic_x'})
SET n:Component
SET n.name = 'DIGIC X'
SET n.componentType = '图像处理器'
;

MERGE (n:Entity {id: 'comp_expeed_7'})
SET n:Component
SET n.name = 'EXPEED 7'
SET n.componentType = '图像处理器'
;

MERGE (n:Entity {id: 'comp_x_proc_5'})
SET n:Component
SET n.name = 'X-Processor 5'
SET n.componentType = '图像处理器'
;

MERGE (n:Entity {id: 'comp_xtrans_5'})
SET n:Component
SET n.name = 'X-Trans CMOS 5 HR'
SET n.componentType = '图像传感器'
;

MERGE (n:Entity {id: 'index_8k30p'})
SET n:ParameterIndex
SET n.name = '8K 30p 视频规格'
SET n.indexValue = '8K 30p'
;

MERGE (n:Entity {id: 'index_4k120p'})
SET n:ParameterIndex
SET n.name = '4K 120p 视频规格'
SET n.indexValue = '4K 120p'
;

MERGE (n:Entity {id: 'index_4k60p'})
SET n:ParameterIndex
SET n.name = '4K 60p 视频规格'
SET n.indexValue = '4K 60p'
;

MERGE (n:Entity {id: 'index_10fps'})
SET n:ParameterIndex
SET n.name = '10fps 连拍速度'
SET n.indexValue = '10fps'
;

MERGE (n:Entity {id: 'index_20fps'})
SET n:ParameterIndex
SET n.name = '20fps 连拍速度'
SET n.indexValue = '20fps'
;

MERGE (n:Entity {id: 'index_30fps'})
SET n:ParameterIndex
SET n.name = '30fps 连拍速度'
SET n.indexValue = '30fps'
;

MERGE (n:Entity {id: 'index_120fps'})
SET n:ParameterIndex
SET n.name = '120fps 连拍速度'
SET n.indexValue = '120fps'
;

MERGE (n:Entity {id: 'use_travel'})
SET n:UseCase
SET n.name = '旅行随拍'
SET n.description = '重视轻便机身、直出色彩和通用焦段'
;

MERGE (n:Entity {id: 'use_portrait'})
SET n:UseCase
SET n.name = '人像摄影'
SET n.description = '重视全画幅、浅景深、镜头系统和高画质'
;

MERGE (n:Entity {id: 'use_video'})
SET n:UseCase
SET n.name = '视频创作'
SET n.description = '重视4K或8K视频规格、防抖、散热和接口扩展'
;

MERGE (n:Entity {id: 'use_sports'})
SET n:UseCase
SET n.name = '体育生态摄影'
SET n.description = '重视高速连拍、追焦性能和长焦镜头系统'
;

MERGE (n:Entity {id: 'use_beginner'})
SET n:UseCase
SET n.name = '入门学习'
SET n.description = '重视价格友好、重量轻、操作简单和镜头成本'
;

MERGE (n:Entity {id: 'use_professional'})
SET n:UseCase
SET n.name = '商业专业拍摄'
SET n.description = '重视旗舰性能、高可靠性、双卡和专业镜头生态'
;

MERGE (n:Entity {id: 'band_entry'})
SET n:PriceBand
SET n.name = '入门预算'
SET n.description = '5000元以内或略高，适合初学者和轻量记录'
SET n.minBudget = 0
SET n.maxBudget = 6000
;

MERGE (n:Entity {id: 'band_mid'})
SET n:PriceBand
SET n.name = '中端预算'
SET n.description = '6000到12000元，兼顾画质、便携和成本'
SET n.minBudget = 6000
SET n.maxBudget = 12000
;

MERGE (n:Entity {id: 'band_high'})
SET n:PriceBand
SET n.name = '高端预算'
SET n.description = '12000到20000元，适合进阶创作和全画幅升级'
SET n.minBudget = 12000
SET n.maxBudget = 20000
;

MERGE (n:Entity {id: 'band_pro'})
SET n:PriceBand
SET n.name = '专业预算'
SET n.description = '20000元以上，适合旗舰性能和商业用途'
SET n.minBudget = 20000
SET n.maxBudget = 999999
;

MERGE (n:Entity {id: 'reason_light'})
SET n:Reason
SET n.name = '轻便机身'
SET n.description = '重量较低，适合旅行和日常携带'
;

MERGE (n:Entity {id: 'reason_full_frame'})
SET n:Reason
SET n.name = '全画幅画质'
SET n.description = '全画幅系统具备更好的高感和景深控制潜力'
;

MERGE (n:Entity {id: 'reason_video'})
SET n:Reason
SET n.name = '视频规格突出'
SET n.description = '具备4K60p、4K120p或8K等视频能力'
;

MERGE (n:Entity {id: 'reason_fast'})
SET n:Reason
SET n.name = '高速连拍'
SET n.description = '连拍指标适合运动、生态和新闻场景'
;

MERGE (n:Entity {id: 'reason_lens_ecosystem'})
SET n:Reason
SET n.name = '镜头生态完善'
SET n.description = '可兼容同品牌多支主流镜头'
;

MERGE (n:Entity {id: 'reason_low_cost'})
SET n:Reason
SET n.name = '预算友好'
SET n.description = '机身价格较低，适合入门或备用机'
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m3'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7m3'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m3'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m3'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'lens_s2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'lens_s70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'lens_s50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'lens_s2470'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_s70200'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_s50'}), (b:Entity {id: 'brand_sony'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r6'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r7'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r7'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r7'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r7'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'lens_c2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'lens_c70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'lens_c50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'lens_c2470'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_c70200'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_c50'}), (b:Entity {id: 'brand_canon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z6m3'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z6m3'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z6m3'}), (b:Entity {id: 'lens_n70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z6m3'}), (b:Entity {id: 'lens_n50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'lens_n70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'lens_n50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'lens_n70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'lens_n50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'lens_n70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'lens_n50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'lens_n2470'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'lens_n70200'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'lens_n50'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'lens_n2470'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_n70200'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_n50'}), (b:Entity {id: 'brand_nikon'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'lens_f1655'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'lens_f1855'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xh2s'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xh2s'}), (b:Entity {id: 'lens_f1655'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xh2s'}), (b:Entity {id: 'lens_f1855'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'lens_f1655'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'lens_f1855'})
MERGE (a)-[r:COMPATIBLE_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_gfx100m2'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_x100vi'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_f1655'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'lens_f1855'}), (b:Entity {id: 'brand_fuji'})
MERGE (a)-[r:PRODUCED_BY]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7m3'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r6'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z6m3'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'cat_ff'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r7'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xh2s'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_x100vi'}), (b:Entity {id: 'cat_apsc'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_gfx100m2'}), (b:Entity {id: 'cat_mf'})
MERGE (a)-[r:BELONGS_TO_CATEGORY]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'comp_bionz_xr'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'comp_exmor_r'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a7r5'}), (b:Entity {id: 'comp_bionz_xr'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'comp_bionz_xr'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'comp_exmor_rs'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'comp_digic_x'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'comp_digic_x'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'comp_expeed_7'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'comp_expeed_7'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'comp_x_proc_5'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_xt5'}), (b:Entity {id: 'comp_xtrans_5'})
MERGE (a)-[r:EQUIPPED_WITH]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'index_120fps'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'index_4k60p'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'index_10fps'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'index_8k30p'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'index_8k30p'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'index_20fps'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'index_30fps'})
MERGE (a)-[r:ACHIEVES_INDEX]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'cam_a7m3'})
MERGE (a)-[r:SUCCESSOR_OF]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'cam_r6'})
MERGE (a)-[r:SUCCESSOR_OF]->(b)
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 95
SET r.note = '价格低、重量轻，适合入门学习'
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = 'APS-C机身轻便，适合新手和日常记录'
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'use_beginner'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 82
SET r.note = '机身轻便且外观直观，适合学习摄影'
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '轻便APS-C机身，兼顾照片和视频'
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '重量较低，适合旅行随拍'
;

MATCH (a:Entity {id: 'cam_x100vi'}), (b:Entity {id: 'use_travel'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '定焦便携，适合街拍和旅行记录'
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 88
SET r.note = '全画幅均衡机型，镜头生态完整'
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 86
SET r.note = '全画幅且价格适中，适合人像创作'
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'use_portrait'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 84
SET r.note = '全画幅复古机身，适合人像和日常创作'
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '支持4K60p，视频和照片能力均衡'
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '视频定位机型，适合专业视频创作'
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'use_video'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 93
SET r.note = '高端全画幅，支持8K规格'
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 98
SET r.note = '高速连拍指标突出，适合运动题材'
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 94
SET r.note = '旗舰机身，支持高速连拍和8K规格'
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'use_sports'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '旗舰级机身，适合新闻和体育'
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 92
SET r.note = '高端全画幅，性能接近旗舰'
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 96
SET r.note = '旗舰定位，适合商业和专业拍摄'
;

MATCH (a:Entity {id: 'cam_gfx100m2'}), (b:Entity {id: 'use_professional'})
MERGE (a)-[r:SUITABLE_FOR]->(b)
SET r.score = 90
SET r.note = '中画幅高像素，适合商业棚拍'
;

MATCH (a:Entity {id: 'cam_r50'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z50'}), (b:Entity {id: 'reason_low_cost'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_xt50'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_x100vi'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a6700'}), (b:Entity {id: 'reason_light'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_zf'}), (b:Entity {id: 'reason_full_frame'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_fx3'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r5m2'}), (b:Entity {id: 'reason_video'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a9m3'}), (b:Entity {id: 'reason_fast'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z9'}), (b:Entity {id: 'reason_fast'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r3'}), (b:Entity {id: 'reason_fast'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_z8'}), (b:Entity {id: 'reason_lens_ecosystem'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_a7m4'}), (b:Entity {id: 'reason_lens_ecosystem'})
MERGE (a)-[r:HAS_REASON]->(b)
;

MATCH (a:Entity {id: 'cam_r6m2'}), (b:Entity {id: 'reason_lens_ecosystem'})
MERGE (a)-[r:HAS_REASON]->(b)
;

// Create price-band relations from camera price.
MATCH (m:CameraModel), (b:PriceBand)
WHERE m.price >= b.minBudget AND m.price < b.maxBudget
MERGE (m)-[:IN_PRICE_BAND]->(b);

// Smoke test
MATCH (n:Entity) RETURN labels(n) AS labels, count(*) AS count ORDER BY count DESC;