SET NAMES UTF8;
DROP DATABASE IF EXISTS hfh;
CREATE DATABASE hfh CHARSET=UTF8;
USE hfh;

/**服装商家信息**/
CREATE TABLE hfh_merchants(
  mid INT PRIMARY KEY AUTO_INCREMENT;
  m_name VARCHAR(32),             #商家名称
  goods_number SMALLINT,          #商品总数量
  m_province VARCHAR(128),        #商家所在省份
  m_city VARCHAR(128),            #商家所在市区
  fans_number INT,                #粉丝数量
  is_focus BOOLEAN,               #是否关注   0代表未关注  1代表已关注
  logo VARCHAR(128)               #商家头像图片路径
);

/**服装商品**/
CREATE TABLE hfh_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  mid INT,                    #所属商家编号
  tid INT,                    #所属主题编号
  title VARCHAR(128),         #标题
  price DECIMAL(10,2),        #价格
  postage DECIMAL(2,2),       #邮费
  inventory SMALLINT,         #库存
  sold_count INT,             #已售出的数量
  
  size VARCHAR(64),           #尺寸
  style VARCHAR(32),          #样式
  details VARCHAR(1024),      #产品详细说明
);

/**服装图片**/
CREATE TABLE hfh_laptop_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  laptop_id INT,              #服装编号
  sm VARCHAR(128),            #小图片路径
  lg VARCHAR(128)             #大图片路径
  href VARCHAR(128)           #点击之后跳转的地址
);

/****主题广告****/
CREATE TABLE hfh_theme(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),           #图片路径
);

/****主题广告的商品****/
CREATE TABLE hfh__index_theme(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),         #标题
  author VARCHAR(32),         #作者
  reader INT,                 #读者数量
  texts VARCHAR(1280),        #文字内容
);

/**用户信息**/
CREATE TABLE hfh_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),          #用户名
  upwd VARCHAR(32),           #密码
  email VARCHAR(64),          #邮箱
  phone VARCHAR(16),          #电话
  
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #真实姓名，如王小明
  gender INT                  #性别  0-女  1-男
);

/**收货地址信息**/
CREATE TABLE hfh_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县/区
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名

  is_default BOOLEAN          #是否为当前用户的默认收货地址
);

/**购物车条目**/
CREATE TABLE hfh_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  laptop_id INT,              #商品编号
  title VARCHAR(128),         #标题
  size VARCHAR(64),           #尺寸
  style VARCHAR(32),          #样式
  price DECIMAL(10,2),        #商品单价
  count INT,                  #加入购物车数量
  merchants_id INT;           #所属商家编号
  m_name VARCHAR(32);         #商家名称
  is_checked BOOLEAN          #是否已勾选，确定购买
);

/**用户订单**/
CREATE TABLE hfh_order(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,            #用户编号
  address_id INT,         #地址编号
  status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  order_time BIGINT,      #下单时间
  pay_time BIGINT,        #付款时间
  deliver_time BIGINT,    #发货时间
  received_time BIGINT    #签收时间
);

/**用户订单列表**/
CREATE TABLE hfh_order_detail(
  did INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,           #订单编号
  product_id INT,         #产品编号
  count INT               #购买数量
);





/*******************/
/******数据导入******/
/*******************/
/**服装商家信息**/
INSERT INTO hfh_merchants VALUES 
(NULL,'寻秦',3,'浙江','杭州',311,0,'assets/store/xunqin_200x200.jpg');
(NULL,'白霓青阙',18,'广东','广州',197,0,'assets/store/bainiqingque_200x200.jpg');
(NULL,'呦呦鹿鸣',18,'广东','广州',44953,0,'assets/store/youyouluming_200x200.jpg');
(NULL,'轻汉坊'),
(NULL,'池夏'),
(NULL,'纨素执素 汉家生活方式'),
(NULL,'墨绯汉服'),
(NULL,'故人归古风手作'),
(NULL,'四时清欢'),
(NULL,'云麓集'),
(NULL,'萤烛亭汉服'),
(NULL,'倾杯叙');
(NULL,'子夜歌汉服工作室');
(NULL,'云起锦绣');
(NULL,'梨花渡（原国色芳华）');
(NULL,'鲸鹿');
(NULL,'羽月司衣局');
(NULL,'花朝记');
(NULL,'华兴唐汉服');
(NULL,'无衣饮羽');
(NULL,'诸仙记原创汉服');
(NULL,'华香凝');
(NULL,'花休原创');
(NULL,'君仙泽原创汉服汉元素');
(NULL,'南国引汉服');
(NULL,'道生一');
(NULL,'南国引汉服');

9773b34843304d2488be0ce574ea04f9.jpg_300x300.jpg 寻秦原创汉服明制红色主腰复原款2件包邮 寻秦 杭州 59 73人种草
d4cebe96b2724423a91ad4362151b7df.jpg_300x300.jpg 寻秦原创汉服芝兰 玉树宋制百迭裙明制马面裙 寻秦 杭州 68 395人种草
008aacf90efb4fc9be15c8db91959938.jpg_300x300.jpg 寻秦原创汉服男女通穿明制纱披风子母扣款华服国风现货 寻秦 杭州 168 167人种草
ff1dcf62d50a4e66bf03c39d138be881.png_300x300.jpg 寻秦原创汉服本草纲目清热解毒系列半边莲飘带一条 寻秦 杭州 54 2人种草

