/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : ele

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/06/2020 12:02:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`) USING BTREE,
  INDEX `userId`(`user_id`) USING BTREE,
  INDEX `storeId`(`s_id`) USING BTREE,
  CONSTRAINT `storeId` FOREIGN KEY (`s_id`) REFERENCES `store` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (1, 2, 2);
INSERT INTO `collect` VALUES (2, 2, 6);
INSERT INTO `collect` VALUES (3, 2, 3);
INSERT INTO `collect` VALUES (4, 2, 1);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES (1, '匿名用户', '2020-05-05 15:15:38', '味道不错，不止一次点这家的饭了');
INSERT INTO `comments` VALUES (2, '我的名字叫小花', '2020-03-05 11:07:33', '超级点赞，外卖速度很快，店家做的也很细心');
INSERT INTO `comments` VALUES (3, '奥利给', '2020-05-06 11:17:26', '超爱这家的食物，都是我喜欢吃的');
INSERT INTO `comments` VALUES (4, 'Mack', '2019-07-18 15:18:03', '由于下雨外卖有点慢，但是丝毫不影响我喜欢这家的饭菜');
INSERT INTO `comments` VALUES (5, 'lucy', '2020-05-21 18:18:59', '我只是想拿个返现红包');
INSERT INTO `comments` VALUES (6, '用户35684', '2020-02-13 05:21:21', '不错，点赞');
INSERT INTO `comments` VALUES (7, '那个某某某', '2019-07-11 11:22:03', '外卖太慢了，到了饭菜都凉了');
INSERT INTO `comments` VALUES (8, 'Mack', '2019-03-21 11:22:38', '第一次点这家的，味道还不错');
INSERT INTO `comments` VALUES (9, '爱吃肉的阿杰', '2020-05-14 14:24:18', '不错不错，肉的个头都挺大一个的');
INSERT INTO `comments` VALUES (10, '匿名用户', '2020-03-12 08:28:13', '白米饭有点硬，但是菜的味道还是不错');
INSERT INTO `comments` VALUES (11, 'Jack', '2020-05-29 16:15:28', '不错很喜欢这家的味道，分量也很足');
INSERT INTO `comments` VALUES (13, 'Jack', '2020-05-30 11:35:54', '很好下次还要来购买');
INSERT INTO `comments` VALUES (14, 'Jack', '2020-06-03 16:46:43', 'Nice');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `s_id` int(11) DEFAULT NULL,
  `sale` int(255) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  PRIMARY KEY (`f_id`) USING BTREE,
  INDEX `s_id`(`s_id`) USING BTREE,
  CONSTRAINT `s_id` FOREIGN KEY (`s_id`) REFERENCES `store` (`s_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, '香辣鸡中翅', 1, 30, 6);
