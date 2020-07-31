/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.19 : Database - opendata
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `opendata`;

/*Table structure for table `hdh_banner` */

CREATE TABLE `hdh_banner` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `banner_name` varchar(255) DEFAULT NULL COMMENT '轮播图名称',
  `banner_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `link_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `priority` int DEFAULT NULL COMMENT '优先级别',
  `is_show` smallint DEFAULT NULL COMMENT '是否展示',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hdh_banner` */

insert  into `hdh_banner`(`id`,`banner_name`,`banner_url`,`link_url`,`priority`,`is_show`,`create_time`) values (1,'banner1','https://img.zcool.cn/community/01463d5ef80dc0a8012066216a021b.png',NULL,7,1,'2020-06-29 18:09:34'),(2,'banner2','https://img.zcool.cn/community/01c7325ef94db7a80120662185e41b.jpg',NULL,8,1,'2020-06-29 18:09:51'),(3,'测试1','http://data.hdhdeveloper.cn/hdh/20200713/8182a8be0b6346209b157c4e034d2c31.png','https://www.baidu.com ',2,1,'2020-07-13 20:47:56');

/*Table structure for table `hdh_category` */

CREATE TABLE `hdh_category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_name` varchar(255) DEFAULT NULL COMMENT '类目名称',
  `priority` int DEFAULT NULL COMMENT '排序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `hdh_category` */

insert  into `hdh_category`(`id`,`category_name`,`priority`,`create_time`) values (2,'java项目',8,'2020-06-28 22:33:54'),(3,'微信小程序',9,'2020-06-28 22:34:04');

/*Table structure for table `hdh_content` */

CREATE TABLE `hdh_content` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content_name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `content_text` text COMMENT '详情',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `hdh_content` */

insert  into `hdh_content`(`id`,`content_name`,`content_text`,`create_time`) values (2,'1','<p>1</p>','2020-07-13 22:53:40');

/*Table structure for table `hdh_works` */

CREATE TABLE `hdh_works` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `works_name` varchar(255) DEFAULT NULL COMMENT '作品名称',
  `works_desc` varchar(255) DEFAULT NULL COMMENT '作品描述',
  `picture_url` varchar(255) DEFAULT NULL COMMENT '封面图',
  `is_new` smallint DEFAULT NULL COMMENT '最新作品',
  `is_recommend` smallint DEFAULT NULL COMMENT '首页推荐',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `link_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `category_id` int DEFAULT NULL COMMENT '所属类目',
  `content` text COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `hdh_works` */

