/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : gmshop

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-12-03 10:03:19
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `adminuser`
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', 'gang', '123');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL auto_increment,
  `cname` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '女装男装');
INSERT INTO `category` VALUES ('2', '书籍');
INSERT INTO `category` VALUES ('3', '日用百货');
INSERT INTO `category` VALUES ('4', '家用电器');

-- ----------------------------
-- Table structure for `categorysecond`
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL auto_increment,
  `csname` varchar(255) default NULL,
  `cid` int(11) default NULL,
  PRIMARY KEY  (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '潮流女装', '1');
INSERT INTO `categorysecond` VALUES ('2', '初冬羽绒', '1');
INSERT INTO `categorysecond` VALUES ('3', '毛呢大衣', '1');
INSERT INTO `categorysecond` VALUES ('4', '温暖毛衣', '1');
INSERT INTO `categorysecond` VALUES ('5', '精选男装', '1');
INSERT INTO `categorysecond` VALUES ('6', '冬季外套', '1');
INSERT INTO `categorysecond` VALUES ('7', '羽绒服', '1');
INSERT INTO `categorysecond` VALUES ('8', '女鞋', '1');
INSERT INTO `categorysecond` VALUES ('9', '短靴', '1');
INSERT INTO `categorysecond` VALUES ('10', '男鞋', '1');
INSERT INTO `categorysecond` VALUES ('11', '冰箱', '4');
INSERT INTO `categorysecond` VALUES ('12', '洗衣机', '4');
INSERT INTO `categorysecond` VALUES ('13', '吸尘器', '4');
INSERT INTO `categorysecond` VALUES ('14', '扫地机器人', '4');
INSERT INTO `categorysecond` VALUES ('15', '网络机顶盒', '4');
INSERT INTO `categorysecond` VALUES ('16', '足浴盆', '4');
INSERT INTO `categorysecond` VALUES ('17', '空调', '4');
INSERT INTO `categorysecond` VALUES ('18', '平板电视', '4');
INSERT INTO `categorysecond` VALUES ('19', '油烟机', '4');
INSERT INTO `categorysecond` VALUES ('20', '青春2', null);
INSERT INTO `categorysecond` VALUES ('21', '文学', '2');
INSERT INTO `categorysecond` VALUES ('22', '艺术', '2');
INSERT INTO `categorysecond` VALUES ('23', '动漫/幽默', '2');
INSERT INTO `categorysecond` VALUES ('24', '娱乐时尚', '2');
INSERT INTO `categorysecond` VALUES ('25', '旅游', '2');
INSERT INTO `categorysecond` VALUES ('26', '生活', '2');
INSERT INTO `categorysecond` VALUES ('27', '武侠', '2');
INSERT INTO `categorysecond` VALUES ('28', '玄幻', '2');
INSERT INTO `categorysecond` VALUES ('29', '计算机', '2');
INSERT INTO `categorysecond` VALUES ('30', '垃圾袋', '3');
INSERT INTO `categorysecond` VALUES ('31', '杯刷', '3');
INSERT INTO `categorysecond` VALUES ('32', '锅底碟', '3');
INSERT INTO `categorysecond` VALUES ('33', '切菜器', '3');
INSERT INTO `categorysecond` VALUES ('34', '吸盘', '3');
INSERT INTO `categorysecond` VALUES ('35', '钢丝球', '3');
INSERT INTO `categorysecond` VALUES ('36', '刀叉', '3');
INSERT INTO `categorysecond` VALUES ('37', '洗鞋刷', '3');
INSERT INTO `categorysecond` VALUES ('38', 'LOL代练', '3');
INSERT INTO `categorysecond` VALUES ('64', '青春', '2');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `subtotal` double default NULL,
  `pid` int(11) default NULL,
  `oid` int(11) default NULL,
  PRIMARY KEY  (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  KEY `FKE8B2AB6140ACF87A` (`oid`),
  CONSTRAINT `FKE8B2AB6140ACF87A` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL auto_increment,
  `total` double default NULL,
  `ordertime` datetime default NULL,
  `state` int(11) default NULL,
  `name` varchar(20) default NULL,
  `phone` varchar(20) default NULL,
  `addr` varchar(50) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '998', '2016-10-14 10:56:14', '1', 'aaa', '123', '123', '20');
