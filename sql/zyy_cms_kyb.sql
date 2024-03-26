
/*Table structure for table `cms_attr` */

DROP TABLE IF EXISTS `cms_attr`;

CREATE TABLE `cms_attr` (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                            `attr_name` varchar(100) DEFAULT NULL COMMENT '属性名称',
                            `attr_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '属性值',
                            `content_id` int DEFAULT NULL COMMENT '内容id',
                            `channel_id` int DEFAULT NULL COMMENT '栏目id',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义属性表';

/*Data for the table `cms_attr` */

insert  into `cms_attr`(`id`,`attr_name`,`attr_value`,`content_id`,`channel_id`) values

                                                                                     (1282,'input_1692177606413','',NULL,1066),

                                                                                     (1292,'uploadImg_1692177427879','[]',1141,NULL),

                                                                                     (1293,'uploadImg_1692177427879','[]',1140,NULL),

                                                                                     (1294,'uploadImg_1692177427879','[]',1137,NULL),

                                                                                     (1295,'uploadImg_1692177427879','[]',1136,NULL),

                                                                                     (1296,'uploadImg_1692177427879','[]',1135,NULL),

                                                                                     (1297,'input_1692263627204','',NULL,1068),

                                                                                     (1299,'video','[]',1143,NULL),

                                                                                     (1300,'video','[{\"type\":\"file\",\"name\":\"d3d582b6-ddbe-11ed-958c-f6b83f3af3a1-v8_f1_t1_5KIw8C0Y.mp4\",\"status\":\"done\",\"uid\":1711016743296,\"url\":\"/profile/upload/2024/03/21/d3d582b6-ddbe-11ed-958c-f6b83f3af3a1-v8_f1_t1_5KIw8C0Y_20240321182543A003.mp4\"}]',1142,NULL),

                                                                                     (1301,'ueditor_1702261173225','',NULL,1069),

                                                                                     (1305,'download','[{\"type\":\"file\",\"name\":\"下载演示.zip\",\"status\":\"done\",\"uid\":1711334563347,\"url\":\"/profile/upload/2024/03/25/下载演示_20240325104243A003.zip\"}]',1144,NULL),

                                                                                     (1306,'download','[{\"type\":\"file\",\"name\":\"下载演示.zip\",\"status\":\"done\",\"uid\":1711334573451,\"url\":\"/profile/upload/2024/03/25/下载演示_20240325104253A004.zip\"}]',1145,NULL);

/*Table structure for table `cms_channel` */

DROP TABLE IF EXISTS `cms_channel`;

CREATE TABLE `cms_channel` (
                               `channel_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                               `parent_id` int DEFAULT '0' COMMENT '父级id',
                               `site_id` int DEFAULT NULL COMMENT '站点id',
                               `channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '栏目名称',
                               `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '访问链接',
                               `external_link` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '外部链接',
                               `order_num` int DEFAULT NULL COMMENT '排序',
                               `temp_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'PC端模板',
                               `temp_mobile` varchar(100) DEFAULT NULL COMMENT '移动端模板',
                               `stage` char(2) DEFAULT '0' COMMENT '状态',
                               `content_model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '内容模型',
                               `channel_model` int NOT NULL COMMENT '栏目模型',
                               `examine_temp_id` varchar(50) DEFAULT NULL COMMENT '审批流模板ID',
                               `is_delete` char(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
                               `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
                               `create_time` datetime NOT NULL COMMENT '创建时间',
                               `delete_by` varchar(20) DEFAULT NULL COMMENT '删除人',
                               `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
                               `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
                               `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                               PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='栏目表';

/*Data for the table `cms_channel` */

insert  into `cms_channel`(`channel_id`,`parent_id`,`site_id`,`channel_name`,`path`,`external_link`,`order_num`,`temp_id`,`temp_mobile`,`stage`,`content_model`,`channel_model`,`examine_temp_id`,`is_delete`,`create_by`,`create_time`,`delete_by`,`delete_time`,`update_by`,`update_time`) values

                                                                                                                                                                                                                                                                                                 (1066,0,1016,'新闻','xw',NULL,10,NULL,NULL,'0','[{\"modelId\":15,\"params\":{}}]',14,NULL,'0','admin','2024-03-21 16:06:31',NULL,NULL,NULL,NULL),

                                                                                                                                                                                                                                                                                                 (1067,0,1016,'图片','tp',NULL,20,NULL,NULL,'0','[]',26,NULL,'0','admin','2024-03-21 16:07:45',NULL,NULL,'admin','2024-03-21 16:07:51'),

                                                                                                                                                                                                                                                                                                 (1068,0,1016,'视频','sp',NULL,30,NULL,NULL,'0','[{\"modelId\":27,\"params\":{}}]',16,NULL,'0','admin','2024-03-21 16:08:05',NULL,NULL,'admin','2024-03-21 17:56:59'),

                                                                                                                                                                                                                                                                                                 (1069,0,1016,'下载','xz',NULL,40,NULL,NULL,'0','[{\"modelId\":28,\"params\":{}}]',18,NULL,'0','admin','2024-03-21 16:08:17',NULL,NULL,'admin','2024-03-25 10:22:23');

/*Table structure for table `cms_config` */

DROP TABLE IF EXISTS `cms_config`;

CREATE TABLE `cms_config` (
                              `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                              `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '键',
                              `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '值',
                              `category` varchar(50) DEFAULT NULL COMMENT '分类',
                              `remark` varchar(100) DEFAULT NULL COMMENT '备注',
                              `sort` int DEFAULT NULL COMMENT '排序',
                              `delete_flag` int DEFAULT NULL COMMENT '是否删除',
                              `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
                              `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                              PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置表';

/*Data for the table `cms_config` */

insert  into `cms_config`(`id`,`config_key`,`config_value`,`category`,`remark`,`sort`,`delete_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values

                                                                                                                                                             (1,'pay_alipay_publicKey','','alipay','支付宝公钥配置',1,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (2,'pay_alipay_appId','','alipay','支付宝应用ID',2,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (3,'pay_alipay_appPrivateKey','','alipay','支付宝私钥配置',3,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (4,'pay_alipay_notifyUrl','','alipay','支付宝回调地址',4,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (5,'email_protocol','smtps','email','邮箱发件协议',5,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (6,'email_host','smtp.ym.163.com','email','SMTP服务器地址',6,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (7,'email_username','','email','发送者邮箱',7,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (8,'email_password','','email','邮箱密码',8,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (9,'email_nickname','hnzyy sun','email','发送人昵称',9,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (10,'email_port','994','email','邮箱端口号',10,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (11,'email_receive','2448200847@qq.com','email','接收者邮箱',11,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (12,'system_title','正易云内容管理系统','system','系统名称',12,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (13,'system_logo','','system','系统logo',13,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (14,'system_ico','/profile/upload/2023/11/13/favicon (1)_20231113171725A002.ico','system','系统图标',14,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (15,'system_login_name','正易云内容管理系统','system','登录标题',15,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (16,'wechat_mp_appid','','wechat_mp','微信公众号appid',16,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (17,'wechat_mp_appSecret','','wechat_mp','微信公众号密钥',17,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (18,'oss_aliyun_endpoint','','oss_aliyun','OSS节点地址',18,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (19,'oss_aliyun_accessKeyId','','oss_aliyun','阿里云oss accessKeyId',19,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (20,'oss_aliyun_accessKeySecret','','oss_aliyun','阿里云oss accessKeySecret',20,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (21,'oss_aliyun_bucketName','','oss_aliyun','阿里云oss bucketName',21,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (22,'cos_tencent_secretId','','cos_tencent','腾讯云cos secretId',22,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (23,'cos_tencent_secretKey','','cos_tencent','腾讯云cos secretKey',23,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (24,'cos_tencent_region','ap-nanjing','cos_tencent','腾讯云cos region',24,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (25,'cos_tencent_bucketName','','cos_tencent','腾讯云cos bucketName',25,0,NULL,NULL,NULL,NULL),

                                                                                                                                                             (26,'cos_tencent_path','','cos_tencent','腾讯云cos path',26,0,NULL,NULL,NULL,NULL);

/*Table structure for table `cms_content` */

DROP TABLE IF EXISTS `cms_content`;

CREATE TABLE `cms_content` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章名字',
                               `channel_id` int NOT NULL COMMENT '栏目id',
                               `model_id` int NOT NULL COMMENT '模型id',
                               `site_id` int NOT NULL COMMENT '站点id',
                               `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
                               `source` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '来源',
                               `profile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
                               `external_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '外部链接',
                               `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '封面图',
                               `views` int DEFAULT '0' COMMENT '浏览量',
                               `order_num` int DEFAULT NULL COMMENT '排序',
                               `stage` char(2) NOT NULL DEFAULT '0' COMMENT '0:已发布 1:下线',
                               `release_time` datetime DEFAULT NULL COMMENT '发布时间',
                               `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
                               `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                               `flow_id` varchar(60) DEFAULT NULL COMMENT '流程id',
                               `content_type` varchar(300) DEFAULT NULL COMMENT '内容类型',
                               `is_delete` char(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
                               `delete_by` varchar(20) DEFAULT NULL COMMENT '删除人',
                               `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
                               `topping` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '是否置顶',
                               PRIMARY KEY (`id`),
                               FULLTEXT KEY `content_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';

/*Data for the table `cms_content` */

insert  into `cms_content`(`id`,`title`,`channel_id`,`model_id`,`site_id`,`author`,`source`,`profile`,`external_link`,`cover`,`views`,`order_num`,`stage`,`release_time`,`create_by`,`create_time`,`update_by`,`update_time`,`flow_id`,`content_type`,`is_delete`,`delete_by`,`delete_time`,`topping`) values

                                                                                                                                                                                                                                                                                                           (1135,'刚推出就“老了”？相比探陆，锐界L正“年轻”',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/6b362a72-ccad-475b-bd49-449a7e2d92fe_20240321161118A001_20240321171602A005.jpg',3,10,'0','2024-03-21 16:10:37','admin','2024-03-21 16:12:01','admin','2024-03-21 17:35:01',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1136,'电比油低，比亚迪再出“王炸”，汉唐荣耀版16.98万起',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/d860bdd7-2b46-4382-8f96-8e7f7f216ea7_20240321162248A010_20240321171530A004.jpg',3,20,'0','2024-03-21 16:22:31','admin','2024-03-21 16:22:58','admin','2024-03-21 17:15:30',NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1137,'车企2024：合资燃油崩塌，中国车企高歌猛进',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/d1f5afe7-ba5d-4951-a78e-dbbc4ef3819f_20240321162401A014_20240321171458A003.jpg',2,30,'0','2024-03-21 16:23:39','admin','2024-03-21 16:24:05','admin','2024-03-21 17:35:05',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1138,'沃尔沃XC60：为你解决电动车的安全顾虑，让你放心出行！',1066,15,1016,'研发部门',NULL,NULL,NULL,NULL,2,40,'0','2024-03-21 16:26:32','admin','2024-03-21 16:26:54',NULL,NULL,NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1139,'沃尔沃XC60：为你解决电动车的安全顾虑，让你放心出行！',1066,15,1016,'研发部门',NULL,NULL,NULL,NULL,0,50,'0','2024-03-21 16:26:32','admin','2024-03-21 16:26:59',NULL,'2024-03-21 16:27:18',NULL,NULL,'1','admin','2024-03-21 16:27:18','0'),

                                                                                                                                                                                                                                                                                                           (1140,'悦达起亚新K3，家庭用车的领跑者',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/54486634-656a-476f-8d9f-d04d0c20379e_20240321162757A020_20240321171439A002.jpg',8,60,'0','2024-03-21 16:27:42','admin','2024-03-21 16:28:02','admin','2024-03-21 17:44:33',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1141,'性能手机新标杆，一加 Ace 3 发布会定档 1 月 4 日',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/aeea61d2-ddb2-43e1-a9a5-a566a6a2a11b_20240321163213A023_20240321171227A001.jpg',10,70,'0','2024-03-21 16:31:59','admin','2024-03-21 16:32:20','admin','2024-03-21 17:12:28',NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1142,'国产特斯拉Model X/S迎来OTA升级！改进了这些功能',1068,27,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/1681833939922182145_20240321175806A001.jpg',15,10,'0','2024-03-21 17:57:04','admin','2024-03-21 17:58:08','admin','2024-03-21 18:25:44',NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1143,'2023款雪铁龙DS4到货',1068,27,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/1674682857374699523_20240321180756A002.jpg',6,20,'0','2024-03-21 18:07:30','admin','2024-03-21 18:07:57',NULL,NULL,NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1144,'QQ下载',1069,28,1016,'研发部门',NULL,'年轻人的社交软件',NULL,NULL,0,10,'0','2024-03-25 10:23:05','admin','2024-03-25 10:26:11','admin','2024-03-25 10:42:44',NULL,NULL,'0',NULL,NULL,'0'),

                                                                                                                                                                                                                                                                                                           (1145,'微信下载',1069,28,1016,'研发部门',NULL,'微信，是一个生活方式',NULL,NULL,0,20,'0','2024-03-25 10:26:40','admin','2024-03-25 10:27:34','admin','2024-03-25 10:42:54',NULL,NULL,'0',NULL,NULL,'0');

/*Table structure for table `cms_content_txt` */

DROP TABLE IF EXISTS `cms_content_txt`;

CREATE TABLE `cms_content_txt` (
                                   `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                   `content_id` int NOT NULL COMMENT '文章表id',
                                   `text` longtext COMMENT '内容',
                                   `attr_key` varchar(20) DEFAULT NULL COMMENT '字段',
                                   PRIMARY KEY (`id`),
                                   FULLTEXT KEY `idxcontent` (`text`) /*!50100 WITH PARSER `ngram` */
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_content_txt` */

insert  into `cms_content_txt`(`id`,`content_id`,`text`,`attr_key`) values

                                                                        (150,1135,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">刚刚过去的春节，旅游成为很多人的“刚需”。经文化和旅游部数据中心测算，春节假期8天全国国内旅游出游4.74亿人次，同比增长34.3%。随着最近一波寒潮的过渡，不难预见，接下来的春暖花开时节，或将再迎来一波出游小高峰。带着家人来一次自由的长途自驾游，成为不少家庭的新计划。而经过对长途驾驶性能、一家人乘坐舒适度、通过性等维度的综合考量，很多消费者将购车目标锁定在了大7座SUV车型。纵观这一细分领域，福特锐界L和日产探陆都是不错的选择，究竟谁更适合全家出游？下面就对二者进行详细对比下。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/6b362a72-ccad-475b-bd49-449a7e2d92fe_20240321161118A001.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/a6928a95-955e-407f-a0fa-26c0ba14747b_20240321161118A002.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>2.0</strong><strong>T</strong><strong>+9AT VS大马力E混动</strong><strong>，锐界L动力</strong><strong>强、用车成本低</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自驾出游，路上省时、省心，才能养精蓄锐攒足精力游玩。从动力系统来看，探陆只提供了燃油版本，采用的是2.0T+9AT动力组合，最大功率185kW，最大扭376N·m，百公里综合油耗低至8.65L。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">锐界L不仅提供了燃油版本，还有混动版本可选，满足用户多元用车需求。锐界L混动版搭载了同级唯一的大马力E混动系统，集福特最新的第五代2.0T EcoBoost®发动机及成熟先进的动力分流混动技术于一身，发动机额定功率202kW，最大扭矩405N·m，百公里加速仅需7.1s，百公里综合油耗低至6.31L，一箱油续航1188km，参数表现明显优于探陆，并且相比探陆需要加95号汽油，锐界L“不挑食”可加92号汽油，进一步降低用车成本。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/3709067d-abc2-4ed5-aa4f-d189292b8aa5_20240321161118A003.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（锐界L大马力E混动系统）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>大沙发VS头等舱，锐界L躺出舒适感</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">对于自驾出游车辆选择，国人普遍有大车情结，全体家庭成员舒适乘坐是首要保障。探陆尺寸5130/1981/1774mm，轴距为2900mm，座椅布局方面，探陆7座车属于传统的2+3+2式7座布局，第三排2个座位空间局促，舒适度一般，并不适合成年人长时间乘座。锐界L 7座车型尺寸5000/1961/1773mm，轴距为2950mm，更大的轴距优势体现在内部空间上，无论第二排还是第三排，都能有较为舒适乘坐体验。特别是锐界L至尊型采用了类似商务MPV的2+2+3座椅布局，进入第三排更方便。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/c4a5a141-817e-45af-b989-497f85a4bcc0_20240321161118A004.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（锐界L二排座椅）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在座椅舒适性上，锐界L第二排双悬浮式头等舱座椅采用豪华Dinamica材质并带有腿托，配有三种模式，可一键切换近零重力模式，该模式下腿托和靠背自动调整，实现半躺平状态，带来如云端般舒适惬意感受。而座椅通风、加热和独立温区控制、无线充电、便携杯架等配置，也让其第二排陆地头等舱乘坐体验名副其实。相比之下，探陆提供了Nappa真皮座椅，有着典型的日产“大沙发”之称，虽然二排座椅支持多档调节，但不能一键躺平，并且二排座椅配置不及锐界L丰富。如果用一句话总结两者在座椅舒适性上的差别，日产探陆还在沉迷在让沙发更大更宽时，福特锐界L已经在追求更人性化、更高品质的舒享体验。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/f2ea3475-9767-4a64-a036-1f21a2c4df23_20240321161118A005.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（探陆二排座椅）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>12.3英寸2K VS 27英寸4K，锐界L让出行更便利</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自驾出游途中，从规划路书、长途驾驶到中途休息组织就餐加油，这些繁冗的工作多由驾驶者一人独立完成，身心压力可想而知。如果车辆足够智能，可以大大降低驾驶人的疲劳程度。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/4808dbbb-8519-46f5-8629-85c1f6b2195d_20240321161118A006.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">虽然为新近推出车型，但探陆整车缺乏“智感”，中控屏只有12.3英寸，并且分辨率只有2K，像基础的智能语音交互和手机映射都有配备，不过在智能辅助驾驶上，低配车型不具备L2级智能驾驶辅助系统，要在27.98万元车型上才配备。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/83ee9f0f-8685-4561-9662-ae0ed574deba_20240321161118A007.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">相比之下，锐界L对主副驾和乘车人员智能交互体验考虑的更为全面。智能化座舱采用了12.3英寸+27英寸的超广域高清4K巨幅屏，科技感极强，副驾驶也更容易参与车辆导航和信息功能设置工作，分担主驾工作。搭载的福特SYNC®+2.0 智行互联系统，不仅支持语音控制，还加入了联合驾趣模式，副驾驶乘车人也可以参与到车辆管理和娱乐交互中。智能驾驶辅助方面，锐界L在25万元的车型上就搭载了达到L2级别的福特Co-Polit 360™智行驾驶辅助系统，拥有超20项主动驾驶辅助功能。它还标配了同级独有的V2I车路协同功能，在开通服务的城市，行驶中可以提前获取前方路口的信号灯状态以及突发交通事件，让出行更有预见性。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/81f3fa2d-21ef-4391-86dc-0d0d030fe190_20240321161118A008.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>结语：</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">通过上述分析不难发现，尽管探陆在动力、空间等方面展现出了不错的实力，但这高科技产品层出不穷的今天，多少缺少新意。相比之下，锐界L在大马力E混动加持下，动力更强，油耗还更低，兼顾性能和用车成本，同时空间更宽敞，二排零重力座椅更舒适，智能交互更领先。因此，全家出游如果要在探陆与锐界L之间进行选择，锐界L能够提供一个更加全面的解决方案。</p><p><br/></p>','txt'),

                                                                        (151,1136,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">继秦荣耀版与驱逐舰05全面冲击A级轿车市场后，比亚迪向中高端市场发起进攻！2月28日，比亚迪汉唐荣耀版车型正式上市。其中，汉EV荣耀版共4款车型，售价17.98~24.98万元；汉DM-i荣耀版共5款车型，售价16.98~22.58万元；2024款汉DM-p战神版共1款车型，售价25.98万元；唐DM-i荣耀版共4款车型，售价17.98~21.98万元。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/2a4864dd-d311-42c3-8a14-4c91616104a2_20240321162247A009.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>六边形冠军 ，中高端“王炸”终结油电之战</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">此次汉唐新车型的荣耀推出，带来“美学、舒享、智驾、智舱”四大方面的全面提升，以全系标配超百项核心配置打响中高端汽车市场的价值之战，更是实现了“电比油低”，在品牌、品质、口碑、产品力、销量、保值率六大维度全面领先，以六边形冠军姿态，终结油电之战，让新能源时代彻底到来，汉唐荣耀版将彻底颠覆中高端燃油车市场！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">其中，汉EV荣耀版推出天神之眼智驾型，成为比亚迪首个搭载“天神之眼”DiPilot 100 平台的车型。在L2+级智能驾驶辅助功能基础上，进一步升级涵盖高速和城市快速路的高快领航NOA、远距AVP代客泊车功能。此外汉唐荣耀版搭载的云辇-C也在持续进化，融合天神之眼的视觉传感器，后期将升级预瞄功能，为用户带来更极致的运动舒适兼得的驾乘体验。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">值得关注的是，此次汉唐携手享誉全球的色彩开发与研究权威机构——潘通，推出暮山紫 、邢窑白瓷、藕韵灰三大2024国潮代表车色搭配，打造中国汽车新的文化标杆。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/d860bdd7-2b46-4382-8f96-8e7f7f216ea7_20240321162248A010.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>表面上是价格战，实际上是技术战，全产业链的体系战</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">长期以来，中高端市场是中国汽车市场的“必争之地”。以2024年1月为例，B级轿车＋B级SUV市场份额占比逾３０％。然而，这也是日系、德系合资品牌垄断的重点细分市场，&quot;日系三剑客”、“德系双雄”等昵称由此而生，其原因之一在于新能源渗透率较低。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自2020年比亚迪推出汉EV以来，比亚迪以汉唐国潮之力不断冲击合资独大局面，月均销量合计3万+，累计销量突破100万辆——成为中国自主品牌首个售价20万+，且累计销量达成100万辆产品，也是自主品牌向上的典范。背靠百万汉唐车主，比亚迪汉唐旗舰车系荣耀版车型将彻底改写中高端汽车市场格局，进一步加速中高端市场油电替代，巩固中国品牌的主导优势，树立中国式豪华”汽车新典范。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">紧凑级、中高端市场的相继荣耀出击背后，是比亚迪秉持&quot;技术为王、创新为本&quot;的底气。一方面，比亚迪一直以来坚持贯彻长期主义，专注技术研发，在自主创新的道路上不断前进，构建起动态成长的“护城河”。另一方面，比亚迪手握自研三电核心技术垂直整合，可以通过全产业链和规模优势来获得同行业玩家不具有的定价主动权，这便为比亚迪产品的售价创造了一个独有的优势空间。秦汉唐的王朝荣耀出击，是比亚迪带动的产业链“规模效应”。未来，比亚迪希望推进“电比油低”的汽车行业变革，让新能源科技为更多中国家庭带来舒适便利的出行体验。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/552b706b-fd3a-4ab7-8b99-24d13dd8825f_20240321162248A011.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>文化自信 品牌赋能，乘风破浪，彰显使命与担当</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">作为新能源领导者，比亚迪2023年夺得中国品牌销量冠军、中国市场车企销量冠军，蝉联全球新能源销量冠军。持续加速主流中高端市场油转电进程中，比亚迪品牌也在用高端化为产品赋能，首先喊出“在一起才是中国汽车”的口号；发起国宝守护计划，彰显文化华彩与自信；东京出行展、慕尼黑车展、日内瓦车展中比亚迪大放异彩赢得了海外消费者的关注和青睐；让节能、环保、低碳紧密相连，提出“为地球降温1°”的倡议，彰显了一个新能源汽车领导企业的使命与担当。签约欧洲杯，成为2024欧洲杯官方出行合作伙伴，成为欧洲杯首次携手新能源汽车品牌以及首次“联姻”中国汽车品牌。百万汉唐，冠军品牌，终结油电之战，是中国新能源汽车的使命，也是比亚迪的使命。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p><br/></p>','txt'),

                                                                        (152,1137,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年是中国汽车市场的一个转折点，新能源汽车的销量和市场份额实现了历史性的突破，超过了传统燃油车，成为了汽车市场的主流。与此同时，中国车企现如今已经势不可挡，在新能源汽车领域展现了强大的竞争力和创新能力，不仅在国内市场占据了主导地位，还在国际市场上取得了不俗的成绩。2024年，中国车市将继续保持增长的势头，新能源汽车将进一步提升产品质量和技术水平，中国车企将继续加强品牌建设和国际化战略，合资品牌将面临更大的挑战和压力，需要加快转型和创新。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/18d56e4f-de06-407e-9f5c-84d02c69f067_20240321162401A012.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源势不可挡</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年，中国汽车市场实现了一个重大的变革，新能源汽车的市场份额首次突破30%，标志着中国汽车市场进入了一个新的时代。在国新办19日举行的新闻发布会上，工业和信息化部副部长辛国斌介绍，2023年，汽车产销分别实现了3016.1万辆和3009.4万辆，同比增长11.6%和12%，创历史新高。产量连续15年保持了全球第一水平。其中，新能源汽车产销分别完成了958.7万辆和949.5万辆，同比分别增长35.8%和37.9%，新车销量达到汽车新车总销量的31.6%。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/c2f5ef84-e149-4279-b1e0-df8938a81d0e_20240321162401A013.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">与此同时，新能源车高端化趋势日益明显，不仅有国际知名品牌如特斯拉、宝马、奔驰、奥迪等加大中国市场的投入，也有国内自主品牌如比亚迪、蔚来、小鹏、理想等推出高端产品。这些高端产品，不仅在设计、性能、品质、服务等方面有了较高的水准，也在价格、销量、口碑等方面有了较好的表现。尤其是比亚迪推出的仰望品牌，引起了市场轰动，更是捅破国产高端新能源车的天花板。这些高端产品，可以提升中国新能源汽车市场的品牌形象，也可以吸引更多的高端消费者，扩大新能源汽车的市场空间。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/d1f5afe7-ba5d-4951-a78e-dbbc4ef3819f_20240321162401A014.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源汽车的崛起，不仅改变了中国汽车市场的格局，也推动了中国汽车产业的转型升级和国际化发展。中国新能源汽车的出口也实现了快速增长，据海关总署发布的数据显示，2023年我国汽车出口量522.1万辆，同比增加57.4%。而日本2023年全年出口量约430万辆，我国在2023年正式超越日本成为全球汽车出口第一。值得一提的是，比亚迪出口量为242759辆，实现了336.2%的同比增长，是2023年品牌出口销量排行榜前十名中增长最大的车企。海关总署表示，近年来，随着我国现代化产业体系建设不断推进。我国汽车产业坚持不懈开展科技创新，构建完整产业链供应链，汽车产销量屡创新高，相应出口规模也在逐步扩大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国品牌扬眉吐气</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">乘联会2023年乘用车零售销量排名里 ，前十家有五家是中国汽车品牌，分别是比亚迪、吉利、长安、奇瑞等；中国汽车品牌年度份额达到了52%。尤其比亚迪和奇瑞、吉利销量增速更为明显。比亚迪新能源汽车销量达到302万，同比增长61.9%，超越特斯拉成为全球新能源汽车销冠。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/a79179dd-33ec-4dc5-b902-272312800fd9_20240321162401A015.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">与中国品牌的崛起形成鲜明对比的是，合资品牌在中国汽车市场的表现却呈现出了一种倒退的态势。合资品牌曾经是中国汽车市场的领导者，但在新能源汽车时代，合资品牌却逐渐失去了优势，面临着中国自主品牌的强势挑战和冲击。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在2023年乘用车零售销量排名前十里 ，比亚迪、奇瑞、长安、吉利等中国车企品牌份额提升明显。在轿车领域，比亚迪股份、长安汽车、上汽股份和吉利汽车销量同比均呈两位数增长。与之相对，主要合资车企全年销量同比去年下滑占多数，上汽通用、东风日产、广汽本田等都下滑了两位数；不少合资品牌退出中国市场，如广汽三菱、广汽讴歌、东风雷诺；此外还有东风标致雪铁龙、北京现代、都已处在岌岌可危的境地，广汽三菱在中国市场彻底淡出。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/84aa1835-7f02-4d6c-a360-dc145120bef4_20240321162401A016.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源汽车的崛起，也导致了合资燃油车体系的全线崩塌。合资品牌在传统燃油车领域曾经拥有着技术和品牌的优势，但在新能源汽车领域却未能跟上中国市场的步伐，从战略方面来看，合资品牌和中国自主品牌在新能源汽车领域的布局和投入存在着明显的差距。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国汽车工业协会副秘书长陈士华认为，相比合资品牌，中国品牌在电动化和智能化方面的转型速度更快，并且在产业链的完整度、成本控制力等方面也有显著提升。叠加产品性价比高，市场竞争力强，以及出口量大幅提升等综合因素，使中国品牌焕发出更强生命力。他还披露了一组数据，2023年，新能源汽车在中国品牌的销量占比已经达到了49.9%。“也就是说，每卖出2辆自主品牌车型，就有1辆是新能源汽车，这个比例相当高。”同时，陈士华特别强调道，2023年，新能源汽车累计销量为949.5万辆，同比增长37.9%，市场占有率31.6%，而在中国生产的新能汽车总量里，中国品牌的占比高达80.6%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在以往被合资把持的中高端市场，中国品牌也在不断的攻城掠地。中国自主品牌近两年新车明显有走向高端化的趋势，在智能化、电动化方面都走得非常的快、远、稳。不仅在外观、内饰、空间等方面有着出色的表现，还在续航、动力、安全、智能等方面有着领先的技术优势，与合资品牌的高端车型相比毫不逊色，甚至有过之而无不及。这些车型也受到了消费者的青睐，成为了市场的爆款，带动了自主品牌的销量和品牌形象的提升。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">值得一提的是，中国自主品牌不仅在国内市场表现出色，还在国际市场上展现了强劲的竞争力。得益于其在产品质量、技术创新、市场布局等方面的不断进步，以及对当地消费者需求的敏锐把握和满足。中国自主品牌也在海外市场树立了良好的口碑和形象，为中国汽车工业的国际化发展打开了新的空间和机遇。中国自主品牌的出口市场已经覆盖了全球100多个国家和地区，其中不乏欧美等发达市场。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国自主品牌的崛起，也引起了国外优秀车企的重视和合作意愿。在新能源汽车领域，中国自主品牌已经具备了核心技术和产业链的优势，对于那些想要进入或扩大在中国市场的份额的外国车企，与中国自主品牌的合作是一个有效的途径。近年来，已经有多起“反向”合资的案例，如比亚迪与丰田、吉利与戴姆勒、长城与宝马等，这些合作不仅有利于双方的资源共享和市场拓展，也有利于中国自主品牌的技术提升和品牌升级。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国车企引领变革</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国自主汽车品牌的崛起，得益于多方面因素的推动。从产品方面来看，近两年，新能源汽车的新品不断在快速滚动推出，涵盖了各个细分市场和消费需求。从技术方面来看，各车企在新能源汽车领域在设计、研发、智能化等方面投入比重越来越大，推动了新能源汽车的技术创新和进步。从全球方面来看，随着全球各大车企纷纷宣布在2035年前后停产燃油车，新能源车成为了全球汽车市场的主角，为中国新能源汽车的发展提供了更大的空间和机遇。在这其中，很好的抓住机遇，踩稳节奏的车企就能较快的脱颖而出。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在2023年，中国新能源汽车市场的快速发展中，比亚迪无疑是最耀眼的明星，不仅在国内市场占据了绝对的优势，也在国际市场展现了强大的竞争力。2023年，比亚迪新能源汽车销量达到了302万辆，同比增长了61.9%，超越了特斯拉，成为了全球新能源汽车销冠。比亚迪的成功，得益于其在新能源汽车领域的长期布局、持续创新、多元发展、国际化战略等方面的优势。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/a92c0779-3301-4fea-b55d-a47f2627e6ac_20240321162402A017.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">比亚迪是最早开始且唯一完成新能源汽车转型的汽车制造商，从2003年开始进入新能源汽车领域，到2023年实现了全面的新能源汽车转型，不再生产燃油汽车。这一转型，使得比亚迪在新能源汽车领域有了深厚的积累，也使得比亚迪在新能源汽车市场有了强大的竞争力。技术实力上，比亚迪在新能源汽车领域的创新能力非常强，不仅在电池、电机、电控等核心技术方面有了突出的成就，也在车型设计、智能化系统、用户服务等方面有了创新的表现。比亚迪的创新能力，也使得其在新能源汽车市场有了高品质的产品形象，赢得了消费者的信赖和喜爱。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">比亚迪不仅在国内市场有了强劲的增长，也在国际市场有了显著的进步。自2021年5月比亚迪正式宣布“乘用车出海”计划，经过2年多的发展，目前比亚迪新能源乘用车已进入德国、日本、法国、巴西、澳大利亚、阿联酋等海外59个国家及地区，超400个城市，并在多个市场取得佳绩。比亚迪的国际化战略，使得其在全球新能源汽车市场有了重要的影响力，也为中国汽车品牌的国际化发展树立了典范。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2024继续高歌猛进</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">对于越来越卷的汽车市场，中国汽车行业协会研究结果比较乐观，认为2024年我国汽车产业产销能够实现稳定增长，新能源汽车也将继续保持良好发展态势。2024年总量规模预计可以达到3100万辆，同比小幅增长3%左右。新能源汽车产销也将达到1150万辆左右的规模，增长约在20%左右。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">有机构预计，2024年，电动汽车在全球汽车销量中所占的比例将从2023年的17%左右上升到20%左右，而中国的电动汽车销量几乎占全球电动汽车销量的60%。此外，有分析认为，在未来几年内，电动汽车销量的头把交椅将由两家公司争夺——特斯拉和比亚迪。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/698bc969-61ba-4eeb-87b9-b07101d20ba6_20240321162402A018.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">合资车也必将加大新能源转型的力度，1月24日，欧盟委员会宣布，根据欧盟合并条例，已批准梅赛德斯-奔驰（中国）与华晨宝马成立合资企业。该交易主要涉及中国电池动力汽车公共充电基础设施网络市场。1 月 25 日，大众汽车集团（中国）董事长兼首席执行官贝瑞德在媒体沟通会上表示，奥迪一汽新能源公司将在年底正式投产首款车型奥迪 Q6 L e-tron。大众品牌与小鹏汽车共同开发的、专属于中国市场的中型车将于 2026 年亮相。到 2027 年，集团将提供 30 款本土生产的燃油车及插电式混合动力车型。到 2030 年，大众汽车集团将在中国市场提供至少 30 款纯电动车型。。可以看出，合资车企将更多的发挥既有的优势，除了守护好原有的地盘，在新能源赛道上进行“狂飙”，因此，中国品牌与合资品牌的较量将更加激烈。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/560a8382-0bbc-4273-ba14-4c14438ee9b4_20240321162402A019.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">综合而言，2023年是中国自主品牌的扬眉吐气之年，也是中国汽车工业的跨越式发展之年。在新能源汽车的引领下，中国自主品牌实现了全面超越，不仅在国内市场占据了主导地位，还在国际市场上取得了不俗的成绩。中国自主品牌在新能源汽车领域展现了强大的竞争力和创新能力，为中国汽车工业的转型升级和国际化发展奠定了坚实的基础。2024年，中国车市将继续保持增长的势头，新能源汽车将进一步提升产品质量和技术水平，自主品牌将继续加强品牌建设和国际化战略，合资品牌将面临更大的挑战和压力，需要加快转型和创新。中国汽车市场将迎来一个新的时代，一个属于新能源汽车和中国自主品牌的时代。</p><p><br/></p>','txt'),

                                                                        (153,1140,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">悦达起亚作为一家汽车合资厂家，始终秉承不断前进、大胆革新的成长心态，在充满变化与挑战的环境中，不断努力成为连接城市与城市、人与人之间的纽带，陪伴着人们的出行和生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/54486634-656a-476f-8d9f-d04d0c20379e_20240321162757A020.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年2月，起亚发布最新K3，与旧K3相比，新款在外观、内饰和性能方面都进行了调整。此次起亚新K3推出六款车型，分别是1.5L IVT舒适版、豪华版、尊贵版和1.4T豪华版、尊贵版和尊贵奢享版，售价从112900元到143900元不等；此次新K3的外观颜色多达7种，内饰颜色也有3种选择。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/9e86cbfe-90c3-4b1e-bede-02a6ce1a29bb_20240321162757A021.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">以星耀黄1.4T尊贵奢享版为例，尺寸是4666mm*1780mm*1450mm，轴距为2700mm，1.4T采用的是7DCT技术，也就是双离合的驾驶模式，最大马力140ps，最大扭矩211N.m，WLTC综合工况油耗5.8L。依然采用家族标志性的虎啸式设计，贯穿式蜂窝状的前中网，造型更加扁平，与两侧LED前大灯属于一体化设计，让前脸看上去更加年轻、时尚。前脸下格栅呈梯形设计，拉宽了前脸的视觉效果，让整个车头的重心显得更低。车尾是贯穿式LED组合尾灯，搭配底部较夸张的扩散器和1.4T专属的运动尾翼，再次强调了整车的运动氛围。1.4T尊贵奢享版采用了高亮黑环绕窗线、高亮黑外后视镜，让整车的线条看上去更加流畅。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/74c57674-5f3e-460a-a8eb-6e5d2bf47e47_20240321162757A022.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">内饰方面以经典全黑为例，搭载10.25英寸智能显示屏、10.25英寸炫彩仪表盘、LCD可视换挡杆。座椅和方向盘都是真皮设计，前排座椅有加热和通风功能，方向盘也配备加热功能。后排座椅为6：4分离式座椅，中间有一个不太高的地台，不影响乘坐的舒适感。智能显示屏搭载的是Kia Connect智能互联系统，可导航、远程空调控制、ETCS支付、IOT车家互联、外卖点餐等。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">安全性能方面，起亚新K3配备前排双安全气囊、侧气囊，胎压监测系统、前后驻车雷达等安全措施。另外还搭载了智能行车辅助系统，从驾驶辅助到驻车辅助都给人提供了很好的安全感，让安全无处不在。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">起亚新K3的1.4T尊贵奢享版，让你用入门级轿车的价格，享受20万级轿车的奢华与智能。</p><p><br/></p>','txt'),

                                                                        (154,1141,'<p style=\"box-sizing: border-box; margin-top: 40px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">12 月 27 日，一加宣布将于 1 月 4 日发布新品一加 Ace 3。一加 Ace 系列秉持「产品力优先」理念，从一加 Ace 2、一加 Ace 2V 到一加 Ace 2 Pro，款款都是现象级爆品，得到了广大用户的认可与支持。作为一加 2024 开年之作，一加 Ace 3 更将以全能姿态，让旗舰体验全面普及，打造性能手机新标杆。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/aeea61d2-ddb2-43e1-a9a5-a566a6a2a11b_20240321163213A023.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加中国区总裁李杰表示：“一加 Ace 3 将「旗舰体验普及」带到前所未有的高度。一加坚信「旗舰可以分价位段，旗舰体验不分价位段」，一加 Ace 3 拥有同档巅峰的硬件配置、前所未见的旗舰体验、超越预期的质感设计，是一款满足你「既要、又要、还要」的全能性能手机。”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/8a549066-1d4f-4bce-a597-3d81a1c36f1e_20240321163213A024.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">质感，是一加的品牌基因。一加 Ace 3 采用全新玻璃工艺和旗舰级金属中框，锻造出性能手机质感新巅峰，并从天空、大地、海洋等自然万物中汲取配色灵感，带来三款极具创意的配色：鸣沙金、星辰黑和月海蓝。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">鸣沙金配色，呈现出剔透的玻璃质感与金属色泽，将光影艺术演绎到极致，力量与优雅兼具；星辰黑配色，不同角度可呈现不同效果，静若黑夜，灿若星辰；月海蓝配色，犹如月夜海洋一般，平静中蕴藏着波涛。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/453bb72a-ba3b-4175-b930-3b91e8c7a67f_20240321163213A025.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/bac5f0c3-53d7-4228-9011-be22767029bb_20240321163214A026.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加 Ace 3 还将全球首发 1.5K 东方屏，全面继承一加 12 旗舰屏幕体验，把显示、护眼、流畅同时做到巅峰；支持超薄指纹解锁，相比同档普遍使用的短焦指纹，拥有更合理的解锁位置和更快速的解锁体验；搭载同档罕见的大容量电池，拥有超长续航表现……</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加 Ace 3 持续秉持「产品力优先」理念，无论是硬件配置还是软件优化都完全从用户需求出发，以性能绝杀姿态颠覆传统定义，带来旗舰体验的全面普及，打造 2024 性能手机新标杆。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\"><br data-filtered=\"filtered\" style=\"box-sizing: border-box; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);\"/></p><p><br/></p>','txt'),

                                                                        (155,1142,'','txt'),

                                                                        (156,1143,'','txt'),

                                                                        (157,1144,'','txt'),

                                                                        (158,1145,'','txt');

/*Table structure for table `cms_content_type` */

DROP TABLE IF EXISTS `cms_content_type`;

CREATE TABLE `cms_content_type` (
                                    `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                    `name` varchar(30) NOT NULL COMMENT '内容类型名称',
                                    `ico` varchar(100) DEFAULT NULL COMMENT '类型图标',
                                    `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(30) DEFAULT NULL COMMENT '修改人',
                                    `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='内容类型表';

/*Data for the table `cms_content_type` */

insert  into `cms_content_type`(`id`,`name`,`ico`,`create_by`,`create_time`,`update_by`,`update_time`) values

                                                                                                           (1001,'首页置顶','/profile/upload/2023/09/06/置顶_20230906113435A001.png',NULL,'2023-09-05 17:19:15',NULL,'2023-09-06 11:34:36'),

                                                                                                           (1002,'热门新闻','/profile/upload/2023/09/06/社区活动_20230906114508A002.png',NULL,'2023-09-06 10:54:10',NULL,'2023-09-06 11:45:09'),

                                                                                                           (1003,'首推','/profile/upload/2023/09/06/good_20230906114807A003.png',NULL,'2023-09-06 10:54:20',NULL,'2023-09-06 11:48:08'),

                                                                                                           (1004,'轮播图',NULL,NULL,'2023-09-06 15:47:34',NULL,NULL);

/*Table structure for table `cms_files` */

DROP TABLE IF EXISTS `cms_files`;

CREATE TABLE `cms_files` (
                             `id` int NOT NULL COMMENT '主键',
                             `user_id` int NOT NULL COMMENT '用户id',
                             `share_status` char(2) NOT NULL DEFAULT '1' COMMENT '共享状态（0已分享 1未分享）',
                             `resource_size` int NOT NULL COMMENT '文件大小',
                             `resource_type` char(2) DEFAULT NULL COMMENT '文件类型',
                             `resource_url` varchar(100) DEFAULT NULL COMMENT '文件路径',
                             `resource_dimensions` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片尺寸',
                             `resource_date` int DEFAULT NULL COMMENT '视频时长（单位/秒）',
                             `resource_alias` varchar(20) DEFAULT NULL COMMENT '文件别名',
                             `upload_oss_id` int DEFAULT NULL COMMENT '上传云存储ID',
                             `suffix` varchar(10) DEFAULT NULL COMMENT '后缀名',
                             `video_cover_id` int DEFAULT NULL COMMENT '视频抽帧id',
                             `is_display` char(2) DEFAULT '1' COMMENT '是否显示在资源库',
                             `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `is_delete` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '是否删除（0未删除 1已删除）',
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传表';

/*Data for the table `cms_files` */

/*Table structure for table `cms_link_sort` */

DROP TABLE IF EXISTS `cms_link_sort`;

CREATE TABLE `cms_link_sort` (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '友情链接分类id',
                                 `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
                                 `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类类型(1文字 2图片)',
                                 `site_id` int DEFAULT NULL COMMENT '站点id',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接分类';

/*Data for the table `cms_link_sort` */

insert  into `cms_link_sort`(`id`,`name`,`type`,`site_id`,`create_time`) values

                                                                             (4,'底部链接','0',1016,'2023-08-16 18:37:54'),

                                                                             (5,'图片链接','1',1016,'2023-09-06 11:56:31');

/*Table structure for table `cms_links` */

DROP TABLE IF EXISTS `cms_links`;

CREATE TABLE `cms_links` (
                             `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `link_name` varchar(100) DEFAULT NULL COMMENT '友情链接名称',
                             `link_src` varchar(100) DEFAULT NULL COMMENT '友情链接图片',
                             `link_url` varchar(150) DEFAULT NULL COMMENT '友情链接地址',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `site_id` int DEFAULT NULL COMMENT '站点id',
                             `link_sort_id` int DEFAULT NULL COMMENT '分类id',
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接';

/*Data for the table `cms_links` */

insert  into `cms_links`(`id`,`link_name`,`link_src`,`link_url`,`create_time`,`site_id`,`link_sort_id`) values

                                                                                                            (20,'阿里巴巴',NULL,'https://www.alibabagroup.com/','2023-08-16 18:38:27',NULL,4),

                                                                                                            (21,'腾讯',NULL,'http://www.qq.com','2023-08-16 18:38:44',NULL,4),

                                                                                                            (22,'京东',NULL,'http://www.jd.com','2023-08-16 18:39:03',NULL,4),

                                                                                                            (23,'百度',NULL,'http://www.baidu.com','2023-08-16 18:39:18',NULL,4),

                                                                                                            (24,'字节跳动',NULL,'https://www.bytedance.com/','2023-08-16 18:40:15',NULL,4),

                                                                                                            (25,'河南正易云','/profile/upload/2023/09/06/Frame 12_20230906115642A004.png','www.hnzyy.ltd','2023-09-06 11:56:58',NULL,5);

/*Table structure for table `cms_model` */

DROP TABLE IF EXISTS `cms_model`;

CREATE TABLE `cms_model` (
                             `model_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                             `model_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模型名称',
                             `model_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '自定义模型代码(前台)',
                             `model_code_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '自定义系统模型',
                             `model_type` varchar(30) DEFAULT NULL COMMENT '模型类型',
                             `site_id` int NOT NULL COMMENT '站点id',
                             `is_public` char(2) DEFAULT '1' COMMENT '是否全站模型',
                             `temp_default` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'pc模板',
                             `temp_mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机模板',
                             `stage` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
                             `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模型表';

/*Data for the table `cms_model` */

insert  into `cms_model`(`model_id`,`model_name`,`model_code`,`model_code_admin`,`model_type`,`site_id`,`is_public`,`temp_default`,`temp_mobile`,`stage`,`create_by`,`create_time`) values

                                                                                                                                                                                        (14,'演示站新闻','{\"list\":[{\"type\":\"input\",\"label\":\"输入框\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1692177606413\",\"key\":\"input_1692177606413\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'0','news.html','','0',NULL,'2023-08-16 17:16:10'),

                                                                                                                                                                                        (15,'演示站新闻','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadImg\",\"label\":\"图片\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"width\":\"100%\",\"data\":\"{}\",\"limit\":1,\"placeholder\":\"上传\",\"fileName\":\"image\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/upload-img.txt\",\"listType\":\"picture-card\"},\"model\":\"uploadImg_1692177427879\",\"key\":\"uploadImg_1692177427879\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692236450186\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'1','news-content.html','news-content.html','0',NULL,'2023-08-16 17:16:51'),

                                                                                                                                                                                        (16,'演示站视频','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'1','video.html',NULL,'0',NULL,'2023-08-16 17:33:49'),

                                                                                                                                                                                        (18,'下载中心','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'1','download.html',NULL,'0',NULL,'2023-08-17 16:48:54'),

                                                                                                                                                                                        (19,'视频栏目模型','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadImg\",\"label\":\"封面图\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"width\":\"100%\",\"data\":\"{}\",\"limit\":1,\"placeholder\":\"上传\",\"fileName\":\"image\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/upload-img.txt\",\"listType\":\"picture-card\"},\"model\":\"fengmiantu\",\"key\":\"uploadImg_1692510722330\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[{\"type\":\"switch\",\"label\":\"VIP课程\",\"options\":{\"defaultValue\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"switch\",\"key\":\"switch_1692518719134\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692518723899\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1017,'1','player.html',NULL,'0',NULL,'2023-08-20 13:48:52'),

                                                                                                                                                                                        (20,'视频内容模型','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传文件\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":true,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/uploadFile.txt\",\"placeholder\":\"上传\"},\"model\":\"video\",\"key\":\"uploadFile_1692510656415\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692511399903\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1017,'1','player.html',NULL,'0',NULL,'2023-08-20 13:50:24'),

                                                                                                                                                                                        (21,'导航栏栏目','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1017,'1','channel-video.html',NULL,'0',NULL,'2023-08-20 16:30:52'),

                                                                                                                                                                                        (22,'图片模型',NULL,NULL,'content',1016,'1','single-blog.html',NULL,'0',NULL,'2023-09-05 16:57:55'),

                                                                                                                                                                                        (23,'配件','{\"list\":[{\"type\":\"switch\",\"label\":\"是否有图\",\"options\":{\"defaultValue\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"switch_1697351862779\",\"key\":\"switch_1697351862779\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1019,'1',NULL,NULL,'0',NULL,'2023-10-14 23:32:50'),

                                                                                                                                                                                        (24,'配件信息','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"input\",\"label\":\"价格\",\"options\":{\"type\":\"number\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1697297602675\",\"key\":\"input_1697297602675\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]},{\"type\":\"textarea\",\"label\":\"图片链接\",\"icon\":\"icon-edit\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"textarea_1697352178357\",\"key\":\"textarea_1697352178357\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[{\"type\":\"textarea\",\"label\":\"商品链接\",\"icon\":\"icon-edit\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"textarea_1697352088708\",\"key\":\"textarea_1697352088708\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1697297608341\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1019,'1',NULL,NULL,'0',NULL,'2023-10-14 23:33:16'),

                                                                                                                                                                                        (25,'测试','{\"list\":[{\"type\":\"input\",\"label\":\"输入框\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1701848262175\",\"key\":\"input_1701848262175\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1018,'1',NULL,NULL,'0',NULL,'2023-12-06 15:37:40'),

                                                                                                                                                                                        (26,'演示站图片','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'0','news.html',NULL,'0',NULL,'2024-03-21 16:07:12'),

                                                                                                                                                                                        (27,'演示站视频','{\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传视频\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":false,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"\",\"placeholder\":\"上传\"},\"model\":\"video\",\"key\":\"uploadFile_1711014936883\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'0','video-content.html',NULL,'0',NULL,'2024-03-21 17:55:08'),

                                                                                                                                                                                        (28,'文件下载','{\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传文件\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":false,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"\",\"placeholder\":\"上传\"},\"model\":\"download\",\"key\":\"uploadFile_1711333287170\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'1',NULL,NULL,'0',NULL,'2024-03-25 10:18:26');

/*Table structure for table `cms_model_item` */

DROP TABLE IF EXISTS `cms_model_item`;

CREATE TABLE `cms_model_item` (
                                  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                  `label_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名字',
                                  `attr_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件类型',
                                  `model_id` int NOT NULL COMMENT '模型id',
                                  `place_holder` varchar(100) DEFAULT NULL COMMENT '提示',
                                  `field` varchar(100) DEFAULT NULL COMMENT '字段名称',
                                  `sort_num` int DEFAULT NULL COMMENT '排序字段',
                                  `content` text COMMENT '属性详情',
                                  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
                                  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                  `update_by` varchar(30) DEFAULT NULL COMMENT '修改人',
                                  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模型字段表';

/*Data for the table `cms_model_item` */

/*Table structure for table `cms_sensitive` */

DROP TABLE IF EXISTS `cms_sensitive`;

CREATE TABLE `cms_sensitive` (
                                 `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                 `sensitive_word` varchar(30) DEFAULT NULL COMMENT '敏感词',
                                 `replace_word` varchar(30) DEFAULT NULL COMMENT '替换词',
                                 `create_by` varchar(10) DEFAULT NULL COMMENT '创建人',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(10) DEFAULT NULL COMMENT '修改人',
                                 `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                                 `state` char(2) DEFAULT NULL COMMENT '0启用 1取消',
                                 PRIMARY KEY (`id`),
                                 FULLTEXT KEY `contentSensitive` (`sensitive_word`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='敏感词';

/*Data for the table `cms_sensitive` */

insert  into `cms_sensitive`(`id`,`sensitive_word`,`replace_word`,`create_by`,`create_time`,`update_by`,`update_time`,`state`) values

                                                                                                                                   (1001,'国家级','***',NULL,'2023-07-06 14:13:22',NULL,'2023-07-06 14:17:48','Y'),

                                                                                                                                   (1002,'宇宙级','***',NULL,'2023-07-06 14:22:28',NULL,NULL,'Y'),

                                                                                                                                   (1003,'畜生','***',NULL,'2023-07-06 14:23:01',NULL,NULL,'Y');

/*Table structure for table `cms_sensitive_log` */

DROP TABLE IF EXISTS `cms_sensitive_log`;

CREATE TABLE `cms_sensitive_log` (
                                     `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                                     `sensitive_word` varchar(50) DEFAULT NULL COMMENT '敏感词',
                                     `content_id` int DEFAULT NULL COMMENT '内容表id',
                                     `sensitive_id` int DEFAULT NULL COMMENT '敏感词id',
                                     `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
                                     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                     PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_sensitive_log` */

insert  into `cms_sensitive_log`(`id`,`sensitive_word`,`content_id`,`sensitive_id`,`create_by`,`create_time`) values

                                                                                                                  (5,'宇宙级',75,NULL,NULL,'2023-07-06 17:09:25'),

                                                                                                                  (6,'煞笔',75,NULL,NULL,'2023-07-06 17:09:25');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
                            `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
                            `parent_id` int DEFAULT NULL COMMENT '父级站点',
                            `name` varchar(100) NOT NULL COMMENT '站点名称',
                            `directory` varchar(50) DEFAULT NULL COMMENT '站点目录',
                            `domain_name` varchar(100) DEFAULT NULL COMMENT '域名',
                            `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
                            `update_time` datetime DEFAULT NULL COMMENT '修改时间',
                            `request_method` varchar(6) DEFAULT NULL COMMENT '请求协议',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`parent_id`,`name`,`directory`,`domain_name`,`create_by`,`create_time`,`update_by`,`update_time`,`request_method`) values

    (1016,0,'正易云CMS演示站','www','192.168.10.124:8083',NULL,'2023-08-16 17:07:05',NULL,'2024-03-25 15:59:20','http');

/*Table structure for table `cms_site_setup` */

DROP TABLE IF EXISTS `cms_site_setup`;

CREATE TABLE `cms_site_setup` (
                                  `site_id` int NOT NULL COMMENT '站点id',
                                  `site_static` char(2) DEFAULT '1' COMMENT '站点静态化',
                                  `site_favicon` varchar(100) DEFAULT NULL COMMENT '站点ico',
                                  `site_logo` varchar(100) DEFAULT NULL COMMENT '站点logo',
                                  `site_grayscale` char(2) DEFAULT '1' COMMENT '网站灰度',
                                  `site_adaption` char(2) DEFAULT '1' COMMENT '屏幕自适应',
                                  `site_stop` char(2) DEFAULT '0' COMMENT '站点状态',
                                  `site_home_path` varchar(100) DEFAULT NULL COMMENT '首页模板路径',
                                  `site_seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'seo标题',
                                  `site_seo_desc` varchar(300) DEFAULT NULL COMMENT 'seo描述',
                                  `site_seo_keywords` varchar(100) DEFAULT NULL COMMENT 'seo关键字',
                                  `site_temp_scheme_pc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'PC端模板方案',
                                  `site_temp_scheme_mobile` varchar(50) DEFAULT NULL COMMENT '移动端模板方案',
                                  `site_temp_style` varchar(50) DEFAULT NULL COMMENT '站点风格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='站点设置';

/*Data for the table `cms_site_setup` */

insert  into `cms_site_setup`(`site_id`,`site_static`,`site_favicon`,`site_logo`,`site_grayscale`,`site_adaption`,`site_stop`,`site_home_path`,`site_seo_title`,`site_seo_desc`,`site_seo_keywords`,`site_temp_scheme_pc`,`site_temp_scheme_mobile`,`site_temp_style`) values

    (1016,'1','/profile/upload/2023/09/20/favicon (5)_20230920173100A001.ico','/profile/upload/2024/03/25/zyycms_logo_20240325155918A005.png','1','1','0','index.html',NULL,NULL,NULL,'default','default','');

/*Table structure for table `cms_template` */

DROP TABLE IF EXISTS `cms_template`;

CREATE TABLE `cms_template` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `temp_name` varchar(20) DEFAULT NULL COMMENT '模板名称',
                                `temp_text` text COMMENT '模板内容',
                                `create_date` datetime DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模板表';

/*Data for the table `cms_template` */

/*Table structure for table `cms_visitor_log` */

DROP TABLE IF EXISTS `cms_visitor_log`;

CREATE TABLE `cms_visitor_log` (
                                   `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
                                   `ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
                                   `os` varchar(30) DEFAULT NULL COMMENT '操作系统',
                                   `cookie` varchar(60) DEFAULT NULL COMMENT 'cookie',
                                   `page_path` varchar(200) DEFAULT NULL COMMENT '页面路径',
                                   `site_id` int NOT NULL COMMENT '站点id',
                                   `create_time` datetime DEFAULT NULL COMMENT '访问时间',
                                   `region` varchar(10) DEFAULT NULL COMMENT '省份',
                                   `city` varchar(10) DEFAULT NULL COMMENT '城市',
                                   `channel_id` int DEFAULT NULL COMMENT '栏目id',
                                   `content_id` int DEFAULT NULL COMMENT '内容id',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_visitor_log` */

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
                             `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

                                                                                                                                                                                                                                                                                                                   (1,'cms_attr','自定义属性表',NULL,NULL,'CmsAttr','crud','com.ruoyi.web','web','attr','自定义属性','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-06-20 16:55:58','','2023-06-20 17:09:07',NULL),

                                                                                                                                                                                                                                                                                                                   (2,'cms_channel','栏目表',NULL,NULL,'CmsChannel','crud','com.ruoyi.web','web','channel','栏目','hnzyy sun','0','/','{\"parentMenuId\":2002}','admin','2023-06-20 16:55:58','','2023-06-20 17:07:35',NULL),

                                                                                                                                                                                                                                                                                                                   (3,'cms_content','文章表',NULL,NULL,'CmsContent','crud','com.ruoyi.web','web','content','文章管理','ruoyi','0','/','{\"parentMenuId\":2001}','admin','2023-06-20 16:55:58','','2023-06-20 17:08:30',NULL),

                                                                                                                                                                                                                                                                                                                   (4,'cms_link_sort','友情链接分类',NULL,NULL,'CmsLinkSort','crud','com.ruoyi.web','web','sort','友情链接分类','hnzyy sun','0','/','{\"parentMenuId\":2004}','admin','2023-06-20 16:55:58','','2023-06-20 17:06:40',NULL),

                                                                                                                                                                                                                                                                                                                   (5,'cms_links','友情链接',NULL,NULL,'CmsLinks','crud','com.ruoyi.web','web','links','友情链接','hnzyy sun','0','/','{\"parentMenuId\":2004}','admin','2023-06-20 16:55:58','','2023-06-20 17:05:45',NULL),

                                                                                                                                                                                                                                                                                                                   (6,'cms_model','模型表',NULL,NULL,'CmsModel','crud','com.ruoyi.web','web','model','模型','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-06-20 16:55:58','','2023-06-20 17:05:14',NULL),

                                                                                                                                                                                                                                                                                                                   (7,'cms_template','模板表',NULL,NULL,'CmsTemplate','crud','com.ruoyi.web','web','template','模板','hnzyy sun','0','/','{\"parentMenuId\":2000}','admin','2023-06-20 16:55:58','','2023-06-20 17:04:21',NULL),

                                                                                                                                                                                                                                                                                                                   (8,'cms_model_item','模型字段表',NULL,NULL,'CmsModelItem','crud','com.ruoyi.web','model','modelItem','自定义模型字段','hnzyy sun','0','/','{}','admin','2023-06-26 10:51:47','','2023-06-26 10:54:18',NULL),

                                                                                                                                                                                                                                                                                                                   (9,'cms_site','站点表',NULL,NULL,'CmsSite','crud','com.ruoyi.web','web','site','站点','hnzyy sun','0','/','{\"parentMenuId\":2053}','admin','2023-07-03 17:22:57','','2023-07-03 17:27:07',NULL),

                                                                                                                                                                                                                                                                                                                   (10,'cms_sensitive','敏感词',NULL,NULL,'CmsSensitive','crud','com.ruoyi.web','web','sensitive','敏感词','hnzyy sun','0','/','{\"parentMenuId\":2060}','admin','2023-07-06 11:45:57','','2023-07-06 11:48:53',NULL),

                                                                                                                                                                                                                                                                                                                   (11,'sys_role_channel','角色栏目权限',NULL,NULL,'SysRoleChannel','crud','com.ruoyi.system','system','channel','角色栏目权限','ruoyi','0','/',NULL,'admin','2023-07-10 16:52:11','',NULL,NULL),

                                                                                                                                                                                                                                                                                                                   (12,'sys_role_site','角色站点权限',NULL,NULL,'SysRoleSite','crud','com.ruoyi.system','system','site','角色站点权限','ruoyi','0','/',NULL,'admin','2023-07-10 16:52:11','',NULL,NULL),

                                                                                                                                                                                                                                                                                                                   (13,'cms_content_txt','文章内容',NULL,NULL,'CmsContentTxt','crud','com.ruoyi.web','system','txt','文章内容','hnzyy sun','0','/','{}','admin','2023-07-20 16:31:10','','2023-07-20 16:33:33',NULL),

                                                                                                                                                                                                                                                                                                                   (14,'cms_site_setup','站点设置',NULL,NULL,'CmsSiteSetup','crud','com.ruoyi.web','web','siteSetup','站点设置','hnzyy sun','0','/','{}','admin','2023-08-03 15:27:00','','2023-08-03 15:28:24',NULL),

                                                                                                                                                                                                                                                                                                                   (15,'sys_role_cms','cms角色权限',NULL,NULL,'SysRoleCms','crud','com.ruoyi.web','system','cms','cms角色权限','hnzyy sun','0','/','{}','admin','2023-08-04 14:42:45','','2023-08-04 14:45:05',NULL),

                                                                                                                                                                                                                                                                                                                   (16,'cms_visitor_log','访客记录',NULL,NULL,'CmsVisitorLog','crud','com.zyy.web','web','log','visitorLog','hnzyy sun','0','/','{}','admin','2023-08-18 14:54:59','','2023-08-18 14:56:26',NULL),

                                                                                                                                                                                                                                                                                                                   (17,'cms_content_type','内容类型表',NULL,NULL,'CmsContentType','crud','com.zyy.web','web','contentType','内容类型','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-09-05 17:07:32','','2023-09-05 17:08:53',NULL),

                                                                                                                                                                                                                                                                                                                   (18,'cms_donate','捐赠记录表',NULL,NULL,'CmsDonate','crud','com.zyy.web','web','donate','捐赠记录','hnzyy sun','0','/','{\"parentMenuId\":2084}','admin','2023-11-06 11:21:24','','2023-11-06 11:23:26',NULL),

                                                                                                                                                                                                                                                                                                                   (19,'cms_config','系统配置表',NULL,NULL,'CmsConfig','crud','com.zyy.web','web','config','系统配置','hnzyy','0','/','{\"parentMenuId\":2088}','admin','2023-11-10 16:10:39','','2023-11-10 16:12:18',NULL),

                                                                                                                                                                                                                                                                                                                   (20,'cms_message','消息内容表',NULL,NULL,'CmsMessage','crud','com.zyy.web','web','message','消息内容','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:01:35',NULL),

                                                                                                                                                                                                                                                                                                                   (21,'cms_message_template','消息通知模板',NULL,NULL,'CmsMessageTemplate','crud','com.zyy.web','web','messageTemplate','消息通知模板','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:03:42',NULL),

                                                                                                                                                                                                                                                                                                                   (22,'cms_message_user','人员消息状态',NULL,NULL,'CmsMessageUser','crud','com.zyy.web','web','messageUser','人员消息状态','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:04:14',NULL),

                                                                                                                                                                                                                                                                                                                   (23,'cms_template_style','网站风格',NULL,NULL,'CmsTemplateStyle','crud','com.zyy.web','web','style','网站风格','hnzyy','0','/','{\"parentMenuId\":2000}','admin','2023-11-21 14:50:37','','2023-11-21 14:52:21',NULL),

                                                                                                                                                                                                                                                                                                                   (24,'sys_security_config','安全配置',NULL,NULL,'SysSecurityConfig','crud','com.zyy.system','system','securitConfig','安全配置','hnzyy','0','/','{\"parentMenuId\":1}','admin','2023-12-13 14:44:40','','2023-12-13 14:46:39',NULL),

                                                                                                                                                                                                                                                                                                                   (25,'cms_files','文件上传表',NULL,NULL,'CmsFiles','crud','com.zyy.web','web','files','资源库','hnzyy','0','/','{\"parentMenuId\":2001}','admin','2023-12-19 11:38:56','','2023-12-19 11:40:42',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
                                    `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
                                    `sort` int DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values

                                                                                                                                                                                                                                                                                                                  (1,'1','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

                                                                                                                                                                                                                                                                                                                  (2,'1','attr_name','属性名称','varchar(100)','String','attrName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

                                                                                                                                                                                                                                                                                                                  (3,'1','attr_value','属性值','varchar(100)','String','attrValue','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

                                                                                                                                                                                                                                                                                                                  (4,'1','content_id','内容id','int','Long','contentId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

                                                                                                                                                                                                                                                                                                                  (5,'2','channel_id','id','int','Long','channelId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (6,'2','parent_id','父级id','int','Long','parentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (7,'2','channel_name','栏目名称','varchar(50)','String','channelName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (8,'2','path','访问链接','varchar(20)','String','path','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (9,'2','external_link','外部链接','varchar(150)','String','externalLink','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (10,'2','order_num','排序','int','Long','orderNum','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (11,'2','temp_id','模板','varchar(100)','String','tempId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (12,'2','stage','状态','int','Long','stage','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (13,'2','create_time','创建时间','date','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

                                                                                                                                                                                                                                                                                                                  (14,'3','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (15,'3','title','文章名字','varchar(200)','String','title','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (16,'3','channel_id','栏目id','int','Long','channelId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (17,'3','model_id','模型id','int','Long','modelId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (18,'3','text','文章内容','text','String','text','0','0',NULL,'1','1','1','1','EQ','editor','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (19,'3','views','浏览量','int','Long','views','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (20,'3','stage','0:已发布 1:下线','int','Long','stage','0','0','1','1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (21,'3','release_time','发布时间','datetime','Date','releaseTime','0','0',NULL,'1','1','1','1','EQ','datetime','',8,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (22,'3','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

                                                                                                                                                                                                                                                                                                                  (23,'4','id','友情链接分类id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

                                                                                                                                                                                                                                                                                                                  (24,'4','name','分类名称','varchar(100)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

                                                                                                                                                                                                                                                                                                                  (25,'4','type','分类类型(1文字 2图片)','int','Long','type','0','0',NULL,'1','1','1','1','EQ','select','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

                                                                                                                                                                                                                                                                                                                  (26,'4','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

                                                                                                                                                                                                                                                                                                                  (27,'5','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (28,'5','link_name','友情链接名称','varchar(100)','String','linkName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (29,'5','link_src','友情链接图片','varchar(100)','String','linkSrc','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (30,'5','link_url','友情链接地址','varchar(150)','String','linkUrl','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (31,'5','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (32,'5','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (33,'5','link_sort_id','分类id','int','Long','linkSortId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

                                                                                                                                                                                                                                                                                                                  (34,'6','model_id','主键','int','Long','modelId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

                                                                                                                                                                                                                                                                                                                  (35,'6','model_name','模型名称','varchar(20)','String','modelName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

                                                                                                                                                                                                                                                                                                                  (36,'6','model_code','自定义模型代码(前台)','text','String','modelCode','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

                                                                                                                                                                                                                                                                                                                  (37,'6','model_code_admin','自定义模型代码(后台)','text','String','modelCodeAdmin','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

                                                                                                                                                                                                                                                                                                                  (38,'6','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

                                                                                                                                                                                                                                                                                                                  (39,'7','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

                                                                                                                                                                                                                                                                                                                  (40,'7','temp_name','模板名称','varchar(20)','String','tempName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

                                                                                                                                                                                                                                                                                                                  (41,'7','temp_text','模板内容','text','String','tempText','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

                                                                                                                                                                                                                                                                                                                  (42,'7','create_date','创建时间','datetime','Date','createDate','0','0',NULL,'1','1','1','1','EQ','datetime','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

                                                                                                                                                                                                                                                                                                                  (43,'8','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (44,'8','label_name','标签名字','varchar(100)','String','labelName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (45,'8','attr_type','组件类型','varchar(100)','String','attrType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (46,'8','model_id','模型id','int','Long','modelId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (47,'8','place_holder','提示','varchar(100)','String','placeHolder','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (48,'8','field','字段名称','varchar(100)','String','field','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (49,'8','sort_num','排序字段','int','Long','sortNum','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (50,'8','content','属性详情','text','String','content','0','0',NULL,'1','1','1','1','EQ','editor','',8,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (51,'8','create_by','创建人','varchar(30)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (52,'8','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (53,'8','update_by','修改人','varchar(30)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',11,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (54,'8','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',12,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

                                                                                                                                                                                                                                                                                                                  (55,'9','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (56,'9','name','站点名称','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (57,'9','directory','站点目录','varchar(50)','String','directory','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (58,'9','domain_name','域名','varchar(100)','String','domainName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (59,'9','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (60,'9','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (61,'9','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (62,'9','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

                                                                                                                                                                                                                                                                                                                  (63,'10','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (64,'10','sensitive_word','敏感词','varchar(30)','String','sensitiveWord','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (65,'10','replace_word','替换词','varchar(30)','String','replaceWord','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (66,'10','create_by','创建人','varchar(10)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',4,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (67,'10','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (68,'10','update_by','修改人','varchar(10)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (69,'10','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (70,'10','state','0启用 1取消','int','Long','state','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',8,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

                                                                                                                                                                                                                                                                                                                  (71,'11','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-07-10 16:52:11','',NULL),

                                                                                                                                                                                                                                                                                                                  (72,'11','channel_id','栏目id','int','Long','channelId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-10 16:52:11','',NULL),

                                                                                                                                                                                                                                                                                                                  (73,'12','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-07-10 16:52:11','',NULL),

                                                                                                                                                                                                                                                                                                                  (74,'12','site_id','站点id','int','Long','siteId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-10 16:52:11','',NULL),

                                                                                                                                                                                                                                                                                                                  (75,'13','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

                                                                                                                                                                                                                                                                                                                  (76,'13','content_id','文章表id','int','Long','contentId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

                                                                                                                                                                                                                                                                                                                  (77,'13','text','内容','longtext','String','text','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

                                                                                                                                                                                                                                                                                                                  (78,'13','attr_key','字段','varchar(20)','String','attrKey','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

                                                                                                                                                                                                                                                                                                                  (79,'14','site_id','站点id','int','Long','siteId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (80,'14','site_static','站点静态化','int','Long','siteStatic','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (81,'14','site_favicon','站点ico','varchar(100)','String','siteFavicon','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (82,'14','site_logo','站点logo','varchar(100)','String','siteLogo','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (83,'14','site_grayscale','网站灰度','int','Long','siteGrayscale','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (84,'14','site_adaption','屏幕自适应','int','Long','siteAdaption','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (85,'14','site_stop','站点状态','int','Long','siteStop','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (86,'14','site_home_path','首页模板路径','varchar(100)','String','siteHomePath','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (87,'14','site_seo_tilte','seo标题','varchar(100)','String','siteSeoTilte','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (88,'14','site_seo_desc','seo描述','varchar(300)','String','siteSeoDesc','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (89,'14','site_seo_keywords','seo关键字','varchar(100)','String','siteSeoKeywords','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

                                                                                                                                                                                                                                                                                                                  (90,'15','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

                                                                                                                                                                                                                                                                                                                  (91,'15','property_id','属性id','int','Long','propertyId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

                                                                                                                                                                                                                                                                                                                  (92,'15','property_type','属性类型','varchar(10)','String','propertyType','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

                                                                                                                                                                                                                                                                                                                  (93,'16','id','id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

                                                                                                                                                                                                                                                                                                                  (94,'16','ip','ip地址','varchar(30)','String','ip','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

                                                                                                                                                                                                                                                                                                                  (95,'16','os','操作系统','varchar(30)','String','os','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

                                                                                                                                                                                                                                                                                                                  (96,'16','create_time','访问时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

                                                                                                                                                                                                                                                                                                                  (97,'17','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (98,'17','name','内容类型名称','varchar(30)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (99,'17','ico','类型图标','varchar(100)','String','ico','0','0',NULL,'1','1','1','1','EQ','imageUpload','',3,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (100,'17','create_by','创建人','varchar(30)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',4,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (101,'17','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (102,'17','update_by','修改人','varchar(30)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (103,'17','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

                                                                                                                                                                                                                                                                                                                  (104,'18','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (105,'18','name','姓名/单位','varchar(30)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (106,'18','money','捐赠金额','double(9,2)','BigDecimal','money','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (107,'18','porject_id','捐赠项目','int','Long','porjectId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (108,'18','phone','手机号','varchar(11)','String','phone','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (109,'18','enrollment_year','入学年份','year','String','enrollmentYear','0','0',NULL,'1','1','1','1','EQ',NULL,'',6,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (110,'18','speciality','专业','varchar(20)','String','speciality','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (111,'18','is_show_name','是否公开姓名','char(1)','String','isShowName','0','0',NULL,'1','1','1','1','LIKE','input','',8,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (112,'18','message','留言','varchar(200)','String','message','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (113,'18','is_pay','是否已经支付','char(1)','String','isPay','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (114,'18','create_time','捐赠创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (115,'18','pay_time','捐赠时间','datetime','Date','payTime','0','0',NULL,'1','1','1','1','EQ','datetime','',12,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (116,'18','certificate','电子证书路径','varchar(200)','String','certificate','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

                                                                                                                                                                                                                                                                                                                  (117,'19','id','id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

                                                                                                                                                                                                                                                                                                                  (118,'19','config_key','键','varchar(50)','String','configKey','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

                                                                                                                                                                                                                                                                                                                  (119,'19','config_value','值','varchar(100)','String','configValue','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

                                                                                                                                                                                                                                                                                                                  (120,'19','category','分类','varchar(50)','String','category','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (121,'19','remark','备注','varchar(100)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (122,'19','sort','排序','int','Long','sort','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (123,'19','delete_flag','是否删除','int','Long','deleteFlag','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (124,'19','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (125,'19','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (126,'19','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (127,'19','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

                                                                                                                                                                                                                                                                                                                  (128,'20','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (129,'20','title','标题','varchar(200)','String','title','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (130,'20','content','内容','varchar(500)','String','content','0','0',NULL,'1','1','1','1','EQ','editor','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (131,'20','recipient_type','接收人类型(1全部消息 2组织消息 3人员消息)','int','Long','recipientType','0','0',NULL,'1','1','1','1','EQ','select','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (132,'20','org_id','部门id','int','Long','orgId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (133,'20','user_id','人员id','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (134,'20','send_name','发送人名称','varchar(20)','String','sendName','0','0',NULL,'1','1','1','1','LIKE','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (135,'20','create_by','创建人','varchar(10)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (136,'20','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (137,'20','update_by','修改人','varchar(10)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (138,'20','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

                                                                                                                                                                                                                                                                                                                  (139,'21','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (140,'21','msg_code','消息模板唯一编码','varchar(30)','String','msgCode','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (141,'21','msg_name','消息模板标题','varchar(50)','String','msgName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (142,'21','msg_desc','消息模板描述','varchar(100)','String','msgDesc','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (143,'21','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (144,'21','mail_open','邮件通知开关','char(2)','String','mailOpen','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (145,'21','mail_title','邮件名称','varchar(50)','String','mailTitle','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (146,'21','mail_text','邮件内容','varchar(255)','String','mailText','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (147,'21','msg_open','站内信开关','char(2)','String','msgOpen','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (148,'21','msg_title','站内信标题','varchar(50)','String','msgTitle','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (149,'21','msg_text','站内信内容','varchar(255)','String','msgText','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (150,'21','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',12,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (151,'21','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',13,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (152,'21','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',14,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (153,'21','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',15,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

                                                                                                                                                                                                                                                                                                                  (154,'22','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (155,'22','msg_id','消息ID','int','Long','msgId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (156,'22','user_id','用户id','int','Long','userId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (157,'22','state','状态(0已读 1删除)','int','Long','state','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (158,'22','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (159,'22','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (160,'22','update_by','修改人','varchar(20)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (161,'22','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

                                                                                                                                                                                                                                                                                                                  (162,'23','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (163,'23','name','主题名称','varchar(50)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (164,'23','temp_suffix','模板后缀名称','varchar(50)','String','tempSuffix','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (165,'23','cover_img','主题封面图','varchar(200)','String','coverImg','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (166,'23','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (167,'23','state','是否启用(0启用 1禁用)','char(2)','String','state','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (168,'23','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',7,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (169,'23','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (170,'23','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',9,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (171,'23','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',10,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

                                                                                                                                                                                                                                                                                                                  (172,'24','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (173,'24','stage','状态','char(2)','String','stage','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (174,'24','password_len_min','密码最小长度','int','Long','passwordLenMin','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (175,'24','password_len_max','密码最大长度','int','Long','passwordLenMax','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (176,'24','password_rule','密码校验规则','varchar(50)','String','passwordRule','0','0','1','1','1','1','1','EQ','input','',5,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (177,'24','password_sensitive','密码不可包含的敏感信息','varchar(255)','String','passwordSensitive','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (178,'24','weak_passwords','弱密码集合','varchar(500)','String','weakPasswords','0','0',NULL,'1','1','1','1','EQ','textarea','',7,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (179,'24','force_modify_pwd_after_add','后台添加的用户首次登陆是否需要强制修改密码','char(2)','String','forceModifyPwdAfterAdd','0','0','1','1','1','1','1','EQ','input','',8,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (180,'24','force_modify_pwd_after_reset','后台重置密码后首次登陆是否需要强制修改密码','char(2)','String','forceModifyPwdAfterReset','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (181,'24','password_expire_seconds','密码有效期（单位：秒）','int','Long','passwordExpireSeconds','0','0','1','1','1','1','1','EQ','input','',10,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (182,'24','password_retry_limit','密码错误次数阈值','int','Long','passwordRetryLimit','0','0','1','1','1','1','1','EQ','input','',11,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (183,'24','password_retry_strategy','密码错误次数阈值触发后的处理策略','varchar(20)','String','passwordRetryStrategy','0','0','1','1','1','1','1','EQ','input','',12,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (184,'24','password_retry_lock_seconds','密码错误阈值触发锁定账号时长，单位：秒','int','Long','passwordRetryLockSeconds','0','0','1','1','1','1','1','EQ','input','',13,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (185,'24','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (186,'24','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',15,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (187,'24','update_by','修改人','varchar(20)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',16,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (188,'24','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',17,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

                                                                                                                                                                                                                                                                                                                  (189,'25','id','主键','int','Long','id','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (190,'25','user_id','用户id','int','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (191,'25','share_status','共享状态（0已分享 1未分享）','char(2)','String','shareStatus','0','0','1','1','1','1','1','EQ','radio','',3,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (192,'25','resource_size','文件大小','int','Long','resourceSize','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (193,'25','resource_type','文件类型','char(2)','String','resourceType','0','0',NULL,'1','1','1','1','EQ','select','',5,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (194,'25','resource_url','文件路径','varchar(100)','String','resourceUrl','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (195,'25','resource_dimensions','图片尺寸','varchar(20)','String','resourceDimensions','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (196,'25','resource_date','视频时长（单位/秒）','int','Long','resourceDate','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (197,'25','resource_alias','文件别名','varchar(20)','String','resourceAlias','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (198,'25','upload_oss_id','上传云存储ID','int','Long','uploadOssId','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (199,'25','suffix','后缀名','varchar(10)','String','suffix','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (200,'25','video_cover_id','视频抽帧id','int','Long','videoCoverId','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (201,'25','is_display','是否显示在资源库','char(2)','String','isDisplay','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (202,'25','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (203,'25','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',15,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

                                                                                                                                                                                                                                                                                                                  (204,'25','is_delete','是否删除（0未删除 1已删除）','char(2)','String','isDelete','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
                              `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

                                                                                                                                                                (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-06-20 14:47:30','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),

                                                                                                                                                                (2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-06-20 14:47:30','',NULL,'初始化密码 123456'),

                                                                                                                                                                (3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-06-20 14:47:30','',NULL,'深色主题theme-dark，浅色主题theme-light'),

                                                                                                                                                                (4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2023-06-20 14:47:30','admin','2023-12-14 17:08:17','是否开启验证码功能（true开启，false关闭）'),

                                                                                                                                                                (5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-06-20 14:47:30','',NULL,'是否开启注册用户功能（true开启，false关闭）'),

                                                                                                                                                                (6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-06-20 14:47:30','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
                            `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values

                                                                                                                                                                                        (100,0,'0','正易云科技',0,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (101,100,'0,100','郑州总公司',1,'','15888888888','','0','0','admin','2023-06-20 14:47:29','admin','2024-01-24 17:51:07'),

                                                                                                                                                                                        (102,100,'0,100','长沙分公司',2,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (103,101,'0,100,101','研发部门',1,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (104,101,'0,100,101','市场部门',2,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (105,101,'0,100,101','测试部门',3,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (106,101,'0,100,101','财务部门',4,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (107,101,'0,100,101','运维部门',5,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (108,102,'0,100,102','市场部门',1,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL),

                                                                                                                                                                                        (109,102,'0,100,102','财务部门',2,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

                                                                                                                                                                                                            (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-06-20 14:47:30','',NULL,'性别男'),

                                                                                                                                                                                                            (2,2,'女','1','sys_user_sex','','','N','0','admin','2023-06-20 14:47:30','',NULL,'性别女'),

                                                                                                                                                                                                            (3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-06-20 14:47:30','',NULL,'性别未知'),

                                                                                                                                                                                                            (4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'显示菜单'),

                                                                                                                                                                                                            (5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'隐藏菜单'),

                                                                                                                                                                                                            (6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

                                                                                                                                                                                                            (7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

                                                                                                                                                                                                            (8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

                                                                                                                                                                                                            (9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

                                                                                                                                                                                                            (10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-06-20 14:47:30','',NULL,'默认分组'),

                                                                                                                                                                                                            (11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-06-20 14:47:30','',NULL,'系统分组'),

                                                                                                                                                                                                            (12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'系统默认是'),

                                                                                                                                                                                                            (13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'系统默认否'),

                                                                                                                                                                                                            (14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-06-20 14:47:30','',NULL,'通知'),

                                                                                                                                                                                                            (15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-06-20 14:47:30','',NULL,'公告'),

                                                                                                                                                                                                            (16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

                                                                                                                                                                                                            (17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'关闭状态'),

                                                                                                                                                                                                            (18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'其他操作'),

                                                                                                                                                                                                            (19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'新增操作'),

                                                                                                                                                                                                            (20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'修改操作'),

                                                                                                                                                                                                            (21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'删除操作'),

                                                                                                                                                                                                            (22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-06-20 14:47:30','',NULL,'授权操作'),

                                                                                                                                                                                                            (23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'导出操作'),

                                                                                                                                                                                                            (24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'导入操作'),

                                                                                                                                                                                                            (25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'强退操作'),

                                                                                                                                                                                                            (26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'生成操作'),

                                                                                                                                                                                                            (27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'清空操作'),

                                                                                                                                                                                                            (28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

                                                                                                                                                                                                            (29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

                                                                                                                                                                                                            (100,1,'显示','0','cms_channel_stage',NULL,'success','N','0','admin','2023-06-21 11:25:16','',NULL,NULL),

                                                                                                                                                                                                            (101,2,'隐藏','1','cms_channel_stage',NULL,'danger','N','0','admin','2023-06-21 11:25:37','admin','2023-06-21 11:25:44',NULL),

                                                                                                                                                                                                            (102,1,'已发布','0','cms_content_stage',NULL,'success','N','0','admin','2023-06-21 15:25:35','',NULL,NULL),

                                                                                                                                                                                                            (103,2,'已下线','1','cms_content_stage',NULL,'primary','N','0','admin','2023-06-21 15:26:08','admin','2023-08-24 16:58:21',NULL),

                                                                                                                                                                                                            (104,1,'文字','0','cms_link_type',NULL,'success','N','0','admin','2023-06-28 10:47:35','',NULL,NULL),

                                                                                                                                                                                                            (105,2,'图片','1','cms_link_type',NULL,'primary','N','0','admin','2023-06-28 10:47:53','admin','2023-06-28 10:48:15',NULL),

                                                                                                                                                                                                            (106,1,'启用','0','cms_setup_stage',NULL,'default','N','0','admin','2023-08-03 16:38:44','admin','2023-08-03 16:39:14',NULL),

                                                                                                                                                                                                            (107,2,'停用','1','cms_setup_stage',NULL,'default','N','0','admin','2023-08-03 16:39:26','admin','2023-08-03 17:18:18',NULL),

                                                                                                                                                                                                            (108,1,'按发布时间升序','1','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:22:37','admin','2023-08-18 14:27:14',NULL),

                                                                                                                                                                                                            (109,2,'按发布时间倒序','2','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:22:53','admin','2023-08-18 14:27:23',NULL),

                                                                                                                                                                                                            (110,3,'按访问量升序','3','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:23:23','admin','2023-08-18 14:27:32',NULL),

                                                                                                                                                                                                            (111,4,' 按访问量倒序','4','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:23:37','admin','2023-08-18 14:27:39',NULL),

                                                                                                                                                                                                            (112,3,'待审核','2','cms_content_stage',NULL,'info','N','0','admin','2023-08-24 16:57:27','',NULL,NULL),

                                                                                                                                                                                                            (113,4,'已退回','3','cms_content_stage',NULL,'danger','N','0','admin','2023-08-24 16:58:09','admin','2023-08-24 16:58:26',NULL),

                                                                                                                                                                                                            (114,5,'草稿','4','cms_content_stage',NULL,'warning','N','0','admin','2023-08-29 09:50:11','',NULL,NULL),

                                                                                                                                                                                                            (115,0,'按默认排序','0','cms_content_order',NULL,'default','N','0','admin','2023-10-16 17:38:24','',NULL,NULL),

                                                                                                                                                                                                            (116,5,'按创建时间升序','5','cms_content_order',NULL,'default','N','0','admin','2023-10-17 10:13:12','',NULL,NULL),

                                                                                                                                                                                                            (117,6,'按创建时间降序','6','cms_content_order',NULL,'default','N','0','admin','2023-10-17 10:13:27','',NULL,NULL),

                                                                                                                                                                                                            (118,1,'左上','topLeft','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:07','',NULL,NULL),

                                                                                                                                                                                                            (119,2,'中上','topCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:37','',NULL,NULL),

                                                                                                                                                                                                            (120,3,'右上','topRight','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:57','',NULL,NULL),

                                                                                                                                                                                                            (121,4,'左中','leftCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:18:48','',NULL,NULL),

                                                                                                                                                                                                            (122,5,'居中','center','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:19:15','',NULL,NULL),

                                                                                                                                                                                                            (123,6,'中右','rightCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:19:59','',NULL,NULL),

                                                                                                                                                                                                            (124,7,'左下','leftBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:20:46','',NULL,NULL),

                                                                                                                                                                                                            (125,8,'中下','centerBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:21:07','',NULL,NULL),

                                                                                                                                                                                                            (126,9,'右下','rightBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:21:31','',NULL,NULL),

                                                                                                                                                                                                            (127,1,'不校验','NONE','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:35:28','',NULL,NULL),

                                                                                                                                                                                                            (128,2,'必须包含字母、数字','LETTER_NUMBER','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:40:11','',NULL,'^(?=.*\\d+)(?=.*[A-Za-z]+)[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(129,3,'必须包含大小写字母、数字','UPPER_LOW_LETTER_NUMBER','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:42:22','admin','2023-12-13 16:42:26','^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(130,4,'必须包含字母、数字、特殊字符','LETTER_NUMBER_SPECIAL','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:42:50','admin','2023-12-13 16:42:54','^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(131,5,'必须包含大小写字母、数字、特殊字符','UPPER_LOW_LETTER_NUMBER_SPECIAL','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:43:45','',NULL,'^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(132,1,'用户名','ACCOUNT','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:52:14','admin','2023-12-13 16:53:31',NULL),

(133,2,'手机号','PHONE_NUMBER','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:53:27','',NULL,NULL),

(134,3,'Email','EMAIL','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:53:55','',NULL,NULL),

(135,4,'昵称全拼','NICK_NAME','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:54:11','',NULL,NULL),

(136,5,'真实姓名全拼','REAL_NAME','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:55:30','admin','2023-12-13 16:55:34',NULL),

(137,6,'生日（yyyyMMdd）','BIRTHDAY','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:56:02','',NULL,NULL),

(138,1,'全站模型','0','cms_model_display',NULL,'default','N','0','admin','2023-12-18 17:32:07','',NULL,NULL),

(139,2,'本站模型','1','cms_model_display',NULL,'default','N','0','admin','2023-12-18 17:32:20','',NULL,NULL),

(140,1,'本地服务器','0','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:54:40','',NULL,NULL),

(141,2,'阿里云OSS','1','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:54:49','',NULL,NULL),

(142,3,'腾讯云COS','2','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:55:02','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'用户性别','sys_user_sex','0','admin','2023-06-20 14:47:30','',NULL,'用户性别列表'),

(2,'菜单状态','sys_show_hide','0','admin','2023-06-20 14:47:30','',NULL,'菜单状态列表'),

(3,'系统开关','sys_normal_disable','0','admin','2023-06-20 14:47:30','',NULL,'系统开关列表'),

(4,'任务状态','sys_job_status','0','admin','2023-06-20 14:47:30','',NULL,'任务状态列表'),

(5,'任务分组','sys_job_group','0','admin','2023-06-20 14:47:30','',NULL,'任务分组列表'),

(6,'系统是否','sys_yes_no','0','admin','2023-06-20 14:47:30','',NULL,'系统是否列表'),

(7,'通知类型','sys_notice_type','0','admin','2023-06-20 14:47:30','',NULL,'通知类型列表'),

(8,'通知状态','sys_notice_status','0','admin','2023-06-20 14:47:30','',NULL,'通知状态列表'),

(9,'操作类型','sys_oper_type','0','admin','2023-06-20 14:47:30','',NULL,'操作类型列表'),

(10,'系统状态','sys_common_status','0','admin','2023-06-20 14:47:30','',NULL,'登录状态列表'),

(100,'显示状态','cms_channel_stage','0','admin','2023-06-21 11:24:36','',NULL,NULL),

(101,'文章状态','cms_content_stage','0','admin','2023-06-21 15:24:56','',NULL,NULL),

(102,'友链分类类型','cms_link_type','0','admin','2023-06-28 10:47:14','',NULL,NULL),

(103,'功能设置状态','cms_setup_stage','0','admin','2023-08-03 16:38:23','',NULL,NULL),

(104,'文章排序方式','cms_content_order','0','admin','2023-08-18 14:22:15','',NULL,NULL),

(105,'水印位置','cms_water_mark_position','0','admin','2023-12-12 18:16:01','',NULL,NULL),

(106,'密码校验规则','sys_security_password_rule','0','admin','2023-12-13 16:31:35','',NULL,NULL),

(107,'密码敏感信息','sys_security_password_sensitive','0','admin','2023-12-13 16:51:43','',NULL,NULL),

(108,'模型范围','cms_model_display','0','admin','2023-12-18 17:31:50','',NULL,'模型可见范围'),

(109,'存储方式','cms_storage_location','0','admin','2023-12-22 10:53:51','admin','2023-12-22 10:54:16','文件存储方式（如 本机或OSS）');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,''),

(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,''),

(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values

(100,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-20 14:56:47'),

(101,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-20 16:41:01'),

(102,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 09:52:17'),

(103,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 11:09:53'),

(104,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 14:15:10'),

(105,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 10:09:32'),

(106,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 14:00:22'),

(107,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 14:30:29'),

(108,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 09:38:16'),

(109,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-06-26 11:22:38'),

(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 11:23:30'),

(111,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 14:06:06'),

(112,'admin','192.168.10.10','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 16:01:22'),

(113,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-27 09:36:51'),

(114,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-27 14:12:56'),

(115,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-28 09:37:08'),

(116,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-28 14:06:55'),

(117,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-06-28 15:02:45'),

(118,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-29 09:26:59'),

(119,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-29 14:29:16'),

(120,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 09:55:52'),

(121,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 12:21:15'),

(122,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-06-30 14:01:46'),

(123,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 14:01:51'),

(124,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-06-30 17:02:50'),

(125,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-06-30 17:39:55'),

(126,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 17:39:57'),

(127,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 09:28:58'),

(128,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 14:09:44'),

(129,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-03 17:44:04'),

(130,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 17:44:41'),

(131,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 09:44:24'),

(132,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 10:26:51'),

(133,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 11:30:29'),

(134,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 14:15:47'),

(135,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 14:48:59'),

(136,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 15:20:53'),

(137,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 15:21:15'),

(138,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 15:21:19'),

(139,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 15:21:24'),

(140,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 17:43:53'),

(141,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 17:45:50'),

(142,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 17:53:58'),

(143,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 17:54:04'),

(144,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:01:56'),

(145,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:02:03'),

(146,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:02:51'),

(147,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:02:58'),

(148,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:08:02'),

(149,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:08:07'),

(150,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:09:14'),

(151,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:18'),

(152,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:09:20'),

(153,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:25'),

(154,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:30'),

(155,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:10:14'),

(156,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:10:50'),

(157,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:10:54'),

(158,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:11:25'),

(159,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:13:55'),

(160,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:13:58'),

(161,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:16:25'),

(162,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:16:29'),

(163,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:16:34'),

(164,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:16:36'),

(165,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:17:20'),

(166,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:22:36'),

(167,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:22:41'),

(168,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:42:42'),

(169,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:48:49'),

(170,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:48:57'),

(171,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:52:13'),

(172,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:52:17'),

(173,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:54:26'),

(174,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:54:29'),

(175,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:22:08'),

(176,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 10:22:13'),

(177,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:22:17'),

(178,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:24:08'),

(179,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:24:12'),

(180,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:38:30'),

(181,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:43:36'),

(182,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:54:31'),

(183,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:54:35'),

(184,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:01:35'),

(185,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:01:41'),

(186,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:03:15'),

(187,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:03:19'),

(188,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:19:53'),

(189,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:19:58'),

(190,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:28:39'),

(191,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:28:44'),

(192,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:36:05'),

(193,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:36:09'),

(194,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 14:10:53'),

(195,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 14:10:56'),

(196,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-05 14:42:28'),

(197,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 15:04:31'),

(198,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-05 16:19:02'),

(199,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 16:26:09'),

(200,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 16:26:12'),

(201,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 16:26:15'),

(202,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-07-05 18:12:46'),

(203,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-05 18:15:01'),

(204,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 09:55:54'),

(205,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-07-06 11:03:31'),

(206,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 11:03:34'),

(207,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 14:09:27'),

(208,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 15:15:56'),

(209,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 16:01:52'),

(210,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 16:01:54'),

(211,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 16:01:58'),

(212,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-06 18:23:22'),

(213,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 18:23:27'),

(214,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 18:23:30'),

(215,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 09:58:18'),

(216,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 10:28:46'),

(217,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 12:22:30'),

(218,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 15:38:57'),

(219,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 16:34:41'),

(220,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 17:05:38'),

(221,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 17:14:33'),

(222,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 18:07:09'),

(223,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-10 14:47:06'),

(224,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-10 14:47:11'),

(225,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-10 17:51:45'),

(226,'admin','192.168.10.94','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-11 09:49:19'),

(227,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 11:13:23'),

(228,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 14:24:20'),

(229,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 16:15:57'),

(230,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-11 17:13:44'),

(231,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 17:13:48'),

(232,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-07-11 18:21:10'),

(233,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-11 18:22:51'),

(234,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-12 09:42:31'),

(235,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-12 14:00:44'),

(236,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-12 14:18:49'),

(237,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 09:34:08'),

(238,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 11:04:03'),

(239,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 14:01:12'),

(240,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 14:38:58'),

(241,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 16:41:34'),

(242,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 18:46:03'),

(243,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-14 10:11:33'),

(244,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-14 14:04:48'),

(245,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:01:46'),

(246,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-17 10:03:26'),

(247,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:03:32'),

(248,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:51:44'),

(249,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 11:42:11'),

(250,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 14:02:38'),

(251,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 15:37:42'),

(252,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 17:34:58'),

(253,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-18 09:31:13'),

(254,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-18 15:55:37'),

(255,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-19 15:02:14'),

(256,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 15:02:17'),

(257,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-19 15:14:05'),

(258,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 15:14:23'),

(259,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 16:13:08'),

(260,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-19 17:35:29'),

(261,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 17:37:48'),

(262,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-20 09:34:20'),

(263,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-20 16:30:49'),

(264,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-20 16:30:51'),

(265,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-21 10:47:44'),

(266,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 10:47:47'),

(267,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-07-21 11:02:02'),

(268,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 11:02:06'),

(269,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:04:30'),

(270,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-21 15:33:25'),

(271,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:35:07'),

(272,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-21 15:35:10'),

(273,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:37:07'),

(274,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:38:20'),

(275,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 10:34:11'),

(276,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 14:02:22'),

(277,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 17:14:58'),

(278,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 09:31:21'),

(279,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 10:11:19'),

(280,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 13:59:31'),

(281,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 14:48:08'),

(282,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 17:43:52'),

(283,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-02 10:50:20'),

(284,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 10:50:25'),

(285,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 14:45:17'),

(286,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-02 17:09:50'),

(287,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 17:09:54'),

(288,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 17:48:16'),

(289,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 09:27:14'),

(290,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 12:05:58'),

(291,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 13:58:20'),

(292,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 16:07:12'),

(293,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 09:26:07'),

(294,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 14:02:18'),

(295,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 15:52:35'),

(296,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 18:29:57'),

(297,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 09:31:51'),

(298,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 09:57:31'),

(299,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:30:41'),

(300,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:30:49'),

(301,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:30:53'),

(302,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:30:57'),

(303,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:31:49'),

(304,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:35:31'),

(305,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:37:35'),

(306,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:37:40'),

(307,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:38:24'),

(308,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:35'),

(309,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:41'),

(310,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:50'),

(311,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:56:35'),

(312,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 10:58:00'),

(313,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:58:04'),

(314,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 11:04:28'),

(315,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-07 11:04:37'),

(316,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 11:28:16'),

(317,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:29:10'),

(318,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:31:05'),

(319,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 11:31:16'),

(320,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:32:02'),

(321,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-07 11:32:23'),

(322,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-07 11:32:27'),

(323,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:32:31'),

(324,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 11:35:43'),

(325,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:36:52'),

(326,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 14:29:24'),

(327,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:09:19'),

(328,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:09:32'),

(329,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:13:14'),

(330,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:13:20'),

(331,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:19:09'),

(332,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:19:25'),

(333,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:19:40'),

(334,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:19:49'),

(335,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:20:00'),

(336,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:05'),

(337,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:39:10'),

(338,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:20'),

(339,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:39:27'),

(340,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:31'),

(341,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 15:39:45'),

(342,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:41:26'),

(343,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 15:45:02'),

(344,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-07 15:45:16'),

(345,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 15:45:20'),

(346,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 10:53:25'),

(347,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 14:20:21'),

(348,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-08 14:24:46'),

(349,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-08 14:26:51'),

(350,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-08 14:27:00'),

(351,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 15:38:18'),

(352,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 09:41:17'),

(353,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 10:42:09'),

(354,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 14:59:00'),

(355,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 16:01:16'),

(356,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-09 17:14:55'),

(357,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-09 18:25:52'),

(358,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 18:25:54'),

(359,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 09:33:40'),

(360,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-10 10:07:32'),

(361,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-10 10:07:37'),

(362,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 11:25:27'),

(363,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 14:13:30'),

(364,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-10 15:22:20'),

(365,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 09:32:55'),

(366,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 10:39:53'),

(367,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 14:43:35'),

(368,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 16:31:10'),

(369,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-11 17:48:33'),

(370,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 17:48:35'),

(371,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 09:45:26'),

(372,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 10:37:10'),

(373,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 16:05:17'),

(374,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 17:10:58'),

(375,'admin','192.168.10.21','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-14 17:33:14'),

(376,'admin','192.168.10.124','内网IP','Safari','Mac OS X','1','验证码错误','2023-08-14 17:45:20'),

(377,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-14 17:45:23'),

(378,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-08-14 17:47:40'),

(379,'admin','222.137.17.88','XX XX','Chrome 11','Mac OS X','0','登录成功','2023-08-14 18:15:27'),

(380,'admin','125.41.168.193','XX XX','Safari','Mac OS X','0','登录成功','2023-08-15 08:21:37'),

(381,'admin','123.14.74.157','XX XX','Chrome 9','Windows 10','0','登录成功','2023-08-15 09:59:13'),

(382,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-17 17:30:47'),

(383,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-17 17:51:26'),

(384,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-17 18:13:17'),

(385,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-17 18:17:33'),

(386,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-17 18:17:41'),

(387,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 09:32:16'),

(388,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 10:12:34'),

(389,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 10:57:55'),

(390,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-18 11:47:21'),

(391,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 11:47:24'),

(392,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 11:53:38'),

(393,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 14:03:20'),

(394,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 14:40:06'),

(395,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 15:53:17'),

(396,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 17:18:15'),

(397,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 20:30:04'),

(398,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 13:43:02'),

(399,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-20 13:44:43'),

(400,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-20 13:44:53'),

(401,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 13:44:56'),

(402,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 17:55:07'),

(403,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 20:40:56'),

(404,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 21:37:58'),

(405,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-20 22:54:01'),

(406,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-20 22:54:04'),

(407,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-08-20 22:54:04'),

(408,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-20 22:54:07'),

(420,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:56:27'),

(421,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:56:27'),

(422,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:59:08'),

(423,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:59:08'),

(424,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-20 23:11:09'),

(425,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 23:11:16'),

(426,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-21 09:35:43'),

(427,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 10:00:27'),

(428,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 14:02:49'),

(429,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 16:21:27'),

(430,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 17:30:21'),

(431,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-21 17:35:21'),

(432,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-22 09:39:33'),

(433,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-23 17:34:14'),

(434,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-23 18:28:08'),

(435,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-23 18:28:11'),

(436,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 09:31:00'),

(437,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 15:27:48'),

(438,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-24 17:25:34'),

(439,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 17:25:41'),

(440,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 09:36:24'),

(441,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-25 14:14:50'),

(442,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 14:14:56'),

(443,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-25 15:23:04'),

(444,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 15:23:19'),

(445,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:37'),

(446,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:39'),

(447,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:43'),

(448,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-08-25 16:03:48'),

(449,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-08-25 16:03:48'),

(450,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-25 16:03:55'),

(451,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:04:52'),

(452,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:04:55'),

(453,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:05:25'),

(454,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:07:18'),

(455,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:08:31'),

(456,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 16:57:14'),

(457,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 17:33:49'),

(458,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 09:29:56'),

(459,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 11:05:53'),

(460,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 14:12:48'),

(461,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-28 14:12:54'),

(462,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-28 14:12:57'),

(463,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 14:13:08'),

(464,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 17:22:58'),

(465,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 17:26:51'),

(466,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-29 09:23:21'),

(467,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 09:23:24'),

(468,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 09:52:57'),

(469,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 10:54:12'),

(470,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 14:02:35'),

(471,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-29 14:32:13'),

(472,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 14:32:16'),

(473,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-29 14:35:16'),

(474,'hnzyy01','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-29 14:36:04'),

(475,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 15:18:00'),

(476,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 15:48:49'),

(477,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 16:29:22'),

(478,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-29 17:23:49'),

(479,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 17:24:34'),

(480,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:45:26'),

(481,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-29 17:46:17'),

(482,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:47:02'),

(483,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:48:21'),

(484,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:50:57'),

(485,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:53:04'),

(486,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:55:38'),

(487,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 17:57:07'),

(488,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-29 18:36:17'),

(489,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 18:36:24'),

(490,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-30 09:34:45'),

(491,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 10:14:57'),

(492,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 14:07:56'),

(493,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-30 14:36:46'),

(494,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-30 14:36:49'),

(495,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 14:36:52'),

(496,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-30 15:15:17'),

(497,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 15:27:52'),

(498,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-31 09:43:59'),

(499,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 14:48:30'),

(500,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 17:23:32'),

(501,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 18:08:58'),

(502,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 09:42:00'),

(503,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 10:16:32'),

(504,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 10:37:38'),

(505,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-05 11:25:01'),

(506,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 14:02:58'),

(507,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-05 14:40:10'),

(508,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-05 17:15:58'),

(509,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 17:18:34'),

(510,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 09:34:48'),

(511,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-06 10:35:06'),

(512,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 14:03:48'),

(513,'admin','192.168.10.194','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-09-06 14:25:13'),

(514,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 15:13:41'),

(515,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-06 18:12:45'),

(516,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 09:27:12'),

(517,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-07 10:00:46'),

(518,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 11:31:44'),

(519,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-07 14:26:02'),

(520,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 15:18:10'),

(521,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 16:17:08'),

(522,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 17:22:55'),

(523,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 18:02:00'),

(524,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-08 09:36:07'),

(525,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 10:26:58'),

(526,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 11:05:51'),

(527,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 14:08:47'),

(528,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 18:25:15'),

(529,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 10:04:32'),

(530,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 11:26:21'),

(531,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-12 14:09:21'),

(532,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-12 14:09:25'),

(533,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 14:09:28'),

(534,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-12 15:05:07'),

(535,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 15:05:13'),

(536,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 16:04:13'),

(537,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-13 09:41:44'),

(538,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 09:41:52'),

(539,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 10:26:03'),

(540,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 14:05:58'),

(541,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 14:52:22'),

(542,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 15:23:03'),

(543,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 17:25:18'),

(544,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 18:35:34'),

(545,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-14 18:28:12'),

(546,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-15 09:39:22'),

(547,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-09-15 09:39:22'),

(548,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-09-15 09:39:27'),

(549,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-15 09:39:27'),

(550,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 09:39:39'),

(551,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 14:05:53'),

(552,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 16:01:53'),

(553,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 17:58:46'),

(554,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 10:04:20'),

(555,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-18 11:10:49'),

(556,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-18 11:10:52'),

(557,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 11:22:25'),

(558,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 14:11:53'),

(559,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 16:05:47'),

(560,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 17:12:48'),

(561,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 18:14:12'),

(562,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 09:37:30'),

(563,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 14:30:57'),

(564,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 16:46:55'),

(565,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 16:52:04'),

(566,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 17:29:55'),

(567,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 11:18:56'),

(568,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 14:12:04'),

(569,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 16:32:46'),

(570,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 09:37:36'),

(571,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 11:13:11'),

(572,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 14:48:35'),

(573,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 17:12:34'),

(574,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 18:26:06'),

(575,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-22 09:36:32'),

(576,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-22 14:42:40'),

(577,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-25 15:48:52'),

(578,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-25 18:36:38'),

(579,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 09:41:39'),

(580,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 10:48:23'),

(581,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 14:55:16'),

(582,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 14:55:19'),

(583,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 14:55:23'),

(584,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-09-26 15:28:53'),

(585,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:28:53'),

(586,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-09-26 15:28:57'),

(587,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:28:57'),

(588,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 15:29:15'),

(589,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:29:33'),

(590,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-09-26 15:29:33'),

(591,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 15:30:21'),

(592,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 16:46:12'),

(593,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 09:31:50'),

(594,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 10:09:02'),

(595,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 10:57:24'),

(596,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 14:03:49'),

(597,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 20:22:06'),

(598,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-09 16:08:46'),

(599,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 09:55:36'),

(600,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 10:54:58'),

(601,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 14:21:35'),

(602,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-11 17:50:25'),

(603,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 09:40:54'),

(604,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 10:43:20'),

(605,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 14:26:57'),

(606,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-13 15:54:51'),

(607,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-13 15:54:54'),

(608,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-13 16:40:44'),

(609,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-13 16:40:53'),

(610,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 22:35:19'),

(611,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-14 22:36:03'),

(612,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 22:36:14'),

(613,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 23:23:41'),

(614,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-15 13:39:21'),

(615,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-15 14:37:05'),

(616,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 09:40:22'),

(617,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 14:59:34'),

(618,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:22:58'),

(619,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:23:05'),

(620,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-16 16:23:41'),

(621,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:26:54'),

(622,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:27:03'),

(623,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:28:02'),

(624,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-16 16:35:49'),

(625,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:36:01'),

(626,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 09:41:55'),

(627,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 11:13:49'),

(628,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 16:02:36'),

(629,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 16:03:26'),

(630,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-17 16:07:54'),

(631,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:08:01'),

(632,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-17 16:11:27'),

(633,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-17 16:11:32'),

(634,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 16:15:12'),

(635,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:18:37'),

(636,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-17 16:19:57'),

(637,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-17 16:24:01'),

(638,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 16:32:57'),

(639,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-17 16:33:06'),

(640,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:33:12'),

(641,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:35:03'),

(642,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-17 16:38:55'),

(643,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:40:59'),

(644,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 16:45:14'),

(645,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 16:46:53'),

(646,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-17 16:46:58'),

(647,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:47:02'),

(648,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 17:17:15'),

(649,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-10-17 17:17:30'),

(650,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 17:17:30'),

(651,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 17:17:57'),

(652,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-17 17:27:06'),

(653,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 17:27:09'),

(654,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 18:22:31'),

(655,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-18 15:43:42'),

(656,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-18 16:50:26'),

(657,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-18 17:59:12'),

(658,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-18 18:14:50'),

(659,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-19 09:38:39'),

(660,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 10:19:40'),

(661,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 11:07:14'),

(662,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-19 11:38:23'),

(663,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 14:54:21'),

(664,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-19 16:00:53'),

(665,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-19 16:01:02'),

(666,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 17:07:53'),

(667,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-19 18:09:42'),

(668,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-19 18:09:50'),

(669,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 10:31:40'),

(670,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 11:31:41'),

(671,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 14:13:47'),

(672,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-23 09:40:41'),

(673,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-23 09:40:53'),

(674,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 12:49:26'),

(675,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 18:25:18'),

(676,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-23 18:25:49'),

(677,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 18:25:56'),

(678,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-23 18:26:00'),

(679,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 09:39:36'),

(680,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 10:11:44'),

(681,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:11:47'),

(682,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 10:12:56'),

(683,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:13:03'),

(684,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 10:13:10'),

(685,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 10:14:08'),

(686,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:14:13'),

(687,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-24 10:15:59'),

(688,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:16:03'),

(689,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-24 10:19:53'),

(690,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-24 10:20:09'),

(691,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:20:12'),

(692,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:51:42'),

(693,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 14:20:50'),

(694,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 15:11:12'),

(695,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 16:15:25'),

(696,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 16:15:31'),

(697,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 16:15:34'),

(698,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 16:50:43'),

(699,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 17:05:44'),

(700,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 17:05:47'),

(701,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-24 17:42:26'),

(702,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 17:42:29'),

(703,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 18:18:46'),

(704,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 09:44:02'),

(705,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 14:11:29'),

(706,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-25 15:17:52'),

(707,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 15:42:35'),

(708,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 15:42:45'),

(709,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 17:20:04'),

(710,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 17:20:12'),

(711,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-10-25 17:20:26'),

(712,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:20:26'),

(713,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:34:35'),

(714,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:34:48'),

(715,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:34:58'),

(716,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:35:06'),

(717,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:35:12'),

(718,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-25 17:41:38'),

(719,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:41:43'),

(720,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:42:56'),

(721,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:20:46'),

(722,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:21:05'),

(723,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:23:21'),

(724,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:32:29'),

(725,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:33:11'),

(726,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:34:23'),

(727,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:38:40'),

(728,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:39:25'),

(729,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:41:07'),

(730,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 18:41:57'),

(731,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-26 09:34:24'),

(732,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-26 09:54:45'),

(733,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-26 09:54:50'),

(734,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-31 15:29:24'),

(735,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-31 15:31:51'),

(736,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-10-31 18:24:57'),

(737,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-31 18:24:57'),

(738,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-31 18:25:02'),

(739,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 10:24:42'),

(740,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 14:08:34'),

(741,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 14:38:58'),

(742,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-01 16:11:30'),

(743,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-01 16:11:30'),

(744,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-01 16:11:39'),

(745,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 16:11:49'),

(746,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 10:11:34'),

(747,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 13:56:06'),

(748,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 14:53:41'),

(749,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-02 17:13:59'),

(750,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 10:08:34'),

(751,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 10:08:34'),

(752,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 10:08:45'),

(753,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 10:08:45'),

(754,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 10:08:54'),

(755,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 14:10:06'),

(756,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-11-03 16:04:43'),

(757,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 16:04:54'),

(758,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 16:04:54'),

(759,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 16:05:02'),

(760,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 16:05:02'),

(761,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 16:05:18'),

(762,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 16:06:15'),

(763,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 16:08:11'),

(764,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-03 16:08:21'),

(765,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 16:08:32'),

(766,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 17:00:14'),

(767,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 17:00:14'),

(768,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 17:00:22'),

(769,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 17:00:22'),

(770,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 17:00:38'),

(771,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:02:17'),

(772,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:02:28'),

(773,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:32:13'),

(774,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:32:22'),

(775,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:43:33'),

(776,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-03 17:43:49'),

(777,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:43:55'),

(778,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-03 18:02:54'),

(779,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','退出成功','2023-11-03 18:06:53'),

(780,'hnzyy01','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-03 18:07:04'),

(781,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-06 11:20:37'),

(782,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-06 11:20:37'),

(783,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-06 11:20:46'),

(784,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 11:21:01'),

(785,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-06 14:04:36'),

(786,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-06 14:04:36'),

(787,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 14:04:43'),

(788,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 15:37:02'),

(789,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-07 18:01:58'),

(790,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-08 09:36:15'),

(791,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-08 09:36:15'),

(792,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误2次','2023-11-08 09:36:27'),

(793,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-08 09:36:27'),

(794,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-08 09:36:38'),

(795,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 10:34:29'),

(796,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-08 10:34:29'),

(797,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 10:34:47'),

(798,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-08 11:28:56'),

(799,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:28:56'),

(800,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-08 11:29:02'),

(801,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:02'),

(802,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-11-08 11:29:06'),

(803,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:06'),

(804,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:11'),

(805,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误4次','2023-11-08 11:29:11'),

(806,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 11:29:19'),

(807,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 14:28:36'),

(808,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 16:33:10'),

(809,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-09 14:13:19'),

(810,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-09 17:54:05'),

(811,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 10:33:30'),

(812,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 14:09:08'),

(813,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-10 14:56:30'),

(814,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-11-10 16:08:57'),

(815,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 16:09:04'),

(816,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 18:18:56'),

(817,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 10:09:27'),

(818,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 11:16:04'),

(819,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 14:11:43'),

(820,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 16:08:50'),

(821,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-11-13 17:20:34'),

(822,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 17:23:09'),

(823,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-13 17:27:29'),

(824,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 09:54:29'),

(825,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 14:37:32'),

(826,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 15:55:54'),

(827,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-14 16:47:03'),

(828,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-15 09:37:58'),

(829,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-16 18:30:56'),

(830,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-17 09:36:54'),

(831,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-17 09:36:54'),

(832,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-17 09:37:01'),

(833,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-17 09:37:01'),

(834,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 09:37:10'),

(835,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 11:13:04'),

(836,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 14:01:48'),

(837,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 14:31:58'),

(838,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-11-20 09:44:42'),

(839,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-20 09:44:47'),

(840,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-20 09:44:47'),

(841,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 09:44:58'),

(842,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 14:43:45'),

(843,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 17:13:30'),

(844,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 17:50:38'),

(845,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-11-20 18:06:17'),

(846,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 18:06:21'),

(847,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-20 18:29:26'),

(848,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 18:29:38'),

(849,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 09:37:29'),

(850,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 11:24:15'),

(851,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 14:11:34'),

(852,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 14:50:09'),

(853,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-21 16:42:25'),

(854,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-11-21 17:35:06'),

(855,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 17:35:12'),

(856,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 18:29:57'),

(857,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-23 09:55:44'),

(858,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:55:44'),

(859,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-23 09:56:10'),

(860,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:56:10'),

(861,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-11-23 09:56:24'),

(862,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:56:24'),

(863,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-23 09:56:32'),

(864,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-30 18:07:57'),

(865,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-30 18:07:57'),

(866,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-30 18:08:05'),

(867,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-12-04 17:40:12'),

(868,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-12-04 17:40:12'),

(869,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-12-04 17:40:22'),

(870,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-12-04 17:40:22'),

(871,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-04 17:40:30'),

(872,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-05 09:38:37'),

(873,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-05 10:34:52'),

(874,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-05 17:09:46'),

(875,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-05 18:04:39'),

(876,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 09:45:04'),

(877,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 11:01:46'),

(878,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 15:00:47'),

(879,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 17:04:09'),

(880,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-07 17:45:36'),

(881,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-07 17:45:36'),

(882,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-07 17:45:48'),

(883,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 10:59:29'),

(884,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 15:14:07'),

(885,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-08 17:09:57'),

(886,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-08 17:09:57'),

(887,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 17:10:04'),

(888,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-11 10:19:04'),

(889,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-11 10:19:05'),

(890,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-11 10:19:12'),

(891,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-11 16:44:20'),

(892,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-12 11:05:49'),

(893,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-12 11:05:49'),

(894,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 11:05:55'),

(895,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 14:27:58'),

(896,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 17:36:51'),

(897,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-13 09:51:53'),

(898,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 09:51:53'),

(899,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误2次','2023-12-13 09:52:04'),

(900,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 09:52:04'),

(901,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 09:52:11'),

(902,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 11:23:52'),

(903,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-13 14:06:18'),

(904,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 14:06:18'),

(905,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 14:06:28'),

(906,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 14:37:46'),

(907,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 15:36:11'),

(908,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:12:46'),

(909,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-12-13 16:33:33'),

(910,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:33:36'),

(911,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:38:57'),

(912,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 18:13:21'),

(913,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-14 09:41:05'),

(914,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-14 09:41:05'),

(915,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 09:41:15'),

(916,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 09:49:39'),

(917,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 14:47:12'),

(918,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 15:57:34'),

(919,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 17:05:34'),

(920,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 18:29:09'),

(921,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 09:39:10'),

(922,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 10:17:48'),

(923,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-12-15 11:10:30'),

(924,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 11:11:32'),

(925,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 14:08:50'),

(926,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 14:39:28'),

(927,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 15:37:45'),

(928,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 16:28:26'),

(929,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 17:43:56'),

(930,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 18:19:31'),

(931,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 09:43:25'),

(932,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 09:47:48'),

(933,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-18 14:50:39'),

(934,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-18 14:50:39'),

(935,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 14:56:56'),

(936,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 17:22:58'),

(937,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-19 09:40:16'),

(938,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-19 09:40:16'),

(939,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 09:40:22'),

(940,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 10:35:03'),

(941,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 11:31:43'),

(942,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 14:20:24'),

(943,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 15:59:06'),

(944,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 16:55:26'),

(945,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 09:34:32'),

(946,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 14:13:23'),

(947,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 17:12:13'),

(948,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 10:19:34'),

(949,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 14:50:06'),

(950,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 18:12:10'),

(951,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 09:50:32'),

(952,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 10:27:57'),

(953,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 11:48:15'),

(954,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 14:24:50'),

(955,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 15:34:30'),

(956,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 18:07:07'),

(957,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 09:39:28'),

(958,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 10:58:01'),

(959,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 14:19:32'),

(960,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-12-25 14:23:54'),

(961,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 14:41:25'),

(962,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-25 15:26:05'),

(963,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-25 15:26:05'),

(964,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 15:26:21'),

(965,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 16:08:41'),

(966,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-12-25 17:25:13'),

(967,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 17:46:39'),

(968,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 18:27:44'),

(969,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 10:05:02'),

(970,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 11:03:22'),

(971,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-26 15:17:53'),

(972,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-26 15:17:53'),

(973,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 15:17:58'),

(974,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-23 10:18:26'),

(975,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-23 17:49:37'),

(976,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-24 19:37:53'),

(977,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-05 14:35:26'),

(978,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 11:34:45'),

(979,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 14:11:14'),

(980,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 14:47:09'),

(981,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-25 10:05:31'),

(982,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-25 14:32:10');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'系统管理',0,10,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-06-20 14:47:29','admin','2023-12-22 17:24:23','系统管理目录'),

(2,'系统监控',0,13,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-06-20 14:47:29','admin','2023-12-22 17:25:00','系统监控目录'),

(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-06-20 14:47:29','',NULL,'用户管理菜单'),

(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-06-20 14:47:29','',NULL,'角色管理菜单'),

(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-06-20 14:47:29','',NULL,'菜单管理菜单'),

(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-06-20 14:47:29','',NULL,'部门管理菜单'),

(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-06-20 14:47:29','',NULL,'岗位管理菜单'),

(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-06-20 14:47:29','',NULL,'字典管理菜单'),

(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-06-20 14:47:29','',NULL,'参数设置菜单'),

(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-06-20 14:47:29','',NULL,'通知公告菜单'),

(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-06-20 14:47:29','',NULL,'日志管理菜单'),

(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-06-20 14:47:29','',NULL,'在线用户菜单'),

(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-06-20 14:47:29','',NULL,'定时任务菜单'),

(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-06-20 14:47:29','',NULL,'数据监控菜单'),

(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-06-20 14:47:29','',NULL,'服务监控菜单'),

(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-06-20 14:47:29','',NULL,'缓存监控菜单'),

(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-06-20 14:47:29','',NULL,'缓存列表菜单'),

(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-06-20 14:47:29','',NULL,'操作日志菜单'),

(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-06-20 14:47:29','',NULL,'登录日志菜单'),

(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-06-20 14:47:29','',NULL,''),

(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-06-20 14:47:29','',NULL,''),

(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-06-20 14:47:29','',NULL,''),

(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-06-20 14:47:29','',NULL,''),

(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-06-20 14:47:29','',NULL,''),

(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-06-20 14:47:29','',NULL,''),

(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(2000,'模板管理',0,2,'temp',NULL,NULL,1,0,'M','0','0','','documentation','admin','2023-06-20 16:59:07','admin','2023-12-22 17:22:48',''),

(2001,'内容管理',0,1,'content',NULL,NULL,1,0,'M','0','0','','edit','admin','2023-06-20 16:59:34','admin','2023-12-22 17:22:39',''),

(2003,'模型管理',0,3,'model',NULL,NULL,1,0,'M','0','0','','swagger','admin','2023-06-20 17:01:42','admin','2023-12-22 17:22:59',''),

(2004,'友情链接',0,7,'link',NULL,NULL,1,0,'M','0','0','','peoples','admin','2023-06-20 17:02:06','admin','2023-12-22 17:23:40',''),

(2005,'自定义属性',2003,1,'attr','web/attr/index',NULL,1,0,'C','1','0','web:attr:list','#','admin','2023-06-20 17:14:54','admin','2023-06-28 11:34:55','自定义属性菜单'),

(2006,'自定义属性查询',2005,1,'#','',NULL,1,0,'F','0','0','web:attr:query','#','admin','2023-06-20 17:14:54','',NULL,''),

(2007,'自定义属性新增',2005,2,'#','',NULL,1,0,'F','0','0','web:attr:add','#','admin','2023-06-20 17:14:54','',NULL,''),

(2008,'自定义属性修改',2005,3,'#','',NULL,1,0,'F','0','0','web:attr:edit','#','admin','2023-06-20 17:14:54','',NULL,''),

(2009,'自定义属性删除',2005,4,'#','',NULL,1,0,'F','0','0','web:attr:remove','#','admin','2023-06-20 17:14:54','',NULL,''),

(2010,'自定义属性导出',2005,5,'#','',NULL,1,0,'F','0','0','web:attr:export','#','admin','2023-06-20 17:14:54','',NULL,''),

(2011,'栏目管理',2001,2,'channel','web/channel/index',NULL,1,0,'C','0','0','web:channel:list','#','admin','2023-06-20 17:15:04','admin','2023-12-22 17:26:15','栏目菜单'),

(2012,'栏目查询',2011,1,'#','',NULL,1,0,'F','0','0','web:channel:query','#','admin','2023-06-20 17:15:04','',NULL,''),

(2013,'栏目新增',2011,2,'#','',NULL,1,0,'F','0','0','web:channel:add','#','admin','2023-06-20 17:15:04','',NULL,''),

(2014,'栏目修改',2011,3,'#','',NULL,1,0,'F','0','0','web:channel:edit','#','admin','2023-06-20 17:15:04','',NULL,''),

(2015,'栏目删除',2011,4,'#','',NULL,1,0,'F','0','0','web:channel:remove','#','admin','2023-06-20 17:15:04','',NULL,''),

(2016,'栏目导出',2011,5,'#','',NULL,1,0,'F','0','0','web:channel:export','#','admin','2023-06-20 17:15:04','',NULL,''),

(2017,'文章管理',2001,1,'Content','web/content/index',NULL,1,0,'C','0','0','web:content:list','#','admin','2023-06-20 17:15:13','admin','2024-03-21 16:12:23','文章管理菜单'),

(2018,'文章管理查询',2017,1,'#','',NULL,1,0,'F','0','0','web:content:query','#','admin','2023-06-20 17:15:13','',NULL,''),

(2019,'文章管理新增',2017,2,'#','',NULL,1,0,'F','0','0','web:content:add','#','admin','2023-06-20 17:15:13','',NULL,''),

(2020,'文章管理修改',2017,3,'#','',NULL,1,0,'F','0','0','web:content:edit','#','admin','2023-06-20 17:15:13','',NULL,''),

(2021,'文章管理删除',2017,4,'#','',NULL,1,0,'F','0','0','web:content:remove','#','admin','2023-06-20 17:15:13','',NULL,''),

(2022,'文章管理导出',2017,5,'#','',NULL,1,0,'F','0','0','web:content:export','#','admin','2023-06-20 17:15:13','',NULL,''),

(2023,'友情链接',2004,1,'links','web/links/index',NULL,1,0,'C','1','0','web:links:list','#','admin','2023-06-20 17:15:23','admin','2023-06-28 11:34:46','友情链接菜单'),

(2024,'友情链接查询',2023,1,'#','',NULL,1,0,'F','0','0','web:links:query','#','admin','2023-06-20 17:15:23','',NULL,''),

(2025,'友情链接新增',2023,2,'#','',NULL,1,0,'F','0','0','web:links:add','#','admin','2023-06-20 17:15:23','',NULL,''),

(2026,'友情链接修改',2023,3,'#','',NULL,1,0,'F','0','0','web:links:edit','#','admin','2023-06-20 17:15:23','',NULL,''),

(2027,'友情链接删除',2023,4,'#','',NULL,1,0,'F','0','0','web:links:remove','#','admin','2023-06-20 17:15:23','',NULL,''),

(2028,'友情链接导出',2023,5,'#','',NULL,1,0,'F','0','0','web:links:export','#','admin','2023-06-20 17:15:23','',NULL,''),

(2029,'内容模型',2003,3,'model','web/model/index',NULL,1,0,'C','0','0','web:model:list','#','admin','2023-06-20 17:15:47','admin','2023-07-12 16:59:04','模型菜单'),

(2030,'模型查询',2029,1,'#','',NULL,1,0,'F','0','0','web:model:query','#','admin','2023-06-20 17:15:47','',NULL,''),

(2031,'模型新增',2029,2,'#','',NULL,1,0,'F','0','0','web:model:add','#','admin','2023-06-20 17:15:47','',NULL,''),

(2032,'模型修改',2029,3,'#','',NULL,1,0,'F','0','0','web:model:edit','#','admin','2023-06-20 17:15:47','',NULL,''),

(2033,'模型删除',2029,4,'#','',NULL,1,0,'F','0','0','web:model:remove','#','admin','2023-06-20 17:15:47','',NULL,''),

(2034,'模型导出',2029,5,'#','',NULL,1,0,'F','0','0','web:model:export','#','admin','2023-06-20 17:15:47','',NULL,''),

(2035,'友情链接分类',2004,1,'sort','web/sort/index',NULL,1,0,'C','0','0','web:sort:list','#','admin','2023-06-20 17:16:04','',NULL,'友情链接分类菜单'),

(2036,'友情链接分类查询',2035,1,'#','',NULL,1,0,'F','0','0','web:sort:query','#','admin','2023-06-20 17:16:04','',NULL,''),

(2037,'友情链接分类新增',2035,2,'#','',NULL,1,0,'F','0','0','web:sort:add','#','admin','2023-06-20 17:16:04','',NULL,''),

(2038,'友情链接分类修改',2035,3,'#','',NULL,1,0,'F','0','0','web:sort:edit','#','admin','2023-06-20 17:16:04','',NULL,''),

(2039,'友情链接分类删除',2035,4,'#','',NULL,1,0,'F','0','0','web:sort:remove','#','admin','2023-06-20 17:16:04','',NULL,''),

(2040,'友情链接分类导出',2035,5,'#','',NULL,1,0,'F','0','0','web:sort:export','#','admin','2023-06-20 17:16:04','',NULL,''),

(2041,'模板',2000,1,'template','web/template/index',NULL,1,0,'C','1','0','web:template:list','#','admin','2023-06-20 17:16:15','admin','2023-06-25 16:53:47','模板菜单'),

(2042,'模板查询',2041,1,'#','',NULL,1,0,'F','0','0','web:template:query','#','admin','2023-06-20 17:16:15','',NULL,''),

(2043,'模板新增',2041,2,'#','',NULL,1,0,'F','0','0','web:template:add','#','admin','2023-06-20 17:16:15','',NULL,''),

(2044,'模板修改',2041,3,'#','',NULL,1,0,'F','0','0','web:template:edit','#','admin','2023-06-20 17:16:15','',NULL,''),

(2045,'模板删除',2041,4,'#','',NULL,1,0,'F','0','0','web:template:remove','#','admin','2023-06-20 17:16:15','',NULL,''),

(2046,'模板导出',2041,5,'#','',NULL,1,0,'F','0','0','web:template:export','#','admin','2023-06-20 17:16:15','',NULL,''),

(2047,'模板列表',2000,1,'TempList','web/template/temp_list',NULL,1,0,'C','0','0','','#','admin','2023-06-25 14:31:44','admin','2023-11-08 10:54:20',''),

(2048,'代码编辑',2000,3,'tempEdit','web/template/file_edit',NULL,1,0,'C','1','0','','#','admin','2023-06-25 15:58:22','admin','2023-11-08 09:52:40',''),

(2054,'站点管理',2088,1,'site','web/site/index',NULL,1,0,'C','0','0','web:site:list','#','admin','2023-07-03 17:31:38','admin','2023-10-17 18:29:42','站点菜单'),

(2055,'站点查询',2054,1,'#','',NULL,1,0,'F','0','0','web:site:query','#','admin','2023-07-03 17:31:38','',NULL,''),

(2056,'站点新增',2054,2,'#','',NULL,1,0,'F','0','0','web:site:add','#','admin','2023-07-03 17:31:38','',NULL,''),

(2057,'站点修改',2054,3,'#','',NULL,1,0,'F','0','0','web:site:edit','#','admin','2023-07-03 17:31:38','',NULL,''),

(2058,'站点删除',2054,4,'#','',NULL,1,0,'F','0','0','web:site:remove','#','admin','2023-07-03 17:31:38','',NULL,''),

(2059,'站点导出',2054,5,'#','',NULL,1,0,'F','0','0','web:site:export','#','admin','2023-07-03 17:31:38','',NULL,''),

(2060,'词汇管理',0,6,'word',NULL,NULL,1,0,'M','0','0','','size','admin','2023-07-06 11:45:40','admin','2023-12-22 17:23:29',''),

(2061,'敏感词',2060,1,'sensitive','web/sensitive/index',NULL,1,0,'C','0','0','web:sensitive:list','#','admin','2023-07-06 14:07:14','',NULL,'敏感词菜单'),

(2062,'敏感词查询',2061,1,'#','',NULL,1,0,'F','0','0','web:sensitive:query','#','admin','2023-07-06 14:07:14','',NULL,''),

(2063,'敏感词新增',2061,2,'#','',NULL,1,0,'F','0','0','web:sensitive:add','#','admin','2023-07-06 14:07:14','',NULL,''),

(2064,'敏感词修改',2061,3,'#','',NULL,1,0,'F','0','0','web:sensitive:edit','#','admin','2023-07-06 14:07:14','',NULL,''),

(2065,'敏感词删除',2061,4,'#','',NULL,1,0,'F','0','0','web:sensitive:remove','#','admin','2023-07-06 14:07:14','',NULL,''),

(2066,'敏感词导出',2061,5,'#','',NULL,1,0,'F','0','0','web:sensitive:export','#','admin','2023-07-06 14:07:14','',NULL,''),

(2067,'表单构建',2003,3,'builder','web/model/builder',NULL,1,0,'C','1','0','','#','admin','2023-07-11 16:18:54','admin','2023-07-12 11:32:18',''),

(2068,'栏目模型',2003,2,'channel','web/model/channel',NULL,1,0,'C','0','0',NULL,'#','admin','2023-07-12 15:27:57','',NULL,''),

(2069,'内容编辑',2001,3,'Edit','web/content/edit',NULL,1,0,'C','1','0','','#','admin','2023-07-31 17:28:28','admin','2023-09-18 10:05:13',''),

(2078,'内容类型',2003,1,'contentType','web/contentType/index',NULL,1,0,'C','0','0','web:contentType:list','#','admin','2023-09-05 17:13:08','',NULL,'内容类型菜单'),

(2079,'内容类型查询',2078,1,'#','',NULL,1,0,'F','0','0','web:contentType:query','#','admin','2023-09-05 17:13:08','',NULL,''),

(2080,'内容类型新增',2078,2,'#','',NULL,1,0,'F','0','0','web:contentType:add','#','admin','2023-09-05 17:13:08','',NULL,''),

(2081,'内容类型修改',2078,3,'#','',NULL,1,0,'F','0','0','web:contentType:edit','#','admin','2023-09-05 17:13:08','',NULL,''),

(2082,'内容类型删除',2078,4,'#','',NULL,1,0,'F','0','0','web:contentType:remove','#','admin','2023-09-05 17:13:08','',NULL,''),

(2083,'内容类型导出',2078,5,'#','',NULL,1,0,'F','0','0','web:contentType:export','#','admin','2023-09-05 17:13:08','',NULL,''),

(2084,'统计管理',0,8,'statistics',NULL,NULL,1,0,'M','0','0','','server','admin','2023-09-15 15:21:10','admin','2023-12-22 17:24:15',''),

(2085,'受访页面',2084,1,'pageview','web/statistics/page_view',NULL,1,0,'C','0','0',NULL,'#','admin','2023-09-18 16:33:38','',NULL,''),

(2086,'地域分布',2084,2,'region','web/statistics/region_view',NULL,1,0,'C','0','0',NULL,'#','admin','2023-10-11 17:51:51','',NULL,''),

(2087,'文章预览',2001,5,'preview','web/content/preview',NULL,1,0,'C','1','0','','#','admin','2023-10-17 17:50:32','admin','2023-10-17 17:50:56',''),

(2088,'系统配置',0,5,'configure',NULL,NULL,1,0,'M','0','0','','tool','admin','2023-10-17 18:26:39','admin','2023-12-22 17:23:13',''),

(2089,'内容索引',2088,2,'contentIndex','web/contentIndex/index',NULL,1,0,'C','0','0','','#','admin','2023-10-17 18:37:31','admin','2023-10-19 16:59:25',''),

(2096,'系统配置',2088,1,'config','web/config/index',NULL,1,0,'C','0','0','web:config:list','#','admin','2023-11-10 16:37:14','',NULL,'系统配置菜单'),

(2097,'系统配置查询',2096,1,'#','',NULL,1,0,'F','0','0','web:config:query','#','admin','2023-11-10 16:37:15','',NULL,''),

(2098,'系统配置新增',2096,2,'#','',NULL,1,0,'F','0','0','web:config:add','#','admin','2023-11-10 16:37:15','',NULL,''),

(2099,'系统配置修改',2096,3,'#','',NULL,1,0,'F','0','0','web:config:edit','#','admin','2023-11-10 16:37:15','',NULL,''),

(2100,'系统配置删除',2096,4,'#','',NULL,1,0,'F','0','0','web:config:remove','#','admin','2023-11-10 16:37:15','',NULL,''),

(2101,'系统配置导出',2096,5,'#','',NULL,1,0,'F','0','0','web:config:export','#','admin','2023-11-10 16:37:15','',NULL,''),

(2120,'安全配置',1,10,'securitConfig','system/securitConfig/index',NULL,1,0,'C','0','0','system:securitConfig:list','logininfor','admin','2023-12-13 14:59:53','admin','2023-12-14 09:52:09','安全配置菜单'),

(2121,'安全配置查询',2120,1,'#','',NULL,1,0,'F','0','0','system:securitConfig:query','#','admin','2023-12-13 14:59:53','',NULL,''),

(2122,'安全配置新增',2120,2,'#','',NULL,1,0,'F','0','0','system:securitConfig:add','#','admin','2023-12-13 14:59:53','',NULL,''),

(2123,'安全配置修改',2120,3,'#','',NULL,1,0,'F','0','0','system:securitConfig:edit','#','admin','2023-12-13 14:59:53','',NULL,''),

(2124,'安全配置删除',2120,4,'#','',NULL,1,0,'F','0','0','system:securitConfig:remove','#','admin','2023-12-13 14:59:53','',NULL,''),

(2125,'安全配置导出',2120,5,'#','',NULL,1,0,'F','0','0','system:securitConfig:export','#','admin','2023-12-13 14:59:53','',NULL,''),

(2126,'资源库',2001,6,'files','web/files/index',NULL,1,0,'C','0','1','web:files:list','#','admin','2023-12-19 14:15:59','admin','2023-12-22 17:26:24','资源库菜单'),

(2127,'资源库查询',2126,1,'#','',NULL,1,0,'F','0','0','web:files:query','#','admin','2023-12-19 14:15:59','',NULL,''),

(2128,'资源库新增',2126,2,'#','',NULL,1,0,'F','0','0','web:files:add','#','admin','2023-12-19 14:15:59','',NULL,''),

(2129,'资源库修改',2126,3,'#','',NULL,1,0,'F','0','0','web:files:edit','#','admin','2023-12-19 14:15:59','',NULL,''),

(2130,'资源库删除',2126,4,'#','',NULL,1,0,'F','0','0','web:files:remove','#','admin','2023-12-19 14:15:59','',NULL,''),

(2131,'资源库导出',2126,5,'#','',NULL,1,0,'F','0','0','web:files:export','#','admin','2023-12-19 14:15:59','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1748 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';


/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'ceo','董事长',1,'0','admin','2023-06-20 14:47:29','',NULL,''),

(2,'se','项目经理',2,'0','admin','2023-06-20 14:47:29','',NULL,''),

(3,'hr','人力资源',3,'0','admin','2023-06-20 14:47:29','',NULL,''),

(4,'user','普通员工',4,'0','admin','2023-06-20 14:47:29','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-06-20 14:47:29','',NULL,'超级管理员'),

(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-06-20 14:47:29','admin','2024-01-24 17:45:56','普通角色'),

(101,'测试管理员','ceshi',2,'1',1,1,'0','0','admin','2023-08-25 16:15:29','admin','2024-01-24 17:49:56',NULL),

(102,'测试审核员','shenhe',0,'1',1,1,'0','0','admin','2023-08-25 16:17:35','admin','2024-01-24 17:50:02',NULL);

/*Table structure for table `sys_role_channel` */

DROP TABLE IF EXISTS `sys_role_channel`;

CREATE TABLE `sys_role_channel` (
  `role_id` int NOT NULL COMMENT '角色id',
  `channel_id` int NOT NULL COMMENT '栏目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色栏目权限';

/*Data for the table `sys_role_channel` */

/*Table structure for table `sys_role_cms` */

DROP TABLE IF EXISTS `sys_role_cms`;

CREATE TABLE `sys_role_cms` (
  `role_id` int NOT NULL COMMENT '角色id',
  `property_id` int NOT NULL COMMENT '属性id',
  `property_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='cms角色权限';

/*Data for the table `sys_role_cms` */

insert  into `sys_role_cms`(`role_id`,`property_id`,`property_type`) values

(100,1012,'site'),

(100,1014,'site'),

(100,1012,'channel'),

(100,1013,'channel'),

(100,1014,'channel'),

(102,1038,'channel'),

(102,1042,'channel'),

(102,1043,'channel'),

(102,1039,'channel'),

(102,1046,'channel'),

(101,1054,'channel'),

(101,1053,'channel'),

(101,1055,'channel'),

(2,1018,'site'),

(101,1016,'site'),

(102,1016,'site');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values

(2,100),

(2,101),

(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values

(2,1),

(2,2),

(2,100),

(2,101),

(2,102),

(2,103),

(2,104),

(2,105),

(2,106),

(2,107),

(2,108),

(2,109),

(2,110),

(2,111),

(2,112),

(2,113),

(2,114),

(2,500),

(2,501),

(2,1000),

(2,1001),

(2,1002),

(2,1003),

(2,1004),

(2,1005),

(2,1006),

(2,1007),

(2,1008),

(2,1009),

(2,1010),

(2,1011),

(2,1012),

(2,1013),

(2,1014),

(2,1015),

(2,1016),

(2,1017),

(2,1018),

(2,1019),

(2,1020),

(2,1021),

(2,1022),

(2,1023),

(2,1024),

(2,1025),

(2,1026),

(2,1027),

(2,1028),

(2,1029),

(2,1030),

(2,1031),

(2,1032),

(2,1033),

(2,1034),

(2,1035),

(2,1036),

(2,1037),

(2,1038),

(2,1039),

(2,1040),

(2,1041),

(2,1042),

(2,1043),

(2,1044),

(2,1045),

(2,1046),

(2,1047),

(2,1048),

(2,1049),

(2,1050),

(2,1051),

(2,1052),

(2,1053),

(2,1054),

(100,2001),

(100,2002),

(100,2011),

(100,2012),

(100,2013),

(100,2014),

(100,2015),

(100,2016),

(100,2017),

(100,2018),

(100,2019),

(100,2020),

(100,2021),

(100,2022),

(100,2054),

(100,2055),

(100,2056),

(100,2057),

(100,2058),

(100,2059),

(100,2069),

(101,2001),

(101,2004),

(101,2011),

(101,2012),

(101,2015),

(101,2016),

(101,2017),

(101,2018),

(101,2019),

(101,2022),

(101,2023),

(101,2024),

(101,2025),

(101,2026),

(101,2027),

(101,2028),

(101,2035),

(101,2036),

(101,2037),

(101,2038),

(101,2039),

(101,2040),

(101,2069),

(101,2087),

(102,1),

(102,2),

(102,100),

(102,101),

(102,102),

(102,103),

(102,104),

(102,105),

(102,106),

(102,107),

(102,108),

(102,109),

(102,110),

(102,111),

(102,112),

(102,113),

(102,114),

(102,500),

(102,501),

(102,1000),

(102,1001),

(102,1002),

(102,1003),

(102,1004),

(102,1005),

(102,1006),

(102,1007),

(102,1008),

(102,1009),

(102,1010),

(102,1011),

(102,1012),

(102,1013),

(102,1014),

(102,1015),

(102,1016),

(102,1017),

(102,1018),

(102,1019),

(102,1020),

(102,1021),

(102,1022),

(102,1023),

(102,1024),

(102,1025),

(102,1026),

(102,1027),

(102,1028),

(102,1029),

(102,1030),

(102,1031),

(102,1032),

(102,1033),

(102,1034),

(102,1035),

(102,1036),

(102,1037),

(102,1038),

(102,1039),

(102,1040),

(102,1041),

(102,1042),

(102,1043),

(102,1044),

(102,1045),

(102,1046),

(102,1047),

(102,1048),

(102,1049),

(102,1050),

(102,1051),

(102,1052),

(102,1053),

(102,1054),

(102,2000),

(102,2001),

(102,2003),

(102,2004),

(102,2005),

(102,2006),

(102,2007),

(102,2008),

(102,2009),

(102,2010),

(102,2011),

(102,2012),

(102,2013),

(102,2014),

(102,2015),

(102,2016),

(102,2017),

(102,2018),

(102,2019),

(102,2020),

(102,2021),

(102,2022),

(102,2023),

(102,2024),

(102,2025),

(102,2026),

(102,2027),

(102,2028),

(102,2029),

(102,2030),

(102,2031),

(102,2032),

(102,2033),

(102,2034),

(102,2035),

(102,2036),

(102,2037),

(102,2038),

(102,2039),

(102,2040),

(102,2041),

(102,2042),

(102,2043),

(102,2044),

(102,2045),

(102,2046),

(102,2047),

(102,2048),

(102,2054),

(102,2055),

(102,2056),

(102,2057),

(102,2058),

(102,2059),

(102,2067),

(102,2068),

(102,2069),

(102,2088);

/*Table structure for table `sys_role_site` */

DROP TABLE IF EXISTS `sys_role_site`;

CREATE TABLE `sys_role_site` (
  `role_id` int NOT NULL COMMENT '角色id',
  `site_id` int NOT NULL COMMENT '站点id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色站点权限';

/*Data for the table `sys_role_site` */

/*Table structure for table `sys_security_config` */

DROP TABLE IF EXISTS `sys_security_config`;

CREATE TABLE `sys_security_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stage` char(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `password_len_min` int NOT NULL COMMENT '密码最小长度',
  `password_len_max` int DEFAULT NULL COMMENT '密码最大长度',
  `password_rule` varchar(50) NOT NULL COMMENT '密码校验规则',
  `password_sensitive` varchar(255) DEFAULT NULL COMMENT '密码不可包含的敏感信息',
  `weak_passwords` varchar(500) DEFAULT NULL COMMENT '弱密码集合',
  `force_modify_pwd_after_add` char(2) NOT NULL COMMENT '后台添加的用户首次登陆是否需要强制修改密码',
  `force_modify_pwd_after_reset` char(2) DEFAULT NULL COMMENT '后台重置密码后首次登陆是否需要强制修改密码',
  `password_expire_seconds` int NOT NULL COMMENT '密码有效期（单位：秒）',
  `password_retry_limit` int NOT NULL COMMENT '密码错误次数阈值',
  `password_retry_strategy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码错误次数阈值触发后的处理策略',
  `password_retry_lock_seconds` int DEFAULT NULL COMMENT '密码错误阈值触发锁定账号时长，单位：秒',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='安全配置';

/*Data for the table `sys_security_config` */

insert  into `sys_security_config`(`id`,`stage`,`password_len_min`,`password_len_max`,`password_rule`,`password_sensitive`,`weak_passwords`,`force_modify_pwd_after_add`,`force_modify_pwd_after_reset`,`password_expire_seconds`,`password_retry_limit`,`password_retry_strategy`,`password_retry_lock_seconds`,`create_by`,`create_time`,`update_by`,`update_time`) values

(103,'1',6,16,'UPPER_LOW_LETTER_NUMBER','[\"PHONE_NUMBER\",\"ACCOUNT\"]',NULL,'N','N',0,0,NULL,NULL,NULL,'2023-12-14 16:07:53',NULL,NULL),

(104,'0',6,16,'UPPER_LOW_LETTER_NUMBER','[\"PHONE_NUMBER\",\"EMAIL\"]',NULL,'N','N',0,0,NULL,NULL,NULL,'2023-12-14 17:05:47',NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,103,'admin','后台管理员','00','','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-03-25 14:32:11','admin','2023-06-20 14:47:29','','2024-03-25 14:32:10','管理员'),

(100,104,'hnzyy01','测试内容管理员','00','','','0','','$2a$10$5Ngw3gmrYzO863DSMZwcROOEZHia7zs.icUccfO35dZ.16yJe0r7O','0','0','127.0.0.1','2023-11-20 18:29:39','admin','2023-08-07 09:56:52','admin','2024-01-24 17:51:41',NULL),

(101,104,'123456','测试','00','','','0','','$2a$10$2IzRQMgKP70a88hz5JhDpurVGqQ5wrpDEOMuIlueuFMlMNiI07FfS','0','0','',NULL,'admin','2023-12-14 09:52:58','',NULL,NULL),

(102,NULL,'ces111','111111','00','','','0','','$2a$10$H8BmFdxn0nTjW.zho/yrp.atXLtx2p76Nrs39pOD//ph6hXt1AKFm','0','0','',NULL,'admin','2023-12-14 09:58:43','',NULL,NULL),

(103,NULL,'16650265577','cessss','00','','','0','','$2a$10$sKW94jyZCbqaN8sZUg/2keUHpYrSP24zDI8WrRXGUzoZK1EWsTyR.','0','2','',NULL,'admin','2023-12-14 14:50:06','',NULL,NULL),

(104,NULL,'12331223','22222','00','','','0','','$2a$10$HRw6MyHA2SRb9Nc1ts2R..OwCrLD5VP69esyKaoxDuGOuSQznWhHS','0','2','',NULL,'admin','2023-12-14 14:52:15','',NULL,NULL),

(105,NULL,'2222','ces122','00','','','0','','$2a$10$k1O4enr3dOhao6ZQr4uyA.TxWld.DjLtqLt6jIRVKa4GdT7KA9mvO','0','0','',NULL,'admin','2023-12-14 14:53:12','',NULL,NULL),

(106,NULL,'22121122','ces11','00','','','0','','$2a$10$wkzrEX5/.zKyRvD.27hTe.8V5kqg.AS4rF9ZFoO2nzU8HnXwOVYbW','0','0','',NULL,'admin','2023-12-14 14:55:12','',NULL,NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values

(1,1),

(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values

(1,1),

(2,2),

(100,101),

(101,102);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*Table structure for table `cms_attr` */

DROP TABLE IF EXISTS `cms_attr`;

CREATE TABLE `cms_attr` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attr_name` varchar(100) DEFAULT NULL COMMENT '属性名称',
  `attr_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '属性值',
  `content_id` int DEFAULT NULL COMMENT '内容id',
  `channel_id` int DEFAULT NULL COMMENT '栏目id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='自定义属性表';

/*Data for the table `cms_attr` */

insert  into `cms_attr`(`id`,`attr_name`,`attr_value`,`content_id`,`channel_id`) values

(1282,'input_1692177606413','',NULL,1066),

(1292,'uploadImg_1692177427879','[]',1141,NULL),

(1293,'uploadImg_1692177427879','[]',1140,NULL),

(1294,'uploadImg_1692177427879','[]',1137,NULL),

(1295,'uploadImg_1692177427879','[]',1136,NULL),

(1296,'uploadImg_1692177427879','[]',1135,NULL),

(1297,'input_1692263627204','',NULL,1068),

(1299,'video','[]',1143,NULL),

(1300,'video','[{\"type\":\"file\",\"name\":\"d3d582b6-ddbe-11ed-958c-f6b83f3af3a1-v8_f1_t1_5KIw8C0Y.mp4\",\"status\":\"done\",\"uid\":1711016743296,\"url\":\"/profile/upload/2024/03/21/d3d582b6-ddbe-11ed-958c-f6b83f3af3a1-v8_f1_t1_5KIw8C0Y_20240321182543A003.mp4\"}]',1142,NULL),

(1301,'ueditor_1702261173225','',NULL,1069),

(1305,'download','[{\"type\":\"file\",\"name\":\"下载演示.zip\",\"status\":\"done\",\"uid\":1711334563347,\"url\":\"/profile/upload/2024/03/25/下载演示_20240325104243A003.zip\"}]',1144,NULL),

(1306,'download','[{\"type\":\"file\",\"name\":\"下载演示.zip\",\"status\":\"done\",\"uid\":1711334573451,\"url\":\"/profile/upload/2024/03/25/下载演示_20240325104253A004.zip\"}]',1145,NULL);

/*Table structure for table `cms_channel` */

DROP TABLE IF EXISTS `cms_channel`;

CREATE TABLE `cms_channel` (
  `channel_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parent_id` int DEFAULT '0' COMMENT '父级id',
  `site_id` int DEFAULT NULL COMMENT '站点id',
  `channel_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '栏目名称',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '访问链接',
  `external_link` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '外部链接',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `temp_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'PC端模板',
  `temp_mobile` varchar(100) DEFAULT NULL COMMENT '移动端模板',
  `stage` char(2) DEFAULT '0' COMMENT '状态',
  `content_model` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '内容模型',
  `channel_model` int NOT NULL COMMENT '栏目模型',
  `examine_temp_id` varchar(50) DEFAULT NULL COMMENT '审批流模板ID',
  `is_delete` char(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `delete_by` varchar(20) DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`channel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1070 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='栏目表';

/*Data for the table `cms_channel` */

insert  into `cms_channel`(`channel_id`,`parent_id`,`site_id`,`channel_name`,`path`,`external_link`,`order_num`,`temp_id`,`temp_mobile`,`stage`,`content_model`,`channel_model`,`examine_temp_id`,`is_delete`,`create_by`,`create_time`,`delete_by`,`delete_time`,`update_by`,`update_time`) values

(1066,0,1016,'新闻','xw',NULL,10,NULL,NULL,'0','[{\"modelId\":15,\"params\":{}}]',14,NULL,'0','admin','2024-03-21 16:06:31',NULL,NULL,NULL,NULL),

(1067,0,1016,'图片','tp',NULL,20,NULL,NULL,'0','[]',26,NULL,'0','admin','2024-03-21 16:07:45',NULL,NULL,'admin','2024-03-21 16:07:51'),

(1068,0,1016,'视频','sp',NULL,30,NULL,NULL,'0','[{\"modelId\":27,\"params\":{}}]',16,NULL,'0','admin','2024-03-21 16:08:05',NULL,NULL,'admin','2024-03-21 17:56:59'),

(1069,0,1016,'下载','xz',NULL,40,NULL,NULL,'0','[{\"modelId\":28,\"params\":{}}]',18,NULL,'0','admin','2024-03-21 16:08:17',NULL,NULL,'admin','2024-03-25 10:22:23');

/*Table structure for table `cms_config` */

DROP TABLE IF EXISTS `cms_config`;

CREATE TABLE `cms_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `config_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '键',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '值',
  `category` varchar(50) DEFAULT NULL COMMENT '分类',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `sort` int DEFAULT NULL COMMENT '排序',
  `delete_flag` int DEFAULT NULL COMMENT '是否删除',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置表';

/*Data for the table `cms_config` */

insert  into `cms_config`(`id`,`config_key`,`config_value`,`category`,`remark`,`sort`,`delete_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values

(1,'pay_alipay_publicKey','','alipay','支付宝公钥配置',1,0,NULL,NULL,NULL,NULL),

(2,'pay_alipay_appId','','alipay','支付宝应用ID',2,0,NULL,NULL,NULL,NULL),

(3,'pay_alipay_appPrivateKey','','alipay','支付宝私钥配置',3,0,NULL,NULL,NULL,NULL),

(4,'pay_alipay_notifyUrl','','alipay','支付宝回调地址',4,0,NULL,NULL,NULL,NULL),

(5,'email_protocol','smtps','email','邮箱发件协议',5,0,NULL,NULL,NULL,NULL),

(6,'email_host','smtp.ym.163.com','email','SMTP服务器地址',6,0,NULL,NULL,NULL,NULL),

(7,'email_username','','email','发送者邮箱',7,0,NULL,NULL,NULL,NULL),

(8,'email_password','','email','邮箱密码',8,0,NULL,NULL,NULL,NULL),

(9,'email_nickname','hnzyy sun','email','发送人昵称',9,0,NULL,NULL,NULL,NULL),

(10,'email_port','994','email','邮箱端口号',10,0,NULL,NULL,NULL,NULL),

(11,'email_receive','2448200847@qq.com','email','接收者邮箱',11,0,NULL,NULL,NULL,NULL),

(12,'system_title','正易云内容管理系统','system','系统名称',12,0,NULL,NULL,NULL,NULL),

(13,'system_logo','','system','系统logo',13,0,NULL,NULL,NULL,NULL),

(14,'system_ico','/profile/upload/2023/11/13/favicon (1)_20231113171725A002.ico','system','系统图标',14,0,NULL,NULL,NULL,NULL),

(15,'system_login_name','正易云内容管理系统','system','登录标题',15,0,NULL,NULL,NULL,NULL),

(16,'wechat_mp_appid','','wechat_mp','微信公众号appid',16,0,NULL,NULL,NULL,NULL),

(17,'wechat_mp_appSecret','','wechat_mp','微信公众号密钥',17,0,NULL,NULL,NULL,NULL),

(18,'oss_aliyun_endpoint','','oss_aliyun','OSS节点地址',18,0,NULL,NULL,NULL,NULL),

(19,'oss_aliyun_accessKeyId','','oss_aliyun','阿里云oss accessKeyId',19,0,NULL,NULL,NULL,NULL),

(20,'oss_aliyun_accessKeySecret','','oss_aliyun','阿里云oss accessKeySecret',20,0,NULL,NULL,NULL,NULL),

(21,'oss_aliyun_bucketName','','oss_aliyun','阿里云oss bucketName',21,0,NULL,NULL,NULL,NULL),

(22,'cos_tencent_secretId','','cos_tencent','腾讯云cos secretId',22,0,NULL,NULL,NULL,NULL),

(23,'cos_tencent_secretKey','','cos_tencent','腾讯云cos secretKey',23,0,NULL,NULL,NULL,NULL),

(24,'cos_tencent_region','ap-nanjing','cos_tencent','腾讯云cos region',24,0,NULL,NULL,NULL,NULL),

(25,'cos_tencent_bucketName','','cos_tencent','腾讯云cos bucketName',25,0,NULL,NULL,NULL,NULL),

(26,'cos_tencent_path','','cos_tencent','腾讯云cos path',26,0,NULL,NULL,NULL,NULL);

/*Table structure for table `cms_content` */

DROP TABLE IF EXISTS `cms_content`;

CREATE TABLE `cms_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章名字',
  `channel_id` int NOT NULL COMMENT '栏目id',
  `model_id` int NOT NULL COMMENT '模型id',
  `site_id` int NOT NULL COMMENT '站点id',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '作者',
  `source` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '来源',
  `profile` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '描述',
  `external_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '外部链接',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '封面图',
  `views` int DEFAULT '0' COMMENT '浏览量',
  `order_num` int DEFAULT NULL COMMENT '排序',
  `stage` char(2) NOT NULL DEFAULT '0' COMMENT '0:已发布 1:下线',
  `release_time` datetime DEFAULT NULL COMMENT '发布时间',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `flow_id` varchar(60) DEFAULT NULL COMMENT '流程id',
  `content_type` varchar(300) DEFAULT NULL COMMENT '内容类型',
  `is_delete` char(2) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `delete_by` varchar(20) DEFAULT NULL COMMENT '删除人',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `topping` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '是否置顶',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `content_index` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文章表';

/*Data for the table `cms_content` */

insert  into `cms_content`(`id`,`title`,`channel_id`,`model_id`,`site_id`,`author`,`source`,`profile`,`external_link`,`cover`,`views`,`order_num`,`stage`,`release_time`,`create_by`,`create_time`,`update_by`,`update_time`,`flow_id`,`content_type`,`is_delete`,`delete_by`,`delete_time`,`topping`) values

(1135,'刚推出就“老了”？相比探陆，锐界L正“年轻”',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/6b362a72-ccad-475b-bd49-449a7e2d92fe_20240321161118A001_20240321171602A005.jpg',3,10,'0','2024-03-21 16:10:37','admin','2024-03-21 16:12:01','admin','2024-03-21 17:35:01',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

(1136,'电比油低，比亚迪再出“王炸”，汉唐荣耀版16.98万起',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/d860bdd7-2b46-4382-8f96-8e7f7f216ea7_20240321162248A010_20240321171530A004.jpg',3,20,'0','2024-03-21 16:22:31','admin','2024-03-21 16:22:58','admin','2024-03-21 17:15:30',NULL,NULL,'0',NULL,NULL,'0'),

(1137,'车企2024：合资燃油崩塌，中国车企高歌猛进',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/d1f5afe7-ba5d-4951-a78e-dbbc4ef3819f_20240321162401A014_20240321171458A003.jpg',2,30,'0','2024-03-21 16:23:39','admin','2024-03-21 16:24:05','admin','2024-03-21 17:35:05',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

(1138,'沃尔沃XC60：为你解决电动车的安全顾虑，让你放心出行！',1066,15,1016,'研发部门',NULL,NULL,NULL,NULL,2,40,'0','2024-03-21 16:26:32','admin','2024-03-21 16:26:54',NULL,NULL,NULL,NULL,'0',NULL,NULL,'0'),

(1139,'沃尔沃XC60：为你解决电动车的安全顾虑，让你放心出行！',1066,15,1016,'研发部门',NULL,NULL,NULL,NULL,0,50,'0','2024-03-21 16:26:32','admin','2024-03-21 16:26:59',NULL,'2024-03-21 16:27:18',NULL,NULL,'1','admin','2024-03-21 16:27:18','0'),

(1140,'悦达起亚新K3，家庭用车的领跑者',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/54486634-656a-476f-8d9f-d04d0c20379e_20240321162757A020_20240321171439A002.jpg',8,60,'0','2024-03-21 16:27:42','admin','2024-03-21 16:28:02','admin','2024-03-21 17:44:33',NULL,'[{\"id\":1004,\"params\":{}}]','0',NULL,NULL,'0'),

(1141,'性能手机新标杆，一加 Ace 3 发布会定档 1 月 4 日',1066,15,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/aeea61d2-ddb2-43e1-a9a5-a566a6a2a11b_20240321163213A023_20240321171227A001.jpg',10,70,'0','2024-03-21 16:31:59','admin','2024-03-21 16:32:20','admin','2024-03-21 17:12:28',NULL,NULL,'0',NULL,NULL,'0'),

(1142,'国产特斯拉Model X/S迎来OTA升级！改进了这些功能',1068,27,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/1681833939922182145_20240321175806A001.jpg',15,10,'0','2024-03-21 17:57:04','admin','2024-03-21 17:58:08','admin','2024-03-21 18:25:44',NULL,NULL,'0',NULL,NULL,'0'),

(1143,'2023款雪铁龙DS4到货',1068,27,1016,'研发部门',NULL,NULL,NULL,'/profile/upload/2024/03/21/1674682857374699523_20240321180756A002.jpg',6,20,'0','2024-03-21 18:07:30','admin','2024-03-21 18:07:57',NULL,NULL,NULL,NULL,'0',NULL,NULL,'0'),

(1144,'QQ下载',1069,28,1016,'研发部门',NULL,'年轻人的社交软件',NULL,NULL,0,10,'0','2024-03-25 10:23:05','admin','2024-03-25 10:26:11','admin','2024-03-25 10:42:44',NULL,NULL,'0',NULL,NULL,'0'),

(1145,'微信下载',1069,28,1016,'研发部门',NULL,'微信，是一个生活方式',NULL,NULL,0,20,'0','2024-03-25 10:26:40','admin','2024-03-25 10:27:34','admin','2024-03-25 10:42:54',NULL,NULL,'0',NULL,NULL,'0');

/*Table structure for table `cms_content_txt` */

DROP TABLE IF EXISTS `cms_content_txt`;

CREATE TABLE `cms_content_txt` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content_id` int NOT NULL COMMENT '文章表id',
  `text` longtext COMMENT '内容',
  `attr_key` varchar(20) DEFAULT NULL COMMENT '字段',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `idxcontent` (`text`) /*!50100 WITH PARSER `ngram` */
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_content_txt` */

insert  into `cms_content_txt`(`id`,`content_id`,`text`,`attr_key`) values

(150,1135,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">刚刚过去的春节，旅游成为很多人的“刚需”。经文化和旅游部数据中心测算，春节假期8天全国国内旅游出游4.74亿人次，同比增长34.3%。随着最近一波寒潮的过渡，不难预见，接下来的春暖花开时节，或将再迎来一波出游小高峰。带着家人来一次自由的长途自驾游，成为不少家庭的新计划。而经过对长途驾驶性能、一家人乘坐舒适度、通过性等维度的综合考量，很多消费者将购车目标锁定在了大7座SUV车型。纵观这一细分领域，福特锐界L和日产探陆都是不错的选择，究竟谁更适合全家出游？下面就对二者进行详细对比下。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/6b362a72-ccad-475b-bd49-449a7e2d92fe_20240321161118A001.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/a6928a95-955e-407f-a0fa-26c0ba14747b_20240321161118A002.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>2.0</strong><strong>T</strong><strong>+9AT VS大马力E混动</strong><strong>，锐界L动力</strong><strong>强、用车成本低</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自驾出游，路上省时、省心，才能养精蓄锐攒足精力游玩。从动力系统来看，探陆只提供了燃油版本，采用的是2.0T+9AT动力组合，最大功率185kW，最大扭376N·m，百公里综合油耗低至8.65L。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">锐界L不仅提供了燃油版本，还有混动版本可选，满足用户多元用车需求。锐界L混动版搭载了同级唯一的大马力E混动系统，集福特最新的第五代2.0T EcoBoost®发动机及成熟先进的动力分流混动技术于一身，发动机额定功率202kW，最大扭矩405N·m，百公里加速仅需7.1s，百公里综合油耗低至6.31L，一箱油续航1188km，参数表现明显优于探陆，并且相比探陆需要加95号汽油，锐界L“不挑食”可加92号汽油，进一步降低用车成本。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/3709067d-abc2-4ed5-aa4f-d189292b8aa5_20240321161118A003.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（锐界L大马力E混动系统）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>大沙发VS头等舱，锐界L躺出舒适感</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">对于自驾出游车辆选择，国人普遍有大车情结，全体家庭成员舒适乘坐是首要保障。探陆尺寸5130/1981/1774mm，轴距为2900mm，座椅布局方面，探陆7座车属于传统的2+3+2式7座布局，第三排2个座位空间局促，舒适度一般，并不适合成年人长时间乘座。锐界L 7座车型尺寸5000/1961/1773mm，轴距为2950mm，更大的轴距优势体现在内部空间上，无论第二排还是第三排，都能有较为舒适乘坐体验。特别是锐界L至尊型采用了类似商务MPV的2+2+3座椅布局，进入第三排更方便。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/c4a5a141-817e-45af-b989-497f85a4bcc0_20240321161118A004.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（锐界L二排座椅）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在座椅舒适性上，锐界L第二排双悬浮式头等舱座椅采用豪华Dinamica材质并带有腿托，配有三种模式，可一键切换近零重力模式，该模式下腿托和靠背自动调整，实现半躺平状态，带来如云端般舒适惬意感受。而座椅通风、加热和独立温区控制、无线充电、便携杯架等配置，也让其第二排陆地头等舱乘坐体验名副其实。相比之下，探陆提供了Nappa真皮座椅，有着典型的日产“大沙发”之称，虽然二排座椅支持多档调节，但不能一键躺平，并且二排座椅配置不及锐界L丰富。如果用一句话总结两者在座椅舒适性上的差别，日产探陆还在沉迷在让沙发更大更宽时，福特锐界L已经在追求更人性化、更高品质的舒享体验。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/f2ea3475-9767-4a64-a036-1f21a2c4df23_20240321161118A005.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em; text-align: center;\">（探陆二排座椅）</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>12.3英寸2K VS 27英寸4K，锐界L让出行更便利</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自驾出游途中，从规划路书、长途驾驶到中途休息组织就餐加油，这些繁冗的工作多由驾驶者一人独立完成，身心压力可想而知。如果车辆足够智能，可以大大降低驾驶人的疲劳程度。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/4808dbbb-8519-46f5-8629-85c1f6b2195d_20240321161118A006.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">虽然为新近推出车型，但探陆整车缺乏“智感”，中控屏只有12.3英寸，并且分辨率只有2K，像基础的智能语音交互和手机映射都有配备，不过在智能辅助驾驶上，低配车型不具备L2级智能驾驶辅助系统，要在27.98万元车型上才配备。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/83ee9f0f-8685-4561-9662-ae0ed574deba_20240321161118A007.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">相比之下，锐界L对主副驾和乘车人员智能交互体验考虑的更为全面。智能化座舱采用了12.3英寸+27英寸的超广域高清4K巨幅屏，科技感极强，副驾驶也更容易参与车辆导航和信息功能设置工作，分担主驾工作。搭载的福特SYNC®+2.0 智行互联系统，不仅支持语音控制，还加入了联合驾趣模式，副驾驶乘车人也可以参与到车辆管理和娱乐交互中。智能驾驶辅助方面，锐界L在25万元的车型上就搭载了达到L2级别的福特Co-Polit 360™智行驾驶辅助系统，拥有超20项主动驾驶辅助功能。它还标配了同级独有的V2I车路协同功能，在开通服务的城市，行驶中可以提前获取前方路口的信号灯状态以及突发交通事件，让出行更有预见性。</p><p style=\"text-align:center;margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\"><img align=\"\" alt=\"\" border=\"0\" src=\"/profile/upload/2024/03/21/81f3fa2d-21ef-4391-86dc-0d0d030fe190_20240321161118A008.jpg\" width=\"90%\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>结语：</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">通过上述分析不难发现，尽管探陆在动力、空间等方面展现出了不错的实力，但这高科技产品层出不穷的今天，多少缺少新意。相比之下，锐界L在大马力E混动加持下，动力更强，油耗还更低，兼顾性能和用车成本，同时空间更宽敞，二排零重力座椅更舒适，智能交互更领先。因此，全家出游如果要在探陆与锐界L之间进行选择，锐界L能够提供一个更加全面的解决方案。</p><p><br/></p>','txt'),

(151,1136,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">继秦荣耀版与驱逐舰05全面冲击A级轿车市场后，比亚迪向中高端市场发起进攻！2月28日，比亚迪汉唐荣耀版车型正式上市。其中，汉EV荣耀版共4款车型，售价17.98~24.98万元；汉DM-i荣耀版共5款车型，售价16.98~22.58万元；2024款汉DM-p战神版共1款车型，售价25.98万元；唐DM-i荣耀版共4款车型，售价17.98~21.98万元。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/2a4864dd-d311-42c3-8a14-4c91616104a2_20240321162247A009.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>六边形冠军 ，中高端“王炸”终结油电之战</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">此次汉唐新车型的荣耀推出，带来“美学、舒享、智驾、智舱”四大方面的全面提升，以全系标配超百项核心配置打响中高端汽车市场的价值之战，更是实现了“电比油低”，在品牌、品质、口碑、产品力、销量、保值率六大维度全面领先，以六边形冠军姿态，终结油电之战，让新能源时代彻底到来，汉唐荣耀版将彻底颠覆中高端燃油车市场！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">其中，汉EV荣耀版推出天神之眼智驾型，成为比亚迪首个搭载“天神之眼”DiPilot 100 平台的车型。在L2+级智能驾驶辅助功能基础上，进一步升级涵盖高速和城市快速路的高快领航NOA、远距AVP代客泊车功能。此外汉唐荣耀版搭载的云辇-C也在持续进化，融合天神之眼的视觉传感器，后期将升级预瞄功能，为用户带来更极致的运动舒适兼得的驾乘体验。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">值得关注的是，此次汉唐携手享誉全球的色彩开发与研究权威机构——潘通，推出暮山紫 、邢窑白瓷、藕韵灰三大2024国潮代表车色搭配，打造中国汽车新的文化标杆。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/d860bdd7-2b46-4382-8f96-8e7f7f216ea7_20240321162248A010.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>表面上是价格战，实际上是技术战，全产业链的体系战</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">长期以来，中高端市场是中国汽车市场的“必争之地”。以2024年1月为例，B级轿车＋B级SUV市场份额占比逾３０％。然而，这也是日系、德系合资品牌垄断的重点细分市场，&quot;日系三剑客”、“德系双雄”等昵称由此而生，其原因之一在于新能源渗透率较低。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">自2020年比亚迪推出汉EV以来，比亚迪以汉唐国潮之力不断冲击合资独大局面，月均销量合计3万+，累计销量突破100万辆——成为中国自主品牌首个售价20万+，且累计销量达成100万辆产品，也是自主品牌向上的典范。背靠百万汉唐车主，比亚迪汉唐旗舰车系荣耀版车型将彻底改写中高端汽车市场格局，进一步加速中高端市场油电替代，巩固中国品牌的主导优势，树立中国式豪华”汽车新典范。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">紧凑级、中高端市场的相继荣耀出击背后，是比亚迪秉持&quot;技术为王、创新为本&quot;的底气。一方面，比亚迪一直以来坚持贯彻长期主义，专注技术研发，在自主创新的道路上不断前进，构建起动态成长的“护城河”。另一方面，比亚迪手握自研三电核心技术垂直整合，可以通过全产业链和规模优势来获得同行业玩家不具有的定价主动权，这便为比亚迪产品的售价创造了一个独有的优势空间。秦汉唐的王朝荣耀出击，是比亚迪带动的产业链“规模效应”。未来，比亚迪希望推进“电比油低”的汽车行业变革，让新能源科技为更多中国家庭带来舒适便利的出行体验。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/552b706b-fd3a-4ab7-8b99-24d13dd8825f_20240321162248A011.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\"><strong>文化自信 品牌赋能，乘风破浪，彰显使命与担当</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">作为新能源领导者，比亚迪2023年夺得中国品牌销量冠军、中国市场车企销量冠军，蝉联全球新能源销量冠军。持续加速主流中高端市场油转电进程中，比亚迪品牌也在用高端化为产品赋能，首先喊出“在一起才是中国汽车”的口号；发起国宝守护计划，彰显文化华彩与自信；东京出行展、慕尼黑车展、日内瓦车展中比亚迪大放异彩赢得了海外消费者的关注和青睐；让节能、环保、低碳紧密相连，提出“为地球降温1°”的倡议，彰显了一个新能源汽车领导企业的使命与担当。签约欧洲杯，成为2024欧洲杯官方出行合作伙伴，成为欧洲杯首次携手新能源汽车品牌以及首次“联姻”中国汽车品牌。百万汉唐，冠军品牌，终结油电之战，是中国新能源汽车的使命，也是比亚迪的使命。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p><br/></p>','txt'),

(152,1137,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年是中国汽车市场的一个转折点，新能源汽车的销量和市场份额实现了历史性的突破，超过了传统燃油车，成为了汽车市场的主流。与此同时，中国车企现如今已经势不可挡，在新能源汽车领域展现了强大的竞争力和创新能力，不仅在国内市场占据了主导地位，还在国际市场上取得了不俗的成绩。2024年，中国车市将继续保持增长的势头，新能源汽车将进一步提升产品质量和技术水平，中国车企将继续加强品牌建设和国际化战略，合资品牌将面临更大的挑战和压力，需要加快转型和创新。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/18d56e4f-de06-407e-9f5c-84d02c69f067_20240321162401A012.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源势不可挡</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年，中国汽车市场实现了一个重大的变革，新能源汽车的市场份额首次突破30%，标志着中国汽车市场进入了一个新的时代。在国新办19日举行的新闻发布会上，工业和信息化部副部长辛国斌介绍，2023年，汽车产销分别实现了3016.1万辆和3009.4万辆，同比增长11.6%和12%，创历史新高。产量连续15年保持了全球第一水平。其中，新能源汽车产销分别完成了958.7万辆和949.5万辆，同比分别增长35.8%和37.9%，新车销量达到汽车新车总销量的31.6%。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/c2f5ef84-e149-4279-b1e0-df8938a81d0e_20240321162401A013.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">与此同时，新能源车高端化趋势日益明显，不仅有国际知名品牌如特斯拉、宝马、奔驰、奥迪等加大中国市场的投入，也有国内自主品牌如比亚迪、蔚来、小鹏、理想等推出高端产品。这些高端产品，不仅在设计、性能、品质、服务等方面有了较高的水准，也在价格、销量、口碑等方面有了较好的表现。尤其是比亚迪推出的仰望品牌，引起了市场轰动，更是捅破国产高端新能源车的天花板。这些高端产品，可以提升中国新能源汽车市场的品牌形象，也可以吸引更多的高端消费者，扩大新能源汽车的市场空间。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/d1f5afe7-ba5d-4951-a78e-dbbc4ef3819f_20240321162401A014.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源汽车的崛起，不仅改变了中国汽车市场的格局，也推动了中国汽车产业的转型升级和国际化发展。中国新能源汽车的出口也实现了快速增长，据海关总署发布的数据显示，2023年我国汽车出口量522.1万辆，同比增加57.4%。而日本2023年全年出口量约430万辆，我国在2023年正式超越日本成为全球汽车出口第一。值得一提的是，比亚迪出口量为242759辆，实现了336.2%的同比增长，是2023年品牌出口销量排行榜前十名中增长最大的车企。海关总署表示，近年来，随着我国现代化产业体系建设不断推进。我国汽车产业坚持不懈开展科技创新，构建完整产业链供应链，汽车产销量屡创新高，相应出口规模也在逐步扩大。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国品牌扬眉吐气</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">乘联会2023年乘用车零售销量排名里 ，前十家有五家是中国汽车品牌，分别是比亚迪、吉利、长安、奇瑞等；中国汽车品牌年度份额达到了52%。尤其比亚迪和奇瑞、吉利销量增速更为明显。比亚迪新能源汽车销量达到302万，同比增长61.9%，超越特斯拉成为全球新能源汽车销冠。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/a79179dd-33ec-4dc5-b902-272312800fd9_20240321162401A015.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">与中国品牌的崛起形成鲜明对比的是，合资品牌在中国汽车市场的表现却呈现出了一种倒退的态势。合资品牌曾经是中国汽车市场的领导者，但在新能源汽车时代，合资品牌却逐渐失去了优势，面临着中国自主品牌的强势挑战和冲击。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在2023年乘用车零售销量排名前十里 ，比亚迪、奇瑞、长安、吉利等中国车企品牌份额提升明显。在轿车领域，比亚迪股份、长安汽车、上汽股份和吉利汽车销量同比均呈两位数增长。与之相对，主要合资车企全年销量同比去年下滑占多数，上汽通用、东风日产、广汽本田等都下滑了两位数；不少合资品牌退出中国市场，如广汽三菱、广汽讴歌、东风雷诺；此外还有东风标致雪铁龙、北京现代、都已处在岌岌可危的境地，广汽三菱在中国市场彻底淡出。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/84aa1835-7f02-4d6c-a360-dc145120bef4_20240321162401A016.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">新能源汽车的崛起，也导致了合资燃油车体系的全线崩塌。合资品牌在传统燃油车领域曾经拥有着技术和品牌的优势，但在新能源汽车领域却未能跟上中国市场的步伐，从战略方面来看，合资品牌和中国自主品牌在新能源汽车领域的布局和投入存在着明显的差距。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国汽车工业协会副秘书长陈士华认为，相比合资品牌，中国品牌在电动化和智能化方面的转型速度更快，并且在产业链的完整度、成本控制力等方面也有显著提升。叠加产品性价比高，市场竞争力强，以及出口量大幅提升等综合因素，使中国品牌焕发出更强生命力。他还披露了一组数据，2023年，新能源汽车在中国品牌的销量占比已经达到了49.9%。“也就是说，每卖出2辆自主品牌车型，就有1辆是新能源汽车，这个比例相当高。”同时，陈士华特别强调道，2023年，新能源汽车累计销量为949.5万辆，同比增长37.9%，市场占有率31.6%，而在中国生产的新能汽车总量里，中国品牌的占比高达80.6%。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在以往被合资把持的中高端市场，中国品牌也在不断的攻城掠地。中国自主品牌近两年新车明显有走向高端化的趋势，在智能化、电动化方面都走得非常的快、远、稳。不仅在外观、内饰、空间等方面有着出色的表现，还在续航、动力、安全、智能等方面有着领先的技术优势，与合资品牌的高端车型相比毫不逊色，甚至有过之而无不及。这些车型也受到了消费者的青睐，成为了市场的爆款，带动了自主品牌的销量和品牌形象的提升。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">值得一提的是，中国自主品牌不仅在国内市场表现出色，还在国际市场上展现了强劲的竞争力。得益于其在产品质量、技术创新、市场布局等方面的不断进步，以及对当地消费者需求的敏锐把握和满足。中国自主品牌也在海外市场树立了良好的口碑和形象，为中国汽车工业的国际化发展打开了新的空间和机遇。中国自主品牌的出口市场已经覆盖了全球100多个国家和地区，其中不乏欧美等发达市场。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国自主品牌的崛起，也引起了国外优秀车企的重视和合作意愿。在新能源汽车领域，中国自主品牌已经具备了核心技术和产业链的优势，对于那些想要进入或扩大在中国市场的份额的外国车企，与中国自主品牌的合作是一个有效的途径。近年来，已经有多起“反向”合资的案例，如比亚迪与丰田、吉利与戴姆勒、长城与宝马等，这些合作不仅有利于双方的资源共享和市场拓展，也有利于中国自主品牌的技术提升和品牌升级。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国车企引领变革</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">中国自主汽车品牌的崛起，得益于多方面因素的推动。从产品方面来看，近两年，新能源汽车的新品不断在快速滚动推出，涵盖了各个细分市场和消费需求。从技术方面来看，各车企在新能源汽车领域在设计、研发、智能化等方面投入比重越来越大，推动了新能源汽车的技术创新和进步。从全球方面来看，随着全球各大车企纷纷宣布在2035年前后停产燃油车，新能源车成为了全球汽车市场的主角，为中国新能源汽车的发展提供了更大的空间和机遇。在这其中，很好的抓住机遇，踩稳节奏的车企就能较快的脱颖而出。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">在2023年，中国新能源汽车市场的快速发展中，比亚迪无疑是最耀眼的明星，不仅在国内市场占据了绝对的优势，也在国际市场展现了强大的竞争力。2023年，比亚迪新能源汽车销量达到了302万辆，同比增长了61.9%，超越了特斯拉，成为了全球新能源汽车销冠。比亚迪的成功，得益于其在新能源汽车领域的长期布局、持续创新、多元发展、国际化战略等方面的优势。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/a92c0779-3301-4fea-b55d-a47f2627e6ac_20240321162402A017.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">比亚迪是最早开始且唯一完成新能源汽车转型的汽车制造商，从2003年开始进入新能源汽车领域，到2023年实现了全面的新能源汽车转型，不再生产燃油汽车。这一转型，使得比亚迪在新能源汽车领域有了深厚的积累，也使得比亚迪在新能源汽车市场有了强大的竞争力。技术实力上，比亚迪在新能源汽车领域的创新能力非常强，不仅在电池、电机、电控等核心技术方面有了突出的成就，也在车型设计、智能化系统、用户服务等方面有了创新的表现。比亚迪的创新能力，也使得其在新能源汽车市场有了高品质的产品形象，赢得了消费者的信赖和喜爱。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">比亚迪不仅在国内市场有了强劲的增长，也在国际市场有了显著的进步。自2021年5月比亚迪正式宣布“乘用车出海”计划，经过2年多的发展，目前比亚迪新能源乘用车已进入德国、日本、法国、巴西、澳大利亚、阿联酋等海外59个国家及地区，超400个城市，并在多个市场取得佳绩。比亚迪的国际化战略，使得其在全球新能源汽车市场有了重要的影响力，也为中国汽车品牌的国际化发展树立了典范。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2024继续高歌猛进</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">对于越来越卷的汽车市场，中国汽车行业协会研究结果比较乐观，认为2024年我国汽车产业产销能够实现稳定增长，新能源汽车也将继续保持良好发展态势。2024年总量规模预计可以达到3100万辆，同比小幅增长3%左右。新能源汽车产销也将达到1150万辆左右的规模，增长约在20%左右。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">有机构预计，2024年，电动汽车在全球汽车销量中所占的比例将从2023年的17%左右上升到20%左右，而中国的电动汽车销量几乎占全球电动汽车销量的60%。此外，有分析认为，在未来几年内，电动汽车销量的头把交椅将由两家公司争夺——特斯拉和比亚迪。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/698bc969-61ba-4eeb-87b9-b07101d20ba6_20240321162402A018.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">合资车也必将加大新能源转型的力度，1月24日，欧盟委员会宣布，根据欧盟合并条例，已批准梅赛德斯-奔驰（中国）与华晨宝马成立合资企业。该交易主要涉及中国电池动力汽车公共充电基础设施网络市场。1 月 25 日，大众汽车集团（中国）董事长兼首席执行官贝瑞德在媒体沟通会上表示，奥迪一汽新能源公司将在年底正式投产首款车型奥迪 Q6 L e-tron。大众品牌与小鹏汽车共同开发的、专属于中国市场的中型车将于 2026 年亮相。到 2027 年，集团将提供 30 款本土生产的燃油车及插电式混合动力车型。到 2030 年，大众汽车集团将在中国市场提供至少 30 款纯电动车型。。可以看出，合资车企将更多的发挥既有的优势，除了守护好原有的地盘，在新能源赛道上进行“狂飙”，因此，中国品牌与合资品牌的较量将更加激烈。</p><p id=\"_img_parent_tmp\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/560a8382-0bbc-4273-ba14-4c14438ee9b4_20240321162402A019.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">综合而言，2023年是中国自主品牌的扬眉吐气之年，也是中国汽车工业的跨越式发展之年。在新能源汽车的引领下，中国自主品牌实现了全面超越，不仅在国内市场占据了主导地位，还在国际市场上取得了不俗的成绩。中国自主品牌在新能源汽车领域展现了强大的竞争力和创新能力，为中国汽车工业的转型升级和国际化发展奠定了坚实的基础。2024年，中国车市将继续保持增长的势头，新能源汽车将进一步提升产品质量和技术水平，自主品牌将继续加强品牌建设和国际化战略，合资品牌将面临更大的挑战和压力，需要加快转型和创新。中国汽车市场将迎来一个新的时代，一个属于新能源汽车和中国自主品牌的时代。</p><p><br/></p>','txt'),

(153,1140,'<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">悦达起亚作为一家汽车合资厂家，始终秉承不断前进、大胆革新的成长心态，在充满变化与挑战的环境中，不断努力成为连接城市与城市、人与人之间的纽带，陪伴着人们的出行和生活。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/54486634-656a-476f-8d9f-d04d0c20379e_20240321162757A020.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">2023年2月，起亚发布最新K3，与旧K3相比，新款在外观、内饰和性能方面都进行了调整。此次起亚新K3推出六款车型，分别是1.5L IVT舒适版、豪华版、尊贵版和1.4T豪华版、尊贵版和尊贵奢享版，售价从112900元到143900元不等；此次新K3的外观颜色多达7种，内饰颜色也有3种选择。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/9e86cbfe-90c3-4b1e-bede-02a6ce1a29bb_20240321162757A021.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">以星耀黄1.4T尊贵奢享版为例，尺寸是4666mm*1780mm*1450mm，轴距为2700mm，1.4T采用的是7DCT技术，也就是双离合的驾驶模式，最大马力140ps，最大扭矩211N.m，WLTC综合工况油耗5.8L。依然采用家族标志性的虎啸式设计，贯穿式蜂窝状的前中网，造型更加扁平，与两侧LED前大灯属于一体化设计，让前脸看上去更加年轻、时尚。前脸下格栅呈梯形设计，拉宽了前脸的视觉效果，让整个车头的重心显得更低。车尾是贯穿式LED组合尾灯，搭配底部较夸张的扩散器和1.4T专属的运动尾翼，再次强调了整车的运动氛围。1.4T尊贵奢享版采用了高亮黑环绕窗线、高亮黑外后视镜，让整车的线条看上去更加流畅。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">&nbsp;</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-align: center;\"><img src=\"/profile/upload/2024/03/21/74c57674-5f3e-460a-a8eb-6e5d2bf47e47_20240321162757A022.jpg\" style=\"border: 0px; margin: 0px; padding: 0px; max-width: 95%;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">内饰方面以经典全黑为例，搭载10.25英寸智能显示屏、10.25英寸炫彩仪表盘、LCD可视换挡杆。座椅和方向盘都是真皮设计，前排座椅有加热和通风功能，方向盘也配备加热功能。后排座椅为6：4分离式座椅，中间有一个不太高的地台，不影响乘坐的舒适感。智能显示屏搭载的是Kia Connect智能互联系统，可导航、远程空调控制、ETCS支付、IOT车家互联、外卖点餐等。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">安全性能方面，起亚新K3配备前排双安全气囊、侧气囊，胎压监测系统、前后驻车雷达等安全措施。另外还搭载了智能行车辅助系统，从驾驶辅助到驻车辅助都给人提供了很好的安全感，让安全无处不在。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 14px; font-family: &quot;Microsoft YaHei&quot;, 微软雅黑; color: rgb(68, 68, 68); text-wrap: wrap; text-indent: 2em;\">起亚新K3的1.4T尊贵奢享版，让你用入门级轿车的价格，享受20万级轿车的奢华与智能。</p><p><br/></p>','txt'),

(154,1141,'<p style=\"box-sizing: border-box; margin-top: 40px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">12 月 27 日，一加宣布将于 1 月 4 日发布新品一加 Ace 3。一加 Ace 系列秉持「产品力优先」理念，从一加 Ace 2、一加 Ace 2V 到一加 Ace 2 Pro，款款都是现象级爆品，得到了广大用户的认可与支持。作为一加 2024 开年之作，一加 Ace 3 更将以全能姿态，让旗舰体验全面普及，打造性能手机新标杆。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/aeea61d2-ddb2-43e1-a9a5-a566a6a2a11b_20240321163213A023.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加中国区总裁李杰表示：“一加 Ace 3 将「旗舰体验普及」带到前所未有的高度。一加坚信「旗舰可以分价位段，旗舰体验不分价位段」，一加 Ace 3 拥有同档巅峰的硬件配置、前所未见的旗舰体验、超越预期的质感设计，是一款满足你「既要、又要、还要」的全能性能手机。”</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/8a549066-1d4f-4bce-a597-3d81a1c36f1e_20240321163213A024.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">质感，是一加的品牌基因。一加 Ace 3 采用全新玻璃工艺和旗舰级金属中框，锻造出性能手机质感新巅峰，并从天空、大地、海洋等自然万物中汲取配色灵感，带来三款极具创意的配色：鸣沙金、星辰黑和月海蓝。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">鸣沙金配色，呈现出剔透的玻璃质感与金属色泽，将光影艺术演绎到极致，力量与优雅兼具；星辰黑配色，不同角度可呈现不同效果，静若黑夜，灿若星辰；月海蓝配色，犹如月夜海洋一般，平静中蕴藏着波涛。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/453bb72a-ba3b-4175-b930-3b91e8c7a67f_20240321163213A025.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em; text-align: center;\"><img alt=\"\" src=\"/profile/upload/2024/03/21/bac5f0c3-53d7-4228-9011-be22767029bb_20240321163214A026.jpg\" style=\"box-sizing: border-box; border: 0px none; vertical-align: middle; display: block; margin: 40px auto; width: 600px; height: auto;\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加 Ace 3 还将全球首发 1.5K 东方屏，全面继承一加 12 旗舰屏幕体验，把显示、护眼、流畅同时做到巅峰；支持超薄指纹解锁，相比同档普遍使用的短焦指纹，拥有更合理的解锁位置和更快速的解锁体验；搭载同档罕见的大容量电池，拥有超长续航表现……</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\">一加 Ace 3 持续秉持「产品力优先」理念，无论是硬件配置还是软件优化都完全从用户需求出发，以性能绝杀姿态颠覆传统定义，带来旗舰体验的全面普及，打造 2024 性能手机新标杆。</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; color: rgb(34, 34, 34); letter-spacing: 0.5px; line-height: 32px; word-break: break-word; text-indent: 2em;\"><br data-filtered=\"filtered\" style=\"box-sizing: border-box; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; text-wrap: wrap; background-color: rgb(255, 255, 255);\"/></p><p><br/></p>','txt'),

(155,1142,'','txt'),

(156,1143,'','txt'),

(157,1144,'','txt'),

(158,1145,'','txt');

/*Table structure for table `cms_content_type` */

DROP TABLE IF EXISTS `cms_content_type`;

CREATE TABLE `cms_content_type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL COMMENT '内容类型名称',
  `ico` varchar(100) DEFAULT NULL COMMENT '类型图标',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='内容类型表';

/*Data for the table `cms_content_type` */

insert  into `cms_content_type`(`id`,`name`,`ico`,`create_by`,`create_time`,`update_by`,`update_time`) values

(1001,'首页置顶','/profile/upload/2023/09/06/置顶_20230906113435A001.png',NULL,'2023-09-05 17:19:15',NULL,'2023-09-06 11:34:36'),

(1002,'热门新闻','/profile/upload/2023/09/06/社区活动_20230906114508A002.png',NULL,'2023-09-06 10:54:10',NULL,'2023-09-06 11:45:09'),

(1003,'首推','/profile/upload/2023/09/06/good_20230906114807A003.png',NULL,'2023-09-06 10:54:20',NULL,'2023-09-06 11:48:08'),

(1004,'轮播图',NULL,NULL,'2023-09-06 15:47:34',NULL,NULL);

/*Table structure for table `cms_files` */

DROP TABLE IF EXISTS `cms_files`;

CREATE TABLE `cms_files` (
  `id` int NOT NULL COMMENT '主键',
  `user_id` int NOT NULL COMMENT '用户id',
  `share_status` char(2) NOT NULL DEFAULT '1' COMMENT '共享状态（0已分享 1未分享）',
  `resource_size` int NOT NULL COMMENT '文件大小',
  `resource_type` char(2) DEFAULT NULL COMMENT '文件类型',
  `resource_url` varchar(100) DEFAULT NULL COMMENT '文件路径',
  `resource_dimensions` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '图片尺寸',
  `resource_date` int DEFAULT NULL COMMENT '视频时长（单位/秒）',
  `resource_alias` varchar(20) DEFAULT NULL COMMENT '文件别名',
  `upload_oss_id` int DEFAULT NULL COMMENT '上传云存储ID',
  `suffix` varchar(10) DEFAULT NULL COMMENT '后缀名',
  `video_cover_id` int DEFAULT NULL COMMENT '视频抽帧id',
  `is_display` char(2) DEFAULT '1' COMMENT '是否显示在资源库',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `is_delete` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '是否删除（0未删除 1已删除）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传表';

/*Data for the table `cms_files` */

/*Table structure for table `cms_link_sort` */

DROP TABLE IF EXISTS `cms_link_sort`;

CREATE TABLE `cms_link_sort` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '友情链接分类id',
  `name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '分类类型(1文字 2图片)',
  `site_id` int DEFAULT NULL COMMENT '站点id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接分类';

/*Data for the table `cms_link_sort` */

insert  into `cms_link_sort`(`id`,`name`,`type`,`site_id`,`create_time`) values

(4,'底部链接','0',1016,'2023-08-16 18:37:54'),

(5,'图片链接','1',1016,'2023-09-06 11:56:31');

/*Table structure for table `cms_links` */

DROP TABLE IF EXISTS `cms_links`;

CREATE TABLE `cms_links` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `link_name` varchar(100) DEFAULT NULL COMMENT '友情链接名称',
  `link_src` varchar(100) DEFAULT NULL COMMENT '友情链接图片',
  `link_url` varchar(150) DEFAULT NULL COMMENT '友情链接地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `site_id` int DEFAULT NULL COMMENT '站点id',
  `link_sort_id` int DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='友情链接';

/*Data for the table `cms_links` */

insert  into `cms_links`(`id`,`link_name`,`link_src`,`link_url`,`create_time`,`site_id`,`link_sort_id`) values

(20,'阿里巴巴',NULL,'https://www.alibabagroup.com/','2023-08-16 18:38:27',NULL,4),

(21,'腾讯',NULL,'http://www.qq.com','2023-08-16 18:38:44',NULL,4),

(22,'京东',NULL,'http://www.jd.com','2023-08-16 18:39:03',NULL,4),

(23,'百度',NULL,'http://www.baidu.com','2023-08-16 18:39:18',NULL,4),

(24,'字节跳动',NULL,'https://www.bytedance.com/','2023-08-16 18:40:15',NULL,4),

(25,'河南正易云','/profile/upload/2023/09/06/Frame 12_20230906115642A004.png','www.hnzyy.ltd','2023-09-06 11:56:58',NULL,5);

/*Table structure for table `cms_model` */

DROP TABLE IF EXISTS `cms_model`;

CREATE TABLE `cms_model` (
  `model_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '模型名称',
  `model_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '自定义模型代码(前台)',
  `model_code_admin` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT '自定义系统模型',
  `model_type` varchar(30) DEFAULT NULL COMMENT '模型类型',
  `site_id` int NOT NULL COMMENT '站点id',
  `is_public` char(2) DEFAULT '1' COMMENT '是否全站模型',
  `temp_default` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'pc模板',
  `temp_mobile` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '手机模板',
  `stage` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模型表';

/*Data for the table `cms_model` */

insert  into `cms_model`(`model_id`,`model_name`,`model_code`,`model_code_admin`,`model_type`,`site_id`,`is_public`,`temp_default`,`temp_mobile`,`stage`,`create_by`,`create_time`) values

(14,'演示站新闻','{\"list\":[{\"type\":\"input\",\"label\":\"输入框\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1692177606413\",\"key\":\"input_1692177606413\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'0','news.html','','0',NULL,'2023-08-16 17:16:10'),

(15,'演示站新闻','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadImg\",\"label\":\"图片\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"width\":\"100%\",\"data\":\"{}\",\"limit\":1,\"placeholder\":\"上传\",\"fileName\":\"image\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/upload-img.txt\",\"listType\":\"picture-card\"},\"model\":\"uploadImg_1692177427879\",\"key\":\"uploadImg_1692177427879\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692236450186\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'1','news-content.html','news-content.html','0',NULL,'2023-08-16 17:16:51'),

(16,'演示站视频','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'1','video.html',NULL,'0',NULL,'2023-08-16 17:33:49'),

(18,'下载中心','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'1','download.html',NULL,'0',NULL,'2023-08-17 16:48:54'),

(19,'视频栏目模型','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadImg\",\"label\":\"封面图\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"width\":\"100%\",\"data\":\"{}\",\"limit\":1,\"placeholder\":\"上传\",\"fileName\":\"image\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/upload-img.txt\",\"listType\":\"picture-card\"},\"model\":\"fengmiantu\",\"key\":\"uploadImg_1692510722330\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[{\"type\":\"switch\",\"label\":\"VIP课程\",\"options\":{\"defaultValue\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"switch\",\"key\":\"switch_1692518719134\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692518723899\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1017,'1','player.html',NULL,'0',NULL,'2023-08-20 13:48:52'),

(20,'视频内容模型','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传文件\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":true,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"http://cdn.kcz66.com/uploadFile.txt\",\"placeholder\":\"上传\"},\"model\":\"video\",\"key\":\"uploadFile_1692510656415\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1692511399903\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1017,'1','player.html',NULL,'0',NULL,'2023-08-20 13:50:24'),

(21,'导航栏栏目','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1017,'1','channel-video.html',NULL,'0',NULL,'2023-08-20 16:30:52'),

(22,'图片模型',NULL,NULL,'content',1016,'1','single-blog.html',NULL,'0',NULL,'2023-09-05 16:57:55'),

(23,'配件','{\"list\":[{\"type\":\"switch\",\"label\":\"是否有图\",\"options\":{\"defaultValue\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"switch_1697351862779\",\"key\":\"switch_1697351862779\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1019,'1',NULL,NULL,'0',NULL,'2023-10-14 23:32:50'),

(24,'配件信息','{\"list\":[{\"type\":\"grid\",\"label\":\"栅格布局\",\"columns\":[{\"span\":12,\"list\":[{\"type\":\"input\",\"label\":\"价格\",\"options\":{\"type\":\"number\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1697297602675\",\"key\":\"input_1697297602675\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]},{\"type\":\"textarea\",\"label\":\"图片链接\",\"icon\":\"icon-edit\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"textarea_1697352178357\",\"key\":\"textarea_1697352178357\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]},{\"span\":12,\"list\":[{\"type\":\"textarea\",\"label\":\"商品链接\",\"icon\":\"icon-edit\",\"options\":{\"width\":\"100%\",\"minRows\":4,\"maxRows\":6,\"maxLength\":null,\"defaultValue\":\"\",\"clearable\":false,\"showLabel\":true,\"hidden\":false,\"disabled\":false,\"placeholder\":\"请输入\"},\"model\":\"textarea_1697352088708\",\"key\":\"textarea_1697352088708\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}]}],\"options\":{\"noFormItem\":true,\"gutter\":0},\"key\":\"grid_1697297608341\"}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1019,'1',NULL,NULL,'0',NULL,'2023-10-14 23:33:16'),

(25,'测试','{\"list\":[{\"type\":\"input\",\"label\":\"输入框\",\"options\":{\"type\":\"text\",\"width\":\"100%\",\"defaultValue\":\"\",\"placeholder\":\"请输入\",\"clearable\":false,\"maxLength\":null,\"addonBefore\":\"\",\"addonAfter\":\"\",\"showLabel\":true,\"hidden\":false,\"disabled\":false},\"model\":\"input_1701848262175\",\"key\":\"input_1701848262175\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1018,'1',NULL,NULL,'0',NULL,'2023-12-06 15:37:40'),

(26,'演示站图片','{\"list\":[],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'channel',1016,'0','news.html',NULL,'0',NULL,'2024-03-21 16:07:12'),

(27,'演示站视频','{\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传视频\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":false,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"\",\"placeholder\":\"上传\"},\"model\":\"video\",\"key\":\"uploadFile_1711014936883\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'0','video-content.html',NULL,'0',NULL,'2024-03-21 17:55:08'),

(28,'文件下载','{\"list\":[{\"type\":\"uploadFile\",\"label\":\"上传文件\",\"options\":{\"defaultValue\":\"[]\",\"multiple\":false,\"disabled\":false,\"showLabel\":true,\"hidden\":false,\"drag\":false,\"downloadWay\":\"a\",\"dynamicFun\":\"\",\"width\":\"100%\",\"limit\":1,\"data\":\"{}\",\"fileName\":\"file\",\"headers\":{},\"action\":\"\",\"placeholder\":\"上传\"},\"model\":\"download\",\"key\":\"uploadFile_1711333287170\",\"help\":\"\",\"rules\":[{\"required\":false,\"message\":\"必填项\"}]}],\"config\":{\"layout\":\"horizontal\",\"labelCol\":{\"xs\":4,\"sm\":4,\"md\":4,\"lg\":4,\"xl\":4,\"xxl\":4},\"labelWidth\":100,\"labelLayout\":\"flex\",\"wrapperCol\":{\"xs\":18,\"sm\":18,\"md\":18,\"lg\":18,\"xl\":18,\"xxl\":18},\"hideRequiredMark\":false,\"customStyle\":\"\"}}',NULL,'content',1016,'1',NULL,NULL,'0',NULL,'2024-03-25 10:18:26');

/*Table structure for table `cms_model_item` */

DROP TABLE IF EXISTS `cms_model_item`;

CREATE TABLE `cms_model_item` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `label_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名字',
  `attr_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '组件类型',
  `model_id` int NOT NULL COMMENT '模型id',
  `place_holder` varchar(100) DEFAULT NULL COMMENT '提示',
  `field` varchar(100) DEFAULT NULL COMMENT '字段名称',
  `sort_num` int DEFAULT NULL COMMENT '排序字段',
  `content` text COMMENT '属性详情',
  `create_by` varchar(30) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(30) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模型字段表';

/*Data for the table `cms_model_item` */

/*Table structure for table `cms_sensitive` */

DROP TABLE IF EXISTS `cms_sensitive`;

CREATE TABLE `cms_sensitive` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sensitive_word` varchar(30) DEFAULT NULL COMMENT '敏感词',
  `replace_word` varchar(30) DEFAULT NULL COMMENT '替换词',
  `create_by` varchar(10) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(10) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `state` char(2) DEFAULT NULL COMMENT '0启用 1取消',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `contentSensitive` (`sensitive_word`)
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='敏感词';

/*Data for the table `cms_sensitive` */

insert  into `cms_sensitive`(`id`,`sensitive_word`,`replace_word`,`create_by`,`create_time`,`update_by`,`update_time`,`state`) values

(1001,'国家级','***',NULL,'2023-07-06 14:13:22',NULL,'2023-07-06 14:17:48','Y'),

(1002,'宇宙级','***',NULL,'2023-07-06 14:22:28',NULL,NULL,'Y'),

(1003,'畜生','***',NULL,'2023-07-06 14:23:01',NULL,NULL,'Y');

/*Table structure for table `cms_sensitive_log` */

DROP TABLE IF EXISTS `cms_sensitive_log`;

CREATE TABLE `cms_sensitive_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sensitive_word` varchar(50) DEFAULT NULL COMMENT '敏感词',
  `content_id` int DEFAULT NULL COMMENT '内容表id',
  `sensitive_id` int DEFAULT NULL COMMENT '敏感词id',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_sensitive_log` */

insert  into `cms_sensitive_log`(`id`,`sensitive_word`,`content_id`,`sensitive_id`,`create_by`,`create_time`) values

(5,'宇宙级',75,NULL,NULL,'2023-07-06 17:09:25'),

(6,'煞笔',75,NULL,NULL,'2023-07-06 17:09:25');

/*Table structure for table `cms_site` */

DROP TABLE IF EXISTS `cms_site`;

CREATE TABLE `cms_site` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int DEFAULT NULL COMMENT '父级站点',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `directory` varchar(50) DEFAULT NULL COMMENT '站点目录',
  `domain_name` varchar(100) DEFAULT NULL COMMENT '域名',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `request_method` varchar(6) DEFAULT NULL COMMENT '请求协议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='站点表';

/*Data for the table `cms_site` */

insert  into `cms_site`(`id`,`parent_id`,`name`,`directory`,`domain_name`,`create_by`,`create_time`,`update_by`,`update_time`,`request_method`) values

(1016,0,'正易云CMS演示站','www','192.168.10.124:8083',NULL,'2023-08-16 17:07:05',NULL,'2024-03-25 15:59:20','http');

/*Table structure for table `cms_site_setup` */

DROP TABLE IF EXISTS `cms_site_setup`;

CREATE TABLE `cms_site_setup` (
  `site_id` int NOT NULL COMMENT '站点id',
  `site_static` char(2) DEFAULT '1' COMMENT '站点静态化',
  `site_favicon` varchar(100) DEFAULT NULL COMMENT '站点ico',
  `site_logo` varchar(100) DEFAULT NULL COMMENT '站点logo',
  `site_grayscale` char(2) DEFAULT '1' COMMENT '网站灰度',
  `site_adaption` char(2) DEFAULT '1' COMMENT '屏幕自适应',
  `site_stop` char(2) DEFAULT '0' COMMENT '站点状态',
  `site_home_path` varchar(100) DEFAULT NULL COMMENT '首页模板路径',
  `site_seo_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'seo标题',
  `site_seo_desc` varchar(300) DEFAULT NULL COMMENT 'seo描述',
  `site_seo_keywords` varchar(100) DEFAULT NULL COMMENT 'seo关键字',
  `site_temp_scheme_pc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'PC端模板方案',
  `site_temp_scheme_mobile` varchar(50) DEFAULT NULL COMMENT '移动端模板方案',
  `site_temp_style` varchar(50) DEFAULT NULL COMMENT '站点风格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='站点设置';

/*Data for the table `cms_site_setup` */

insert  into `cms_site_setup`(`site_id`,`site_static`,`site_favicon`,`site_logo`,`site_grayscale`,`site_adaption`,`site_stop`,`site_home_path`,`site_seo_title`,`site_seo_desc`,`site_seo_keywords`,`site_temp_scheme_pc`,`site_temp_scheme_mobile`,`site_temp_style`) values

(1016,'1','/profile/upload/2023/09/20/favicon (5)_20230920173100A001.ico','/profile/upload/2024/03/25/zyycms_logo_20240325155918A005.png','1','1','0','index.html',NULL,NULL,NULL,'default','default','');

/*Table structure for table `cms_template` */

DROP TABLE IF EXISTS `cms_template`;

CREATE TABLE `cms_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `temp_name` varchar(20) DEFAULT NULL COMMENT '模板名称',
  `temp_text` text COMMENT '模板内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='模板表';

/*Data for the table `cms_template` */

/*Table structure for table `cms_visitor_log` */

DROP TABLE IF EXISTS `cms_visitor_log`;

CREATE TABLE `cms_visitor_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ip` varchar(30) DEFAULT NULL COMMENT 'ip地址',
  `os` varchar(30) DEFAULT NULL COMMENT '操作系统',
  `cookie` varchar(60) DEFAULT NULL COMMENT 'cookie',
  `page_path` varchar(200) DEFAULT NULL COMMENT '页面路径',
  `site_id` int NOT NULL COMMENT '站点id',
  `create_time` datetime DEFAULT NULL COMMENT '访问时间',
  `region` varchar(10) DEFAULT NULL COMMENT '省份',
  `city` varchar(10) DEFAULT NULL COMMENT '城市',
  `channel_id` int DEFAULT NULL COMMENT '栏目id',
  `content_id` int DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3393 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cms_visitor_log` */

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'cms_attr','自定义属性表',NULL,NULL,'CmsAttr','crud','com.ruoyi.web','web','attr','自定义属性','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-06-20 16:55:58','','2023-06-20 17:09:07',NULL),

(2,'cms_channel','栏目表',NULL,NULL,'CmsChannel','crud','com.ruoyi.web','web','channel','栏目','hnzyy sun','0','/','{\"parentMenuId\":2002}','admin','2023-06-20 16:55:58','','2023-06-20 17:07:35',NULL),

(3,'cms_content','文章表',NULL,NULL,'CmsContent','crud','com.ruoyi.web','web','content','文章管理','ruoyi','0','/','{\"parentMenuId\":2001}','admin','2023-06-20 16:55:58','','2023-06-20 17:08:30',NULL),

(4,'cms_link_sort','友情链接分类',NULL,NULL,'CmsLinkSort','crud','com.ruoyi.web','web','sort','友情链接分类','hnzyy sun','0','/','{\"parentMenuId\":2004}','admin','2023-06-20 16:55:58','','2023-06-20 17:06:40',NULL),

(5,'cms_links','友情链接',NULL,NULL,'CmsLinks','crud','com.ruoyi.web','web','links','友情链接','hnzyy sun','0','/','{\"parentMenuId\":2004}','admin','2023-06-20 16:55:58','','2023-06-20 17:05:45',NULL),

(6,'cms_model','模型表',NULL,NULL,'CmsModel','crud','com.ruoyi.web','web','model','模型','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-06-20 16:55:58','','2023-06-20 17:05:14',NULL),

(7,'cms_template','模板表',NULL,NULL,'CmsTemplate','crud','com.ruoyi.web','web','template','模板','hnzyy sun','0','/','{\"parentMenuId\":2000}','admin','2023-06-20 16:55:58','','2023-06-20 17:04:21',NULL),

(8,'cms_model_item','模型字段表',NULL,NULL,'CmsModelItem','crud','com.ruoyi.web','model','modelItem','自定义模型字段','hnzyy sun','0','/','{}','admin','2023-06-26 10:51:47','','2023-06-26 10:54:18',NULL),

(9,'cms_site','站点表',NULL,NULL,'CmsSite','crud','com.ruoyi.web','web','site','站点','hnzyy sun','0','/','{\"parentMenuId\":2053}','admin','2023-07-03 17:22:57','','2023-07-03 17:27:07',NULL),

(10,'cms_sensitive','敏感词',NULL,NULL,'CmsSensitive','crud','com.ruoyi.web','web','sensitive','敏感词','hnzyy sun','0','/','{\"parentMenuId\":2060}','admin','2023-07-06 11:45:57','','2023-07-06 11:48:53',NULL),

(11,'sys_role_channel','角色栏目权限',NULL,NULL,'SysRoleChannel','crud','com.ruoyi.system','system','channel','角色栏目权限','ruoyi','0','/',NULL,'admin','2023-07-10 16:52:11','',NULL,NULL),

(12,'sys_role_site','角色站点权限',NULL,NULL,'SysRoleSite','crud','com.ruoyi.system','system','site','角色站点权限','ruoyi','0','/',NULL,'admin','2023-07-10 16:52:11','',NULL,NULL),

(13,'cms_content_txt','文章内容',NULL,NULL,'CmsContentTxt','crud','com.ruoyi.web','system','txt','文章内容','hnzyy sun','0','/','{}','admin','2023-07-20 16:31:10','','2023-07-20 16:33:33',NULL),

(14,'cms_site_setup','站点设置',NULL,NULL,'CmsSiteSetup','crud','com.ruoyi.web','web','siteSetup','站点设置','hnzyy sun','0','/','{}','admin','2023-08-03 15:27:00','','2023-08-03 15:28:24',NULL),

(15,'sys_role_cms','cms角色权限',NULL,NULL,'SysRoleCms','crud','com.ruoyi.web','system','cms','cms角色权限','hnzyy sun','0','/','{}','admin','2023-08-04 14:42:45','','2023-08-04 14:45:05',NULL),

(16,'cms_visitor_log','访客记录',NULL,NULL,'CmsVisitorLog','crud','com.zyy.web','web','log','visitorLog','hnzyy sun','0','/','{}','admin','2023-08-18 14:54:59','','2023-08-18 14:56:26',NULL),

(17,'cms_content_type','内容类型表',NULL,NULL,'CmsContentType','crud','com.zyy.web','web','contentType','内容类型','hnzyy sun','0','/','{\"parentMenuId\":2003}','admin','2023-09-05 17:07:32','','2023-09-05 17:08:53',NULL),

(18,'cms_donate','捐赠记录表',NULL,NULL,'CmsDonate','crud','com.zyy.web','web','donate','捐赠记录','hnzyy sun','0','/','{\"parentMenuId\":2084}','admin','2023-11-06 11:21:24','','2023-11-06 11:23:26',NULL),

(19,'cms_config','系统配置表',NULL,NULL,'CmsConfig','crud','com.zyy.web','web','config','系统配置','hnzyy','0','/','{\"parentMenuId\":2088}','admin','2023-11-10 16:10:39','','2023-11-10 16:12:18',NULL),

(20,'cms_message','消息内容表',NULL,NULL,'CmsMessage','crud','com.zyy.web','web','message','消息内容','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:01:35',NULL),

(21,'cms_message_template','消息通知模板',NULL,NULL,'CmsMessageTemplate','crud','com.zyy.web','web','messageTemplate','消息通知模板','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:03:42',NULL),

(22,'cms_message_user','人员消息状态',NULL,NULL,'CmsMessageUser','crud','com.zyy.web','web','messageUser','人员消息状态','hnzyy','0','/','{}','admin','2023-11-14 15:59:31','','2023-11-14 16:04:14',NULL),

(23,'cms_template_style','网站风格',NULL,NULL,'CmsTemplateStyle','crud','com.zyy.web','web','style','网站风格','hnzyy','0','/','{\"parentMenuId\":2000}','admin','2023-11-21 14:50:37','','2023-11-21 14:52:21',NULL),

(24,'sys_security_config','安全配置',NULL,NULL,'SysSecurityConfig','crud','com.zyy.system','system','securitConfig','安全配置','hnzyy','0','/','{\"parentMenuId\":1}','admin','2023-12-13 14:44:40','','2023-12-13 14:46:39',NULL),

(25,'cms_files','文件上传表',NULL,NULL,'CmsFiles','crud','com.zyy.web','web','files','资源库','hnzyy','0','/','{\"parentMenuId\":2001}','admin','2023-12-19 11:38:56','','2023-12-19 11:40:42',NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values

(1,'1','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

(2,'1','attr_name','属性名称','varchar(100)','String','attrName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

(3,'1','attr_value','属性值','varchar(100)','String','attrValue','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

(4,'1','content_id','内容id','int','Long','contentId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:09:07'),

(5,'2','channel_id','id','int','Long','channelId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(6,'2','parent_id','父级id','int','Long','parentId','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(7,'2','channel_name','栏目名称','varchar(50)','String','channelName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(8,'2','path','访问链接','varchar(20)','String','path','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(9,'2','external_link','外部链接','varchar(150)','String','externalLink','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(10,'2','order_num','排序','int','Long','orderNum','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(11,'2','temp_id','模板','varchar(100)','String','tempId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(12,'2','stage','状态','int','Long','stage','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(13,'2','create_time','创建时间','date','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-06-20 16:55:58','','2023-06-20 17:07:35'),

(14,'3','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(15,'3','title','文章名字','varchar(200)','String','title','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(16,'3','channel_id','栏目id','int','Long','channelId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(17,'3','model_id','模型id','int','Long','modelId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(18,'3','text','文章内容','text','String','text','0','0',NULL,'1','1','1','1','EQ','editor','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(19,'3','views','浏览量','int','Long','views','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(20,'3','stage','0:已发布 1:下线','int','Long','stage','0','0','1','1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(21,'3','release_time','发布时间','datetime','Date','releaseTime','0','0',NULL,'1','1','1','1','EQ','datetime','',8,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(22,'3','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-06-20 16:55:58','','2023-06-20 17:08:30'),

(23,'4','id','友情链接分类id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

(24,'4','name','分类名称','varchar(100)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

(25,'4','type','分类类型(1文字 2图片)','int','Long','type','0','0',NULL,'1','1','1','1','EQ','select','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

(26,'4','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:06:40'),

(27,'5','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(28,'5','link_name','友情链接名称','varchar(100)','String','linkName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(29,'5','link_src','友情链接图片','varchar(100)','String','linkSrc','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(30,'5','link_url','友情链接地址','varchar(150)','String','linkUrl','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(31,'5','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(32,'5','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(33,'5','link_sort_id','分类id','int','Long','linkSortId','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:45'),

(34,'6','model_id','主键','int','Long','modelId','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

(35,'6','model_name','模型名称','varchar(20)','String','modelName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

(36,'6','model_code','自定义模型代码(前台)','text','String','modelCode','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

(37,'6','model_code_admin','自定义模型代码(后台)','text','String','modelCodeAdmin','0','0',NULL,'1','1','1','1','EQ','textarea','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

(38,'6','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-06-20 16:55:58','','2023-06-20 17:05:14'),

(39,'7','id',NULL,'int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

(40,'7','temp_name','模板名称','varchar(20)','String','tempName','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

(41,'7','temp_text','模板内容','text','String','tempText','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

(42,'7','create_date','创建时间','datetime','Date','createDate','0','0',NULL,'1','1','1','1','EQ','datetime','',4,'admin','2023-06-20 16:55:58','','2023-06-20 17:04:21'),

(43,'8','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(44,'8','label_name','标签名字','varchar(100)','String','labelName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(45,'8','attr_type','组件类型','varchar(100)','String','attrType','0','0','1','1','1','1','1','EQ','select','',3,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(46,'8','model_id','模型id','int','Long','modelId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(47,'8','place_holder','提示','varchar(100)','String','placeHolder','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(48,'8','field','字段名称','varchar(100)','String','field','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(49,'8','sort_num','排序字段','int','Long','sortNum','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(50,'8','content','属性详情','text','String','content','0','0',NULL,'1','1','1','1','EQ','editor','',8,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(51,'8','create_by','创建人','varchar(30)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',9,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(52,'8','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(53,'8','update_by','修改人','varchar(30)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',11,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(54,'8','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',12,'admin','2023-06-26 10:51:47','','2023-06-26 10:54:18'),

(55,'9','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(56,'9','name','站点名称','varchar(100)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(57,'9','directory','站点目录','varchar(50)','String','directory','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(58,'9','domain_name','域名','varchar(100)','String','domainName','0','0',NULL,'1','1','1','1','LIKE','input','',4,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(59,'9','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(60,'9','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(61,'9','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(62,'9','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-07-03 17:22:57','','2023-07-03 17:27:07'),

(63,'10','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(64,'10','sensitive_word','敏感词','varchar(30)','String','sensitiveWord','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(65,'10','replace_word','替换词','varchar(30)','String','replaceWord','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(66,'10','create_by','创建人','varchar(10)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',4,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(67,'10','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(68,'10','update_by','修改人','varchar(10)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(69,'10','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(70,'10','state','0启用 1取消','int','Long','state','0','0',NULL,'1','1','1','1','EQ','radio','sys_yes_no',8,'admin','2023-07-06 11:45:57','','2023-07-06 11:48:53'),

(71,'11','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-07-10 16:52:11','',NULL),

(72,'11','channel_id','栏目id','int','Long','channelId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-10 16:52:11','',NULL),

(73,'12','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-07-10 16:52:11','',NULL),

(74,'12','site_id','站点id','int','Long','siteId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-10 16:52:11','',NULL),

(75,'13','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

(76,'13','content_id','文章表id','int','Long','contentId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

(77,'13','text','内容','longtext','String','text','0','0',NULL,'1','1','1','1','EQ','textarea','',3,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

(78,'13','attr_key','字段','varchar(20)','String','attrKey','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-07-20 16:31:10','','2023-07-20 16:33:33'),

(79,'14','site_id','站点id','int','Long','siteId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(80,'14','site_static','站点静态化','int','Long','siteStatic','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(81,'14','site_favicon','站点ico','varchar(100)','String','siteFavicon','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(82,'14','site_logo','站点logo','varchar(100)','String','siteLogo','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(83,'14','site_grayscale','网站灰度','int','Long','siteGrayscale','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(84,'14','site_adaption','屏幕自适应','int','Long','siteAdaption','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(85,'14','site_stop','站点状态','int','Long','siteStop','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(86,'14','site_home_path','首页模板路径','varchar(100)','String','siteHomePath','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(87,'14','site_seo_tilte','seo标题','varchar(100)','String','siteSeoTilte','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(88,'14','site_seo_desc','seo描述','varchar(300)','String','siteSeoDesc','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(89,'14','site_seo_keywords','seo关键字','varchar(100)','String','siteSeoKeywords','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-08-03 15:27:00','','2023-08-03 15:28:24'),

(90,'15','role_id','角色id','int','Long','roleId','0','0','1','1','1','1','1','EQ','input','',1,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

(91,'15','property_id','属性id','int','Long','propertyId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

(92,'15','property_type','属性类型','varchar(10)','String','propertyType','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-08-04 14:42:45','','2023-08-04 14:45:05'),

(93,'16','id','id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

(94,'16','ip','ip地址','varchar(30)','String','ip','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

(95,'16','os','操作系统','varchar(30)','String','os','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

(96,'16','create_time','访问时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2023-08-18 14:54:59','','2023-08-18 14:56:26'),

(97,'17','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(98,'17','name','内容类型名称','varchar(30)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(99,'17','ico','类型图标','varchar(100)','String','ico','0','0',NULL,'1','1','1','1','EQ','imageUpload','',3,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(100,'17','create_by','创建人','varchar(30)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',4,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(101,'17','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',5,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(102,'17','update_by','修改人','varchar(30)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',6,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(103,'17','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',7,'admin','2023-09-05 17:07:32','','2023-09-05 17:08:53'),

(104,'18','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(105,'18','name','姓名/单位','varchar(30)','String','name','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(106,'18','money','捐赠金额','double(9,2)','BigDecimal','money','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(107,'18','porject_id','捐赠项目','int','Long','porjectId','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(108,'18','phone','手机号','varchar(11)','String','phone','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(109,'18','enrollment_year','入学年份','year','String','enrollmentYear','0','0',NULL,'1','1','1','1','EQ',NULL,'',6,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(110,'18','speciality','专业','varchar(20)','String','speciality','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(111,'18','is_show_name','是否公开姓名','char(1)','String','isShowName','0','0',NULL,'1','1','1','1','LIKE','input','',8,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(112,'18','message','留言','varchar(200)','String','message','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(113,'18','is_pay','是否已经支付','char(1)','String','isPay','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(114,'18','create_time','捐赠创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(115,'18','pay_time','捐赠时间','datetime','Date','payTime','0','0',NULL,'1','1','1','1','EQ','datetime','',12,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(116,'18','certificate','电子证书路径','varchar(200)','String','certificate','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2023-11-06 11:21:24','','2023-11-06 11:23:26'),

(117,'19','id','id','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

(118,'19','config_key','键','varchar(50)','String','configKey','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

(119,'19','config_value','值','varchar(100)','String','configValue','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:18'),

(120,'19','category','分类','varchar(50)','String','category','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(121,'19','remark','备注','varchar(100)','String','remark','0','0',NULL,'1','1','1',NULL,'EQ','input','',5,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(122,'19','sort','排序','int','Long','sort','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(123,'19','delete_flag','是否删除','int','Long','deleteFlag','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(124,'19','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(125,'19','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(126,'19','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(127,'19','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-10 16:10:39','','2023-11-10 16:12:19'),

(128,'20','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(129,'20','title','标题','varchar(200)','String','title','0','0',NULL,'1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(130,'20','content','内容','varchar(500)','String','content','0','0',NULL,'1','1','1','1','EQ','editor','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(131,'20','recipient_type','接收人类型(1全部消息 2组织消息 3人员消息)','int','Long','recipientType','0','0',NULL,'1','1','1','1','EQ','select','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(132,'20','org_id','部门id','int','Long','orgId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(133,'20','user_id','人员id','int','Long','userId','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(134,'20','send_name','发送人名称','varchar(20)','String','sendName','0','0',NULL,'1','1','1','1','LIKE','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(135,'20','create_by','创建人','varchar(10)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(136,'20','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(137,'20','update_by','修改人','varchar(10)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',10,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(138,'20','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',11,'admin','2023-11-14 15:59:31','','2023-11-14 16:01:35'),

(139,'21','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(140,'21','msg_code','消息模板唯一编码','varchar(30)','String','msgCode','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(141,'21','msg_name','消息模板标题','varchar(50)','String','msgName','0','0','1','1','1','1','1','LIKE','input','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(142,'21','msg_desc','消息模板描述','varchar(100)','String','msgDesc','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(143,'21','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(144,'21','mail_open','邮件通知开关','char(2)','String','mailOpen','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(145,'21','mail_title','邮件名称','varchar(50)','String','mailTitle','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(146,'21','mail_text','邮件内容','varchar(255)','String','mailText','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(147,'21','msg_open','站内信开关','char(2)','String','msgOpen','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(148,'21','msg_title','站内信标题','varchar(50)','String','msgTitle','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(149,'21','msg_text','站内信内容','varchar(255)','String','msgText','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(150,'21','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',12,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(151,'21','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',13,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(152,'21','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',14,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(153,'21','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',15,'admin','2023-11-14 15:59:31','','2023-11-14 16:03:42'),

(154,'22','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(155,'22','msg_id','消息ID','int','Long','msgId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(156,'22','user_id','用户id','int','Long','userId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(157,'22','state','状态(0已读 1删除)','int','Long','state','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(158,'22','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',5,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(159,'22','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',6,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(160,'22','update_by','修改人','varchar(20)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',7,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(161,'22','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',8,'admin','2023-11-14 15:59:31','','2023-11-14 16:04:14'),

(162,'23','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(163,'23','name','主题名称','varchar(50)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(164,'23','temp_suffix','模板后缀名称','varchar(50)','String','tempSuffix','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(165,'23','cover_img','主题封面图','varchar(200)','String','coverImg','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(166,'23','site_id','站点id','int','Long','siteId','0','0',NULL,'1','1','1','1','EQ','input','',5,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(167,'23','state','是否启用(0启用 1禁用)','char(2)','String','state','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(168,'23','create_by','创建人','varchar(50)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',7,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(169,'23','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(170,'23','update_by','修改人','varchar(50)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',9,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(171,'23','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',10,'admin','2023-11-21 14:50:37','','2023-11-21 14:52:21'),

(172,'24','id','主键','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(173,'24','stage','状态','char(2)','String','stage','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(174,'24','password_len_min','密码最小长度','int','Long','passwordLenMin','0','0','1','1','1','1','1','EQ','input','',3,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(175,'24','password_len_max','密码最大长度','int','Long','passwordLenMax','0','0',NULL,'1','1','1','1','EQ','input','',4,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(176,'24','password_rule','密码校验规则','varchar(50)','String','passwordRule','0','0','1','1','1','1','1','EQ','input','',5,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(177,'24','password_sensitive','密码不可包含的敏感信息','varchar(255)','String','passwordSensitive','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(178,'24','weak_passwords','弱密码集合','varchar(500)','String','weakPasswords','0','0',NULL,'1','1','1','1','EQ','textarea','',7,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(179,'24','force_modify_pwd_after_add','后台添加的用户首次登陆是否需要强制修改密码','char(2)','String','forceModifyPwdAfterAdd','0','0','1','1','1','1','1','EQ','input','',8,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(180,'24','force_modify_pwd_after_reset','后台重置密码后首次登陆是否需要强制修改密码','char(2)','String','forceModifyPwdAfterReset','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(181,'24','password_expire_seconds','密码有效期（单位：秒）','int','Long','passwordExpireSeconds','0','0','1','1','1','1','1','EQ','input','',10,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(182,'24','password_retry_limit','密码错误次数阈值','int','Long','passwordRetryLimit','0','0','1','1','1','1','1','EQ','input','',11,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(183,'24','password_retry_strategy','密码错误次数阈值触发后的处理策略','varchar(20)','String','passwordRetryStrategy','0','0','1','1','1','1','1','EQ','input','',12,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(184,'24','password_retry_lock_seconds','密码错误阈值触发锁定账号时长，单位：秒','int','Long','passwordRetryLockSeconds','0','0','1','1','1','1','1','EQ','input','',13,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(185,'24','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(186,'24','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',15,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(187,'24','update_by','修改人','varchar(20)','String','updateBy','0','0',NULL,'1','1',NULL,NULL,'EQ','input','',16,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(188,'24','update_time','修改时间','datetime','Date','updateTime','0','0',NULL,'1','1',NULL,NULL,'EQ','datetime','',17,'admin','2023-12-13 14:44:40','','2023-12-13 14:46:39'),

(189,'25','id','主键','int','Long','id','1','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(190,'25','user_id','用户id','int','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(191,'25','share_status','共享状态（0已分享 1未分享）','char(2)','String','shareStatus','0','0','1','1','1','1','1','EQ','radio','',3,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(192,'25','resource_size','文件大小','int','Long','resourceSize','0','0','1','1','1','1','1','EQ','input','',4,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(193,'25','resource_type','文件类型','char(2)','String','resourceType','0','0',NULL,'1','1','1','1','EQ','select','',5,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(194,'25','resource_url','文件路径','varchar(100)','String','resourceUrl','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(195,'25','resource_dimensions','图片尺寸','varchar(20)','String','resourceDimensions','0','0',NULL,'1','1','1','1','EQ','input','',7,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(196,'25','resource_date','视频时长（单位/秒）','int','Long','resourceDate','0','0',NULL,'1','1','1','1','EQ','input','',8,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(197,'25','resource_alias','文件别名','varchar(20)','String','resourceAlias','0','0',NULL,'1','1','1','1','EQ','input','',9,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(198,'25','upload_oss_id','上传云存储ID','int','Long','uploadOssId','0','0',NULL,'1','1','1','1','EQ','input','',10,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(199,'25','suffix','后缀名','varchar(10)','String','suffix','0','0',NULL,'1','1','1','1','EQ','input','',11,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(200,'25','video_cover_id','视频抽帧id','int','Long','videoCoverId','0','0',NULL,'1','1','1','1','EQ','input','',12,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(201,'25','is_display','是否显示在资源库','char(2)','String','isDisplay','0','0',NULL,'1','1','1','1','EQ','input','',13,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(202,'25','create_by','创建人','varchar(20)','String','createBy','0','0',NULL,'1',NULL,NULL,NULL,'EQ','input','',14,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(203,'25','create_time','创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',15,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42'),

(204,'25','is_delete','是否删除（0未删除 1已删除）','char(2)','String','isDelete','0','0',NULL,'1','1','1','1','EQ','input','',16,'admin','2023-12-19 11:38:56','','2023-12-19 11:40:42');

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2023-06-20 14:47:30','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),

(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-06-20 14:47:30','',NULL,'初始化密码 123456'),

(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2023-06-20 14:47:30','',NULL,'深色主题theme-dark，浅色主题theme-light'),

(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2023-06-20 14:47:30','admin','2023-12-14 17:08:17','是否开启验证码功能（true开启，false关闭）'),

(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-06-20 14:47:30','',NULL,'是否开启注册用户功能（true开启，false关闭）'),

(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-06-20 14:47:30','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values

(100,0,'0','正易云科技',0,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(101,100,'0,100','郑州总公司',1,'','15888888888','','0','0','admin','2023-06-20 14:47:29','admin','2024-01-24 17:51:07'),

(102,100,'0,100','长沙分公司',2,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL),

(103,101,'0,100,101','研发部门',1,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(104,101,'0,100,101','市场部门',2,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(105,101,'0,100,101','测试部门',3,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(106,101,'0,100,101','财务部门',4,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(107,101,'0,100,101','运维部门',5,'','15888888888','','0','0','admin','2023-06-20 14:47:29','',NULL),

(108,102,'0,100,102','市场部门',1,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL),

(109,102,'0,100,102','财务部门',2,'','15888888888','','0','2','admin','2023-06-20 14:47:29','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-06-20 14:47:30','',NULL,'性别男'),

(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-06-20 14:47:30','',NULL,'性别女'),

(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-06-20 14:47:30','',NULL,'性别未知'),

(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'显示菜单'),

(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'隐藏菜单'),

(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-06-20 14:47:30','',NULL,'默认分组'),

(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-06-20 14:47:30','',NULL,'系统分组'),

(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'系统默认是'),

(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'系统默认否'),

(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-06-20 14:47:30','',NULL,'通知'),

(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-06-20 14:47:30','',NULL,'公告'),

(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'关闭状态'),

(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'其他操作'),

(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'新增操作'),

(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-06-20 14:47:30','',NULL,'修改操作'),

(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'删除操作'),

(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-06-20 14:47:30','',NULL,'授权操作'),

(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'导出操作'),

(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'导入操作'),

(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'强退操作'),

(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-06-20 14:47:30','',NULL,'生成操作'),

(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'清空操作'),

(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-06-20 14:47:30','',NULL,'正常状态'),

(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-06-20 14:47:30','',NULL,'停用状态'),

(100,1,'显示','0','cms_channel_stage',NULL,'success','N','0','admin','2023-06-21 11:25:16','',NULL,NULL),

(101,2,'隐藏','1','cms_channel_stage',NULL,'danger','N','0','admin','2023-06-21 11:25:37','admin','2023-06-21 11:25:44',NULL),

(102,1,'已发布','0','cms_content_stage',NULL,'success','N','0','admin','2023-06-21 15:25:35','',NULL,NULL),

(103,2,'已下线','1','cms_content_stage',NULL,'primary','N','0','admin','2023-06-21 15:26:08','admin','2023-08-24 16:58:21',NULL),

(104,1,'文字','0','cms_link_type',NULL,'success','N','0','admin','2023-06-28 10:47:35','',NULL,NULL),

(105,2,'图片','1','cms_link_type',NULL,'primary','N','0','admin','2023-06-28 10:47:53','admin','2023-06-28 10:48:15',NULL),

(106,1,'启用','0','cms_setup_stage',NULL,'default','N','0','admin','2023-08-03 16:38:44','admin','2023-08-03 16:39:14',NULL),

(107,2,'停用','1','cms_setup_stage',NULL,'default','N','0','admin','2023-08-03 16:39:26','admin','2023-08-03 17:18:18',NULL),

(108,1,'按发布时间升序','1','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:22:37','admin','2023-08-18 14:27:14',NULL),

(109,2,'按发布时间倒序','2','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:22:53','admin','2023-08-18 14:27:23',NULL),

(110,3,'按访问量升序','3','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:23:23','admin','2023-08-18 14:27:32',NULL),

(111,4,' 按访问量倒序','4','cms_content_order',NULL,'default','N','0','admin','2023-08-18 14:23:37','admin','2023-08-18 14:27:39',NULL),

(112,3,'待审核','2','cms_content_stage',NULL,'info','N','0','admin','2023-08-24 16:57:27','',NULL,NULL),

(113,4,'已退回','3','cms_content_stage',NULL,'danger','N','0','admin','2023-08-24 16:58:09','admin','2023-08-24 16:58:26',NULL),

(114,5,'草稿','4','cms_content_stage',NULL,'warning','N','0','admin','2023-08-29 09:50:11','',NULL,NULL),

(115,0,'按默认排序','0','cms_content_order',NULL,'default','N','0','admin','2023-10-16 17:38:24','',NULL,NULL),

(116,5,'按创建时间升序','5','cms_content_order',NULL,'default','N','0','admin','2023-10-17 10:13:12','',NULL,NULL),

(117,6,'按创建时间降序','6','cms_content_order',NULL,'default','N','0','admin','2023-10-17 10:13:27','',NULL,NULL),

(118,1,'左上','topLeft','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:07','',NULL,NULL),

(119,2,'中上','topCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:37','',NULL,NULL),

(120,3,'右上','topRight','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:17:57','',NULL,NULL),

(121,4,'左中','leftCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:18:48','',NULL,NULL),

(122,5,'居中','center','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:19:15','',NULL,NULL),

(123,6,'中右','rightCenter','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:19:59','',NULL,NULL),

(124,7,'左下','leftBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:20:46','',NULL,NULL),

(125,8,'中下','centerBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:21:07','',NULL,NULL),

(126,9,'右下','rightBottom','cms_water_mark_position',NULL,'default','N','0','admin','2023-12-12 18:21:31','',NULL,NULL),

(127,1,'不校验','NONE','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:35:28','',NULL,NULL),

(128,2,'必须包含字母、数字','LETTER_NUMBER','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:40:11','',NULL,'^(?=.*\\d+)(?=.*[A-Za-z]+)[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(129,3,'必须包含大小写字母、数字','UPPER_LOW_LETTER_NUMBER','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:42:22','admin','2023-12-13 16:42:26','^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(130,4,'必须包含字母、数字、特殊字符','LETTER_NUMBER_SPECIAL','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:42:50','admin','2023-12-13 16:42:54','^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(131,5,'必须包含大小写字母、数字、特殊字符','UPPER_LOW_LETTER_NUMBER_SPECIAL','sys_security_password_rule',NULL,'primary','N','0','admin','2023-12-13 16:43:45','',NULL,'^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-])[A-Za-z\\d!@#$%^&*?()\\[\\]{}:;,.\'\"~·+=_-]+$'),

(132,1,'用户名','ACCOUNT','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:52:14','admin','2023-12-13 16:53:31',NULL),

(133,2,'手机号','PHONE_NUMBER','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:53:27','',NULL,NULL),

(134,3,'Email','EMAIL','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:53:55','',NULL,NULL),

(135,4,'昵称全拼','NICK_NAME','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:54:11','',NULL,NULL),

(136,5,'真实姓名全拼','REAL_NAME','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:55:30','admin','2023-12-13 16:55:34',NULL),

(137,6,'生日（yyyyMMdd）','BIRTHDAY','sys_security_password_sensitive',NULL,'primary','N','0','admin','2023-12-13 16:56:02','',NULL,NULL),

(138,1,'全站模型','0','cms_model_display',NULL,'default','N','0','admin','2023-12-18 17:32:07','',NULL,NULL),

(139,2,'本站模型','1','cms_model_display',NULL,'default','N','0','admin','2023-12-18 17:32:20','',NULL,NULL),

(140,1,'本地服务器','0','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:54:40','',NULL,NULL),

(141,2,'阿里云OSS','1','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:54:49','',NULL,NULL),

(142,3,'腾讯云COS','2','cms_storage_location',NULL,'default','N','0','admin','2023-12-22 10:55:02','',NULL,NULL);

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'用户性别','sys_user_sex','0','admin','2023-06-20 14:47:30','',NULL,'用户性别列表'),

(2,'菜单状态','sys_show_hide','0','admin','2023-06-20 14:47:30','',NULL,'菜单状态列表'),

(3,'系统开关','sys_normal_disable','0','admin','2023-06-20 14:47:30','',NULL,'系统开关列表'),

(4,'任务状态','sys_job_status','0','admin','2023-06-20 14:47:30','',NULL,'任务状态列表'),

(5,'任务分组','sys_job_group','0','admin','2023-06-20 14:47:30','',NULL,'任务分组列表'),

(6,'系统是否','sys_yes_no','0','admin','2023-06-20 14:47:30','',NULL,'系统是否列表'),

(7,'通知类型','sys_notice_type','0','admin','2023-06-20 14:47:30','',NULL,'通知类型列表'),

(8,'通知状态','sys_notice_status','0','admin','2023-06-20 14:47:30','',NULL,'通知状态列表'),

(9,'操作类型','sys_oper_type','0','admin','2023-06-20 14:47:30','',NULL,'操作类型列表'),

(10,'系统状态','sys_common_status','0','admin','2023-06-20 14:47:30','',NULL,'登录状态列表'),

(100,'显示状态','cms_channel_stage','0','admin','2023-06-21 11:24:36','',NULL,NULL),

(101,'文章状态','cms_content_stage','0','admin','2023-06-21 15:24:56','',NULL,NULL),

(102,'友链分类类型','cms_link_type','0','admin','2023-06-28 10:47:14','',NULL,NULL),

(103,'功能设置状态','cms_setup_stage','0','admin','2023-08-03 16:38:23','',NULL,NULL),

(104,'文章排序方式','cms_content_order','0','admin','2023-08-18 14:22:15','',NULL,NULL),

(105,'水印位置','cms_water_mark_position','0','admin','2023-12-12 18:16:01','',NULL,NULL),

(106,'密码校验规则','sys_security_password_rule','0','admin','2023-12-13 16:31:35','',NULL,NULL),

(107,'密码敏感信息','sys_security_password_sensitive','0','admin','2023-12-13 16:51:43','',NULL,NULL),

(108,'模型范围','cms_model_display','0','admin','2023-12-18 17:31:50','',NULL,'模型可见范围'),

(109,'存储方式','cms_storage_location','0','admin','2023-12-22 10:53:51','admin','2023-12-22 10:54:16','文件存储方式（如 本机或OSS）');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,''),

(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,''),

(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-06-20 14:47:30','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=983 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values

(100,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-20 14:56:47'),

(101,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-20 16:41:01'),

(102,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 09:52:17'),

(103,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 11:09:53'),

(104,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-06-21 14:15:10'),

(105,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 10:09:32'),

(106,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 14:00:22'),

(107,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-25 14:30:29'),

(108,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 09:38:16'),

(109,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-06-26 11:22:38'),

(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 11:23:30'),

(111,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 14:06:06'),

(112,'admin','192.168.10.10','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-26 16:01:22'),

(113,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-27 09:36:51'),

(114,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-27 14:12:56'),

(115,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-28 09:37:08'),

(116,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-28 14:06:55'),

(117,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-06-28 15:02:45'),

(118,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-29 09:26:59'),

(119,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-29 14:29:16'),

(120,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 09:55:52'),

(121,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 12:21:15'),

(122,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-06-30 14:01:46'),

(123,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 14:01:51'),

(124,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-06-30 17:02:50'),

(125,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-06-30 17:39:55'),

(126,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 17:39:57'),

(127,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 09:28:58'),

(128,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 14:09:44'),

(129,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-03 17:44:04'),

(130,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 17:44:41'),

(131,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 09:44:24'),

(132,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 10:26:51'),

(133,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 11:30:29'),

(134,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 14:15:47'),

(135,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 14:48:59'),

(136,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 15:20:53'),

(137,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 15:21:15'),

(138,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 15:21:19'),

(139,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 15:21:24'),

(140,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 17:43:53'),

(141,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 17:45:50'),

(142,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 17:53:58'),

(143,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 17:54:04'),

(144,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:01:56'),

(145,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:02:03'),

(146,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:02:51'),

(147,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:02:58'),

(148,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:08:02'),

(149,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:08:07'),

(150,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:09:14'),

(151,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:18'),

(152,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:09:20'),

(153,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:25'),

(154,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:09:30'),

(155,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:10:14'),

(156,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:10:50'),

(157,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:10:54'),

(158,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:11:25'),

(159,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:13:55'),

(160,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:13:58'),

(161,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:16:25'),

(162,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:16:29'),

(163,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:16:34'),

(164,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-04 18:16:36'),

(165,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:17:20'),

(166,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-04 18:22:36'),

(167,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-04 18:22:41'),

(168,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:42:42'),

(169,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:48:49'),

(170,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:48:57'),

(171,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:52:13'),

(172,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:52:17'),

(173,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 09:54:26'),

(174,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 09:54:29'),

(175,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:22:08'),

(176,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 10:22:13'),

(177,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:22:17'),

(178,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:24:08'),

(179,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:24:12'),

(180,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:38:30'),

(181,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:43:36'),

(182,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 10:54:31'),

(183,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 10:54:35'),

(184,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:01:35'),

(185,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:01:41'),

(186,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:03:15'),

(187,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:03:19'),

(188,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:19:53'),

(189,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:19:58'),

(190,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:28:39'),

(191,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:28:44'),

(192,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 11:36:05'),

(193,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 11:36:09'),

(194,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 14:10:53'),

(195,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 14:10:56'),

(196,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-05 14:42:28'),

(197,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-05 15:04:31'),

(198,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-05 16:19:02'),

(199,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 16:26:09'),

(200,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-05 16:26:12'),

(201,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 16:26:15'),

(202,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-07-05 18:12:46'),

(203,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-05 18:15:01'),

(204,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 09:55:54'),

(205,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-07-06 11:03:31'),

(206,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 11:03:34'),

(207,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 14:09:27'),

(208,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 15:15:56'),

(209,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 16:01:52'),

(210,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 16:01:54'),

(211,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 16:01:58'),

(212,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-06 18:23:22'),

(213,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-06 18:23:27'),

(214,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-06 18:23:30'),

(215,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 09:58:18'),

(216,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 10:28:46'),

(217,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 12:22:30'),

(218,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 15:38:57'),

(219,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 16:34:41'),

(220,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 17:05:38'),

(221,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 17:14:33'),

(222,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-07 18:07:09'),

(223,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-10 14:47:06'),

(224,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-10 14:47:11'),

(225,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-10 17:51:45'),

(226,'admin','192.168.10.94','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-11 09:49:19'),

(227,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 11:13:23'),

(228,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 14:24:20'),

(229,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 16:15:57'),

(230,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-11 17:13:44'),

(231,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-11 17:13:48'),

(232,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-07-11 18:21:10'),

(233,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-11 18:22:51'),

(234,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-12 09:42:31'),

(235,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-12 14:00:44'),

(236,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-07-12 14:18:49'),

(237,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 09:34:08'),

(238,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 11:04:03'),

(239,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 14:01:12'),

(240,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 14:38:58'),

(241,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 16:41:34'),

(242,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-13 18:46:03'),

(243,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-14 10:11:33'),

(244,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-14 14:04:48'),

(245,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:01:46'),

(246,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-17 10:03:26'),

(247,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:03:32'),

(248,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 10:51:44'),

(249,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 11:42:11'),

(250,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 14:02:38'),

(251,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 15:37:42'),

(252,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-17 17:34:58'),

(253,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-18 09:31:13'),

(254,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-18 15:55:37'),

(255,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-19 15:02:14'),

(256,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 15:02:17'),

(257,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-19 15:14:05'),

(258,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 15:14:23'),

(259,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 16:13:08'),

(260,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-19 17:35:29'),

(261,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-19 17:37:48'),

(262,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-20 09:34:20'),

(263,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-20 16:30:49'),

(264,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-20 16:30:51'),

(265,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-07-21 10:47:44'),

(266,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 10:47:47'),

(267,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-07-21 11:02:02'),

(268,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 11:02:06'),

(269,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:04:30'),

(270,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-21 15:33:25'),

(271,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:35:07'),

(272,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-07-21 15:35:10'),

(273,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:37:07'),

(274,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-21 15:38:20'),

(275,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 10:34:11'),

(276,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 14:02:22'),

(277,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-07-31 17:14:58'),

(278,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 09:31:21'),

(279,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 10:11:19'),

(280,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 13:59:31'),

(281,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 14:48:08'),

(282,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-01 17:43:52'),

(283,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-02 10:50:20'),

(284,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 10:50:25'),

(285,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 14:45:17'),

(286,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-02 17:09:50'),

(287,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 17:09:54'),

(288,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-02 17:48:16'),

(289,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 09:27:14'),

(290,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 12:05:58'),

(291,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 13:58:20'),

(292,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-03 16:07:12'),

(293,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 09:26:07'),

(294,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 14:02:18'),

(295,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 15:52:35'),

(296,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-04 18:29:57'),

(297,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 09:31:51'),

(298,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 09:57:31'),

(299,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:30:41'),

(300,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:30:49'),

(301,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:30:53'),

(302,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:30:57'),

(303,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:31:49'),

(304,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:35:31'),

(305,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-07 10:37:35'),

(306,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:37:40'),

(307,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:38:24'),

(308,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:35'),

(309,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:41'),

(310,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:50:50'),

(311,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:56:35'),

(312,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 10:58:00'),

(313,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 10:58:04'),

(314,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 11:04:28'),

(315,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-07 11:04:37'),

(316,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 11:28:16'),

(317,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:29:10'),

(318,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:31:05'),

(319,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 11:31:16'),

(320,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:32:02'),

(321,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-07 11:32:23'),

(322,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-07 11:32:27'),

(323,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:32:31'),

(324,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 11:35:43'),

(325,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 11:36:52'),

(326,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 14:29:24'),

(327,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:09:19'),

(328,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:09:32'),

(329,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:13:14'),

(330,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:13:20'),

(331,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:19:09'),

(332,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:19:25'),

(333,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:19:40'),

(334,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:19:49'),

(335,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:20:00'),

(336,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:05'),

(337,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:39:10'),

(338,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:20'),

(339,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:39:27'),

(340,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-07 15:39:31'),

(341,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 15:39:45'),

(342,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-07 15:41:26'),

(343,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-07 15:45:02'),

(344,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-07 15:45:16'),

(345,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-07 15:45:20'),

(346,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 10:53:25'),

(347,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 14:20:21'),

(348,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-08 14:24:46'),

(349,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-08 14:26:51'),

(350,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-08 14:27:00'),

(351,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-08 15:38:18'),

(352,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 09:41:17'),

(353,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 10:42:09'),

(354,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 14:59:00'),

(355,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 16:01:16'),

(356,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-09 17:14:55'),

(357,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-09 18:25:52'),

(358,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-09 18:25:54'),

(359,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 09:33:40'),

(360,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-10 10:07:32'),

(361,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-10 10:07:37'),

(362,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 11:25:27'),

(363,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-10 14:13:30'),

(364,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-10 15:22:20'),

(365,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 09:32:55'),

(366,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 10:39:53'),

(367,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 14:43:35'),

(368,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 16:31:10'),

(369,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-11 17:48:33'),

(370,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-11 17:48:35'),

(371,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 09:45:26'),

(372,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 10:37:10'),

(373,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 16:05:17'),

(374,'admin','192.168.10.21','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-14 17:10:58'),

(375,'admin','192.168.10.21','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-14 17:33:14'),

(376,'admin','192.168.10.124','内网IP','Safari','Mac OS X','1','验证码错误','2023-08-14 17:45:20'),

(377,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-14 17:45:23'),

(378,'admin','192.168.10.124','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-08-14 17:47:40'),

(379,'admin','222.137.17.88','XX XX','Chrome 11','Mac OS X','0','登录成功','2023-08-14 18:15:27'),

(380,'admin','125.41.168.193','XX XX','Safari','Mac OS X','0','登录成功','2023-08-15 08:21:37'),

(381,'admin','123.14.74.157','XX XX','Chrome 9','Windows 10','0','登录成功','2023-08-15 09:59:13'),

(382,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-17 17:30:47'),

(383,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-17 17:51:26'),

(384,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-17 18:13:17'),

(385,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-17 18:17:33'),

(386,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-17 18:17:41'),

(387,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 09:32:16'),

(388,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 10:12:34'),

(389,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 10:57:55'),

(390,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-18 11:47:21'),

(391,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 11:47:24'),

(392,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 11:53:38'),

(393,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-18 14:03:20'),

(394,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 14:40:06'),

(395,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 15:53:17'),

(396,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 17:18:15'),

(397,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-18 20:30:04'),

(398,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 13:43:02'),

(399,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-08-20 13:44:43'),

(400,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-20 13:44:53'),

(401,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 13:44:56'),

(402,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-20 17:55:07'),

(403,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 20:40:56'),

(404,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 21:37:58'),

(405,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-20 22:54:01'),

(406,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-20 22:54:04'),

(407,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-08-20 22:54:04'),

(408,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-20 22:54:07'),

(420,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:56:27'),

(421,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:56:27'),

(422,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:59:08'),

(423,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误5次，帐户锁定10分钟','2023-08-20 22:59:08'),

(424,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-20 23:11:09'),

(425,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-20 23:11:16'),

(426,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-21 09:35:43'),

(427,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 10:00:27'),

(428,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 14:02:49'),

(429,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 16:21:27'),

(430,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-21 17:30:21'),

(431,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-21 17:35:21'),

(432,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-22 09:39:33'),

(433,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-23 17:34:14'),

(434,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-23 18:28:08'),

(435,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-23 18:28:11'),

(436,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 09:31:00'),

(437,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 15:27:48'),

(438,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-24 17:25:34'),

(439,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-24 17:25:41'),

(440,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 09:36:24'),

(441,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-25 14:14:50'),

(442,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 14:14:56'),

(443,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-08-25 15:23:04'),

(444,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 15:23:19'),

(445,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:37'),

(446,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:39'),

(447,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:03:43'),

(448,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-08-25 16:03:48'),

(449,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-08-25 16:03:48'),

(450,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-25 16:03:55'),

(451,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:04:52'),

(452,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:04:55'),

(453,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:05:25'),

(454,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:07:18'),

(455,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-25 16:08:31'),

(456,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 16:57:14'),

(457,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-25 17:33:49'),

(458,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 09:29:56'),

(459,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 11:05:53'),

(460,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 14:12:48'),

(461,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-28 14:12:54'),

(462,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-28 14:12:57'),

(463,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 14:13:08'),

(464,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-28 17:22:58'),

(465,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-28 17:26:51'),

(466,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-29 09:23:21'),

(467,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 09:23:24'),

(468,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 09:52:57'),

(469,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 10:54:12'),

(470,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 14:02:35'),

(471,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-29 14:32:13'),

(472,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 14:32:16'),

(473,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-29 14:35:16'),

(474,'hnzyy01','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-29 14:36:04'),

(475,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 15:18:00'),

(476,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 15:48:49'),

(477,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 16:29:22'),

(478,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-08-29 17:23:49'),

(479,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 17:24:34'),

(480,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:45:26'),

(481,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-08-29 17:46:17'),

(482,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:47:02'),

(483,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:48:21'),

(484,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:50:57'),

(485,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:53:04'),

(486,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-29 17:55:38'),

(487,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-29 17:57:07'),

(488,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-08-29 18:36:17'),

(489,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-29 18:36:24'),

(490,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-08-30 09:34:45'),

(491,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 10:14:57'),

(492,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 14:07:56'),

(493,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-08-30 14:36:46'),

(494,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-08-30 14:36:49'),

(495,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 14:36:52'),

(496,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-08-30 15:15:17'),

(497,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-30 15:27:52'),

(498,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-08-31 09:43:59'),

(499,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 14:48:30'),

(500,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 17:23:32'),

(501,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-04 18:08:58'),

(502,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 09:42:00'),

(503,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 10:16:32'),

(504,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 10:37:38'),

(505,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-05 11:25:01'),

(506,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 14:02:58'),

(507,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-05 14:40:10'),

(508,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-05 17:15:58'),

(509,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-05 17:18:34'),

(510,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 09:34:48'),

(511,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-06 10:35:06'),

(512,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 14:03:48'),

(513,'admin','192.168.10.194','内网IP','Chrome 11','Mac OS X','0','登录成功','2023-09-06 14:25:13'),

(514,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-06 15:13:41'),

(515,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-06 18:12:45'),

(516,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 09:27:12'),

(517,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-07 10:00:46'),

(518,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 11:31:44'),

(519,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-07 14:26:02'),

(520,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 15:18:10'),

(521,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 16:17:08'),

(522,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 17:22:55'),

(523,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-07 18:02:00'),

(524,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-08 09:36:07'),

(525,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 10:26:58'),

(526,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 11:05:51'),

(527,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 14:08:47'),

(528,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-11 18:25:15'),

(529,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 10:04:32'),

(530,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 11:26:21'),

(531,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-12 14:09:21'),

(532,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-12 14:09:25'),

(533,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 14:09:28'),

(534,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-09-12 15:05:07'),

(535,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 15:05:13'),

(536,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-12 16:04:13'),

(537,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-13 09:41:44'),

(538,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 09:41:52'),

(539,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 10:26:03'),

(540,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 14:05:58'),

(541,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 14:52:22'),

(542,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 15:23:03'),

(543,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 17:25:18'),

(544,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-13 18:35:34'),

(545,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-14 18:28:12'),

(546,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-15 09:39:22'),

(547,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-09-15 09:39:22'),

(548,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-09-15 09:39:27'),

(549,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-15 09:39:27'),

(550,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 09:39:39'),

(551,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 14:05:53'),

(552,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 16:01:53'),

(553,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-15 17:58:46'),

(554,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 10:04:20'),

(555,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-09-18 11:10:49'),

(556,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-18 11:10:52'),

(557,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 11:22:25'),

(558,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 14:11:53'),

(559,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 16:05:47'),

(560,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 17:12:48'),

(561,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-18 18:14:12'),

(562,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 09:37:30'),

(563,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 14:30:57'),

(564,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 16:46:55'),

(565,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 16:52:04'),

(566,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-19 17:29:55'),

(567,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 11:18:56'),

(568,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 14:12:04'),

(569,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-20 16:32:46'),

(570,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 09:37:36'),

(571,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 11:13:11'),

(572,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 14:48:35'),

(573,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 17:12:34'),

(574,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-09-21 18:26:06'),

(575,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-22 09:36:32'),

(576,'admin','192.168.10.182','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-22 14:42:40'),

(577,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-25 15:48:52'),

(578,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-25 18:36:38'),

(579,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 09:41:39'),

(580,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 10:48:23'),

(581,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 14:55:16'),

(582,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 14:55:19'),

(583,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 14:55:23'),

(584,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-09-26 15:28:53'),

(585,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:28:53'),

(586,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-09-26 15:28:57'),

(587,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:28:57'),

(588,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-09-26 15:29:15'),

(589,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-09-26 15:29:33'),

(590,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-09-26 15:29:33'),

(591,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 15:30:21'),

(592,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-26 16:46:12'),

(593,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 09:31:50'),

(594,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 10:09:02'),

(595,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 10:57:24'),

(596,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 14:03:49'),

(597,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-09-27 20:22:06'),

(598,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-09 16:08:46'),

(599,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 09:55:36'),

(600,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 10:54:58'),

(601,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-11 14:21:35'),

(602,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-11 17:50:25'),

(603,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 09:40:54'),

(604,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 10:43:20'),

(605,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-12 14:26:57'),

(606,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-13 15:54:51'),

(607,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-13 15:54:54'),

(608,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-13 16:40:44'),

(609,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-13 16:40:53'),

(610,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 22:35:19'),

(611,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-14 22:36:03'),

(612,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 22:36:14'),

(613,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-14 23:23:41'),

(614,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-15 13:39:21'),

(615,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-15 14:37:05'),

(616,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 09:40:22'),

(617,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 14:59:34'),

(618,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:22:58'),

(619,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:23:05'),

(620,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-16 16:23:41'),

(621,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:26:54'),

(622,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:27:03'),

(623,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-16 16:28:02'),

(624,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-16 16:35:49'),

(625,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-16 16:36:01'),

(626,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 09:41:55'),

(627,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 11:13:49'),

(628,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 16:02:36'),

(629,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 16:03:26'),

(630,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-17 16:07:54'),

(631,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:08:01'),

(632,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-17 16:11:27'),

(633,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-17 16:11:32'),

(634,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 16:15:12'),

(635,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:18:37'),

(636,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-17 16:19:57'),

(637,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-17 16:24:01'),

(638,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 16:32:57'),

(639,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-17 16:33:06'),

(640,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:33:12'),

(641,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-17 16:35:03'),

(642,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-17 16:38:55'),

(643,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:40:59'),

(644,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 16:45:14'),

(645,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 16:46:53'),

(646,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-17 16:46:58'),

(647,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 16:47:02'),

(648,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 17:17:15'),

(649,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-10-17 17:17:30'),

(650,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-17 17:17:30'),

(651,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-17 17:17:57'),

(652,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-17 17:27:06'),

(653,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-17 17:27:09'),

(654,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-17 18:22:31'),

(655,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-18 15:43:42'),

(656,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-18 16:50:26'),

(657,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-18 17:59:12'),

(658,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-18 18:14:50'),

(659,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-19 09:38:39'),

(660,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 10:19:40'),

(661,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 11:07:14'),

(662,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-19 11:38:23'),

(663,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 14:54:21'),

(664,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-19 16:00:53'),

(665,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-19 16:01:02'),

(666,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-19 17:07:53'),

(667,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-19 18:09:42'),

(668,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-10-19 18:09:50'),

(669,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 10:31:40'),

(670,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 11:31:41'),

(671,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-20 14:13:47'),

(672,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-10-23 09:40:41'),

(673,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-23 09:40:53'),

(674,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 12:49:26'),

(675,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 18:25:18'),

(676,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-23 18:25:49'),

(677,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-23 18:25:56'),

(678,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-23 18:26:00'),

(679,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 09:39:36'),

(680,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 10:11:44'),

(681,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:11:47'),

(682,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 10:12:56'),

(683,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:13:03'),

(684,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 10:13:10'),

(685,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 10:14:08'),

(686,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 10:14:13'),

(687,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-24 10:15:59'),

(688,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:16:03'),

(689,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-24 10:19:53'),

(690,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-24 10:20:09'),

(691,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:20:12'),

(692,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 10:51:42'),

(693,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 14:20:50'),

(694,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 15:11:12'),

(695,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-10-24 16:15:25'),

(696,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 16:15:31'),

(697,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 16:15:34'),

(698,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 16:50:43'),

(699,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-24 17:05:44'),

(700,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-24 17:05:47'),

(701,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-24 17:42:26'),

(702,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 17:42:29'),

(703,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-24 18:18:46'),

(704,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 09:44:02'),

(705,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 14:11:29'),

(706,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-25 15:17:52'),

(707,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 15:42:35'),

(708,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 15:42:45'),

(709,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 17:20:04'),

(710,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-10-25 17:20:12'),

(711,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-10-25 17:20:26'),

(712,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:20:26'),

(713,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:34:35'),

(714,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:34:48'),

(715,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:34:58'),

(716,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:35:06'),

(717,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:35:12'),

(718,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-10-25 17:41:38'),

(719,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 17:41:43'),

(720,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-10-25 17:42:56'),

(721,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:20:46'),

(722,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:21:05'),

(723,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:23:21'),

(724,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:32:29'),

(725,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:33:11'),

(726,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:34:23'),

(727,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:38:40'),

(728,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:39:25'),

(729,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-25 18:41:07'),

(730,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-25 18:41:57'),

(731,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-26 09:34:24'),

(732,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-10-26 09:54:45'),

(733,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-26 09:54:50'),

(734,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-10-31 15:29:24'),

(735,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-10-31 15:31:51'),

(736,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-10-31 18:24:57'),

(737,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-10-31 18:24:57'),

(738,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-10-31 18:25:02'),

(739,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 10:24:42'),

(740,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 14:08:34'),

(741,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 14:38:58'),

(742,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-01 16:11:30'),

(743,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-01 16:11:30'),

(744,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-01 16:11:39'),

(745,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-01 16:11:49'),

(746,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 10:11:34'),

(747,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 13:56:06'),

(748,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-02 14:53:41'),

(749,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-02 17:13:59'),

(750,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 10:08:34'),

(751,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 10:08:34'),

(752,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 10:08:45'),

(753,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 10:08:45'),

(754,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 10:08:54'),

(755,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 14:10:06'),

(756,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-11-03 16:04:43'),

(757,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 16:04:54'),

(758,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 16:04:54'),

(759,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 16:05:02'),

(760,'hnzyy01','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 16:05:02'),

(761,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 16:05:18'),

(762,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 16:06:15'),

(763,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 16:08:11'),

(764,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-03 16:08:21'),

(765,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 16:08:32'),

(766,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-03 17:00:14'),

(767,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 17:00:14'),

(768,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-03 17:00:22'),

(769,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-03 17:00:22'),

(770,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-03 17:00:38'),

(771,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:02:17'),

(772,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:02:28'),

(773,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:32:13'),

(774,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:32:22'),

(775,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-03 17:43:33'),

(776,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-03 17:43:49'),

(777,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-03 17:43:55'),

(778,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-03 18:02:54'),

(779,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','退出成功','2023-11-03 18:06:53'),

(780,'hnzyy01','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-03 18:07:04'),

(781,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-06 11:20:37'),

(782,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-06 11:20:37'),

(783,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-11-06 11:20:46'),

(784,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 11:21:01'),

(785,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-06 14:04:36'),

(786,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-06 14:04:36'),

(787,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 14:04:43'),

(788,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-06 15:37:02'),

(789,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-07 18:01:58'),

(790,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-11-08 09:36:15'),

(791,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-08 09:36:15'),

(792,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误2次','2023-11-08 09:36:27'),

(793,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-11-08 09:36:27'),

(794,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-08 09:36:38'),

(795,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 10:34:29'),

(796,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-08 10:34:29'),

(797,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 10:34:47'),

(798,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-08 11:28:56'),

(799,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:28:56'),

(800,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-08 11:29:02'),

(801,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:02'),

(802,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-11-08 11:29:06'),

(803,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:06'),

(804,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-08 11:29:11'),

(805,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误4次','2023-11-08 11:29:11'),

(806,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 11:29:19'),

(807,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 14:28:36'),

(808,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-08 16:33:10'),

(809,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-09 14:13:19'),

(810,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-09 17:54:05'),

(811,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 10:33:30'),

(812,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 14:09:08'),

(813,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-10 14:56:30'),

(814,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-11-10 16:08:57'),

(815,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 16:09:04'),

(816,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-10 18:18:56'),

(817,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 10:09:27'),

(818,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 11:16:04'),

(819,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 14:11:43'),

(820,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 16:08:50'),

(821,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','退出成功','2023-11-13 17:20:34'),

(822,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-13 17:23:09'),

(823,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-13 17:27:29'),

(824,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 09:54:29'),

(825,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 14:37:32'),

(826,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-14 15:55:54'),

(827,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-14 16:47:03'),

(828,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-15 09:37:58'),

(829,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-16 18:30:56'),

(830,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-17 09:36:54'),

(831,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-17 09:36:54'),

(832,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-17 09:37:01'),

(833,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-17 09:37:01'),

(834,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 09:37:10'),

(835,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 11:13:04'),

(836,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 14:01:48'),

(837,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-17 14:31:58'),

(838,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码已失效','2023-11-20 09:44:42'),

(839,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-20 09:44:47'),

(840,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-20 09:44:47'),

(841,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 09:44:58'),

(842,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 14:43:45'),

(843,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 17:13:30'),

(844,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 17:50:38'),

(845,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','验证码错误','2023-11-20 18:06:17'),

(846,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-20 18:06:21'),

(847,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-11-20 18:29:26'),

(848,'hnzyy01','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-20 18:29:38'),

(849,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 09:37:29'),

(850,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 11:24:15'),

(851,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 14:11:34'),

(852,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-21 14:50:09'),

(853,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-11-21 16:42:25'),

(854,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-11-21 17:35:06'),

(855,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 17:35:12'),

(856,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-11-21 18:29:57'),

(857,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-23 09:55:44'),

(858,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:55:44'),

(859,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-11-23 09:56:10'),

(860,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:56:10'),

(861,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误3次','2023-11-23 09:56:24'),

(862,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-23 09:56:24'),

(863,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-23 09:56:32'),

(864,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-11-30 18:07:57'),

(865,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-11-30 18:07:57'),

(866,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-11-30 18:08:05'),

(867,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-12-04 17:40:12'),

(868,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误1次','2023-12-04 17:40:12'),

(869,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','密码输入错误2次','2023-12-04 17:40:22'),

(870,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','1','用户不存在/密码错误','2023-12-04 17:40:22'),

(871,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-04 17:40:30'),

(872,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-05 09:38:37'),

(873,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2023-12-05 10:34:52'),

(874,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-05 17:09:46'),

(875,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-05 18:04:39'),

(876,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 09:45:04'),

(877,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 11:01:46'),

(878,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 15:00:47'),

(879,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-06 17:04:09'),

(880,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-07 17:45:36'),

(881,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-07 17:45:36'),

(882,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-07 17:45:48'),

(883,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 10:59:29'),

(884,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 15:14:07'),

(885,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-08 17:09:57'),

(886,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-08 17:09:57'),

(887,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-08 17:10:04'),

(888,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-11 10:19:04'),

(889,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-11 10:19:05'),

(890,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-11 10:19:12'),

(891,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-11 16:44:20'),

(892,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-12 11:05:49'),

(893,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-12 11:05:49'),

(894,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 11:05:55'),

(895,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 14:27:58'),

(896,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-12 17:36:51'),

(897,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-13 09:51:53'),

(898,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 09:51:53'),

(899,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误2次','2023-12-13 09:52:04'),

(900,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 09:52:04'),

(901,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 09:52:11'),

(902,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 11:23:52'),

(903,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-13 14:06:18'),

(904,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-13 14:06:18'),

(905,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 14:06:28'),

(906,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 14:37:46'),

(907,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 15:36:11'),

(908,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:12:46'),

(909,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-12-13 16:33:33'),

(910,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:33:36'),

(911,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 16:38:57'),

(912,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-13 18:13:21'),

(913,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-14 09:41:05'),

(914,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-14 09:41:05'),

(915,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 09:41:15'),

(916,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 09:49:39'),

(917,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 14:47:12'),

(918,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 15:57:34'),

(919,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 17:05:34'),

(920,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-14 18:29:09'),

(921,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 09:39:10'),

(922,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 10:17:48'),

(923,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-12-15 11:10:30'),

(924,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 11:11:32'),

(925,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 14:08:50'),

(926,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 14:39:28'),

(927,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 15:37:45'),

(928,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 16:28:26'),

(929,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 17:43:56'),

(930,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-15 18:19:31'),

(931,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 09:43:25'),

(932,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 09:47:48'),

(933,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-18 14:50:39'),

(934,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-18 14:50:39'),

(935,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 14:56:56'),

(936,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-18 17:22:58'),

(937,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-19 09:40:16'),

(938,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-19 09:40:16'),

(939,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 09:40:22'),

(940,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 10:35:03'),

(941,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 11:31:43'),

(942,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 14:20:24'),

(943,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 15:59:06'),

(944,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-19 16:55:26'),

(945,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 09:34:32'),

(946,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 14:13:23'),

(947,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-20 17:12:13'),

(948,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 10:19:34'),

(949,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 14:50:06'),

(950,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-21 18:12:10'),

(951,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 09:50:32'),

(952,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 10:27:57'),

(953,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 11:48:15'),

(954,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 14:24:50'),

(955,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 15:34:30'),

(956,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-22 18:07:07'),

(957,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 09:39:28'),

(958,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 10:58:01'),

(959,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 14:19:32'),

(960,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-12-25 14:23:54'),

(961,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 14:41:25'),

(962,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-25 15:26:05'),

(963,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-25 15:26:05'),

(964,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 15:26:21'),

(965,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 16:08:41'),

(966,'admin','192.168.10.124','内网IP','Safari','Mac OS X','0','登录成功','2023-12-25 17:25:13'),

(967,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 17:46:39'),

(968,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-25 18:27:44'),

(969,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 10:05:02'),

(970,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 11:03:22'),

(971,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','密码输入错误1次','2023-12-26 15:17:53'),

(972,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','用户不存在/密码错误','2023-12-26 15:17:53'),

(973,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-12-26 15:17:58'),

(974,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-23 10:18:26'),

(975,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-23 17:49:37'),

(976,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-01-24 19:37:53'),

(977,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-05 14:35:26'),

(978,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 11:34:45'),

(979,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 14:11:14'),

(980,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-21 14:47:09'),

(981,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-25 10:05:31'),

(982,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2024-03-25 14:32:10');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2132 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'系统管理',0,10,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-06-20 14:47:29','admin','2023-12-22 17:24:23','系统管理目录'),

(2,'系统监控',0,13,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-06-20 14:47:29','admin','2023-12-22 17:25:00','系统监控目录'),

(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-06-20 14:47:29','',NULL,'用户管理菜单'),

(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-06-20 14:47:29','',NULL,'角色管理菜单'),

(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-06-20 14:47:29','',NULL,'菜单管理菜单'),

(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-06-20 14:47:29','',NULL,'部门管理菜单'),

(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-06-20 14:47:29','',NULL,'岗位管理菜单'),

(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-06-20 14:47:29','',NULL,'字典管理菜单'),

(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-06-20 14:47:29','',NULL,'参数设置菜单'),

(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-06-20 14:47:29','',NULL,'通知公告菜单'),

(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-06-20 14:47:29','',NULL,'日志管理菜单'),

(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-06-20 14:47:29','',NULL,'在线用户菜单'),

(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-06-20 14:47:29','',NULL,'定时任务菜单'),

(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-06-20 14:47:29','',NULL,'数据监控菜单'),

(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-06-20 14:47:29','',NULL,'服务监控菜单'),

(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-06-20 14:47:29','',NULL,'缓存监控菜单'),

(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-06-20 14:47:29','',NULL,'缓存列表菜单'),

(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-06-20 14:47:29','',NULL,'操作日志菜单'),

(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-06-20 14:47:29','',NULL,'登录日志菜单'),

(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-06-20 14:47:29','',NULL,''),

(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-06-20 14:47:29','',NULL,''),

(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-06-20 14:47:29','',NULL,''),

(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-06-20 14:47:29','',NULL,''),

(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-06-20 14:47:29','',NULL,''),

(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-06-20 14:47:29','',NULL,''),

(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-06-20 14:47:29','',NULL,''),

(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-06-20 14:47:29','',NULL,''),

(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-06-20 14:47:29','',NULL,''),

(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-06-20 14:47:29','',NULL,''),

(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-06-20 14:47:29','',NULL,''),

(2000,'模板管理',0,2,'temp',NULL,NULL,1,0,'M','0','0','','documentation','admin','2023-06-20 16:59:07','admin','2023-12-22 17:22:48',''),

(2001,'内容管理',0,1,'content',NULL,NULL,1,0,'M','0','0','','edit','admin','2023-06-20 16:59:34','admin','2023-12-22 17:22:39',''),

(2003,'模型管理',0,3,'model',NULL,NULL,1,0,'M','0','0','','swagger','admin','2023-06-20 17:01:42','admin','2023-12-22 17:22:59',''),

(2004,'友情链接',0,7,'link',NULL,NULL,1,0,'M','0','0','','peoples','admin','2023-06-20 17:02:06','admin','2023-12-22 17:23:40',''),

(2005,'自定义属性',2003,1,'attr','web/attr/index',NULL,1,0,'C','1','0','web:attr:list','#','admin','2023-06-20 17:14:54','admin','2023-06-28 11:34:55','自定义属性菜单'),

(2006,'自定义属性查询',2005,1,'#','',NULL,1,0,'F','0','0','web:attr:query','#','admin','2023-06-20 17:14:54','',NULL,''),

(2007,'自定义属性新增',2005,2,'#','',NULL,1,0,'F','0','0','web:attr:add','#','admin','2023-06-20 17:14:54','',NULL,''),

(2008,'自定义属性修改',2005,3,'#','',NULL,1,0,'F','0','0','web:attr:edit','#','admin','2023-06-20 17:14:54','',NULL,''),

(2009,'自定义属性删除',2005,4,'#','',NULL,1,0,'F','0','0','web:attr:remove','#','admin','2023-06-20 17:14:54','',NULL,''),

(2010,'自定义属性导出',2005,5,'#','',NULL,1,0,'F','0','0','web:attr:export','#','admin','2023-06-20 17:14:54','',NULL,''),

(2011,'栏目管理',2001,2,'channel','web/channel/index',NULL,1,0,'C','0','0','web:channel:list','#','admin','2023-06-20 17:15:04','admin','2023-12-22 17:26:15','栏目菜单'),

(2012,'栏目查询',2011,1,'#','',NULL,1,0,'F','0','0','web:channel:query','#','admin','2023-06-20 17:15:04','',NULL,''),

(2013,'栏目新增',2011,2,'#','',NULL,1,0,'F','0','0','web:channel:add','#','admin','2023-06-20 17:15:04','',NULL,''),

(2014,'栏目修改',2011,3,'#','',NULL,1,0,'F','0','0','web:channel:edit','#','admin','2023-06-20 17:15:04','',NULL,''),

(2015,'栏目删除',2011,4,'#','',NULL,1,0,'F','0','0','web:channel:remove','#','admin','2023-06-20 17:15:04','',NULL,''),

(2016,'栏目导出',2011,5,'#','',NULL,1,0,'F','0','0','web:channel:export','#','admin','2023-06-20 17:15:04','',NULL,''),

(2017,'文章管理',2001,1,'Content','web/content/index',NULL,1,0,'C','0','0','web:content:list','#','admin','2023-06-20 17:15:13','admin','2024-03-21 16:12:23','文章管理菜单'),

(2018,'文章管理查询',2017,1,'#','',NULL,1,0,'F','0','0','web:content:query','#','admin','2023-06-20 17:15:13','',NULL,''),

(2019,'文章管理新增',2017,2,'#','',NULL,1,0,'F','0','0','web:content:add','#','admin','2023-06-20 17:15:13','',NULL,''),

(2020,'文章管理修改',2017,3,'#','',NULL,1,0,'F','0','0','web:content:edit','#','admin','2023-06-20 17:15:13','',NULL,''),

(2021,'文章管理删除',2017,4,'#','',NULL,1,0,'F','0','0','web:content:remove','#','admin','2023-06-20 17:15:13','',NULL,''),

(2022,'文章管理导出',2017,5,'#','',NULL,1,0,'F','0','0','web:content:export','#','admin','2023-06-20 17:15:13','',NULL,''),

(2023,'友情链接',2004,1,'links','web/links/index',NULL,1,0,'C','1','0','web:links:list','#','admin','2023-06-20 17:15:23','admin','2023-06-28 11:34:46','友情链接菜单'),

(2024,'友情链接查询',2023,1,'#','',NULL,1,0,'F','0','0','web:links:query','#','admin','2023-06-20 17:15:23','',NULL,''),

(2025,'友情链接新增',2023,2,'#','',NULL,1,0,'F','0','0','web:links:add','#','admin','2023-06-20 17:15:23','',NULL,''),

(2026,'友情链接修改',2023,3,'#','',NULL,1,0,'F','0','0','web:links:edit','#','admin','2023-06-20 17:15:23','',NULL,''),

(2027,'友情链接删除',2023,4,'#','',NULL,1,0,'F','0','0','web:links:remove','#','admin','2023-06-20 17:15:23','',NULL,''),

(2028,'友情链接导出',2023,5,'#','',NULL,1,0,'F','0','0','web:links:export','#','admin','2023-06-20 17:15:23','',NULL,''),

(2029,'内容模型',2003,3,'model','web/model/index',NULL,1,0,'C','0','0','web:model:list','#','admin','2023-06-20 17:15:47','admin','2023-07-12 16:59:04','模型菜单'),

(2030,'模型查询',2029,1,'#','',NULL,1,0,'F','0','0','web:model:query','#','admin','2023-06-20 17:15:47','',NULL,''),

(2031,'模型新增',2029,2,'#','',NULL,1,0,'F','0','0','web:model:add','#','admin','2023-06-20 17:15:47','',NULL,''),

(2032,'模型修改',2029,3,'#','',NULL,1,0,'F','0','0','web:model:edit','#','admin','2023-06-20 17:15:47','',NULL,''),

(2033,'模型删除',2029,4,'#','',NULL,1,0,'F','0','0','web:model:remove','#','admin','2023-06-20 17:15:47','',NULL,''),

(2034,'模型导出',2029,5,'#','',NULL,1,0,'F','0','0','web:model:export','#','admin','2023-06-20 17:15:47','',NULL,''),

(2035,'友情链接分类',2004,1,'sort','web/sort/index',NULL,1,0,'C','0','0','web:sort:list','#','admin','2023-06-20 17:16:04','',NULL,'友情链接分类菜单'),

(2036,'友情链接分类查询',2035,1,'#','',NULL,1,0,'F','0','0','web:sort:query','#','admin','2023-06-20 17:16:04','',NULL,''),

(2037,'友情链接分类新增',2035,2,'#','',NULL,1,0,'F','0','0','web:sort:add','#','admin','2023-06-20 17:16:04','',NULL,''),

(2038,'友情链接分类修改',2035,3,'#','',NULL,1,0,'F','0','0','web:sort:edit','#','admin','2023-06-20 17:16:04','',NULL,''),

(2039,'友情链接分类删除',2035,4,'#','',NULL,1,0,'F','0','0','web:sort:remove','#','admin','2023-06-20 17:16:04','',NULL,''),

(2040,'友情链接分类导出',2035,5,'#','',NULL,1,0,'F','0','0','web:sort:export','#','admin','2023-06-20 17:16:04','',NULL,''),

(2041,'模板',2000,1,'template','web/template/index',NULL,1,0,'C','1','0','web:template:list','#','admin','2023-06-20 17:16:15','admin','2023-06-25 16:53:47','模板菜单'),

(2042,'模板查询',2041,1,'#','',NULL,1,0,'F','0','0','web:template:query','#','admin','2023-06-20 17:16:15','',NULL,''),

(2043,'模板新增',2041,2,'#','',NULL,1,0,'F','0','0','web:template:add','#','admin','2023-06-20 17:16:15','',NULL,''),

(2044,'模板修改',2041,3,'#','',NULL,1,0,'F','0','0','web:template:edit','#','admin','2023-06-20 17:16:15','',NULL,''),

(2045,'模板删除',2041,4,'#','',NULL,1,0,'F','0','0','web:template:remove','#','admin','2023-06-20 17:16:15','',NULL,''),

(2046,'模板导出',2041,5,'#','',NULL,1,0,'F','0','0','web:template:export','#','admin','2023-06-20 17:16:15','',NULL,''),

(2047,'模板列表',2000,1,'TempList','web/template/temp_list',NULL,1,0,'C','0','0','','#','admin','2023-06-25 14:31:44','admin','2023-11-08 10:54:20',''),

(2048,'代码编辑',2000,3,'tempEdit','web/template/file_edit',NULL,1,0,'C','1','0','','#','admin','2023-06-25 15:58:22','admin','2023-11-08 09:52:40',''),

(2054,'站点管理',2088,1,'site','web/site/index',NULL,1,0,'C','0','0','web:site:list','#','admin','2023-07-03 17:31:38','admin','2023-10-17 18:29:42','站点菜单'),

(2055,'站点查询',2054,1,'#','',NULL,1,0,'F','0','0','web:site:query','#','admin','2023-07-03 17:31:38','',NULL,''),

(2056,'站点新增',2054,2,'#','',NULL,1,0,'F','0','0','web:site:add','#','admin','2023-07-03 17:31:38','',NULL,''),

(2057,'站点修改',2054,3,'#','',NULL,1,0,'F','0','0','web:site:edit','#','admin','2023-07-03 17:31:38','',NULL,''),

(2058,'站点删除',2054,4,'#','',NULL,1,0,'F','0','0','web:site:remove','#','admin','2023-07-03 17:31:38','',NULL,''),

(2059,'站点导出',2054,5,'#','',NULL,1,0,'F','0','0','web:site:export','#','admin','2023-07-03 17:31:38','',NULL,''),

(2060,'词汇管理',0,6,'word',NULL,NULL,1,0,'M','0','0','','size','admin','2023-07-06 11:45:40','admin','2023-12-22 17:23:29',''),

(2061,'敏感词',2060,1,'sensitive','web/sensitive/index',NULL,1,0,'C','0','0','web:sensitive:list','#','admin','2023-07-06 14:07:14','',NULL,'敏感词菜单'),

(2062,'敏感词查询',2061,1,'#','',NULL,1,0,'F','0','0','web:sensitive:query','#','admin','2023-07-06 14:07:14','',NULL,''),

(2063,'敏感词新增',2061,2,'#','',NULL,1,0,'F','0','0','web:sensitive:add','#','admin','2023-07-06 14:07:14','',NULL,''),

(2064,'敏感词修改',2061,3,'#','',NULL,1,0,'F','0','0','web:sensitive:edit','#','admin','2023-07-06 14:07:14','',NULL,''),

(2065,'敏感词删除',2061,4,'#','',NULL,1,0,'F','0','0','web:sensitive:remove','#','admin','2023-07-06 14:07:14','',NULL,''),

(2066,'敏感词导出',2061,5,'#','',NULL,1,0,'F','0','0','web:sensitive:export','#','admin','2023-07-06 14:07:14','',NULL,''),

(2067,'表单构建',2003,3,'builder','web/model/builder',NULL,1,0,'C','1','0','','#','admin','2023-07-11 16:18:54','admin','2023-07-12 11:32:18',''),

(2068,'栏目模型',2003,2,'channel','web/model/channel',NULL,1,0,'C','0','0',NULL,'#','admin','2023-07-12 15:27:57','',NULL,''),

(2069,'内容编辑',2001,3,'Edit','web/content/edit',NULL,1,0,'C','1','0','','#','admin','2023-07-31 17:28:28','admin','2023-09-18 10:05:13',''),

(2078,'内容类型',2003,1,'contentType','web/contentType/index',NULL,1,0,'C','0','0','web:contentType:list','#','admin','2023-09-05 17:13:08','',NULL,'内容类型菜单'),

(2079,'内容类型查询',2078,1,'#','',NULL,1,0,'F','0','0','web:contentType:query','#','admin','2023-09-05 17:13:08','',NULL,''),

(2080,'内容类型新增',2078,2,'#','',NULL,1,0,'F','0','0','web:contentType:add','#','admin','2023-09-05 17:13:08','',NULL,''),

(2081,'内容类型修改',2078,3,'#','',NULL,1,0,'F','0','0','web:contentType:edit','#','admin','2023-09-05 17:13:08','',NULL,''),

(2082,'内容类型删除',2078,4,'#','',NULL,1,0,'F','0','0','web:contentType:remove','#','admin','2023-09-05 17:13:08','',NULL,''),

(2083,'内容类型导出',2078,5,'#','',NULL,1,0,'F','0','0','web:contentType:export','#','admin','2023-09-05 17:13:08','',NULL,''),

(2084,'统计管理',0,8,'statistics',NULL,NULL,1,0,'M','0','0','','server','admin','2023-09-15 15:21:10','admin','2023-12-22 17:24:15',''),

(2085,'受访页面',2084,1,'pageview','web/statistics/page_view',NULL,1,0,'C','0','0',NULL,'#','admin','2023-09-18 16:33:38','',NULL,''),

(2086,'地域分布',2084,2,'region','web/statistics/region_view',NULL,1,0,'C','0','0',NULL,'#','admin','2023-10-11 17:51:51','',NULL,''),

(2087,'文章预览',2001,5,'preview','web/content/preview',NULL,1,0,'C','1','0','','#','admin','2023-10-17 17:50:32','admin','2023-10-17 17:50:56',''),

(2088,'系统配置',0,5,'configure',NULL,NULL,1,0,'M','0','0','','tool','admin','2023-10-17 18:26:39','admin','2023-12-22 17:23:13',''),

(2089,'内容索引',2088,2,'contentIndex','web/contentIndex/index',NULL,1,0,'C','0','0','','#','admin','2023-10-17 18:37:31','admin','2023-10-19 16:59:25',''),

(2096,'系统配置',2088,1,'config','web/config/index',NULL,1,0,'C','0','0','web:config:list','#','admin','2023-11-10 16:37:14','',NULL,'系统配置菜单'),

(2097,'系统配置查询',2096,1,'#','',NULL,1,0,'F','0','0','web:config:query','#','admin','2023-11-10 16:37:15','',NULL,''),

(2098,'系统配置新增',2096,2,'#','',NULL,1,0,'F','0','0','web:config:add','#','admin','2023-11-10 16:37:15','',NULL,''),

(2099,'系统配置修改',2096,3,'#','',NULL,1,0,'F','0','0','web:config:edit','#','admin','2023-11-10 16:37:15','',NULL,''),

(2100,'系统配置删除',2096,4,'#','',NULL,1,0,'F','0','0','web:config:remove','#','admin','2023-11-10 16:37:15','',NULL,''),

(2101,'系统配置导出',2096,5,'#','',NULL,1,0,'F','0','0','web:config:export','#','admin','2023-11-10 16:37:15','',NULL,''),

(2120,'安全配置',1,10,'securitConfig','system/securitConfig/index',NULL,1,0,'C','0','0','system:securitConfig:list','logininfor','admin','2023-12-13 14:59:53','admin','2023-12-14 09:52:09','安全配置菜单'),

(2121,'安全配置查询',2120,1,'#','',NULL,1,0,'F','0','0','system:securitConfig:query','#','admin','2023-12-13 14:59:53','',NULL,''),

(2122,'安全配置新增',2120,2,'#','',NULL,1,0,'F','0','0','system:securitConfig:add','#','admin','2023-12-13 14:59:53','',NULL,''),

(2123,'安全配置修改',2120,3,'#','',NULL,1,0,'F','0','0','system:securitConfig:edit','#','admin','2023-12-13 14:59:53','',NULL,''),

(2124,'安全配置删除',2120,4,'#','',NULL,1,0,'F','0','0','system:securitConfig:remove','#','admin','2023-12-13 14:59:53','',NULL,''),

(2125,'安全配置导出',2120,5,'#','',NULL,1,0,'F','0','0','system:securitConfig:export','#','admin','2023-12-13 14:59:53','',NULL,''),

(2126,'资源库',2001,6,'files','web/files/index',NULL,1,0,'C','0','1','web:files:list','#','admin','2023-12-19 14:15:59','admin','2023-12-22 17:26:24','资源库菜单'),

(2127,'资源库查询',2126,1,'#','',NULL,1,0,'F','0','0','web:files:query','#','admin','2023-12-19 14:15:59','',NULL,''),

(2128,'资源库新增',2126,2,'#','',NULL,1,0,'F','0','0','web:files:add','#','admin','2023-12-19 14:15:59','',NULL,''),

(2129,'资源库修改',2126,3,'#','',NULL,1,0,'F','0','0','web:files:edit','#','admin','2023-12-19 14:15:59','',NULL,''),

(2130,'资源库删除',2126,4,'#','',NULL,1,0,'F','0','0','web:files:remove','#','admin','2023-12-19 14:15:59','',NULL,''),

(2131,'资源库导出',2126,5,'#','',NULL,1,0,'F','0','0','web:files:export','#','admin','2023-12-19 14:15:59','',NULL,'');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=1748 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';


/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'ceo','董事长',1,'0','admin','2023-06-20 14:47:29','',NULL,''),

(2,'se','项目经理',2,'0','admin','2023-06-20 14:47:29','',NULL,''),

(3,'hr','人力资源',3,'0','admin','2023-06-20 14:47:29','',NULL,''),

(4,'user','普通员工',4,'0','admin','2023-06-20 14:47:29','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-06-20 14:47:29','',NULL,'超级管理员'),

(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-06-20 14:47:29','admin','2024-01-24 17:45:56','普通角色'),

(101,'测试管理员','ceshi',2,'1',1,1,'0','0','admin','2023-08-25 16:15:29','admin','2024-01-24 17:49:56',NULL),

(102,'测试审核员','shenhe',0,'1',1,1,'0','0','admin','2023-08-25 16:17:35','admin','2024-01-24 17:50:02',NULL);

/*Table structure for table `sys_role_channel` */

DROP TABLE IF EXISTS `sys_role_channel`;

CREATE TABLE `sys_role_channel` (
  `role_id` int NOT NULL COMMENT '角色id',
  `channel_id` int NOT NULL COMMENT '栏目id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色栏目权限';

/*Data for the table `sys_role_channel` */

/*Table structure for table `sys_role_cms` */

DROP TABLE IF EXISTS `sys_role_cms`;

CREATE TABLE `sys_role_cms` (
  `role_id` int NOT NULL COMMENT '角色id',
  `property_id` int NOT NULL COMMENT '属性id',
  `property_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '属性类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='cms角色权限';

/*Data for the table `sys_role_cms` */

insert  into `sys_role_cms`(`role_id`,`property_id`,`property_type`) values

(100,1012,'site'),

(100,1014,'site'),

(100,1012,'channel'),

(100,1013,'channel'),

(100,1014,'channel'),

(102,1038,'channel'),

(102,1042,'channel'),

(102,1043,'channel'),

(102,1039,'channel'),

(102,1046,'channel'),

(101,1054,'channel'),

(101,1053,'channel'),

(101,1055,'channel'),

(2,1018,'site'),

(101,1016,'site'),

(102,1016,'site');

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

insert  into `sys_role_dept`(`role_id`,`dept_id`) values

(2,100),

(2,101),

(2,105);

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values

(2,1),

(2,2),

(2,100),

(2,101),

(2,102),

(2,103),

(2,104),

(2,105),

(2,106),

(2,107),

(2,108),

(2,109),

(2,110),

(2,111),

(2,112),

(2,113),

(2,114),

(2,500),

(2,501),

(2,1000),

(2,1001),

(2,1002),

(2,1003),

(2,1004),

(2,1005),

(2,1006),

(2,1007),

(2,1008),

(2,1009),

(2,1010),

(2,1011),

(2,1012),

(2,1013),

(2,1014),

(2,1015),

(2,1016),

(2,1017),

(2,1018),

(2,1019),

(2,1020),

(2,1021),

(2,1022),

(2,1023),

(2,1024),

(2,1025),

(2,1026),

(2,1027),

(2,1028),

(2,1029),

(2,1030),

(2,1031),

(2,1032),

(2,1033),

(2,1034),

(2,1035),

(2,1036),

(2,1037),

(2,1038),

(2,1039),

(2,1040),

(2,1041),

(2,1042),

(2,1043),

(2,1044),

(2,1045),

(2,1046),

(2,1047),

(2,1048),

(2,1049),

(2,1050),

(2,1051),

(2,1052),

(2,1053),

(2,1054),

(100,2001),

(100,2002),

(100,2011),

(100,2012),

(100,2013),

(100,2014),

(100,2015),

(100,2016),

(100,2017),

(100,2018),

(100,2019),

(100,2020),

(100,2021),

(100,2022),

(100,2054),

(100,2055),

(100,2056),

(100,2057),

(100,2058),

(100,2059),

(100,2069),

(101,2001),

(101,2004),

(101,2011),

(101,2012),

(101,2015),

(101,2016),

(101,2017),

(101,2018),

(101,2019),

(101,2022),

(101,2023),

(101,2024),

(101,2025),

(101,2026),

(101,2027),

(101,2028),

(101,2035),

(101,2036),

(101,2037),

(101,2038),

(101,2039),

(101,2040),

(101,2069),

(101,2087),

(102,1),

(102,2),

(102,100),

(102,101),

(102,102),

(102,103),

(102,104),

(102,105),

(102,106),

(102,107),

(102,108),

(102,109),

(102,110),

(102,111),

(102,112),

(102,113),

(102,114),

(102,500),

(102,501),

(102,1000),

(102,1001),

(102,1002),

(102,1003),

(102,1004),

(102,1005),

(102,1006),

(102,1007),

(102,1008),

(102,1009),

(102,1010),

(102,1011),

(102,1012),

(102,1013),

(102,1014),

(102,1015),

(102,1016),

(102,1017),

(102,1018),

(102,1019),

(102,1020),

(102,1021),

(102,1022),

(102,1023),

(102,1024),

(102,1025),

(102,1026),

(102,1027),

(102,1028),

(102,1029),

(102,1030),

(102,1031),

(102,1032),

(102,1033),

(102,1034),

(102,1035),

(102,1036),

(102,1037),

(102,1038),

(102,1039),

(102,1040),

(102,1041),

(102,1042),

(102,1043),

(102,1044),

(102,1045),

(102,1046),

(102,1047),

(102,1048),

(102,1049),

(102,1050),

(102,1051),

(102,1052),

(102,1053),

(102,1054),

(102,2000),

(102,2001),

(102,2003),

(102,2004),

(102,2005),

(102,2006),

(102,2007),

(102,2008),

(102,2009),

(102,2010),

(102,2011),

(102,2012),

(102,2013),

(102,2014),

(102,2015),

(102,2016),

(102,2017),

(102,2018),

(102,2019),

(102,2020),

(102,2021),

(102,2022),

(102,2023),

(102,2024),

(102,2025),

(102,2026),

(102,2027),

(102,2028),

(102,2029),

(102,2030),

(102,2031),

(102,2032),

(102,2033),

(102,2034),

(102,2035),

(102,2036),

(102,2037),

(102,2038),

(102,2039),

(102,2040),

(102,2041),

(102,2042),

(102,2043),

(102,2044),

(102,2045),

(102,2046),

(102,2047),

(102,2048),

(102,2054),

(102,2055),

(102,2056),

(102,2057),

(102,2058),

(102,2059),

(102,2067),

(102,2068),

(102,2069),

(102,2088);

/*Table structure for table `sys_role_site` */

DROP TABLE IF EXISTS `sys_role_site`;

CREATE TABLE `sys_role_site` (
  `role_id` int NOT NULL COMMENT '角色id',
  `site_id` int NOT NULL COMMENT '站点id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色站点权限';

/*Data for the table `sys_role_site` */

/*Table structure for table `sys_security_config` */

DROP TABLE IF EXISTS `sys_security_config`;

CREATE TABLE `sys_security_config` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stage` char(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `password_len_min` int NOT NULL COMMENT '密码最小长度',
  `password_len_max` int DEFAULT NULL COMMENT '密码最大长度',
  `password_rule` varchar(50) NOT NULL COMMENT '密码校验规则',
  `password_sensitive` varchar(255) DEFAULT NULL COMMENT '密码不可包含的敏感信息',
  `weak_passwords` varchar(500) DEFAULT NULL COMMENT '弱密码集合',
  `force_modify_pwd_after_add` char(2) NOT NULL COMMENT '后台添加的用户首次登陆是否需要强制修改密码',
  `force_modify_pwd_after_reset` char(2) DEFAULT NULL COMMENT '后台重置密码后首次登陆是否需要强制修改密码',
  `password_expire_seconds` int NOT NULL COMMENT '密码有效期（单位：秒）',
  `password_retry_limit` int NOT NULL COMMENT '密码错误次数阈值',
  `password_retry_strategy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '密码错误次数阈值触发后的处理策略',
  `password_retry_lock_seconds` int DEFAULT NULL COMMENT '密码错误阈值触发锁定账号时长，单位：秒',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='安全配置';

/*Data for the table `sys_security_config` */

insert  into `sys_security_config`(`id`,`stage`,`password_len_min`,`password_len_max`,`password_rule`,`password_sensitive`,`weak_passwords`,`force_modify_pwd_after_add`,`force_modify_pwd_after_reset`,`password_expire_seconds`,`password_retry_limit`,`password_retry_strategy`,`password_retry_lock_seconds`,`create_by`,`create_time`,`update_by`,`update_time`) values

(103,'1',6,16,'UPPER_LOW_LETTER_NUMBER','[\"PHONE_NUMBER\",\"ACCOUNT\"]',NULL,'N','N',0,0,NULL,NULL,NULL,'2023-12-14 16:07:53',NULL,NULL),

(104,'0',6,16,'UPPER_LOW_LETTER_NUMBER','[\"PHONE_NUMBER\",\"EMAIL\"]',NULL,'N','N',0,0,NULL,NULL,NULL,'2023-12-14 17:05:47',NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values

(1,103,'admin','后台管理员','00','','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-03-25 14:32:11','admin','2023-06-20 14:47:29','','2024-03-25 14:32:10','管理员'),

(100,104,'hnzyy01','测试内容管理员','00','','','0','','$2a$10$5Ngw3gmrYzO863DSMZwcROOEZHia7zs.icUccfO35dZ.16yJe0r7O','0','0','127.0.0.1','2023-11-20 18:29:39','admin','2023-08-07 09:56:52','admin','2024-01-24 17:51:41',NULL),

(101,104,'123456','测试','00','','','0','','$2a$10$2IzRQMgKP70a88hz5JhDpurVGqQ5wrpDEOMuIlueuFMlMNiI07FfS','0','0','',NULL,'admin','2023-12-14 09:52:58','',NULL,NULL),

(102,NULL,'ces111','111111','00','','','0','','$2a$10$H8BmFdxn0nTjW.zho/yrp.atXLtx2p76Nrs39pOD//ph6hXt1AKFm','0','0','',NULL,'admin','2023-12-14 09:58:43','',NULL,NULL),

(103,NULL,'16650265577','cessss','00','','','0','','$2a$10$sKW94jyZCbqaN8sZUg/2keUHpYrSP24zDI8WrRXGUzoZK1EWsTyR.','0','2','',NULL,'admin','2023-12-14 14:50:06','',NULL,NULL),

(104,NULL,'12331223','22222','00','','','0','','$2a$10$HRw6MyHA2SRb9Nc1ts2R..OwCrLD5VP69esyKaoxDuGOuSQznWhHS','0','2','',NULL,'admin','2023-12-14 14:52:15','',NULL,NULL),

(105,NULL,'2222','ces122','00','','','0','','$2a$10$k1O4enr3dOhao6ZQr4uyA.TxWld.DjLtqLt6jIRVKa4GdT7KA9mvO','0','0','',NULL,'admin','2023-12-14 14:53:12','',NULL,NULL),

(106,NULL,'22121122','ces11','00','','','0','','$2a$10$wkzrEX5/.zKyRvD.27hTe.8V5kqg.AS4rF9ZFoO2nzU8HnXwOVYbW','0','0','',NULL,'admin','2023-12-14 14:55:12','',NULL,NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values

(1,1),

(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values

(1,1),

(2,2),

(100,101),

(101,102);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