insert  into `hdh_works`(`id`,`works_name`,`works_desc`,`picture_url`,`is_new`,`is_recommend`,`create_time`,`link_url`,`category_id`,`content`) values (1,'美力绽放的艺术 ｜ 华光HG ｜ 手持挂烫机详情视觉策划','网页-电商','https://img.zcool.cn/community/01d1f55ef93a4ea801206621ec1422.jpg',1,1,'2020-06-29 14:41:35','https://www.zcool.com.cn/',2,'黄初三年，余朝京师，还济洛川。古人有言，斯水之神，名曰宓妃。感宋玉对楚王神女之事，遂作斯赋。其辞曰：\r\n余从京域，言归东藩。背伊阙，越轘辕，经通谷，陵景山。日既西倾，车殆马烦。尔乃税驾乎蘅皋，秣驷乎芝田，容与乎阳林，流眄乎洛川。于是精移神骇，忽焉思散。俯则未察，仰以殊观，睹一丽人，于岩之畔。乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神，名曰宓妃。然则君王所见，无乃是乎？其状若何？臣愿闻之。”\r\n余告之曰：“其形也，翩若惊鸿，婉若游龙。荣曜秋菊，华茂春松。髣髴兮若轻云之蔽月，飘飖兮若流风之回雪。远而望之，皎若太阳升朝霞；迫而察之，灼若芙蕖出渌波。秾纤得衷，修短合度。肩若削成，腰如约素。延颈秀项，皓质呈露。芳泽无加，铅华弗御。云髻峨峨，修眉联娟。丹唇外朗，皓齿内鲜，明眸善睐，靥辅承权。瑰姿艳逸，仪静体闲。柔情绰态，媚于语言。奇服旷世，骨像应图。披罗衣之璀粲兮，珥瑶碧之华琚。戴金翠之首饰，缀明珠以耀躯。践远游之文履，曳雾绡之轻裾。微幽兰之芳蔼兮，步踟蹰于山隅。\r\n于是忽焉纵体，以遨以嬉。左倚采旄，右荫桂旗。壤皓腕于神浒兮，采湍濑之玄芝。余情悦其淑美兮，心振荡而不怡。无良媒以接欢兮，托微波而通辞。愿诚素之先达兮，解玉佩以要之。嗟佳人之信修，羌习礼而明诗。抗琼珶以和予兮，指潜渊而为期。执眷眷之款实兮，惧斯灵之我欺。感交甫之弃言兮，怅犹豫而狐疑。收和颜而静志兮，申礼防以自持。\r\n于是洛灵感焉，徙倚彷徨，神光离合，乍阴乍阳。竦轻躯以鹤立，若将飞而未翔。践椒涂之郁烈，步蘅薄而流芳。超长吟以永慕兮，声哀厉而弥长。\r\n尔乃众灵杂沓，命俦啸侣，或戏清流，或翔神渚，或采明珠，或拾翠羽。从南湘之二妃，携汉滨之游女。叹匏瓜之无匹兮，咏牵牛之独处。扬轻袿之猗靡兮，翳修袖以延伫。体迅飞凫，飘忽若神，凌波微步，罗袜生尘。动无常则，若危若安。进止难期，若往若还。转眄流精，光润玉颜。含辞未吐，气若幽兰。华容婀娜，令我忘餐。\r\n于是屏翳收风，川后静波。冯夷鸣鼓，女娲清歌。腾文鱼以警乘，鸣玉鸾以偕逝。六龙俨其齐首，载云车之容裔，鲸鲵踊而夹毂，水禽翔而为卫。\r\n于是越北沚。过南冈，纡素领，回清阳，动朱唇以徐言，陈交接之大纲。恨人神之道殊兮，怨盛年之莫当。抗罗袂以掩涕兮，泪流襟之浪浪。悼良会之永绝兮，哀一逝而异乡。无微情以效爱兮，献江南之明珰。虽潜处于太阴，长寄心于君王。忽不悟其所舍，怅神宵而蔽光。\r\n于是背下陵高，足往神留，遗情想像，顾望怀愁。冀灵体之复形，御轻舟而上溯。浮长川而忘返，思绵绵而增慕。夜耿耿而不寐，沾繁霜而至曙。命仆夫而就驾，吾将归乎东路。揽騑辔以抗策，怅盘桓而不能去。\r\n\r\n作者：追逐繁星D孩子\r\n链接：https://www.jianshu.com/p/dd476e8f0eef\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。'),(2,'低碳生活精选图集','精选图集','https://img.zcool.cn/community/0159275ef95cfba801206621efec24.jpg',1,1,'2020-06-29 14:42:58','https://www.zcool.com.cn/',2,'黄初三年，余朝京师，还济洛川。古人有言，斯水之神，名曰宓妃。感宋玉对楚王神女之事，遂作斯赋。其辞曰：\r\n余从京域，言归东藩。背伊阙，越轘辕，经通谷，陵景山。日既西倾，车殆马烦。尔乃税驾乎蘅皋，秣驷乎芝田，容与乎阳林，流眄乎洛川。于是精移神骇，忽焉思散。俯则未察，仰以殊观，睹一丽人，于岩之畔。乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神，名曰宓妃。然则君王所见，无乃是乎？其状若何？臣愿闻之。”\r\n余告之曰：“其形也，翩若惊鸿，婉若游龙。荣曜秋菊，华茂春松。髣髴兮若轻云之蔽月，飘飖兮若流风之回雪。远而望之，皎若太阳升朝霞；迫而察之，灼若芙蕖出渌波。秾纤得衷，修短合度。肩若削成，腰如约素。延颈秀项，皓质呈露。芳泽无加，铅华弗御。云髻峨峨，修眉联娟。丹唇外朗，皓齿内鲜，明眸善睐，靥辅承权。瑰姿艳逸，仪静体闲。柔情绰态，媚于语言。奇服旷世，骨像应图。披罗衣之璀粲兮，珥瑶碧之华琚。戴金翠之首饰，缀明珠以耀躯。践远游之文履，曳雾绡之轻裾。微幽兰之芳蔼兮，步踟蹰于山隅。\r\n于是忽焉纵体，以遨以嬉。左倚采旄，右荫桂旗。壤皓腕于神浒兮，采湍濑之玄芝。余情悦其淑美兮，心振荡而不怡。无良媒以接欢兮，托微波而通辞。愿诚素之先达兮，解玉佩以要之。嗟佳人之信修，羌习礼而明诗。抗琼珶以和予兮，指潜渊而为期。执眷眷之款实兮，惧斯灵之我欺。感交甫之弃言兮，怅犹豫而狐疑。收和颜而静志兮，申礼防以自持。\r\n于是洛灵感焉，徙倚彷徨，神光离合，乍阴乍阳。竦轻躯以鹤立，若将飞而未翔。践椒涂之郁烈，步蘅薄而流芳。超长吟以永慕兮，声哀厉而弥长。\r\n尔乃众灵杂沓，命俦啸侣，或戏清流，或翔神渚，或采明珠，或拾翠羽。从南湘之二妃，携汉滨之游女。叹匏瓜之无匹兮，咏牵牛之独处。扬轻袿之猗靡兮，翳修袖以延伫。体迅飞凫，飘忽若神，凌波微步，罗袜生尘。动无常则，若危若安。进止难期，若往若还。转眄流精，光润玉颜。含辞未吐，气若幽兰。华容婀娜，令我忘餐。\r\n于是屏翳收风，川后静波。冯夷鸣鼓，女娲清歌。腾文鱼以警乘，鸣玉鸾以偕逝。六龙俨其齐首，载云车之容裔，鲸鲵踊而夹毂，水禽翔而为卫。\r\n于是越北沚。过南冈，纡素领，回清阳，动朱唇以徐言，陈交接之大纲。恨人神之道殊兮，怨盛年之莫当。抗罗袂以掩涕兮，泪流襟之浪浪。悼良会之永绝兮，哀一逝而异乡。无微情以效爱兮，献江南之明珰。虽潜处于太阴，长寄心于君王。忽不悟其所舍，怅神宵而蔽光。\r\n于是背下陵高，足往神留，遗情想像，顾望怀愁。冀灵体之复形，御轻舟而上溯。浮长川而忘返，思绵绵而增慕。夜耿耿而不寐，沾繁霜而至曙。命仆夫而就驾，吾将归乎东路。揽騑辔以抗策，怅盘桓而不能去。\r\n\r\n作者：追逐繁星D孩子\r\n链接：https://www.jianshu.com/p/dd476e8f0eef\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。'),(3,'A4美术馆｜良相设计','平面-设计','https://img.zcool.cn/community/01ed5a5ef89ca8a8012066216a5bc9.jpg',1,1,'2020-06-29 14:43:24','https://www.zcool.com.cn/',3,'黄初三年，余朝京师，还济洛川。古人有言，斯水之神，名曰宓妃。感宋玉对楚王神女之事，遂作斯赋。其辞曰：\r\n余从京域，言归东藩。背伊阙，越轘辕，经通谷，陵景山。日既西倾，车殆马烦。尔乃税驾乎蘅皋，秣驷乎芝田，容与乎阳林，流眄乎洛川。于是精移神骇，忽焉思散。俯则未察，仰以殊观，睹一丽人，于岩之畔。乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神，名曰宓妃。然则君王所见，无乃是乎？其状若何？臣愿闻之。”\r\n余告之曰：“其形也，翩若惊鸿，婉若游龙。荣曜秋菊，华茂春松。髣髴兮若轻云之蔽月，飘飖兮若流风之回雪。远而望之，皎若太阳升朝霞；迫而察之，灼若芙蕖出渌波。秾纤得衷，修短合度。肩若削成，腰如约素。延颈秀项，皓质呈露。芳泽无加，铅华弗御。云髻峨峨，修眉联娟。丹唇外朗，皓齿内鲜，明眸善睐，靥辅承权。瑰姿艳逸，仪静体闲。柔情绰态，媚于语言。奇服旷世，骨像应图。披罗衣之璀粲兮，珥瑶碧之华琚。戴金翠之首饰，缀明珠以耀躯。践远游之文履，曳雾绡之轻裾。微幽兰之芳蔼兮，步踟蹰于山隅。\r\n于是忽焉纵体，以遨以嬉。左倚采旄，右荫桂旗。壤皓腕于神浒兮，采湍濑之玄芝。余情悦其淑美兮，心振荡而不怡。无良媒以接欢兮，托微波而通辞。愿诚素之先达兮，解玉佩以要之。嗟佳人之信修，羌习礼而明诗。抗琼珶以和予兮，指潜渊而为期。执眷眷之款实兮，惧斯灵之我欺。感交甫之弃言兮，怅犹豫而狐疑。收和颜而静志兮，申礼防以自持。\r\n于是洛灵感焉，徙倚彷徨，神光离合，乍阴乍阳。竦轻躯以鹤立，若将飞而未翔。践椒涂之郁烈，步蘅薄而流芳。超长吟以永慕兮，声哀厉而弥长。\r\n尔乃众灵杂沓，命俦啸侣，或戏清流，或翔神渚，或采明珠，或拾翠羽。从南湘之二妃，携汉滨之游女。叹匏瓜之无匹兮，咏牵牛之独处。扬轻袿之猗靡兮，翳修袖以延伫。体迅飞凫，飘忽若神，凌波微步，罗袜生尘。动无常则，若危若安。进止难期，若往若还。转眄流精，光润玉颜。含辞未吐，气若幽兰。华容婀娜，令我忘餐。\r\n于是屏翳收风，川后静波。冯夷鸣鼓，女娲清歌。腾文鱼以警乘，鸣玉鸾以偕逝。六龙俨其齐首，载云车之容裔，鲸鲵踊而夹毂，水禽翔而为卫。\r\n于是越北沚。过南冈，纡素领，回清阳，动朱唇以徐言，陈交接之大纲。恨人神之道殊兮，怨盛年之莫当。抗罗袂以掩涕兮，泪流襟之浪浪。悼良会之永绝兮，哀一逝而异乡。无微情以效爱兮，献江南之明珰。虽潜处于太阴，长寄心于君王。忽不悟其所舍，怅神宵而蔽光。\r\n于是背下陵高，足往神留，遗情想像，顾望怀愁。冀灵体之复形，御轻舟而上溯。浮长川而忘返，思绵绵而增慕。夜耿耿而不寐，沾繁霜而至曙。命仆夫而就驾，吾将归乎东路。揽騑辔以抗策，怅盘桓而不能去。\r\n\r\n作者：追逐繁星D孩子\r\n链接：https://www.jianshu.com/p/dd476e8f0eef\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。'),(4,'晒物集·SHOW出你们灵感诞生地「工作台」','活动-线上活动','https://img.zcool.cn/community/activity_cover/53aa5ef80c20000001465eb720dd.jpg',1,1,'2020-06-29 14:44:29','https://www.zcool.com.cn/',3,'黄初三年，余朝京师，还济洛川。古人有言，斯水之神，名曰宓妃。感宋玉对楚王神女之事，遂作斯赋。其辞曰：\r\n余从京域，言归东藩。背伊阙，越轘辕，经通谷，陵景山。日既西倾，车殆马烦。尔乃税驾乎蘅皋，秣驷乎芝田，容与乎阳林，流眄乎洛川。于是精移神骇，忽焉思散。俯则未察，仰以殊观，睹一丽人，于岩之畔。乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神，名曰宓妃。然则君王所见，无乃是乎？其状若何？臣愿闻之。”\r\n余告之曰：“其形也，翩若惊鸿，婉若游龙。荣曜秋菊，华茂春松。髣髴兮若轻云之蔽月，飘飖兮若流风之回雪。远而望之，皎若太阳升朝霞；迫而察之，灼若芙蕖出渌波。秾纤得衷，修短合度。肩若削成，腰如约素。延颈秀项，皓质呈露。芳泽无加，铅华弗御。云髻峨峨，修眉联娟。丹唇外朗，皓齿内鲜，明眸善睐，靥辅承权。瑰姿艳逸，仪静体闲。柔情绰态，媚于语言。奇服旷世，骨像应图。披罗衣之璀粲兮，珥瑶碧之华琚。戴金翠之首饰，缀明珠以耀躯。践远游之文履，曳雾绡之轻裾。微幽兰之芳蔼兮，步踟蹰于山隅。\r\n于是忽焉纵体，以遨以嬉。左倚采旄，右荫桂旗。壤皓腕于神浒兮，采湍濑之玄芝。余情悦其淑美兮，心振荡而不怡。无良媒以接欢兮，托微波而通辞。愿诚素之先达兮，解玉佩以要之。嗟佳人之信修，羌习礼而明诗。抗琼珶以和予兮，指潜渊而为期。执眷眷之款实兮，惧斯灵之我欺。感交甫之弃言兮，怅犹豫而狐疑。收和颜而静志兮，申礼防以自持。\r\n于是洛灵感焉，徙倚彷徨，神光离合，乍阴乍阳。竦轻躯以鹤立，若将飞而未翔。践椒涂之郁烈，步蘅薄而流芳。超长吟以永慕兮，声哀厉而弥长。\r\n尔乃众灵杂沓，命俦啸侣，或戏清流，或翔神渚，或采明珠，或拾翠羽。从南湘之二妃，携汉滨之游女。叹匏瓜之无匹兮，咏牵牛之独处。扬轻袿之猗靡兮，翳修袖以延伫。体迅飞凫，飘忽若神，凌波微步，罗袜生尘。动无常则，若危若安。进止难期，若往若还。转眄流精，光润玉颜。含辞未吐，气若幽兰。华容婀娜，令我忘餐。\r\n于是屏翳收风，川后静波。冯夷鸣鼓，女娲清歌。腾文鱼以警乘，鸣玉鸾以偕逝。六龙俨其齐首，载云车之容裔，鲸鲵踊而夹毂，水禽翔而为卫。\r\n于是越北沚。过南冈，纡素领，回清阳，动朱唇以徐言，陈交接之大纲。恨人神之道殊兮，怨盛年之莫当。抗罗袂以掩涕兮，泪流襟之浪浪。悼良会之永绝兮，哀一逝而异乡。无微情以效爱兮，献江南之明珰。虽潜处于太阴，长寄心于君王。忽不悟其所舍，怅神宵而蔽光。\r\n于是背下陵高，足往神留，遗情想像，顾望怀愁。冀灵体之复形，御轻舟而上溯。浮长川而忘返，思绵绵而增慕。夜耿耿而不寐，沾繁霜而至曙。命仆夫而就驾，吾将归乎东路。揽騑辔以抗策，怅盘桓而不能去。\r\n\r\n作者：追逐繁星D孩子\r\n链接：https://www.jianshu.com/p/dd476e8f0eef\r\n来源：简书\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。'),(5,'75/365个故事','插画-商业插画','https://img.zcool.cn/community/0118c55ef618d4a801206621fcd958.jpg',0,0,'2020-06-29 15:28:06','https://www.zcool.com.cn/',2,'1黄初三年，余朝京师，还济洛川。古人有言，斯水之神，名曰宓妃。感宋玉对楚王神女之事，遂作斯赋。其辞曰：\n余从京域，言归东藩。背伊阙，越轘辕，经通谷，陵景山。日既西倾，车殆马烦。尔乃税驾乎蘅皋，秣驷乎芝田，容与乎阳林，流眄乎洛川。于是精移神骇，忽焉思散。俯则未察，仰以殊观，睹一丽人，于岩之畔。乃援御者而告之曰：“尔有觌于彼者乎？彼何人斯？若此之艳也！”御者对曰：“臣闻河洛之神，名曰宓妃。然则君王所见，无乃是乎？其状若何？臣愿闻之。”\n余告之曰：“其形也，翩若惊鸿，婉若游龙。荣曜秋菊，华茂春松。髣髴兮若轻云之蔽月，飘飖兮若流风之回雪。远而望之，皎若太阳升朝霞；迫而察之，灼若芙蕖出渌波。秾纤得衷，修短合度。肩若削成，腰如约素。延颈秀项，皓质呈露。芳泽无加，铅华弗御。云髻峨峨，修眉联娟。丹唇外朗，皓齿内鲜，明眸善睐，靥辅承权。瑰姿艳逸，仪静体闲。柔情绰态，媚于语言。奇服旷世，骨像应图。披罗衣之璀粲兮，珥瑶碧之华琚。戴金翠之首饰，缀明珠以耀躯。践远游之文履，曳雾绡之轻裾。微幽兰之芳蔼兮，步踟蹰于山隅。\n于是忽焉纵体，以遨以嬉。左倚采旄，右荫桂旗。壤皓腕于神浒兮，采湍濑之玄芝。余情悦其淑美兮，心振荡而不怡。无良媒以接欢兮，托微波而通辞。愿诚素之先达兮，解玉佩以要之。嗟佳人之信修，羌习礼而明诗。抗琼珶以和予兮，指潜渊而为期。执眷眷之款实兮，惧斯灵之我欺。感交甫之弃言兮，怅犹豫而狐疑。收和颜而静志兮，申礼防以自持。\n于是洛灵感焉，徙倚彷徨，神光离合，乍阴乍阳。竦轻躯以鹤立，若将飞而未翔。践椒涂之郁烈，步蘅薄而流芳。超长吟以永慕兮，声哀厉而弥长。\n尔乃众灵杂沓，命俦啸侣，或戏清流，或翔神渚，或采明珠，或拾翠羽。从南湘之二妃，携汉滨之游女。叹匏瓜之无匹兮，咏牵牛之独处。扬轻袿之猗靡兮，翳修袖以延伫。体迅飞凫，飘忽若神，凌波微步，罗袜生尘。动无常则，若危若安。进止难期，若往若还。转眄流精，光润玉颜。含辞未吐，气若幽兰。华容婀娜，令我忘餐。\n于是屏翳收风，川后静波。冯夷鸣鼓，女娲清歌。腾文鱼以警乘，鸣玉鸾以偕逝。六龙俨其齐首，载云车之容裔，鲸鲵踊而夹毂，水禽翔而为卫。\n于是越北沚。过南冈，纡素领，回清阳，动朱唇以徐言，陈交接之大纲。恨人神之道殊兮，怨盛年之莫当。抗罗袂以掩涕兮，泪流襟之浪浪。悼良会之永绝兮，哀一逝而异乡。无微情以效爱兮，献江南之明珰。虽潜处于太阴，长寄心于君王。忽不悟其所舍，怅神宵而蔽光。\n于是背下陵高，足往神留，遗情想像，顾望怀愁。冀灵体之复形，御轻舟而上溯。浮长川而忘返，思绵绵而增慕。夜耿耿而不寐，沾繁霜而至曙。命仆夫而就驾，吾将归乎东路。揽騑辔以抗策，怅盘桓而不能去。\n\n作者：追逐繁星D孩子\n链接：https://www.jianshu.com/p/dd476e8f0eef\n来源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。<p><br></p>');