67a54bf40938444cbb0d61344ab0635c.jpg_300x300.jpg 霹雳布袋戏×华裳九州×白霓青阙联名寒烟翠衍生汉服比甲立领尾款 白霓青阙 广州 99 23人种草
f000f6eae44345a2b1ab9dca1f2a33fa.jpg_300x300.jpg 白霓青阙【简卿】明制立领对襟衫袄琵琶袖汉服秋冬比甲汉洋折衷 白霓青阙 广州 168 381人种草
688b4e6a1a0b44d3856cef9710280627.jpg_300x300.jpg 掖月华白霓青阙原创汉服女琵琶袖交领长袄襦裙珍珠马面绣明制秋冬 白霓青阙 广州 38 23人种草
0a58f82b36fa4cb399508d9f4df997b1.jpg_300x300.jpg 熊猫憨憨方领夹衣袄补子琵琶袖马面绣花白霓青阙原创明制日常汉服 白霓青阙 广州 168 14人种草
b47ec6766c6a40af997ff26171d9c8db.png_300x300.jpg 荼蘼花神白霓青阙原创绣花粉交领blingbling大袖彩虹齐腰襦裙汉服 白霓青阙 广州 118 92人种草
317c41b4f6604dcfb692b2102a8ea54f.jpg_300x300.jpg 汉服吊带背心两色仿宋式抹胸白灰内搭原创绣花白霓青阙女襦裙夏装 白霓青阙 广州 39 9人种草
fa5460f5ed064975a8e23e36fa506cac.jpg_300x300.jpg 琉羽原创绣花仙鹤羽毛齐胸襦裙间色六米摆白霓青阙女汉服显瘦不灵 白霓青阙 广州 2 176人种草
b1b17a5bf2494ebf8f446e0b3a6c2be7.jpg_300x300.jpg 邺星落白霓青阙秋冬原创汉服女琵琶袖交领长袄裙套装刺绣明制日常 白霓青阙 广州 38 22人种草
c5abb23e94674d1ea1d8f4a42b8880e8.jpg_300x300.jpg 喵与咪原创两色晋襦间色闺蜜白霓青阙可爱大摆破裙女汉服齐腰襦裙 白霓青阙 广州 238 20人种草
ac74e9730e294cf49d939ef3ac24ee74.jpg_300x300.jpg 曳相宸传统汉服齐胸襦裙女日常套装白霓青阙定制渐变珍珠星空绣花 白霓青阙 广州 38 23人种草
330baa3f660543b5a26f606cfb01e51f.jpg_300x300.jpg 蓝白叠穿超长褙子白霓青阙单品传统汉服襦裙8穿法扶摇同款 白霓青阙 广州 168 5人种草
63fd0617d96d46b9bb4a9db43b13c93d.jpg_300x300.jpg 墨绿色交领半臂白霓青阙女汉服单品上衣原创襦裙日常时尚方便夏 白霓青阙 广州 168 2人种草
8bd17f11c9c9451ab79c4bd090b7fa3d.jpg_300x300.jpg 原-蓝汉服家居服白霓青阙现货三色裙裤禅服打坐静思仿汉服汉元素 白霓青阙 广州 398 2人种草

1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg 呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆 呦呦鹿鸣 徐州 139 3689人种草
44029702d34c4427b4d9bdc35b944325.jpg_300x300.jpg 呦呦鹿鸣 白鹿青崖 原创汉服设计 重工刺绣 齐胸襦裙 春秋 呦呦鹿鸣 徐州 168 22866人种草
8ce52ee557eb4fcab048b33492cf21fc.jpg_300x300.jpg 呦呦鹿鸣 云梦蝶 原创汉服女绣花立领斜襟长配纯色裙日常秋冬日常 呦呦鹿鸣 徐州 168 9932人种草
ac13e9dcbe614db8bcd9e81e6b33cc35.jpg_300x300.jpg 呦呦鹿鸣 韩十二 原创设计传统汉服男款本白色男女同款三米摆春秋 呦呦鹿鸣 徐州 119 777人种草
14cd016b9ead4eafacc5fa0b4c278ff3.jpg_300x300.jpg 呦呦鹿鸣 鹤鸣 原创设计传统汉服男女款本白色仙鹤交领三米白春秋 呦呦鹿鸣 徐州 129 924人种草
7d3d172311d046259fb865e619aacf84.jpg_300x300.jpg 呦呦鹿鸣 云梦蝶 原创设计汉服女绣花短袄搭配褶裙日常春秋冬3米摆 呦呦鹿鸣 徐州 138 3520人种草
54c1adea79804fe3a64105ef2d7c6dc7.jpg_300x300.jpg 呦呦鹿鸣 韩十一 原创设计传统汉服 烫金 齐胸襦裙齐腰襦裙 呦呦鹿鸣 徐州 79 20153人种草
2f9d7db131864dcfa7ca1b4e2cf6e534.jpg_300x300.jpg 呦呦鹿鸣 将进酒 原创汉服女明制长袄立领斜襟重工刺绣褶裙秋冬 呦呦鹿鸣 徐州 159 1130人种草
0d95042d8b144fad96867c0eee569245.jpg_300x300.jpg 呦呦鹿鸣 朱雀亭 原创设计传统斗篷刺绣加绒日常中长款三色秋冬 呦呦鹿鸣 徐州 179 357人种草
0c250be667104fd98d9481f6b7b24b61.jpg_300x300.jpg 呦呦鹿鸣 衔双飞 原创设计情侣汉服cp款刺绣春夏秋日常6米 呦呦鹿鸣 徐州 29 3461人种草
977f30b58e8b4f7d9ce20ab8a07e6b06.jpg_300x300.jpg 呦呦鹿鸣 鹿鸣斗篷 原创设计传统斗篷刺绣薄款中长春秋款 呦呦鹿鸣 徐州 129 4028人种草
1bae8cdf1c2b41b59397d42640ef84aa.jpg_300x300.jpg 呦呦鹿鸣 原创汉服女装明制交领袄裙琵琶袖刺绣日常双层秋冬款 呦呦鹿鸣 徐州 179 13262人种草
23037ce81f3e4c23bb683bbf9e90b01e.jpg_300x300.jpg 呦呦鹿鸣 鹿鸣斗篷 原创传统汉服斗篷刺绣加绒中长款冬季红 呦呦鹿鸣 徐州 179 3362人种草

/**服装商品**/
  -- lid INT PRIMARY KEY AUTO_INCREMENT,
  -- mid INT,                    #所属商家编号
  -- tid INT,                    #所属主题编号
  -- title VARCHAR(128),         #标题
  -- price DECIMAL(10,2),        #价格
  -- postage DECIMAL(2,2),       #邮费   0 包邮
  -- inventory SMALLINT,         #库存
  -- sold_count INT,             #已售出的数量
  
  -- size VARCHAR(64),           #尺寸
  -- style VARCHAR(32),          #样式
  -- details VARCHAR(1024),      #产品详细说明
  <div class="content_tpl"> 
    <div class="formwork">
      <div class="formwork_img">
      <br>
      </div>
      <div class="formwork_img">
        <img alt="" class="" src="assets/icon_type_aoqun.png">
      </div>
    </div>
  </div>