INSERT INTO `foods` VALUES (2, '掌中宝', 1, 23, 3);
INSERT INTO `foods` VALUES (3, '鸡排', 1, 40, 3);
INSERT INTO `foods` VALUES (4, '鸭肠（20串）', 1, 60, 10);
INSERT INTO `foods` VALUES (5, '土豆片', 1, 20, 1);
INSERT INTO `foods` VALUES (6, '金针菇', 1, 32, 1);
INSERT INTO `foods` VALUES (7, '平菇', 1, 15, 1);
INSERT INTO `foods` VALUES (8, '鱼排', 1, 43, 3);
INSERT INTO `foods` VALUES (9, '豆皮卷韭菜', 1, 291, 2);
INSERT INTO `foods` VALUES (10, '五花肉', 1, 53, 3);
INSERT INTO `foods` VALUES (11, '米饭', 2, 22, 1);
INSERT INTO `foods` VALUES (12, '米粉', 2, 12, 6);
INSERT INTO `foods` VALUES (13, '火爆鹅肠', 2, 30, 25);
INSERT INTO `foods` VALUES (14, '招牌酸菜鱼', 2, 55, 25);
INSERT INTO `foods` VALUES (15, '黑椒牛肉荷叶饭', 2, 15, 15);
INSERT INTO `foods` VALUES (16, '豆豉排骨荷叶饭', 2, 25, 15);
INSERT INTO `foods` VALUES (17, '秘制卤鸡腿饭', 2, 5, 20);
INSERT INTO `foods` VALUES (18, '招牌广式烧腊', 2, 26, 20);
INSERT INTO `foods` VALUES (19, '香菇滑鸡', 2, 13, 15);
INSERT INTO `foods` VALUES (20, '尖椒回锅肉盖饭', 2, 14, 18);
INSERT INTO `foods` VALUES (21, '至尊肉食披萨', 3, 21, 33);
INSERT INTO `foods` VALUES (22, '吞拿鱼三明治', 3, 2, 24);
INSERT INTO `foods` VALUES (23, '麻辣双鸡披萨', 3, 7, 31);
INSERT INTO `foods` VALUES (24, '意式猪排披萨', 3, 21, 33);
INSERT INTO `foods` VALUES (25, '彩虹水果披萨', 3, 8, 28);
INSERT INTO `foods` VALUES (26, '培根薯角披萨', 3, 20, 29);
INSERT INTO `foods` VALUES (27, '纯爱芝士披萨', 3, 10, 27);
INSERT INTO `foods` VALUES (28, '夏威夷甄选披萨', 3, 10, 19);
INSERT INTO `foods` VALUES (29, '牛肉BBQ披萨', 3, 24, 27);
INSERT INTO `foods` VALUES (30, '意大利肉酱面', 3, 10, 22);
INSERT INTO `foods` VALUES (31, '招牌猪肘饭', 4, 98, 10);
INSERT INTO `foods` VALUES (32, '招牌猪蹄饭', 4, 34, 24);
INSERT INTO `foods` VALUES (33, '鸡腿套饭', 4, 5, 19);
INSERT INTO `foods` VALUES (34, '叉烧套饭', 4, 6, 20);
INSERT INTO `foods` VALUES (35, '鸡排饭', 4, 8, 22);
INSERT INTO `foods` VALUES (36, '烤鸭拼猪肘饭', 4, 16, 20);
INSERT INTO `foods` VALUES (37, '猪肘拼肥肠饭', 4, 23, 20);
INSERT INTO `foods` VALUES (38, '猪肘拼鸡腿饭', 4, 27, 20);
INSERT INTO `foods` VALUES (39, '叉烧拼烤鸭饭', 4, 47, 19);
INSERT INTO `foods` VALUES (40, '猪肘拼烤鸭饭', 4, 18, 20);
INSERT INTO `foods` VALUES (41, '燃面', 5, 10, 12);
INSERT INTO `foods` VALUES (42, '生椒牛肉面', 5, 12, 15);
INSERT INTO `foods` VALUES (43, '酸辣粉', 5, 20, 8);
INSERT INTO `foods` VALUES (44, '杂酱面', 5, 23, 15);
INSERT INTO `foods` VALUES (45, '肥肠面', 5, 23, 9);
INSERT INTO `foods` VALUES (46, '重庆小面', 5, 31, 7);
INSERT INTO `foods` VALUES (47, '香菇炖鸡面', 5, 5, 12);
INSERT INTO `foods` VALUES (48, '螺蛳粉', 5, 103, 16);
INSERT INTO `foods` VALUES (49, '肥牛米线', 5, 90, 17);
INSERT INTO `foods` VALUES (50, '鲜虾米线', 5, 44, 14);
INSERT INTO `foods` VALUES (51, '黄金夏威夷披萨', 6, 8, 66);
INSERT INTO `foods` VALUES (52, '超级至尊披萨', 6, 16, 76);
INSERT INTO `foods` VALUES (53, '匈牙利海鲜意面', 6, 5, 40);
INSERT INTO `foods` VALUES (54, '麻辣小龙虾意面', 6, 10, 46);
INSERT INTO `foods` VALUES (55, '波纹薯条', 6, 16, 12);
INSERT INTO `foods` VALUES (56, '香酥鸡米花', 6, 10, 11);
INSERT INTO `foods` VALUES (57, '香烤草原嫩羊肉大串', 6, 13, 18);
INSERT INTO `foods` VALUES (58, '6翅6虾盒', 6, 5, 79);
INSERT INTO `foods` VALUES (59, '法式吐司', 6, 5, 16);
INSERT INTO `foods` VALUES (60, '经典提拉米苏', 6, 6, 24);
INSERT INTO `foods` VALUES (61, '秘制黑椒牛柳便当', 7, 1311, 40);
INSERT INTO `foods` VALUES (62, '日式经典猪扒便当', 7, 283, 38);
INSERT INTO `foods` VALUES (63, '日式照烧肥牛便当', 7, 734, 40);
INSERT INTO `foods` VALUES (64, '日式照烧鸡腿便当', 7, 585, 29);
INSERT INTO `foods` VALUES (65, '樱花过目烤菠萝仔骨便当', 7, 118, 29);
INSERT INTO `foods` VALUES (66, '南洋咖喱鸡排便当', 7, 51, 29);
INSERT INTO `foods` VALUES (67, '秘制黄金蒜香排骨便当', 7, 75, 42);
INSERT INTO `foods` VALUES (68, '招牌香烤鸡翅便当', 7, 72, 40);
INSERT INTO `foods` VALUES (69, '天妇罗鳕鱼便当', 7, 55, 39);
INSERT INTO `foods` VALUES (70, '直火香烤孜然腿排便当', 7, 753, 27);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `price` int(10) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `date` datetime(0) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `store_id`(`store_id`) USING BTREE,
  CONSTRAINT `store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`s_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1, 2, 1, 60, 5, '2019-12-19 16:17:01', '已送达');