/*Table structure for table `qrtz_blob_triggers` */

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_cron_triggers` */

insert  into `qrtz_cron_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`CRON_EXPRESSION`,`TIME_ZONE_ID`) values ('RenrenScheduler','TASK_1','DEFAULT','0 0/30 * * * ?','Asia/Shanghai');

/*Table structure for table `qrtz_fired_triggers` */

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_job_details` */

insert  into `qrtz_job_details`(`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`JOB_CLASS_NAME`,`IS_DURABLE`,`IS_NONCONCURRENT`,`IS_UPDATE_DATA`,`REQUESTS_RECOVERY`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT',NULL,'io.renren.modules.job.utils.ScheduleJob','0','0','0','0','��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0r��٘xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `qrtz_locks` */

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_locks` */

insert  into `qrtz_locks`(`SCHED_NAME`,`LOCK_NAME`) values ('RenrenScheduler','STATE_ACCESS'),('RenrenScheduler','TRIGGER_ACCESS');

/*Table structure for table `qrtz_paused_trigger_grps` */

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_scheduler_state` */

insert  into `qrtz_scheduler_state`(`SCHED_NAME`,`INSTANCE_NAME`,`LAST_CHECKIN_TIME`,`CHECKIN_INTERVAL`) values ('RenrenScheduler','HDH1595832782501',1595840270626,15000);