INSERT INTO `orders` VALUES ('2', '666', '2016-10-03 10:57:10', '3', '欧巴刚', '123456', '大开封', '20');
INSERT INTO `orders` VALUES ('3', '222', '2016-09-24 19:35:57', '2', '刚哥2', '123123', '还是大开封', '22');
INSERT INTO `orders` VALUES ('4', '9999', '2016-10-02 10:58:44', '4', '帅刚', '3333333', '静十207', '21');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL auto_increment,
  `pname` varchar(255) default NULL,
  `price` double default NULL,
  `image` varchar(255) default NULL,
  `pdesc` varchar(255) default NULL,
  `count` int(11) default '999',
  `is_hot` int(11) default NULL,
  `pdate` datetime default NULL,
  `csid` int(11) default NULL,
  PRIMARY KEY  (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '韩版连帽加厚毛衣女外套', '558', 'products/1/cs10001.jpg', '双11限量200件，拍完下架，加车享优惠，早下手早发货。。秋冬个性中长款毛衣，美丽和温度同在！限量供应，拒绝撞衫！迫于纱线和人工在不断上涨的双重压力下，产品涨价在即！少量现货出售中，手快有，手慢等哦，赶紧抢哦，绝对高大上。', '999', '1', '2014-11-02 20:18:00', '1');