INSERT INTO `orders` VALUES (2, 2, 4, 30, 2, '2020-02-05 21:17:23', '已送达');
INSERT INTO `orders` VALUES (3, 2, 7, 120, 4, '2020-03-04 12:17:49', '已送达');
INSERT INTO `orders` VALUES (4, 2, 2, 32, 2, '2020-04-16 14:18:26', '已送达');
INSERT INTO `orders` VALUES (5, 2, 3, 60, 3, '2020-05-01 19:21:53', '已送达');
INSERT INTO `orders` VALUES (6, 2, 1, 32, 8, '2020-05-29 17:02:54', '已送达');
INSERT INTO `orders` VALUES (7, 2, 6, 388, 10, '2020-05-29 21:53:48', '已送达');
INSERT INTO `orders` VALUES (8, 2, 2, 160, 10, '2020-05-29 21:54:23', '已送达');
INSERT INTO `orders` VALUES (9, 3, 7, 69, 2, '2020-06-02 20:46:17', '已送达');
INSERT INTO `orders` VALUES (10, 2, 2, 51, 3, '2020-06-03 15:52:30', '已送达');
INSERT INTO `orders` VALUES (11, 2, 2, 57, 4, '2020-06-03 15:53:07', '未送达');
INSERT INTO `orders` VALUES (12, 2, 1, 18, 4, '2020-06-03 16:46:08', '未送达');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `s_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `star` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sale` int(10) DEFAULT NULL,
  `send` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activityA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `activityB` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`s_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, 'img/store/store01.webp', '爷门串串(北京路店)', 'img/store/star01.svg', '4.8', 234, '￥20元起送 | 免配送费 ', '1.90km | 36分钟', '品质联盟', '满25减10，满36减16，满58减23，满88减33', '新用户下单立减17元');
INSERT INTO `store` VALUES (2, 'img/store/store02.webp', '华顺快餐(起义路店)', 'img/store/star01.svg', '4', 126, '￥10元起送 | 配送费￥5', '2.0km | 40分钟', '品质联盟', '满20减10，满40减13，满60减20，满88减33', '新用户下单立减18元');
INSERT INTO `store` VALUES (3, 'img/store/store03.webp', '尊宝披萨(小北店)', 'img/store/star01.svg', '5', 500, '￥40元起送 | 配送费￥3', '3.0km | 50分钟', '披萨', '满25减10，满36减16，满58减23，满88减33', ' 新用户下单立减30元');
INSERT INTO `store` VALUES (4, 'img/store/store04.webp', '正宗隆江猪脚饭(豪贤店)', 'img/store/star01.svg', '4.8', 342, '￥20元起送 | 免配送费', '1.90km | 36分钟', '快餐', '满25减10，满36减16，满58减23，满88减33', '新用户下单立减17元');
INSERT INTO `store` VALUES (5, 'img/store/store05.webp', '来自星星的ET.无国界(康王店)', 'img/store/star01.svg', '4.8', 234, '￥20元起送 | 配送费￥5', '1.0km | 36分钟', '面馆', '满25减10，满36减16，满58减23，满88减33', '新用户下单立减17元');
INSERT INTO `store` VALUES (6, 'img/store/store06.webp', '必胜客急宅送', 'img/store/star01.svg', '4.8', 234, '￥20元起送 | 免配送费', '1.90km | 36分钟', '品质联盟', '满25减10，满36减16，满58减23，满88减33', '新用户下单立减17元');
INSERT INTO `store` VALUES (7, 'img/store/store07.webp', '巨饿便当(未来餐厅东湖店)', 'img/store/star01.svg', '4.8', 3400, '￥20元起送 | 免配送费', '1.0km | 36分钟', '品质联盟', '满25减10，满36减16，满58减23，满88减33', '新用户下单立减17元');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `user_pass` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phonenum` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'user1', '123', '18042696619');
INSERT INTO `users` VALUES (2, 'Jack', '123', '15369136253');
INSERT INTO `users` VALUES (3, 'Mack', '123', '18781780269');
INSERT INTO `users` VALUES (4, 'Mary', '123', '15964836571');
INSERT INTO `users` VALUES (5, 'Tom', '123', '15369136252');

SET FOREIGN_KEY_CHECKS = 1;