/*Table structure for table `qrtz_simple_triggers` */

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `qrtz_triggers` */

insert  into `qrtz_triggers`(`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`JOB_NAME`,`JOB_GROUP`,`DESCRIPTION`,`NEXT_FIRE_TIME`,`PREV_FIRE_TIME`,`PRIORITY`,`TRIGGER_STATE`,`TRIGGER_TYPE`,`START_TIME`,`END_TIME`,`CALENDAR_NAME`,`MISFIRE_INSTR`,`JOB_DATA`) values ('RenrenScheduler','TASK_1','DEFAULT','TASK_1','DEFAULT',NULL,1595840400000,1595838600000,5,'WAITING','CRON',1593265514000,0,NULL,2,'��\0sr\0org.quartz.JobDataMap���迩��\0\0xr\0&org.quartz.utils.StringKeyDirtyFlagMap�����](\0Z\0allowsTransientDataxr\0org.quartz.utils.DirtyFlagMap�.�(v\n�\0Z\0dirtyL\0mapt\0Ljava/util/Map;xpsr\0java.util.HashMap���`�\0F\0\nloadFactorI\0	thresholdxp?@\0\0\0\0\0w\0\0\0\0\0\0t\0\rJOB_PARAM_KEYsr\0.io.renren.modules.job.entity.ScheduleJobEntity\0\0\0\0\0\0\0\0L\0beanNamet\0Ljava/lang/String;L\0\ncreateTimet\0Ljava/util/Date;L\0cronExpressionq\0~\0	L\0jobIdt\0Ljava/lang/Long;L\0paramsq\0~\0	L\0remarkq\0~\0	L\0statust\0Ljava/lang/Integer;xpt\0testTasksr\0java.util.Datehj�KYt\0\0xpw\0\0r��٘xt\00 0/30 * * * ?sr\0java.lang.Long;��̏#�\0J\0valuexr\0java.lang.Number������\0\0xp\0\0\0\0\0\0\0t\0renrent\0参数测试sr\0java.lang.Integer⠤���8\0I\0valuexq\0~\0\0\0\0\0x\0');

/*Table structure for table `schedule_job` */

CREATE TABLE `schedule_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务';

/*Data for the table `schedule_job` */

insert  into `schedule_job`(`job_id`,`bean_name`,`params`,`cron_expression`,`status`,`remark`,`create_time`) values (1,'testTask','renren','0 0/30 * * * ?',0,'参数测试','2020-06-27 21:28:15');

/*Table structure for table `schedule_job_log` */

CREATE TABLE `schedule_job_log` (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务日志';

/*Data for the table `schedule_job_log` */

insert  into `schedule_job_log`(`log_id`,`job_id`,`bean_name`,`params`,`status`,`error`,`times`,`create_time`) values (1,1,'testTask','renren',0,NULL,0,'2020-06-27 22:00:00'),(2,1,'testTask','renren',0,NULL,0,'2020-06-27 22:30:00'),(3,1,'testTask','renren',0,NULL,0,'2020-06-27 23:00:00'),(4,1,'testTask','renren',0,NULL,0,'2020-06-27 23:30:00'),(5,1,'testTask','renren',0,NULL,1,'2020-06-28 16:30:00'),(6,1,'testTask','renren',0,NULL,1,'2020-06-28 17:00:00'),(7,1,'testTask','renren',0,NULL,0,'2020-06-28 17:30:00'),(8,1,'testTask','renren',0,NULL,0,'2020-06-28 18:00:00'),(9,1,'testTask','renren',0,NULL,1,'2020-06-28 18:30:00'),(10,1,'testTask','renren',0,NULL,1,'2020-06-28 19:00:00'),(11,1,'testTask','renren',0,NULL,2,'2020-06-28 21:14:57'),(12,1,'testTask','renren',0,NULL,0,'2020-06-28 21:30:00'),(13,1,'testTask','renren',0,NULL,1,'2020-06-28 22:00:00'),(14,1,'testTask','renren',0,NULL,0,'2020-06-28 22:30:00'),(15,1,'testTask','renren',0,NULL,0,'2020-06-28 23:00:00'),(16,1,'testTask','renren',0,NULL,0,'2020-06-28 23:30:00'),(17,1,'testTask','renren',0,NULL,1,'2020-06-29 13:00:00'),(18,1,'testTask','renren',0,NULL,0,'2020-06-29 13:30:00'),(19,1,'testTask','renren',0,NULL,0,'2020-06-29 14:00:00'),(20,1,'testTask','renren',0,NULL,1,'2020-06-29 14:30:00'),(21,1,'testTask','renren',0,NULL,1,'2020-06-29 15:00:00'),(22,1,'testTask','renren',0,NULL,1,'2020-06-29 15:30:00'),(23,1,'testTask','renren',0,NULL,1,'2020-06-29 16:00:00'),(24,1,'testTask','renren',0,NULL,0,'2020-06-29 16:30:00'),(25,1,'testTask','renren',0,NULL,1,'2020-06-29 17:00:00'),(26,1,'testTask','renren',0,NULL,1,'2020-06-29 17:30:00'),(27,1,'testTask','renren',0,NULL,1,'2020-06-29 18:00:00'),(28,1,'testTask','renren',0,NULL,1,'2020-06-29 18:30:00'),(29,1,'testTask','renren',0,NULL,0,'2020-06-29 19:00:00'),(30,1,'testTask','renren',0,NULL,0,'2020-06-29 19:30:00'),(31,1,'testTask','renren',0,NULL,0,'2020-06-29 20:00:00'),(32,1,'testTask','renren',0,NULL,1,'2020-07-12 15:00:00'),(33,1,'testTask','renren',0,NULL,1,'2020-07-12 15:30:00'),(34,1,'testTask','renren',0,NULL,1,'2020-07-12 16:00:00'),(35,1,'testTask','renren',0,NULL,1,'2020-07-12 16:30:00'),(36,1,'testTask','renren',0,NULL,0,'2020-07-12 18:00:00'),(37,1,'testTask','renren',0,NULL,0,'2020-07-12 22:00:00'),(38,1,'testTask','renren',0,NULL,1,'2020-07-13 11:30:00'),(39,1,'testTask','renren',0,NULL,1,'2020-07-13 12:00:00'),(40,1,'testTask','renren',0,NULL,0,'2020-07-13 13:30:00'),(41,1,'testTask','renren',0,NULL,0,'2020-07-13 14:00:00'),(42,1,'testTask','renren',0,NULL,0,'2020-07-13 14:30:00'),(43,1,'testTask','renren',0,NULL,0,'2020-07-13 15:00:00'),(44,1,'testTask','renren',0,NULL,1,'2020-07-13 15:30:00'),(45,1,'testTask','renren',0,NULL,1,'2020-07-13 16:00:00'),(46,1,'testTask','renren',0,NULL,0,'2020-07-13 16:30:00'),(47,1,'testTask','renren',0,NULL,1,'2020-07-13 18:00:00'),(48,1,'testTask','renren',0,NULL,1,'2020-07-13 18:30:00'),(49,1,'testTask','renren',0,NULL,0,'2020-07-13 21:00:00'),(50,1,'testTask','renren',0,NULL,1,'2020-07-13 21:30:00'),(51,1,'testTask','renren',0,NULL,0,'2020-07-13 22:00:00'),(52,1,'testTask','renren',0,NULL,1,'2020-07-13 22:30:00'),(53,1,'testTask','renren',0,NULL,1,'2020-07-13 23:00:00'),(54,1,'testTask','renren',0,NULL,0,'2020-07-14 15:00:00'),(55,1,'testTask','renren',0,NULL,1,'2020-07-14 15:30:00'),(56,1,'testTask','renren',0,NULL,1,'2020-07-14 16:00:00'),(57,1,'testTask','renren',0,NULL,1,'2020-07-14 16:30:00'),(58,1,'testTask','renren',0,NULL,0,'2020-07-14 20:00:00'),(59,1,'testTask','renren',0,NULL,0,'2020-07-14 20:30:00'),(60,1,'testTask','renren',0,NULL,1,'2020-07-14 21:00:00'),(61,1,'testTask','renren',0,NULL,1,'2020-07-14 21:30:00'),(62,1,'testTask','renren',0,NULL,1,'2020-07-14 22:00:00'),(63,1,'testTask','renren',0,NULL,1,'2020-07-14 22:30:00'),(64,1,'testTask','renren',0,NULL,1,'2020-07-14 23:30:00'),(65,1,'testTask','renren',0,NULL,1,'2020-07-27 15:00:00'),(66,1,'testTask','renren',0,NULL,1,'2020-07-27 15:30:00'),(67,1,'testTask','renren',0,NULL,1,'2020-07-27 16:00:00'),(68,1,'testTask','renren',0,NULL,0,'2020-07-27 16:30:00'),(69,1,'testTask','renren',0,NULL,0,'2020-07-31 12:30:00');

/*Table structure for table `sys_captcha` */

CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统验证码';

/*Data for the table `sys_captcha` */

insert  into `sys_captcha`(`uuid`,`code`,`expire_time`) values ('1493c068-ce79-485f-8caa-d72331e413b3','8wycn','2020-07-31 12:30:51'),('ee3b9707-bbd7-48ca-8e65-d957e7a23606','5aday','2020-07-13 11:42:58');

/*Table structure for table `sys_config` */

CREATE TABLE `sys_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统配置信息表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`id`,`param_key`,`param_value`,`status`,`remark`) values (1,'CLOUD_STORAGE_CONFIG_KEY','{\"type\":1,\"qiniuDomain\":\"http://data.hdhdeveloper.cn\",\"qiniuPrefix\":\"hdh\",\"qiniuAccessKey\":\"bt_wUDJ7BMzqdmjvs04IyyE3InvpUwvzneS1v0QM\",\"qiniuSecretKey\":\"QoQ9jbE0SIDaFkpO9ImuNwFPadrqvYnfriCGz-82\",\"qiniuBucketName\":\"hdh-open-data\",\"aliyunDomain\":\"\",\"aliyunPrefix\":\"\",\"aliyunEndPoint\":\"\",\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qcloudBucketName\":\"\"}',0,'云存储配置信息');