INSERT INTO `product` VALUES ('2', '女装立领长袖拼接PU皮毛呢外套', '436', 'products/1/cs10002.jpg', '【现在拍下并支付定金，即可获得双12当天10元无门槛优惠券一张。注：只限有预付定金款~优惠券统一在12月11号发放】 毛呢外套 整洁干练的长款版型 整个肩部给予皮绒拼接 与毛呢一起撑起品质感 立领 长袖 肩部往下做流行加层拼接 一粒扣收合门襟 特意做的夹棉里层（袖里无） 不必再畏惧冷冽寒风', '999', '0', '2014-11-04 20:18:00', '1');
INSERT INTO `product` VALUES ('3', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', 'products/1/cs10003.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '999', '0', '2014-10-01 20:18:00', '1');
INSERT INTO `product` VALUES ('4', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', 'products/1/cs10004.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '999', '0', '2014-12-07 20:18:00', '1');
INSERT INTO `product` VALUES ('5', '韩版女装翻领羔绒夹棉格子毛呢外套', '238', 'products/1/cs10005.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '999', '0', '2014-11-02 20:18:00', '1');
INSERT INTO `product` VALUES ('6', '冬装韩版女装翻领羔绒夹棉格子毛呢外套', '238', 'products/1/cs10006.jpg', '外套款。 称为棉衣也不为过 或者因为它的表层毛呢　称呼为毛呢外套 ｙａｎｇ　羔绒位于翻领及袖口 从视觉着手　带来温暖无限 夹棉里衬（袖里也有）再次提升御寒功能 流行元素上　选择红黑格纹理　大气而又经典 金属拉链开叉　插袋自不会少', '999', '0', '2014-11-10 15:18:00', '1');
INSERT INTO `product` VALUES ('7', '新款优雅奢华毛领白鸭绒轻薄羽绒服', '1120', 'products/1/cs10007.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', '999', '0', '2014-11-03 20:18:00', '1');
INSERT INTO `product` VALUES ('8', '秋冬季毛呢外套女中长款圆领小香风呢子大衣', '672', 'products/1/cs10008.jpg', '【双12预售】双12提前开抢，11月24日—12月11日抢先付预付款33.6元，12月12日付剩余尾款，先付先发货，提前引爆双12！！！买就【送】双十二10元无门槛优惠券！！！商家【赠】运费险！！！', '999', '0', '2014-11-03 20:18:00', '1');
INSERT INTO `product` VALUES ('9', '女装貉子毛大衣 时尚修身长袖淑女毛呢外套', '238', 'products/1/cs10009.jpg', '秋冬热卖款，今日特惠！库存有限，卖完即止！喜欢的赶紧出手哦！', '999', '0', '2014-11-03 20:18:00', '1');
INSERT INTO `product` VALUES ('10', '修身显瘦淑女针织长袖打底连衣裙女', '356', 'products/1/cs10010.jpg', '【1212万能盛典预售抢先购,早买早便宜！】定金15.80元，预售价158.00元，双12价涨价至178.00元!', '999', '0', '2014-11-03 20:18:00', '1');
INSERT INTO `product` VALUES ('11', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20001.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('12', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20002.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('13', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20003.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('14', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20004.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('15', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20005.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('16', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20006.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('17', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20007.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('18', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20008.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('19', '整貂皮大衣外套中长款收腰立领长袖进口真皮草裘皮', '19800', 'products/1/cs20009.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货 【售后保障】终身免费保养维修', '999', '0', '2014-10-01 20:18:00', '2');
INSERT INTO `product` VALUES ('20', '中长款貂皮大衣整貂女装', '17900', 'products/1/cs20010.jpg', '采用100%进口小母貂 毛皮结实柔软毛峰更有光泽 保暖效果极强。　 【正品保证】【售后保障】我们承诺100%整皮水貂 假一罚十 支持验货 无理由退换货', '999', '0', '2014-11-03 20:18:00', '2');
INSERT INTO `product` VALUES ('21', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30001.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '1', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('22', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30002.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('23', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30003.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('24', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30004.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('25', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30005.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('26', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30006.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('27', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30007.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('28', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30008.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('29', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30009.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-03 20:18:00', '3');
INSERT INTO `product` VALUES ('30', '韩版毛呢外套女韩范秋冬装厚中长款冬季呢子', '598', 'products/1/cs30010.png', '今年韩国首尔爆款，超高端定制羊毛呢大衣，版型超美，不挑身材，不挑年龄，上身非常漂亮哦，适合任何场合，这个秋冬MM必备款哦。几乎人手一件，美丽时尚的你怎么能少了这件呢，现秋冬预热加十一到来，只需99元包邮，只限今天，今天过后马上涨价，早买早划算哦~', '999', '0', '2014-11-10 20:18:00', '3');
INSERT INTO `product` VALUES ('31', '打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40001.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('32', '打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40002.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('33', '打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40003.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('34', '性感时尚 酷感黑色小圆领露肩修身长袖针织衫', '387', 'products/1/cs40004.jpg', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('35', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40005.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '1', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('36', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40006.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('37', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40007.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('38', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40008.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('39', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40009.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('40', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40010.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '0', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('41', '韩版黑色打底衫加厚修身羊毛衫女装羊绒衫', '387', 'products/1/cs40011.png', '本产品 不起球 不掉色 不缩水 是一款贴身必备的厚款羊绒衫 质量保证支持退换', '999', '1', '2014-11-03 20:18:00', '4');
INSERT INTO `product` VALUES ('42', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50001.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '1', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('43', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50002.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('44', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50003.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '1', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('45', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50004.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-12-07 20:18:00', '5');
INSERT INTO `product` VALUES ('46', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50005.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('47', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50006.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '1', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('48', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50007.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('49', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50008.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('50', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50009.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '0', '2014-11-03 20:18:00', '5');
INSERT INTO `product` VALUES ('51', '冬装外套棉衣立领修身商务大码男装潮牌上衣', '899', 'products/1/cs50010.png', '【型男卖点简介】该款凭借其独特的设计、精选的面料和一致的时尚理念，以质感都市，充满时尚感的设计风格， 简约毛呢大衣，修身不变形，不起球，国际大牌一样的面料！面料成分：77.8%聚酯纤维+22.2%粘纤 秋冬简约修身防静电呢风衣外套', '999', '1', '2014-12-07 20:18:00', '5');
INSERT INTO `product` VALUES ('52', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60001.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('53', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60002.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '1', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('54', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60003.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('55', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60004.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('56', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60005.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('57', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60006.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '1', '2014-12-07 22:18:00', '6');
INSERT INTO `product` VALUES ('58', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60007.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('59', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60008.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('60', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60009.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '1', '2014-12-02 20:18:00', '6');
INSERT INTO `product` VALUES ('61', '商务修身羊毛呢子风衣 中长款呢大衣外套', '997', 'products/1/cs60010.png', '冬装新品首发！大牌做工，顶级羊毛呢面料，穿着舒适保暖，冬季潮男必备品！新品预售价299元，预计涨到398！不要拿市场上那些低劣的毛呢大衣相比较，一分价钱一分货哦！买到就是赚到，支持7天无理由退换货，尺码不对，可享受免费换货！', '999', '0', '2014-11-03 20:18:00', '6');
INSERT INTO `product` VALUES ('62', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70001.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('63', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70002.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('64', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70003.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '0', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('65', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70004.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('66', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70005.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '0', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('67', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70006.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('68', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70007.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-12-04 20:18:00', '7');
INSERT INTO `product` VALUES ('69', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70008.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('70', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70009.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', '999', '0', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('71', '韩版修身羽绒服加厚保暖可脱卸帽', '198', 'products/1/cs70010.png', '羽绒棉服，保暖性比普通棉服高出3倍，价格合适，比羽绒服便宜3倍，超高性价比～～现亏本冲业绩，活动过后涨价为198元哦，亲们速抢～～！！', null, '1', '2014-11-03 20:18:00', '7');
INSERT INTO `product` VALUES ('72', '女鞋', '198', 'products/1/nvxie.jpg', '韩版女鞋...', '999', '0', '2015-02-10 12:02:54', '9');
INSERT INTO `product` VALUES ('73', '短靴1', '299', 'products/1/duanxue1.png', '女款短靴...', '999', '1', '2015-02-10 15:02:08', '10');
INSERT INTO `product` VALUES ('74', '女款短靴2', '200', 'products/1/duanxue2.png', '女款短靴', '999', '1', '2014-12-15 00:00:00', '10');
INSERT INTO `product` VALUES ('75', '女款短靴3', '200', 'products/1/duanxue3.png', '女款短靴', '999', '1', '2014-12-15 00:00:00', '10');
INSERT INTO `product` VALUES ('76', '女款短靴4', '200', 'products/1/duanxue4.png', '女款短靴', '999', '1', '2014-12-15 00:00:00', '10');
INSERT INTO `product` VALUES ('80', '泰戈尔诗集', '18', 'products/2/book_01.gif', '泰戈尔诗集泰戈尔诗集', '999', '1', null, '20');
INSERT INTO `product` VALUES ('81', '痕记', '22.8', 'products/2/book_01.gif', '痕记痕记', '999', '0', null, '21');
INSERT INTO `product` VALUES ('82', '5年高考3年模拟', '666', 'products/2/book_03.gif', '5年高考3年模拟', '999', '1', null, '23');
INSERT INTO `product` VALUES ('83', '一生有多少爱', '17', 'products/2/book_04.gif', '一生有多少爱', '999', '0', '2016-10-10 15:18:03', '24');
INSERT INTO `product` VALUES ('84', '李戡戡乱记', '36', 'products/2/book_05.gif', '李戡戡乱记', '999', '0', '2016-10-09 15:18:25', '25');
INSERT INTO `product` VALUES ('85', '还有谁', '34', 'products/2/book_08.gif', '天堂之旅', '999', '0', '2016-10-06 15:20:05', '27');
INSERT INTO `product` VALUES ('86', '儿童故事书文学读物', '558', 'products/2/book_11.jpg', '10册彩图注音版小学生一二三年级课外阅读书籍儿童故事书文学读物', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('87', '临摹字帖佛经经书', '20', 'products/2/book_12.jpg', '般若波罗蜜多心经 隶书仿宣万次水写布毛笔字帖 临摹字帖佛经经书', '999', '1', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('88', '边城(沈从文集)', '50', 'products/2/book_13.jpg', '边城(沈从文集) 沈从文 书籍 正版 文学作品集N', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('89', '简爱', '50', 'products/2/book_14.jpg', '大悦读(升级版) 简爱 初中生语文新课标书籍 图片批发 特价书', '999', '1', '2016-10-02 20:18:00', '29');
INSERT INTO `product` VALUES ('90', '封神演义', '56', 'products/2/book_15.jpg', '封神演义 古典文学小说原著古典神话长篇封神榜足本无删减图书籍', '999', '1', '2016-10-02 20:18:00', '29');
INSERT INTO `product` VALUES ('91', '父与子全集', '65', 'products/2/book_16.jpg', '父与子全集 彩色图片带拼音 父与子漫画全集 少儿童书籍 正版书籍', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('92', '鲁迅文集', '70', 'products/2/book_17.jpg', '鲁迅的故事新编鲁迅文学作品精选 正版书籍鲁迅著精装鲁迅文集', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('94', '毛笔书法教程', '68', 'products/2/book_19.jpg', '毛笔书法教程颜欧赵柳楷书结构毛笔初学入门临摹字帖教程笔画详解', '999', '1', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('95', '米兰的秘密花园', '90', 'products/2/book_20.jpg', '米兰的秘密花园全套5册7-8-9-10-12周岁儿童文学读物课外阅读书籍', '999', '0', '2016-10-02 20:18:00', '20');
INSERT INTO `product` VALUES ('96', '你的努力,终将成就无可替代的自己', '65', 'products/2/book_21.jpg', '你的努力,终将成就无可替代的自己 汤木 青春文学 励志畅销书籍HL', '999', '1', '2016-10-02 20:18:00', '20');
INSERT INTO `product` VALUES ('97', '小猪唏哩呼噜(上下)', '60', 'products/2/book_22.jpg', '批发正版《小猪唏哩呼噜(上下)》注音版孙幼军儿童书籍图书西里', '999', '1', '2016-10-02 20:18:00', '20');
INSERT INTO `product` VALUES ('98', '平凡的世界', '58', 'products/2/book_23.jpg', '平凡的世界(3册)路遥全集三册经典文学小说 中学生必读课外书籍', '999', '1', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('99', '儿童宝宝益智早教书籍', '58', 'products/2/book_24.jpg', '球球馆1-3-6岁幼儿童宝宝益智早教书籍亲子故事绘本图书启蒙读物2', '999', '0', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('100', '十万个为什么', '58', 'products/2/book_25.jpg', '全套八本正版书籍 出版社十万个为什么 儿童版百科全书 畅销书籍', '999', '1', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('101', '红楼梦', '30', 'products/2/book_26.jpg', '四大名著书籍红楼梦红楼梦中国古典文学世界名著中国名著小说 ', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('102', '宋词三百首', '30', 'products/2/book_27.jpg', '宋词三百首 宋词艺术中国古典文学荟萃青少年课外必读正版书籍', '999', '0', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('103', '孙子兵法', '45', 'products/2/book_28.jpg', '孙子兵法 古风书籍 中国古典文学荟萃 春秋孙武 批发国学 D2', '999', '1', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('104', '偷影子的人', '45', 'products/2/book_29.jpg', '偷影子的人 马克.李维 法国温情疗愈小说外国言情青春文学书籍HL', '999', '1', '2016-10-02 20:18:00', '20');
INSERT INTO `product` VALUES ('105', '西游记', '50', 'products/2/book_30.jpg', '无障碍阅读学生四大名著足本原著精装西游记古典小说文学名著书籍', '999', '0', '2016-10-02 20:18:00', '21');
INSERT INTO `product` VALUES ('106', '小河男孩', '58', 'products/2/book_31.jpg', '小河男孩.国际大奖小说升级版 畅销书籍 童书 儿童文学', '999', '1', '2016-10-02 20:18:00', '20');
INSERT INTO `product` VALUES ('107', '小星座公主换装贴纸', '58', 'products/2/book_32.jpg', '小星座公主换装贴纸图书书籍批发涂画绘画填色粘贴画宝宝益智手工', '999', '1', '2016-10-02 20:18:00', '26');
INSERT INTO `product` VALUES ('108', '注音版伊索寓言', '60', 'products/2/book_33.jpg', '新课标名著小书坊（注音版伊索寓言 文学名著书籍正版 世界名著', '999', '1', '2016-10-02 20:18:00', '23');
INSERT INTO `product` VALUES ('109', '炫彩童书世界酷车大百科', '68', 'products/2/book_34.jpg', '炫彩童书世界酷车大百科注音彩图版 图片儿童识车大全书籍汽车品', '999', '1', '2016-10-02 20:18:00', '23');
INSERT INTO `product` VALUES ('110', '学生版原著原文导读注释史记', '50', 'products/2/book_35.jpg', '学生版原著原文导读注释史记无障碍阅读精装司马迁著正版历史书籍', '999', '1', '2016-10-02 20:18:00', '22');
INSERT INTO `product` VALUES ('111', '语文新课标名家选 天方夜谭', '55', 'products/2/book_36.jpg', '语文新课标名家选 天方夜谭 线装书局 青少年文学名著 正版书籍', '999', '1', '2016-10-02 20:18:00', '22');
INSERT INTO `product` VALUES ('112', '一粒种子的旅行', '55', 'products/2/book_37.jpg', '正版 幼儿童经典 特惠批发 平装注音版 一粒种子的旅行绘本书籍', '999', '1', '2016-10-02 20:18:00', '24');
INSERT INTO `product` VALUES ('113', '正版《查理九世吸血鬼公墓6》', '55', 'products/2/book_38.jpg', '正版《查理九世吸血鬼公墓6》墨多多谜境冒险系列 儿童文学书籍', '999', '1', '2016-10-02 20:18:00', '24');
INSERT INTO `product` VALUES ('114', '正版包邮水浒传', '60', 'products/2/book_39.jpg', '正版包邮水浒传 国学典藏书系书 明 施耐庵 古典文学名著 书籍', '999', '1', '2016-10-02 20:18:00', '24');
INSERT INTO `product` VALUES ('115', '云阅读 彩虹童梦馆注音版', '55', 'products/2/book_40.jpg', '正版现货 云阅读 彩虹童梦馆注音版儿童文学励志书籍全套10本', '999', '1', '2016-10-02 20:18:00', '25');
INSERT INTO `product` VALUES ('116', '正版现货看见', '58', 'products/2/book_41.jpg', '正版现货看见 柴静著中国现当代随笔纪实文学读物自传畅销图书籍', '999', '1', '2016-10-02 20:18:00', '27');
INSERT INTO `product` VALUES ('117', '周易预测周易算卦周易入门', '88', 'products/2/book_42.jpg', '中国古典文学书籍周易预测周易算卦周易入门周易书籍周易八卦', '999', '1', '2016-10-02 20:18:00', '29');
INSERT INTO `product` VALUES ('118', '电磁炉配件', '20', 'products/3/dianqi_01.jpg', '【2元店货源专批】电饭煲线 家用电器配件 通用 电磁炉配件 热销', '999', '1', '2016-10-02 20:18:00', '32');
INSERT INTO `product` VALUES ('119', ' 家居檀木珠香樟球', '20', 'products/3/dianqi_02.jpg', '2元店日用百货居家驱虫防蛀 家居檀木珠香樟球 樟木球10粒装批发', '999', '1', '2016-10-02 20:18:00', '30');
INSERT INTO `product` VALUES ('120', '创意居家复古软木杯垫', '50', 'products/3/dianqi_03.jpg', '2元店日用品百货创意居家复古软木杯垫 家居环保隔热垫批发', '999', '1', '2016-10-02 20:18:00', '30');
INSERT INTO `product` VALUES ('123', '小家电不锈钢快速电水壶 ', '50', 'products/3/dianqi_04.jpg', '爆款家居日用百货 小家电不锈钢快速电水壶 家用电器厂家特价批发', '999', '1', '2016-10-02 20:18:00', '30');
INSERT INTO `product` VALUES ('124', '不锈钢木炭火锅炉', '56', 'products/3/dianqi_05.jpg', '厂家批发 不锈钢木炭火锅炉 家用电器多功能电火锅 微信淘宝爆款', '999', '1', '2016-10-02 20:18:00', '32');
INSERT INTO `product` VALUES ('125', '迷你超声波加湿器办公usb增湿器', '65', 'products/3/dianqi_06.jpg', '创意款生活电器家用迷你超声波加湿器办公usb增湿器一件代发礼品', '999', '1', '2016-10-02 20:18:00', '31');
INSERT INTO `product` VALUES ('126', '创意迷你火山加湿器', '70', 'products/3/dianqi_07.jpg', '创意迷你火山加湿器 usb家用电器超声波香薰机现货空气净化器七彩', '999', '1', '2016-10-02 20:18:00', '31');
INSERT INTO `product` VALUES ('127', '工厂直销竹炭纳米牙刷韩版4支装细柄软毛牙刷', '60', 'products/2/dianqi_08.jpg', '工厂直销竹炭纳米牙刷韩版4支装细柄软毛牙刷祛渍美白牙刷批发', '999', '1', '2016-10-02 20:18:00', '31');
INSERT INTO `product` VALUES ('128', '家用空气净化器', '68', 'products/3/dianqi_09.jpg', '家用空气净化器负离子负离子空气净化器家用生活电器', '999', '1', '2016-10-02 20:18:00', '32');
INSERT INTO `product` VALUES ('129', '卡布奇诺拉花杯', '90', 'products/3/dianqi_10.jpg', '卡布奇诺拉花杯不锈钢意式咖啡拉花比赛练习杯350ml牛奶咖啡杯', '999', '0', '2016-10-02 20:18:00', '32');
INSERT INTO `product` VALUES ('130', '美嘉宝3合1搅拌机', '65', 'products/3/dianqi_11.jpg', '美嘉宝3合1搅拌机 家用电器 厨房小家电 多功能榨汁搅拌器', '999', '1', '2016-10-02 20:18:00', '33');
INSERT INTO `product` VALUES ('131', '五谷迷糊机', '60', 'products/3/dianqi_12.jpg', '巧夫人新品无网研磨新型豆浆机 美观家庭自制豆腐机 五谷迷糊机', '999', '1', '2016-10-02 20:18:00', '33');
INSERT INTO `product` VALUES ('132', '可乐杯', '58', 'products/3/dianqi_13.jpg', '热转印空白耗材 广告可乐瓶 热转印可乐罐 可印制图片 可乐杯', '999', '1', '2016-10-02 20:18:00', '33');
INSERT INTO `product` VALUES ('133', '不锈钢保温杯', '58', 'products/3/dianqi_14.jpg', '日用百货不锈钢保温杯隔热水杯广告促销礼品杯 创意弹跳杯子批发', '999', '0', '2016-10-02 20:18:00', '34');
INSERT INTO `product` VALUES ('134', '外出折叠便携吹风机', '58', 'products/3/dianqi_15.jpg', '十元店日用百货 168外出折叠便携吹风机 外出学生便携吹风机配货', '999', '1', '2016-10-02 20:18:00', '34');
INSERT INTO `product` VALUES ('135', '舒夫新款电吹风机', '30', 'products/3/dianqi_16.jpg', '舒夫新款电吹风机 进口材料吹风机 日用百货 家用电器 厂家自销 ', '999', '1', '2016-10-02 20:18:00', '34');
INSERT INTO `product` VALUES ('136', '烧水壶', '30', 'products/3/dianqi_17.jpg', '搪瓷炫彩热水壶 厂家批发珐琅壶 日用搪瓷壶3.3L搪瓷水壶 烧水壶', '999', '0', '2016-10-02 20:18:00', '35');
INSERT INTO `product` VALUES ('137', '陶瓷杯子', '45', 'products/3/dianqi_18.jpg', '陶瓷杯子创意陶瓷礼品夜光杯日用百货2元店促销礼品批发', '999', '1', '2016-10-02 20:18:00', '35');
INSERT INTO `product` VALUES ('138', '陶瓷加湿器', '45', 'products/3/dianqi_19.jpg', '陶瓷加湿器家用香薰静音大容量 办公室空调空气加湿机电器车载', '999', '1', '2016-10-02 20:18:00', '35');
INSERT INTO `product` VALUES ('139', '调温电熨斗', '50', 'products/3/dianqi_20.jpg', '调温电熨斗 生活小家电 家用电器 日用百货批发', '999', '0', '2016-10-02 20:18:00', '35');
INSERT INTO `product` VALUES ('140', '万佳K-5婴儿洗脚盆', '58', 'products/3/dianqi_21.jpg', '万佳K-5婴儿洗脚盆 宝宝卡通塑料盆子 日用百货厂家直销', '999', '1', '2016-10-02 20:18:00', '36');
INSERT INTO `product` VALUES ('141', '新款家用电器迷你暖风机小太阳小型取暖器', '58', 'products/3/dianqi_22.jpg', '新款家用电器迷你暖风机小太阳小型取暖器季节性小家电烤火炉批发', '999', '1', '2016-10-02 20:18:00', '36');
INSERT INTO `product` VALUES ('142', '雅乐思YBW28-70BA正品微电脑电压力锅', '60', 'products/3/dianqi_23.jpg', '雅乐思YBW28-70BA正品微电脑电压力锅 2.8L智能饭煲家用高压锅', '999', '1', '2016-10-02 20:18:00', '36');
INSERT INTO `product` VALUES ('143', '洋葱香薰机', '68', 'products/3/dianqi_24.jpg', '洋葱香薰机 超声波香薰机 木纹香薰机加湿器 家用电器 工厂批发', '999', '1', '2016-10-02 20:18:00', '37');
INSERT INTO `product` VALUES ('144', '节能省电小热得快热的快', '50', 'products/3/dianqi_25.jpg', '一元日用百货批发 节能省电小热得快热的快 速热器烧水器家用电器', '999', '1', '2016-10-02 20:18:00', '37');
INSERT INTO `product` VALUES ('145', '空气净化器', '55', 'products/3/dianqi_26.jpg', '怡特方品牌大量供应小型家用电器空气净化器超声波香薰机加湿器', '999', '1', '2016-10-02 20:18:00', '37');
INSERT INTO `product` VALUES ('146', '正品 q084 进口CREE变焦T6强光手电筒', '55', 'products/3/dianqi_27.jpg', '正品 q084 进口CREE变焦T6强光手电筒充电远射户外家用手电', '999', '1', '2016-10-02 20:18:00', '38');
INSERT INTO `product` VALUES ('147', '正品欧美特料理机', '55', 'products/3/dianqi_28.jpg', '正品欧美特料理机S730家用便携式原汁机果汁机榨汁机料理机', '999', '1', '2016-10-02 20:18:00', '38');
INSERT INTO `product` VALUES ('148', '家用手持挂烫机', '60', 'products/3/dianqi_29.jpg', '正品特价欧美特GT1501智能挂烫机挂烫蒸汽机熨斗家用手持挂烫机', '999', '1', '2016-10-02 20:18:00', '38');
INSERT INTO `product` VALUES ('149', '家用落地扇', '55', 'products/3/dianqi_30.jpg', '直销 家用落地扇16寸立式宿舍落地电风扇大功率台扇家用电器批发', '999', '1', '2016-10-02 20:18:00', '38');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `nYear` varchar(255) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20', 'gang', '123', '欧巴刚', '1098788608@qq.com', '1327358612', '大开封', '男', null);
INSERT INTO `user` VALUES ('21', 'aaa', '123', '老王啊', '', '', '', '男', null);
INSERT INTO `user` VALUES ('22', 'bbb', '123', '小王', '', '', '', '', null);
INSERT INTO `user` VALUES ('26', 'asd', '123', 'aaa', '', '', '', '', null);