INSERT INTO hfh_laptop VALUES
(NULL,1,1,'寻秦原创汉服明制红色主腰复原款2件包邮',59,0,1043,74,'S','砖红系带','<div class="content_tpl"> <div class="formwork"><div class="formwork_img"><br></div><div class="formwork_img"><img alt="" class="" src="assets/icon_type_aoqun.png"></div></div></div>'),
(NULL,1,1,'寻秦原创汉服芝兰 玉树宋制百迭裙明制马面裙',68,0,53,396,'S','砖红系带','<div class="content_tpl"> <div class="formwork"><div class="formwork_img"><br></div><div class="formwork_img"><img alt="" class="" src="assets/icon_type_aoqun.png"></div></div></div>'),
(NULL,1,1,'寻秦原创汉服男女通穿明制纱披风子母扣款华服国风现货',168,0,385,168,'S','砖红系带','<div class="content_tpl"> <div class="formwork"><div class="formwork_img"><br></div><div class="formwork_img"><img alt="" class="" src="assets/icon_type_aoqun.png"></div></div></div>'),

霹雳布袋戏×华裳九州×白霓青阙联名寒烟翠衍生汉服比甲立领尾款 白霓青阙 广州 99 23人种草
白霓青阙【简卿】明制立领对襟衫袄琵琶袖汉服秋冬比甲汉洋折衷 白霓青阙 广州 168 381人种草
掖月华白霓青阙原创汉服女琵琶袖交领长袄襦裙珍珠马面绣明制秋冬 白霓青阙 广州 38 23人种草
熊猫憨憨方领夹衣袄补子琵琶袖马面绣花白霓青阙原创明制日常汉服 白霓青阙 广州 168 14人种草
荼蘼花神白霓青阙原创绣花粉交领blingbling大袖彩虹齐腰襦裙汉服 白霓青阙 广州 118 92人种草
汉服吊带背心两色仿宋式抹胸白灰内搭原创绣花白霓青阙女襦裙夏装 白霓青阙 广州 39 9人种草
琉羽原创绣花仙鹤羽毛齐胸襦裙间色六米摆白霓青阙女汉服显瘦不灵 白霓青阙 广州 2 176人种草
邺星落白霓青阙秋冬原创汉服女琵琶袖交领长袄裙套装刺绣明制日常 白霓青阙 广州 38 22人种草
喵与咪原创两色晋襦间色闺蜜白霓青阙可爱大摆破裙女汉服齐腰襦裙 白霓青阙 广州 238 20人种草
曳相宸传统汉服齐胸襦裙女日常套装白霓青阙定制渐变珍珠星空绣花 白霓青阙 广州 38 23人种草
蓝白叠穿超长褙子白霓青阙单品传统汉服襦裙8穿法扶摇同款 白霓青阙 广州 168 5人种草
墨绿色交领半臂白霓青阙女汉服单品上衣原创襦裙日常时尚方便夏 白霓青阙 广州 168 2人种草
原-蓝汉服家居服白霓青阙现货三色裙裤禅服打坐静思仿汉服汉元素 白霓青阙 广州 398 2人种草
(NULL,2,1,'霹雳布袋戏×华裳九州×白霓青阙联名寒烟翠衍生汉服比甲立领尾款',99,'','<div class="content_tpl"> <div class="formwork">   <div class="formwork_img"><br></div><div class="formwork_img">    <img alt="" class="" src="img/product/detail/57b15612N81dc489d.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_img">    <img alt="" class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg">   </div>  </div>  <div class="formwork">   <div class="formwork_text">    技术规格请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150223456789,1922,false),
(NULL,2,1,'白霓青阙【简卿】明制立领对襟衫袄琵琶袖汉服秋冬比甲汉洋折衷',168,0,57,380,'','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,733,false),
(NULL,2,1,'掖月华白霓青阙原创汉服女琵琶袖交领长袄襦裙珍珠马面绣明制秋冬',38,'i7处理器在此！依旧纤薄轻盈，续航持久，能胜任更多高强度工作，办公利器！',7888,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','定制款：双核i7/8G内存/256G闪存','AppleMacBook Air','MacOS','8G','1920*1080','集成显卡','Intel i7低功耗版','其它','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t3034/151/748569500/226790/d6cd86a2/57b15612N81dc489d.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="//img20.360buyimg.com/vc/jfs/t2683/60/4222930118/169462/233c7678/57b15616N1e285f09.jpg"></div></div><div class="formwork"><div class="formwork_text">技术规格 请前往 www.apple.com/cn/macbook-air/specs.html 查看完整内容。</div></div></div>',150323456789,105,false),
(NULL,2,1,'熊猫憨憨方领夹衣袄补子琵琶袖马面绣花白霓青阙原创明制日常汉服',168,'【i5 独立显卡】全高清窄边框 8G内存 256G固态硬盘 支持SSD硬盘扩容 薄至14.8mm 轻至1.28kg！AKG扬声器！',4999,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【13.3英寸】I5-6200U 8G 256G','小米Air','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i5低功耗版','1G','轻薄本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',154123456789,1527,true),
(NULL,2,1,'荼蘼花神白霓青阙原创绣花粉交领blingbling大袖彩虹齐腰襦裙汉服',118,'【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5银色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',153123456789,115,false),
(NULL,2,1,'汉服吊带背心两色仿宋式抹胸白灰内搭原创绣花白霓青阙女襦裙夏装',39,'【FHD窄边框】第七代处理器 128G SSD支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！AKG扬声器！',3599,'*退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5金色】 M-7Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',156123456789,812,true),
(NULL,2,1,'琉羽原创绣花仙鹤羽毛齐胸襦裙间色六米摆白霓青阙女汉服显瘦不灵',2,'【FHD窄边框】库存紧张 128G固态硬盘 支持M.2接口SSD硬盘扩容 薄至12.9mm 轻至1.07kg！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【12.5英寸】M-6Y30 4G 128G','小米Air','Windows 10','4G','全高清屏(1920*1080)','集成显卡','Intel CoreM','其它','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/5886e317Nbc52a580.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f747eNfdc5f737.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7483N695168a2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7486Nf809b915.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748bN28dbcbb2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f748fNd2861229.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7493N5a3758af.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f7497N20aac53e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d23597N878bf1f7.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58cfbc2aN51481cf1.png"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74a3N1f47e1f2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74acN9da4ea13.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b0N0af5a884.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/586f74b6N10c0f4a0.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c0N452b66a1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/586f74c4N07c85d41.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/58d2350bNb98d64e2.jpg"></div></div><div class="formwork"><div class="formwork_img"><img src="img/product/detail/589458f0N90e67b9d.jpg"></div></div></div>',157123456789,1081,false),
(NULL,2,2,'邺星落白霓青阙秋冬原创汉服女琵琶袖交领长袄裙套装刺绣明制日常',38,'2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',3499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i3 4G 500G独显','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i3','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',150423456789,1461,true),
(NULL,2,2,'喵与咪原创两色晋襦间色闺蜜白霓青阙可爱大摆破裙女汉服齐腰襦裙',238,'2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 500G','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',151423456789,733,false),
(NULL,2,2,'曳相宸传统汉服齐胸襦裙女日常套装白霓青阙定制渐变珍珠星空绣花',38,'2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5399,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 4G 256GSSD','ThinkPadE480c','Windows10','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',152423456789,913,true),
(NULL,2,2,'蓝白叠穿超长褙子白霓青阙单品传统汉服襦裙8穿法扶摇同款',168,'2017年经典款新！精致小黑！22.3mm轻薄体验，180度开合灵活耐用，高效稳健办公最长可达5小时！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款','【E480C-2017新】i5 8G 256GSSD','ThinkPadE480c','Windows10','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规笔记本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58745160N7de01df6.jpg"></div></div></div>',153423456789,112,false),
(NULL,2,2,'墨绿色交领半臂白霓青阙女汉服单品上衣原创襦裙日常时尚方便夏',168'【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I3-7100U/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I3-7100U/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',151123456789,1197,true),
(NULL,2,2,'原-蓝汉服家居服白霓青阙现货三色裙裤禅服打坐静思仿汉服汉元素',398,'【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',4999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/128G固态','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/128G固态','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152123456789,137,false),
(NULL,3,2,'','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/4G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/4G/256G/2G独显','Windows 10','4G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',153123456789,21,false),
(NULL,3,2,'','【铝镁合金 纯固态 轻至1.45kg 金属超极本 】双尺寸可选',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','13.3英寸I5/8G/256G/2G独显','华硕(ASUS)13.3英寸RX310UQ金属超极本 学生 商务手提轻薄便携超薄笔记本电脑 玫瑰金 13.3英寸I5/8G/256G/2G独显','Windows 10','8G','全高清屏(1920×1080)','高性能游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59190fe7N6a9fb112.jpg"><img class="" src="img/product/detail/58d0bfceNc0694135.jpg"><img class="" src="img/product/detail/59143b58N0f24f48d.jpg"><img class="" src="img/product/detail/58f9de03Nd67611dc.jpg"><img class="" src="img/product/detail/58d0bfcbNc96d061c.jpg"><img class="" src="img/product/detail/58d0bfd1Nea212a7a.jpg"></div></div></div>',152423456789,981,false),
(NULL,3,2,'','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i5 双硬盘 GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i5标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',149123456789,192,true),
(NULL,3,2,'联想(Lenovo)小新700电竞版 15.6英寸游戏笔记本电脑(i7-6700HQ 8G 500G GTX950M 4G FHD IPS Office)黑','【小新家族2017闪耀换新！晒单得E卡！12期免息！】小新700电竞版！经典之选',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','小新700【i7 8G 500G GTX950M】','联想小新700','Windows 10','8G','分辨率：全高清屏(1920×1080)','GTX950M','Intel i7标准电压版','4G','游戏本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58ca2b14Nd5c09fcd.jpg"><img class="" src="img/product/detail/58ca2b28Na5a22f83.jpg"><img class="" src="img/product/detail/58ca3012Nc99ab61f.jpg"><img class="" src="img/product/detail/58ca2b51Nbf258c3b.jpg"><img class="" src="img/product/detail/58ca2b67N436e60de.jpg"></div></div></div>',151523456789,260,false),
(NULL,3,6,'戴尔DELL灵越燃7000 R1525S 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 940MX 2G独显 FHD)银','【轻薄微边框、燃7000】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【流光银】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151923456789,911,false),
(NULL,3,6,'戴尔DELL灵越燃7000 R1725G 14.0英寸轻薄窄边框笔记本电脑(i7-7500U 8G 128GSSD+1T 940MX 2G独显 FHD)金','【轻薄微边框、燃7000】七代i7双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',6599,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【溢彩金】i7-7500u 8G 128 1T','戴尔燃7000','Windows 10','8G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',150823456789,1930,true),
(NULL,3,6,'戴尔DELL灵越燃7000 R1525P 14.0英寸轻薄窄边框笔记本电脑(i5-7200U 4G 128GSSD+500G 2G独显 FHD)元気粉','【轻薄微边框、燃7000元気粉】七代i5双核CPU、128GSSD+500G双硬盘、IPS全高清显示屏，动力强劲性能澎湃！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','【元気粉】i5-7200u 4G 128 500G','戴尔燃7000','Windows 10','4G','全高清屏(1920×1080)','入门级游戏独立显卡','Intel i5低功耗版','2G','轻薄本','128G+500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58d87221Na033954c.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58e5e4b5N862f8aa1.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/57bfa672N20953b71.jpg"></div></div></div>',151023456789,987,true),
(NULL,3,7,'戴尔DELL灵越游匣15PR-5745B 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5745B','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',148123456789,1901,true),
(NULL,3,7,'戴尔DELL灵越游匣15PR-5645SE 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',6699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',153123456789,1231,false),
(NULL,3,7,'戴尔DELL灵越游匣15PR-5745SE 15.6英寸游戏笔记本电脑(i7-7700HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)枪弹版','游匣枪弹版精装上市 3D立体喷涂画面 机身更酷炫 七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',7999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','枪弹版 i7-7700HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645SE','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1539923456789,221,false),
(NULL,25,7,'戴尔DELL灵越游匣15PR-3848B 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 128GSSD+500G GTX960M 4G FHD)黑','【强力散热保性能】 960M 4G独显 预装128SSD 双硬盘游戏更劲爽 我们比大多数产品 散热好一些',6099,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i7-6700HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1519123456789,711,true),
(NULL,26,7,'戴尔DELL灵越游匣15PR-2648B 15.6英寸游戏笔记本电脑(i5-6300HQ 4G 128SSD+500G GTX960M 4G独显 FHD)黑','【选游戏本还得看散热】960M 4G独显 预装128SSD 双硬盘游戏更劲爽 ！',5299,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','精锐版 i5-6300HQ 4G GTX960 4G','戴尔游匣','Windows 10','4G','全高清屏(1920×1080)','GTX960M','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1529123456789,319,false),
(NULL,27,7,'戴尔DELL灵越游匣15PR-5645B 15.6英寸游戏笔记本电脑(i5-7300HQ 8G 128GSSD+1T GTX1050 4G独显 FHD)黑','【白条6期免息 游匣“10”力出击】七代四核CPU ,GTX1050 4G独显,FHD全高清屏,热血出击！',5999,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','宗师版 i5-7300HQ 8G GTX1050 4G','戴尔灵越游匣15PR-5645B','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d3fNd4e6c74e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d49Nd9aa8623.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003d53N79717f17.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003db4N5441df2e.jpg"></div></div><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/59003afdN7d9208b8.jpg"></div></div></div>',1511123456789,2110,false),
(NULL,28,8,'联想(ThinkPad)轻薄系列E470c(20H3A000CD)14英寸笔记本电脑(i5-6200U 4G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',3998,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 500G','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',150123456789,117,true),
(NULL,29,8,'联想(ThinkPad)轻薄系列E470c(20H3A004CD)14英寸笔记本电脑(i5-6200U 8G 500G 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',4699,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 500G','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','500G','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',151123456789,1862,false),
(NULL,30,8,'联想(ThinkPad)轻薄系列E470c(20H3A003CD)14英寸笔记本电脑(i5-6200U 8G 1T 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 1TB','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',152123456789,812,true),
(NULL,31,8,'联想(ThinkPad)轻薄系列E470c(20H3A002CD)14英寸笔记本电脑(i5-6200U 4G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5399,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 4G 256GSSD','ThinkPadE470 c','Linux','4G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',153123456789,162,false),
(NULL,32,8,'联想(ThinkPad)轻薄系列E470c(20H3A001CD)14英寸笔记本电脑(i5-6200U 8G 256G SSD 2G独显 Win10)黑色','点击进入5月大促，超值满千减百品牌周',5499,'*30天无忧退货 *48小时快速退款','【E470C-2017新】i5 8G 256GSSD','ThinkPadE470 c','Linux','8G','标准屏(1366×768)','入门级游戏独立显卡','Intel i5低功耗版','2G','常规本','256G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58119b8aNb84f1e22.jpg"></div></div></div>',154123456789,1180,false),
(NULL,33,9,'华硕(ASUS)顽石电竞版FH5900 15.6英寸游戏笔记本电脑(i7-6700HQ 4G 1TB +128G SSD NV940MX 2G 独显 FHD)','顽石血统 标压电竞版 强劲动力带你畅快遨游',4999,' *退货补运费 *30天无忧退货 *72小时发货','【高速】顽石游戏本i74G1T128SSD','华硕FH5900V','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,1231,false),
(NULL,34,9,'华硕(ASUS) 顽石四代尊享版 15.6英寸笔记本电脑(i7-7500U 8G 1TB NV940MX 2G独显 深蓝 FHD )','第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境',4699,' *退货补运费 *30天无忧退货 *72小时发货','顽石经典【高配i7 8G 1T 深蓝】','华硕FL5900UQ','Windows 10','8G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1550123456789,1231,true),
(NULL,35,9,'华硕(ASUS) 顽石四代旗舰版FL5900 15.6英寸笔记本电脑(i7-7500U 4G 1TB +128GBSSD NV940MX 深蓝 FHD)','混合硬盘，1T搭载128G固态，读取速度更快，智能散热不烫手！！',4999,' *退货补运费 *30天无忧退货 *72小时发货','顽石双盘【i7 4G 1t加128SSD】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1531023456789,221,false),
(NULL,36,9,'华硕(ASUS)顽石四代疾速版 FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512GB SSD NV940M 2G独显 红色)','【同样配置看主板，搭配华硕主板让您放心，屏幕无坏点保证】办公，游戏无压力！！！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i7-4G 512SSD 炫红】','华硕FL5900U','Windows 10','4G','全高清屏(1920*1080)','GT940M','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1510123456789,103,true),
(NULL,37,9,'华硕(ASUS) 顽石四代疾速版FL5900 15.6英寸笔记本电脑(i7-6500U 4G 512G SSD NV940MX 2G独显 红色 FHD)','疾速版，就是要你快！512G固态硬盘，第六代i7处理器搭载2G独显！',4799,' *退货补运费 *30天无忧退货 *72小时发货','顽石高速【i74G512SSD NV940MX】','华硕FL5900UQ','Windows 10','4G','全高清屏(1920*1080)','入门级游戏独立显卡','Intel i7低功耗版','2G','游戏本','512G固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/583d2fb0N44aa29cf.jpg"><img class="" src="img/product/detail/583d2fd5N33db758b.jpg"><img class="" src="img/product/detail/583d359aN47f3276b.jpg"><img class="" src="img/product/detail/583d3036Nef20d28f.jpg"><img class="" src="img/product/detail/583d304aN4722f8d5.jpg"></div></div></div>',1450123456789,341,false),
(NULL,38,10,'神舟(HASEE)战神Z7M-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050Ti 1080P)IPS屏','超强性价比！！',6199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z7M GT【i7 128G+1T GTX1050Ti】','神舟战神Z7M-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050Ti','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',151123456789,441,false),
(NULL,39,10,'神舟(HASEE)战神Z7M-SL7D2 15.6英寸游戏本笔记本电脑(i7-6700HQ 8G 1T+128GB SSD GTX965M 1080P)IPS','六代i7 SSD GTX965M还预装WIN10，一步到位，你赢了！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i7 GTX965M】','神舟战神Z7M','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',152123456789,1289,true),
(NULL,40,10,'神舟(HASEE)战神Z7M-SL5D1 15.6英寸游戏本笔记本电脑(i5-6300HQ 8G 1TB GTX965M 1080P)IPS屏','超强性价比！！',4499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神Z7M【四核i5 GTX965M】','神舟战神Z7M-SL5D1','Windows 10','8G','全高清屏(1920×1080)','GTX965M','Intel i7标准电压版','2G','游戏本','1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',153123456789,231,false),
(NULL,41,10,'神舟(HASEE)战神Z6-KP5GT 15.6英寸游戏本笔记本电脑(i5-7300HQ 8G 1T+128G SSD GTX1050 1080P)黑色','超强性价比！！',5199,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i5 128G+1T GTX1050】','神舟战神Z6-KP5GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i5标准电压版','4G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',154123456789,469,true),
(NULL,42,10,'神舟(HASEE) 战神G6-SL7S2 17.3英寸游戏笔记本(i7-6700HQ 8G 256G SSD GTX960M 2G独显 1080P)黑色','17.3英寸大屏游戏本，纯固态硬盘，秒速开启超神之路！',5499,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','战神G6【17.3英寸 GTX960M】','神舟战神G6','Windows 10','8G','全高清屏(1920×1080)','GTX960M','Intel i7标准电压版','4G','游戏本','256固态','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',155123456789,1223,false),
(NULL,43,10,'神舟(HASEE)战神Z6-KP7GT 15.6英寸游戏本笔记本电脑(i7-7700HQ 8G 1T+128G SSD GTX1050 1080P)黑色','预约享5499抢！【128G SSD+1T HDD】双硬盘，春风“十”里，期待是你！',5699,' *退货补运费 *30天无忧退货 *48小时快速退款 *72小时发货','Z6 GT【i7 128G+1T GTX1050】','神舟战神Z6-KP7GT','Windows 10','8G','全高清屏(1920×1080)','GTX1050','Intel i7标准电压版','2G','游戏本','128G+1T','<div class="content_tpl"><div class="formwork"><div class="formwork_img"><img class="" src="img/product/detail/58c67b22Ned66fcb8.jpg"> <img class="" src="img/product/detail/58c67b23Nfffc2f8b.jpg"> <img class="" src="img/product/detail/58c67b22N04b18388.jpg"> <img class="" src="img/product/detail/58c67b24N6d5ce71c.jpg"> <img class="" src="img/product/detail/58c67b24Nac3dc074.jpg"> <img class="" src="img/product/detail/58c67b22N8aa1905c.jpg"> <img class="" src="img/product/detail/58c67b24N9aa8a252.jpg"></div></div></div>',156123456789,1844,true);

/**笔记本电脑图片**/
INSERT INTO hfh_laptop_pic VALUES
(NULL, 1, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 1, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 1, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 2, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 2, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 2, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 3, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 3, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 3, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 4, 'img/product/sm/57b12a31N8f4f75a3.jpg','img/product/md/57b12a31N8f4f75a3.jpg','img/product/lg/57b12a31N8f4f75a3.jpg'),
(NULL, 4, 'img/product/sm/57ad359dNd4a6f130.jpg','img/product/md/57ad359dNd4a6f130.jpg','img/product/lg/57ad359dNd4a6f130.jpg'),
(NULL, 4, 'img/product/sm/57ad8846N64ac3c79.jpg','img/product/md/57ad8846N64ac3c79.jpg','img/product/lg/57ad8846N64ac3c79.jpg'),
(NULL, 5, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 5, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 5, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 5, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 5, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 5, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 5, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 6, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 6, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 6, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 6, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 6, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 6, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 6, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 7, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 7, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 7, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 7, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 7, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 7, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 7, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 8, 'img/product/sm/57e3b072N661cd00d.jpg','img/product/md/57e3b072N661cd00d.jpg','img/product/lg/57e3b072N661cd00d.jpg'),
(NULL, 8, 'img/product/sm/57e1ff09Nf610fea3.jpg','img/product/md/57e1ff09Nf610fea3.jpg','img/product/lg/57e1ff09Nf610fea3.jpg'),
(NULL, 8, 'img/product/sm/57e1ff17N286390a9.jpg','img/product/md/57e1ff17N286390a9.jpg','img/product/lg/57e1ff17N286390a9.jpg'),
(NULL, 8, 'img/product/sm/57e1ff2fN8a36d0fe.jpg','img/product/md/57e1ff2fN8a36d0fe.jpg','img/product/lg/57e1ff2fN8a36d0fe.jpg'),
(NULL, 8, 'img/product/sm/57e52dffNa4d8ce2c.jpg','img/product/md/57e52dffNa4d8ce2c.jpg','img/product/lg/57e52dffNa4d8ce2c.jpg'),
(NULL, 8, 'img/product/sm/57e52e03N4ec367dd.jpg','img/product/md/57e52e03N4ec367dd.jpg','img/product/lg/57e52e03N4ec367dd.jpg'),
(NULL, 8, 'img/product/sm/57e52e06N116974f7.jpg','img/product/md/57e52e06N116974f7.jpg','img/product/lg/57e52e06N116974f7.jpg'),
(NULL, 9, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 9, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 9, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 9, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 9, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 9, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 9, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 9, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 10, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 10, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 10, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 10, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 10, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 10, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 10, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 10, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 11, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 11, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 11, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 11, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 11, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 11, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 11, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 11, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 12, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 12, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 12, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 12, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 12, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 12, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 12, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 12, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 13, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 13, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 13, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 13, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 13, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 13, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 14, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 14, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 14, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 14, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 14, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 14, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 15, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 15, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 15, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 15, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 15, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 15, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 16, 'img/product/sm/590a98f9N8039f132.jpg','img/product/md/590a98f9N8039f132.jpg','img/product/lg/590a98f9N8039f132.jpg'),
(NULL, 16, 'img/product/sm/58f46de7N0dafbae3.jpg','img/product/md/58f46de7N0dafbae3.jpg','img/product/lg/58f46de7N0dafbae3.jpg'),
(NULL, 16, 'img/product/sm/58e5c226N4836a223.jpg','img/product/md/58e5c226N4836a223.jpg','img/product/lg/58e5c226N4836a223.jpg'),
(NULL, 16, 'img/product/sm/58dc76d5N8a0947a3.jpg','img/product/md/58dc76d5N8a0947a3.jpg','img/product/lg/58dc76d5N8a0947a3.jpg'),
(NULL, 16, 'img/product/sm/58fd9c54Nec723d68.jpg','img/product/md/58fd9c54Nec723d68.jpg','img/product/lg/58fd9c54Nec723d68.jpg'),
(NULL, 16, 'img/product/sm/58bfc2afNd44b4135.jpg','img/product/md/58bfc2afNd44b4135.jpg','img/product/lg/58bfc2afNd44b4135.jpg'),
(NULL, 17, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 17, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 17, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 17, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 17, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 17, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 17, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 18, 'img/product/sm/587f476aNcfbf7869.jpg','img/product/md/587f476aNcfbf7869.jpg','img/product/lg/587f476aNcfbf7869.jpg'),
(NULL, 18, 'img/product/sm/57871083Nefe2d3d6.jpg','img/product/md/57871083Nefe2d3d6.jpg','img/product/lg/57871083Nefe2d3d6.jpg'),
(NULL, 18, 'img/product/sm/57871086N86c8f0ab.jpg','img/product/md/57871086N86c8f0ab.jpg','img/product/lg/57871086N86c8f0ab.jpg'),
(NULL, 18, 'img/product/sm/5787107bN73d05ad5.jpg','img/product/md/5787107bN73d05ad5.jpg','img/product/lg/5787107bN73d05ad5.jpg'),
(NULL, 18, 'img/product/sm/5787109cNaf26e3b0.jpg','img/product/md/5787109cNaf26e3b0.jpg','img/product/lg/5787109cNaf26e3b0.jpg'),
(NULL, 18, 'img/product/sm/578710a0N07795fe5.jpg','img/product/md/578710a0N07795fe5.jpg','img/product/lg/578710a0N07795fe5.jpg'),
(NULL, 18, 'img/product/sm/578710a3Nc498e3ea.jpg','img/product/md/578710a3Nc498e3ea.jpg','img/product/lg/578710a3Nc498e3ea.jpg'),
(NULL, 19, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 19, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 19, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 19, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 19, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 19, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 20, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 20, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 20, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 20, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 20, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 20, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 21, 'img/product/sm/57bbc38eN9def8042.jpg','img/product/md/57bbc38eN9def8042.jpg','img/product/lg/57bbc38eN9def8042.jpg'),
(NULL, 21, 'img/product/sm/57ba6a27Nbb8d2dcf.jpg','img/product/md/57ba6a27Nbb8d2dcf.jpg','img/product/lg/57ba6a27Nbb8d2dcf.jpg'),
(NULL, 21, 'img/product/sm/57ba6a38N4f4670bd.jpg','img/product/md/57ba6a38N4f4670bd.jpg','img/product/lg/57ba6a38N4f4670bd.jpg'),
(NULL, 21, 'img/product/sm/57ba6a3dN54779e6a.jpg','img/product/md/57ba6a3dN54779e6a.jpg','img/product/lg/57ba6a3dN54779e6a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a47N19af9c97.jpg','img/product/md/57ba6a47N19af9c97.jpg','img/product/lg/57ba6a47N19af9c97.jpg'),
(NULL, 21, 'img/product/sm/57ba6a4cNb83e292a.jpg','img/product/md/57ba6a4cNb83e292a.jpg','img/product/lg/57ba6a4cNb83e292a.jpg'),
(NULL, 21, 'img/product/sm/57ba6a56N1e3e3d63.jpg','img/product/md/57ba6a56N1e3e3d63.jpg','img/product/lg/57ba6a56N1e3e3d63.jpg'),
(NULL, 22, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 22, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 22, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 22, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 22, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 22, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 22, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 23, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 23, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 23, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 23, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 23, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 23, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 23, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 24, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 24, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 24, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 24, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 24, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 24, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 24, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 25, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 25, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 25, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 25, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 25, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 25, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 25, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 26, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 26, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 26, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 26, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 26, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 26, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 26, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 27, 'img/product/sm/5913f8ffN49fa143c.jpg','img/product/md/5913f8ffN49fa143c.jpg','img/product/lg/5913f8ffN49fa143c.jpg'),
(NULL, 27, 'img/product/sm/5913f903Nbffaa4fd.jpg','img/product/md/5913f903Nbffaa4fd.jpg','img/product/lg/5913f903Nbffaa4fd.jpg'),
(NULL, 27, 'img/product/sm/5913f907Ncbc65469.jpg','img/product/md/5913f907Ncbc65469.jpg','img/product/lg/5913f907Ncbc65469.jpg'),
(NULL, 27, 'img/product/sm/5913f90bN1b563f42.jpg','img/product/md/5913f90bN1b563f42.jpg','img/product/lg/5913f90bN1b563f42.jpg'),
(NULL, 27, 'img/product/sm/5913f90fN99370675.jpg','img/product/md/5913f90fN99370675.jpg','img/product/lg/5913f90fN99370675.jpg'),
(NULL, 27, 'img/product/sm/5913f93bNe4d2b3e5.jpg','img/product/md/5913f93bNe4d2b3e5.jpg','img/product/lg/5913f93bNe4d2b3e5.jpg'),
(NULL, 27, 'img/product/sm/5913f93fNfd79b4fc.jpg','img/product/md/5913f93fNfd79b4fc.jpg','img/product/lg/5913f93fNfd79b4fc.jpg'),
(NULL, 28, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 28, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 28, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 28, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 28, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 28, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 28, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 28, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 29, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 29, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 29, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 29, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 29, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 29, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 29, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 29, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 30, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 30, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 30, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 30, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 30, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 30, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 30, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 30, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 31, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 31, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 31, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 31, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 31, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 31, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 31, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 31, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 32, 'img/product/sm/584b5678Nbc9f1e70.jpg','img/product/md/584b5678Nbc9f1e70.jpg','img/product/lg/584b5678Nbc9f1e70.jpg'),
(NULL, 32, 'img/product/sm/584b567dNd9c58341.jpg','img/product/md/584b567dNd9c58341.jpg','img/product/lg/584b567dNd9c58341.jpg'),
(NULL, 32, 'img/product/sm/5819a0ebNefd901bc.jpg','img/product/md/5819a0ebNefd901bc.jpg','img/product/lg/5819a0ebNefd901bc.jpg'),
(NULL, 32, 'img/product/sm/5819a106Necf0abb8.jpg','img/product/md/5819a106Necf0abb8.jpg','img/product/lg/5819a106Necf0abb8.jpg'),
(NULL, 32, 'img/product/sm/5819a10bN2ea5c8e0.jpg','img/product/md/5819a10bN2ea5c8e0.jpg','img/product/lg/5819a10bN2ea5c8e0.jpg'),
(NULL, 32, 'img/product/sm/5819a10fNd0f96a03.jpg','img/product/md/5819a10fNd0f96a03.jpg','img/product/lg/5819a10fNd0f96a03.jpg'),
(NULL, 32, 'img/product/sm/5819a114Ne0cd75db.jpg','img/product/md/5819a114Ne0cd75db.jpg','img/product/lg/5819a114Ne0cd75db.jpg'),
(NULL, 32, 'img/product/sm/5819a133N03021b26.jpg','img/product/md/5819a133N03021b26.jpg','img/product/lg/5819a133N03021b26.jpg'),
(NULL, 33, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 33, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 33, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 33, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 33, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 33, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 33, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 34, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 34, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 34, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 34, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 34, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 34, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 34, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 35, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 35, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 35, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 35, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 35, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 35, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 35, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 36, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 36, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 36, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 36, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 36, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 36, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 36, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 37, 'img/product/sm/58985861N615a3581.jpg','img/product/md/58985861N615a3581.jpg','img/product/lg/58985861N615a3581.jpg'),
(NULL, 37, 'img/product/sm/58985867Nf8909d49.jpg','img/product/md/58985867Nf8909d49.jpg','img/product/lg/58985867Nf8909d49.jpg'),
(NULL, 37, 'img/product/sm/5898586cNe235284b.jpg','img/product/md/5898586cNe235284b.jpg','img/product/lg/5898586cNe235284b.jpg'),
(NULL, 37, 'img/product/sm/58985881N0a78dea2.jpg','img/product/md/58985881N0a78dea2.jpg','img/product/lg/58985881N0a78dea2.jpg'),
(NULL, 37, 'img/product/sm/58985883Nd4aec745.jpg','img/product/md/58985883Nd4aec745.jpg','img/product/lg/58985883Nd4aec745.jpg'),
(NULL, 37, 'img/product/sm/5836b979N85c3852b.jpg','img/product/md/5836b979N85c3852b.jpg','img/product/lg/5836b979N85c3852b.jpg'),
(NULL, 37, 'img/product/sm/5836b981Nd60fd02a.jpg','img/product/md/5836b981Nd60fd02a.jpg','img/product/lg/5836b981Nd60fd02a.jpg'),
(NULL, 38, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 38, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 38, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 38, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 38, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 39, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 39, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 39, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 39, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 39, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 40, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 40, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 40, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 40, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 40, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 41, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 41, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 41, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 41, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 41, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 42, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 42, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 42, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 42, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 42, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg'),
(NULL, 43, 'img/product/sm/58a2c667Ne2b5cb73.jpg','img/product/md/58a2c667Ne2b5cb73.jpg','img/product/lg/58a2c667Ne2b5cb73.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N800be261.jpg','img/product/md/58a2c668N800be261.jpg','img/product/lg/58a2c668N800be261.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0159a26f.jpg','img/product/md/58a2c668N0159a26f.jpg','img/product/lg/58a2c668N0159a26f.jpg'),
(NULL, 43, 'img/product/sm/58a2c669Nf884ac31.jpg','img/product/md/58a2c669Nf884ac31.jpg','img/product/lg/58a2c669Nf884ac31.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N7293a0d1.jpg','img/product/md/58a2c668N7293a0d1.jpg','img/product/lg/58a2c668N7293a0d1.jpg'),
(NULL, 43, 'img/product/sm/58a2c669N4f92f8cb.jpg','img/product/md/58a2c669N4f92f8cb.jpg','img/product/lg/58a2c669N4f92f8cb.jpg'),
(NULL, 43, 'img/product/sm/58a2c668N0be41fb0.jpg','img/product/md/58a2c668N0be41fb0.jpg','img/product/lg/58a2c668N0be41fb0.jpg'),
(NULL, 43, 'img/product/sm/58a2c66aNcd10ee32.jpg','img/product/md/58a2c66aNcd10ee32.jpg','img/product/lg/58a2c66aNcd10ee32.jpg');

/**用户信息**/
INSERT INTO hfh_user VALUES
(NULL, 'lulu',md5('941006'),'844432381@qq.com','18035513471','img/avatar/default.png','梁路路','0');


/****首页轮播广告商品****/
INSERT INTO hfh_index_carousel VALUES
(NULL, 'img/index/banner1.png','轮播广告商品1','product_details.html?lid=28'),
(NULL, 'img/index/banner2.png','轮播广告商品2','product_details.html?lid=19'),
(NULL, 'img/index/banner3.png','轮播广告商品3','lookforward.html'),
(NULL, 'img/index/banner4.png','轮播广告商品4','lookforward.html');

/****首页商品****/
INSERT INTO hfh_index_product VALUES
(NULL, 'Apple MacBook Air系列', '酷睿双核i5处理器|256GB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img1.png', 6988, 'product_details.html?lid=1', 1, 1, 1),
(NULL, '小米Air 金属超轻薄', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD独立显卡', 'img/index/study_computer_img2.png', 3488, 'product_details.html?lid=5', 2, 2, 2),
(NULL, '联想E480C 轻薄系列', '酷睿双核i7处理器|256GB SSD|4GB内存|英特尔HD显卡680M', 'img/index/study_computer_img3.png', 5399, 'product_details.html?lid=9', 3, 3, 3),
(NULL, '华硕RX310 金属超极本', '酷睿双核i5处理器|512GB SSD|4GB内存|英特尔HD游戏级显卡', 'img/index/study_computer_img4.png', 4966, 'product_details.html?lid=13', 4, 4, 4),
(NULL, '联想小新700 电竞版游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD显卡620含共享显卡内存', 'img/index/study_computer_img5.png', 6299, 'product_details.html?lid=17', 5, 5, 5),
(NULL, '戴尔灵越燃7000 轻薄窄边', '酷睿双核i5处理器|512GB SSD|2GB内存|英特尔HD显卡', 'img/index/study_computer_img3.png', 5199, 'product_details.html?lid=19', 6, 6, 6),
(NULL, '神州战神Z7M 高性价比游戏本', '酷睿双核i7处理器|1TGB SSD|8GB内存|英特尔HD游戏机独立显卡', 'img/index/study_computer_img4.png', 5799, 'product_details.html?lid=38', 0, 0, 0);