/*Table structure for table `sys_log` */

CREATE TABLE `sys_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统日志';

/*Data for the table `sys_log` */

insert  into `sys_log`(`id`,`username`,`operation`,`method`,`params`,`time`,`ip`,`create_date`) values (1,'admin','保存菜单','io.renren.modules.sys.controller.SysMenuController.save()','[{\"menuId\":46,\"parentId\":0,\"name\":\"项目管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]',15,'0:0:0:0:0:0:0:1','2020-06-27 21:47:02'),(2,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":31,\"parentId\":46,\"name\":\"轮播图\",\"url\":\"generator/hdhbanner\",\"type\":1,\"icon\":\"shouye\",\"orderNum\":6}]',16,'0:0:0:0:0:0:0:1','2020-06-27 21:47:41'),(3,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":36,\"parentId\":46,\"name\":\"类目管理\",\"url\":\"generator/hdhcategory\",\"type\":1,\"icon\":\"menu\",\"orderNum\":6}]',13,'0:0:0:0:0:0:0:1','2020-06-27 21:48:06'),(4,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":41,\"parentId\":46,\"name\":\"项目管理\",\"url\":\"generator/hdhworks\",\"type\":1,\"icon\":\"config\",\"orderNum\":6}]',14,'0:0:0:0:0:0:0:1','2020-06-27 21:48:49'),(5,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":46,\"parentId\":0,\"name\":\"功能管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0}]',13,'0:0:0:0:0:0:0:1','2020-06-27 21:48:58'),(6,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":1,\"parentId\":0,\"name\":\"系统管理\",\"type\":0,\"icon\":\"system\",\"orderNum\":1}]',13,'0:0:0:0:0:0:0:1','2020-06-27 21:56:50'),(7,'admin','修改菜单','io.renren.modules.sys.controller.SysMenuController.update()','[{\"menuId\":47,\"parentId\":46,\"name\":\"页面管理\",\"url\":\"generator/hdhcontent\",\"type\":1,\"icon\":\"xiangqufill\",\"orderNum\":6}]',13,'0:0:0:0:0:0:0:1','2020-06-27 22:40:24');

/*Table structure for table `sys_menu` */

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单管理';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`parent_id`,`name`,`url`,`perms`,`type`,`icon`,`order_num`) values (1,0,'系统管理',NULL,NULL,0,'system',1),(2,1,'管理员列表','sys/user',NULL,1,'admin',1),(3,1,'角色管理','sys/role',NULL,1,'role',2),(4,1,'菜单管理','sys/menu',NULL,1,'menu',3),(5,1,'SQL监控','http://localhost:8080/renren-fast/druid/sql.html',NULL,1,'sql',4),(6,1,'定时任务','job/schedule',NULL,1,'job',5),(7,6,'查看',NULL,'sys:schedule:list,sys:schedule:info',2,NULL,0),(8,6,'新增',NULL,'sys:schedule:save',2,NULL,0),(9,6,'修改',NULL,'sys:schedule:update',2,NULL,0),(10,6,'删除',NULL,'sys:schedule:delete',2,NULL,0),(11,6,'暂停',NULL,'sys:schedule:pause',2,NULL,0),(12,6,'恢复',NULL,'sys:schedule:resume',2,NULL,0),(13,6,'立即执行',NULL,'sys:schedule:run',2,NULL,0),(14,6,'日志列表',NULL,'sys:schedule:log',2,NULL,0),(15,2,'查看',NULL,'sys:user:list,sys:user:info',2,NULL,0),(16,2,'新增',NULL,'sys:user:save,sys:role:select',2,NULL,0),(17,2,'修改',NULL,'sys:user:update,sys:role:select',2,NULL,0),(18,2,'删除',NULL,'sys:user:delete',2,NULL,0),(19,3,'查看',NULL,'sys:role:list,sys:role:info',2,NULL,0),(20,3,'新增',NULL,'sys:role:save,sys:menu:list',2,NULL,0),(21,3,'修改',NULL,'sys:role:update,sys:menu:list',2,NULL,0),(22,3,'删除',NULL,'sys:role:delete',2,NULL,0),(23,4,'查看',NULL,'sys:menu:list,sys:menu:info',2,NULL,0),(24,4,'新增',NULL,'sys:menu:save,sys:menu:select',2,NULL,0),(25,4,'修改',NULL,'sys:menu:update,sys:menu:select',2,NULL,0),(26,4,'删除',NULL,'sys:menu:delete',2,NULL,0),(27,1,'参数管理','sys/config','sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete',1,'config',6),(29,1,'系统日志','sys/log','sys:log:list',1,'log',7),(30,1,'文件上传','oss/oss','sys:oss:all',1,'oss',6),(31,46,'轮播图','generator/hdhbanner',NULL,1,'shouye',6),(32,31,'查看',NULL,'generator:hdhbanner:list,generator:hdhbanner:info',2,NULL,6),(33,31,'新增',NULL,'generator:hdhbanner:save',2,NULL,6),(34,31,'修改',NULL,'generator:hdhbanner:update',2,NULL,6),(35,31,'删除',NULL,'generator:hdhbanner:delete',2,NULL,6),(36,46,'类目管理','generator/hdhcategory',NULL,1,'menu',6),(37,36,'查看',NULL,'generator:hdhcategory:list,generator:hdhcategory:info',2,NULL,6),(38,36,'新增',NULL,'generator:hdhcategory:save',2,NULL,6),(39,36,'修改',NULL,'generator:hdhcategory:update',2,NULL,6),(40,36,'删除',NULL,'generator:hdhcategory:delete',2,NULL,6),(41,46,'项目管理','generator/hdhworks',NULL,1,'config',6),(42,41,'查看',NULL,'generator:hdhworks:list,generator:hdhworks:info',2,NULL,6),(43,41,'新增',NULL,'generator:hdhworks:save',2,NULL,6),(44,41,'修改',NULL,'generator:hdhworks:update',2,NULL,6),(45,41,'删除',NULL,'generator:hdhworks:delete',2,NULL,6),(46,0,'功能管理','','',0,'admin',0),(47,46,'页面管理','generator/hdhcontent',NULL,1,'xiangqufill',6),(48,47,'查看',NULL,'generator:hdhcontent:list,generator:hdhcontent:info',2,NULL,6),(49,47,'新增',NULL,'generator:hdhcontent:save',2,NULL,6),(50,47,'修改',NULL,'generator:hdhcontent:update',2,NULL,6),(51,47,'删除',NULL,'generator:hdhcontent:delete',2,NULL,6);

/*Table structure for table `sys_oss` */

CREATE TABLE `sys_oss` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件上传';

/*Data for the table `sys_oss` */

insert  into `sys_oss`(`id`,`url`,`create_date`) values (2,'http://data.hdhdeveloper.cn/hdh/20200628/b3b03929932b4363aedbd5f49684cfe2.png','2020-06-28 21:59:50'),(3,'http://data.hdhdeveloper.cn/hdh/20200629/452c958e36ec427a9ed9ef1a299de314.png','2020-06-29 15:50:51'),(4,'http://data.hdhdeveloper.cn/hdh/20200629/afe171fb03e94c2caa96e2c907fc40d5.png','2020-06-29 15:50:51'),(5,'http://data.hdhdeveloper.cn/hdh/20200629/d832dfa8de5c4290ba274852de502fc5.jpg','2020-06-29 15:51:07'),(6,'http://data.hdhdeveloper.cn/hdh/20200629/0448fedf4adb452e8320164d5616df19.png','2020-06-29 16:03:08'),(7,'http://data.hdhdeveloper.cn/hdh/20200713/7fdd33dade2e437b8f0f5414eed0365a.jpg','2020-07-13 18:03:27'),(8,'http://data.hdhdeveloper.cn/hdh/20200713/9f09e81283b346d48b5d66e4837bee84.jpg','2020-07-13 18:04:31'),(9,'http://data.hdhdeveloper.cn/hdh/20200713/cfe234ee5f22495d89b24984d7aac945.jpg','2020-07-13 18:05:43'),(10,'http://data.hdhdeveloper.cn/hdh/20200713/cdf3d2beea854f639e80050e41027573.jpg','2020-07-13 18:06:24'),(11,'http://data.hdhdeveloper.cn/hdh/20200713/7ebeef4f0b0d4a799f6501c152f127a8.jpg','2020-07-13 18:08:26'),(12,'http://data.hdhdeveloper.cn/hdh/20200713/8182a8be0b6346209b157c4e034d2c31.png','2020-07-13 20:47:41'),(13,'http://data.hdhdeveloper.cn/hdh/20200727/bfaec0e6386241f286e35b635e7edb39.png','2020-07-27 15:23:07');

/*Table structure for table `sys_role` */

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色';

/*Data for the table `sys_role` */

/*Table structure for table `sys_role_menu` */

CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色与菜单对应关系';

/*Data for the table `sys_role_menu` */

/*Table structure for table `sys_user` */

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`username`,`password`,`salt`,`email`,`mobile`,`status`,`create_user_id`,`create_time`) values (1,'admin','9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d','YzcmCZNvbXocrsz9dm8e','root@renren.io','13612345678',1,1,'2016-11-11 11:11:11');

/*Table structure for table `sys_user_role` */

CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与角色对应关系';

/*Data for the table `sys_user_role` */

/*Table structure for table `sys_user_token` */

CREATE TABLE `sys_user_token` (
  `user_id` bigint NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统用户Token';

/*Data for the table `sys_user_token` */

insert  into `sys_user_token`(`user_id`,`token`,`expire_time`,`update_time`) values (1,'c8cf616960aa7435fa285b6d2065cea5','2020-08-01 00:26:44','2020-07-31 12:26:44');

/*Table structure for table `tb_user` */

CREATE TABLE `tb_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户';

/*Data for the table `tb_user` */

insert  into `tb_user`(`user_id`,`username`,`mobile`,`password`,`create_time`) values (1,'mark','13612345678','8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918','2017-03-23 22:37:41');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
