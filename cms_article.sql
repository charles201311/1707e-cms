/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50639
Source Host           : localhost:3306
Source Database       : 1707e

Target Server Type    : MYSQL
Target Server Version : 50639
File Encoding         : 65001

Date: 2019-11-23 11:32:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cms_article`
-- ----------------------------
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` longtext COMMENT '文章内容',
  `picture` varchar(200) DEFAULT NULL COMMENT '标题图片',
  `channel_id` int(11) DEFAULT NULL COMMENT '所属栏目',
  `category_id` int(11) DEFAULT NULL COMMENT '所属分类',
  `user_id` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0,刚发布,1审核通过,-1 审核未通过',
  `deleted` int(11) DEFAULT NULL COMMENT '0:正常,1:删除',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `summary` text,
  `content_type` int(11) DEFAULT NULL COMMENT '文章类型: 1:html 2:image',
  `keywords` varchar(100) DEFAULT NULL,
  `original` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_USER` (`user_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CHAN` (`channel_id`),
  KEY `FK_CMS_ARTI_REFERENCE_CMS_CATE` (`category_id`),
  CONSTRAINT `cms_article_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `cms_category` (`id`),
  CONSTRAINT `cms_article_ibfk_2` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`),
  CONSTRAINT `cms_article_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `cms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_article
-- ----------------------------
INSERT INTO `cms_article` VALUES ('1', '雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好', '<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	上市首日，金山办公与其母公司金山软件的股价变动，堪称一首离奇的“冰与火之歌”。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这边在A股，研发销售WPS的子公司金山办公开盘即大涨，截至收盘，涨幅175.5%，市值近600亿元；那边在港股，除持有金山办公67.5%股权外，另有猎豹移动、金山云、西山居三家子公司的金山软件股价大跌近7%，市值244亿港元（约219亿元）。此外，小米科技也在当天微跌了0.35%。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	悬殊的差距不禁让人感叹，究竟是港股太冷淡，还是A股太热情？还有人调侃，早知A股如此人傻钱多，雷军又何必让小米经历上市首日破发，市值蒸发44.75亿港元的惨剧。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	《科创板日报》援引市场分析师观点称，二者间的巨大落差，体现了不同市场环境下，不同的投资理念、投资偏好以及投资兴趣。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不过对雷军来说，虽然作为实控人，苦心经营二十年才得以在A股敲钟，但作为投资人，A股早已为其带来丰厚回报。据铅笔道今年5月不完全统计，科创板受理的106家企业中，有8家与雷军或小米有关。而据雷军称，除金山办公外，金山云也在IPO的路上。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/622da1ccda6641808c47491380875869\" alt=\"雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">港股A股的冰与火之歌</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	对于金山办公的600亿市值，直到上市次日，各方仍争论不休。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	支持方认为，估值估得是对未来收益的想象，作为互联网企业，金山办公月活跃用户3亿多人，在用户规模方面仍有想象空间，因此估值较硬件企业更高。批评方则认为，金山办公所处行业已相当成熟，无论营收、利润还是市场，都基本可知。“这样的公司居然还给到200倍市盈率，科创板真是太疯狂了。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	其实，相比今年7月开板，主打“硬科技”的科创板估值已经谨慎许多。7月首批企业上市时，科创板25家公司多数股价翻番，最大涨幅400%，平均涨幅140%，首日成交近500亿元，市场一片狂热。还有不少投资者称，在科创板打新是躺着赚钱，稳赚不赔。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	反观港股，境况则惨淡许多。小米上市前，雷军曾高调表示，小米是一家全球罕见的全能型公司，估值应为腾讯乘苹果的估值。但实际上，对于小米是硬件企业还是互联网企业，外界心存疑虑，市场反应也相当冷淡。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	上市首日，小米股价破发，市值蒸发约44.75亿港元（约人民币37.11亿元），雷军不得不在现场尴尬表示，“今天大势不好，相信长期表现会越来越好。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	但更为尴尬的是，此后小米股价持续走低。曾有小米员工称：当时我有两个选择，阿里和小米。阿里承诺给我4000股，但小米的期权更吸引我，同时我觉得雷总是个有激情、有事业心的人，所以几乎没有犹豫，就去了小米，结果......\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	在上市一年多后，小米的股价跌去36%，雷军的身家也从前20名被甩到了百名开外。截至11月19日收盘，小米股价报8.56港元，与17港元的发行价相比折去一半。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	福布斯实时富豪榜显示，截至11月20日早7点，雷军的身家为83亿美元，排在全球第210位。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/2967a66f23fd44c5a4f3c9f936084ebd\" alt=\"雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">雷军的英雄梦想价值600亿？</span>\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	虽然相比港股，曾经的科创板的确众星捧月，但时至今日，科创板已陆续出现破发现象，首日涨幅也趋于平稳。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	热情褪去后，金山办公仍能拿下近600亿估值，外界认为与雷军反复宣讲的“三十年梦想与青春”“要当民族软件排头兵”不无关系。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	无论是夸赞还是讽刺，雷军一向被认为是营销高手。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	荣耀手机总裁赵明曾在反击雷军“过去五年，不论友商如何黑我，我都没有回应过，但我这次是真急了，总之就是一句话——生死看淡，不服就干！”时称，这话很像当年看古惑仔电影，还称雷军为营销高手，是学习的榜样。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而对善于营销的评价，雷军曾半开玩笑地说：我作为20多年的工程师，被人说只会营销，而董明珠销售出身，天天在外面说她有核心科技。董则回应：格力要向雷军学习如何用互联网思维搞营销，股票从上市的17块，到8块10块，而格力的1万元原始股，已经涨到了3000万元。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/78d0c784624447c0b04df3003c59a22a\" alt=\"雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好\" />\n</div>', 'f9a5a92c-ad80-47c5-bcfd-719f2d5f57bc.jpg', '1', '1', '160', '0', '1', '1', '0', '2019-11-20 09:58:31', '2019-11-20 09:58:31', null, '0', null, null);
INSERT INTO `cms_article` VALUES ('2', '卖电动车赚钱有多难？', '<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/bd02634175834cd6963ed1ae982b8bd0\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	新能源汽车虽然是大势所趋，但发展的每一个过程总是充满不确定性，总有新的问题等待解决。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	新能源补贴政策是否合理、新能源如何顺利进入市场化、新能源安全事故如何规避……在摸索前进中，新能源汽车接到了市场抛来的一系列问题。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	如今，随着新能源补贴逐渐淡出、外资企业涌入、造车新势力企业的市场化阶段来临，市场又向新能源车企抛出了一个新的问题——依靠卖新能源车，能否赚钱呢？\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	盈利的冰火两重天\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	对于发展新能源车能否实现盈利的话题，身处于时代洪流中的新能源车企们正在用亲身经历书写着自己的答案。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/bb1ad88dbbd74ad09bebdc132bf0f318\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	今年十月，戴森突然宣布终止造车计划，其给出的理由是“该项目在商业上不可行”。在宣布这个决定之前，戴森已经涉足造车事业四年，并持续投入了180亿元，其首款电动车原本预计在2021年推出。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	戴森认为造车并不难，难在很难找到适合的盈利模式。有分析师指出，“戴森的电动车根据其成本估算价格不菲，因此很难找到合适且充足的消费群体。”\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	无独有偶的是，还在造车上“苦苦挣扎”的蔚来遇到了和戴森一样的问题——盈利乏力。蔚来李斌亲口公布，截止到今年6月份，蔚来已经亏损了大约220亿人民币。受此影响，蔚来股价一度跌破2美元，如今其子公司也被列入了经营异常目录。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/da99221fa7df4633bc3ce186ff02b268\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	几年前，刚刚涉足汽车圈的李斌对造车花费的粗略估算是200亿元，然而几年过去，烧掉了220亿元的蔚来还在死磕用户体验，依然没能找到一条“可持续发展的道路”。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	如果从仅仅从卖车盈利的商业模式来看，蔚来似乎已经陷入了盈利的死胡同。从批量交付至今，蔚来共交付了26215辆车，如果按照220亿亏损来算，相当于蔚来每卖出一辆车，便亏损83.92万。当然，这个“单车亏损”数字并不具备参考意义，但却也能从一个侧面反映出当前蔚来的窘境。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/115d6f8d2ef34e628b59564b9f5942e7\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	汽车是一个对规模化要求颇高的产业，在蔚来的销量没有达到一定规模的当下，实现盈利还有很长的路需要走。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而盈利的难题不仅只针对造车新势力企业，在补贴退坡的近况下，传统车企面对每况愈下的收益数字泛起了难色。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	最新的第三季度财报显示，包括北汽新能源、比亚迪、上汽集团在内的自主新能源第一阵营企业，均因为补贴退坡拉低了盈利水平。对补贴更为依赖的江淮之流更是生存现状堪忧。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/7044959a7bcd47af9c063fe9e6bb88ee\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	北汽蓝谷公布的第三季度财报显示，北汽新能源归属于上市公司股东的净利润却由盈转亏，第三季度净亏损额为3.67亿元。并且，受新能源补贴退坡幅度较大影响，北汽蓝谷预计“全年净利润将可能产生亏损”；同样受到补贴退坡的影响，比亚迪今年第三季度归属于上市公司股东的净利润为1.20亿元，同比下88.58%。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	北汽新能源与比亚迪是中国新能源发展的前期探索中，是积极的践行者。但随着补贴的退坡，两家企业无论是在销量还是在利润上无一不受补贴退坡的直接影响。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p3.pstatp.com/large/pgc-image/76060971295e4e5fbb1ac16d028f4404\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	这也直接显示了，在市场化运作中，即便是传统车企也难以通过卖车来实现企业盈利，它们必须找到新能源市场生存的新的商业模式。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不过再残酷的市场竞争中，也有相对的优胜者诞生。从盈利层面来看，新能源车企中实现国产的特斯拉盈利有望。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	特斯拉第三季度财报显示，其归属于普通股股东的净利润为1.43亿美元，与去年同期相比减少54%。这是特斯拉成立以来第五次实现盈利，消息一出，特斯拉股价应声大涨。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/8334b6ef380642eba08375f769361273\" alt=\"卖电动车赚钱有多难？\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	而目前特斯拉已经在上海实现国产，为特斯拉未来进一步盈利打下了坚实基础。根据摩根士丹利的分析师称，有鉴于上海工程的劳动成本仅为特斯拉美国加州工厂的十分之一和其他削减成本的措施，特斯拉中国的汽车销售利润率可以达到30%左右，与豪华品牌保时捷的利润率相当。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	除了特斯拉之外，刚刚在中国投放首款电动产品EQC的奔驰也对电动车的盈利表现出足够的信心。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	北京梅赛德斯-奔驰销售服务有限公司销售与市场营销首席运营官段建军在接受采访时表示：“卖电动车还是能够盈利的，我们也有信心把电动车做好，让我们的客户满意。”\n</p>', '1b381831-b6c7-474c-8b86-d171f0b069c3.jpg', '4', '13', '160', '0', '1', '1', '0', '2019-11-20 09:59:32', '2019-11-20 09:59:32', null, '0', null, null);
INSERT INTO `cms_article` VALUES ('3', '假5G被曝光之后，美国仍面临三大障碍！中国已建成87000个5G基站', '<blockquote class=\"article-blockquote\" style=\"font-size:16px;color:#707070;background:#FFFFFF;text-align:justify;font-family:&quot;\">\n	<p>\n		目前，随着各国都在加紧对5G网络的部署，一直想在5G领域拿到重要地位的美国，似乎却在其5G的部署进程中遇到了阻碍。<span style=\"font-weight:700;\">据媒体11月19日报道，美国媒体在18日指出，目前美国5G面临关键时刻，而美国的5G频谱规划还存在着诸多的争议</span>。据悉，美国通信委员会（FCC）与美国卫星通讯服务行业都在争夺5G的C频段频谱的使用权。\n	</p>\n</blockquote>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	据报道，目前美国的无线运营商都在呼吁FCC将这段频谱能够用于5G，但是FCC需要与使用这段频谱提供电视广播服务的卫星公司进行协调。<span style=\"font-weight:700;\">有分析指出，随着FCC把C频段频谱大量用于5G领域，此举会损害美国卫星通讯服务商利益并且可能会遭到起诉。</span>\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/b4cdd66bf0084475b90608145cd76f93\" alt=\"假5G被曝光之后，美国仍面临三大障碍！中国已建成87000个5G基站\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">事实上，对于在5G建设一波三折的美国来说，这已经不是其在5G领域第一次起内部冲突。</span>据报道，去年12月份，为了争得首先发布5G的头衔，美国电信运营商AT&amp;T在全美12个城市推出了一项名为\"5GE\"的网络服务。随后，因为其费用高，且实际运行速度与4G网络没有较大区别，此举被其竞争对手以及众多消费者投诉为\"假5G\"。\n</p>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	<span style=\"font-weight:700;\">值得一提的是，由于在5G网络建设需要投入大量成本，美国主要运营商的手头资金状况也不容乐观。</span>数据显示，截至2018年底，Verizon持有约120亿美元债务，AT＆T持有约175亿美元债务，T-Mobile持有约25亿美元的债务，而Sprint持有约400亿美元的债务，这些负债使运营商在5G网络的建设和推广上面临另一大障碍。\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/00a735cb24e740e489c241f8f2d0912f\" alt=\"假5G被曝光之后，美国仍面临三大障碍！中国已建成87000个5G基站\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	此外，在我国5G部署顺利开展之下，近日，据中国信息通信研究院消息，目前我国已建成5G基站8.7万个，预计今年年底，全国还将开通超过13万座5G基站。而美国仅仅计划在2020年新建5万个5G基站。<span style=\"font-weight:700;\">分析指出，5G基站数量的差异将使得中国和美国5G进展差距越来越大。</span>\n</p>\n<div class=\"pgc-img\" style=\"margin:0px;padding:0px;font-size:16px;color:#222222;font-family:&quot;background-color:#FFFFFF;\">\n	<img src=\"http://p1.pstatp.com/large/pgc-image/c84fff69eaa14f82856f74a883655721\" alt=\"假5G被曝光之后，美国仍面临三大障碍！中国已建成87000个5G基站\" />\n</div>\n<p style=\"color:#222222;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">\n	不难想象，在当下面临5G族谱规划不合理、电信运营商存在债务问题以及5G基站数量远远不足这三大障碍的情况下，美国想在5G建设中拔得头筹，或许还有很长的路要走。\n</p>', 'a0c693a4-21d6-4d1f-b55f-9c1c179bf03e.jpg', '1', '2', '168', '0', '0', '-1', '0', '2019-11-20 11:02:44', '2019-11-20 11:02:44', null, '0', null, null);
INSERT INTO `cms_article` VALUES ('4', '111', '111', '28868dc0-a7f9-42dc-ae2e-c07307d7577b.jpg', '3', '9', '168', '0', '0', '0', '1', '2019-11-21 10:04:54', '2019-11-21 10:04:54', null, '0', null, null);
INSERT INTO `cms_article` VALUES ('5', 'aaa', 'aaa', 'fc51f4b9-0b34-4d67-a3a5-b8badc534c64.jpg', '3', '9', '168', '0', '0', '1', '1', '2019-11-21 10:29:31', '2019-11-21 10:29:31', null, '0', null, null);
INSERT INTO `cms_article` VALUES ('6', '1707E图片集', '[{\"url\":\"e487338d-ac0b-4c67-ae7e-965ab9554541.jpg\",\"descr\":\"111\"},{\"url\":\"881e610e-49c0-4d98-9a86-50116f4b5cf1.jpg\",\"descr\":\"222\"},{\"url\":\"05cdf03e-bb71-453e-b5db-78bc6660ad5b.jpg\",\"descr\":\"333\"}]', '05cdf03e-bb71-453e-b5db-78bc6660ad5b.jpg', null, null, '168', '0', '0', '1', '0', '2019-11-22 16:14:13', '2019-11-22 16:14:13', null, '1', null, null);
INSERT INTO `cms_article` VALUES ('7', '1708E', '[{\"url\":\"9847914d-a30f-4fac-86d4-823c5cff4b5c.jpg\",\"descr\":\"111\"},{\"url\":\"8e905bc5-e478-4ba5-8b0b-f030b1f3e199.jpg\",\"descr\":\"222\"}]', '8e905bc5-e478-4ba5-8b0b-f030b1f3e199.jpg', null, null, '168', '0', '0', '1', '0', '2019-11-22 16:26:59', '2019-11-22 16:26:59', null, '1', null, null);

-- ----------------------------
-- Table structure for `cms_category`
-- ----------------------------
DROP TABLE IF EXISTS `cms_category`;
CREATE TABLE `cms_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CMS_CATE_REFERENCE_CMS_CHAN` (`channel_id`),
  CONSTRAINT `cms_category_ibfk_1` FOREIGN KEY (`channel_id`) REFERENCES `cms_channel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_category
-- ----------------------------
INSERT INTO `cms_category` VALUES ('1', '互联网', '1');
INSERT INTO `cms_category` VALUES ('2', '软件', '1');
INSERT INTO `cms_category` VALUES ('3', '智能家居', '1');
INSERT INTO `cms_category` VALUES ('4', '虚拟货币', '2');
INSERT INTO `cms_category` VALUES ('5', '股票', '2');
INSERT INTO `cms_category` VALUES ('6', '外汇', '2');
INSERT INTO `cms_category` VALUES ('7', '黄金', '2');
INSERT INTO `cms_category` VALUES ('8', '宏观经济', '2');
INSERT INTO `cms_category` VALUES ('9', '美国', '3');
INSERT INTO `cms_category` VALUES ('10', '亚洲', '3');
INSERT INTO `cms_category` VALUES ('11', '欧洲', '3');
INSERT INTO `cms_category` VALUES ('12', '非洲', '3');
INSERT INTO `cms_category` VALUES ('13', '新车', '4');
INSERT INTO `cms_category` VALUES ('14', 'SUV', '4');
INSERT INTO `cms_category` VALUES ('15', '汽车导购', '4');
INSERT INTO `cms_category` VALUES ('16', '用车', '4');
INSERT INTO `cms_category` VALUES ('17', 'NBA', '5');
INSERT INTO `cms_category` VALUES ('18', 'CBA', '5');
INSERT INTO `cms_category` VALUES ('19', '中超', '5');
INSERT INTO `cms_category` VALUES ('20', '意甲', '5');
INSERT INTO `cms_category` VALUES ('21', '电影', '6');
INSERT INTO `cms_category` VALUES ('22', '电视剧', '6');
INSERT INTO `cms_category` VALUES ('23', '综艺', '6');
INSERT INTO `cms_category` VALUES ('24', '明星八卦', '6');
INSERT INTO `cms_category` VALUES ('25', '段子', '7');
INSERT INTO `cms_category` VALUES ('26', '爆笑节目', '7');
INSERT INTO `cms_category` VALUES ('27', '童趣萌宠', '7');
INSERT INTO `cms_category` VALUES ('28', '雷人囧事', '7');
INSERT INTO `cms_category` VALUES ('29', '老图片', '9');
INSERT INTO `cms_category` VALUES ('30', '图片故事', '9');
INSERT INTO `cms_category` VALUES ('31', '摄影集', '9');
INSERT INTO `cms_category` VALUES ('32', '王者荣耀', '8');

-- ----------------------------
-- Table structure for `cms_channel`
-- ----------------------------
DROP TABLE IF EXISTS `cms_channel`;
CREATE TABLE `cms_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `sorted` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_channel
-- ----------------------------
INSERT INTO `cms_channel` VALUES ('1', '科技', null, null, null);
INSERT INTO `cms_channel` VALUES ('2', '财经', null, null, null);
INSERT INTO `cms_channel` VALUES ('3', '国际', null, null, null);
INSERT INTO `cms_channel` VALUES ('4', '汽车', null, null, null);
INSERT INTO `cms_channel` VALUES ('5', '体育', null, null, null);
INSERT INTO `cms_channel` VALUES ('6', '娱乐', null, null, null);
INSERT INTO `cms_channel` VALUES ('7', '搞笑', null, null, null);
INSERT INTO `cms_channel` VALUES ('8', '游戏', '游戏游戏游戏游戏', null, null);
INSERT INTO `cms_channel` VALUES ('9', '图片', null, null, null);

-- ----------------------------
-- Table structure for `cms_collect`
-- ----------------------------
DROP TABLE IF EXISTS `cms_collect`;
CREATE TABLE `cms_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_collect
-- ----------------------------
INSERT INTO `cms_collect` VALUES ('23', '卖电动车赚钱有多难？', 'http://127.0.0.1/article?id=2', '2019-11-23 11:06:09', '168');
INSERT INTO `cms_collect` VALUES ('24', '雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好', 'http://127.0.0.1/article?id=1', '2019-11-23 11:06:34', '168');
INSERT INTO `cms_collect` VALUES ('25', '雷军股市往事：A股火爆身家一天暴涨150亿，港股破发说大势不好', 'http://127.0.0.1/article?id=1', '2019-11-23 11:07:40', '169');

-- ----------------------------
-- Table structure for `cms_links`
-- ----------------------------
DROP TABLE IF EXISTS `cms_links`;
CREATE TABLE `cms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_links
-- ----------------------------
INSERT INTO `cms_links` VALUES ('6', '京东', 'https://www.jd.com', '2019-08-22 10:28:33');
INSERT INTO `cms_links` VALUES ('7', '百度', 'https://www.baidu.com', null);
INSERT INTO `cms_links` VALUES ('8', '淘宝', 'https://www.taobao.com', '2019-08-22 11:15:13');
INSERT INTO `cms_links` VALUES ('11', '头条', 'https://www.toutiao.com/', '2019-11-23 09:04:37');

-- ----------------------------
-- Table structure for `cms_settings`
-- ----------------------------
DROP TABLE IF EXISTS `cms_settings`;
CREATE TABLE `cms_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_domain` varchar(50) DEFAULT NULL,
  `site_name` varchar(50) DEFAULT NULL,
  `article_list_size` int(11) DEFAULT NULL,
  `slide_size` int(11) DEFAULT NULL,
  `admin_username` varchar(16) DEFAULT NULL,
  `admin_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_settings
-- ----------------------------

-- ----------------------------
-- Table structure for `cms_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cms_slide`;
CREATE TABLE `cms_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `picture` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_slide
-- ----------------------------
INSERT INTO `cms_slide` VALUES ('1', '风景一', '', '1.jpg');
INSERT INTO `cms_slide` VALUES ('2', '风景二', null, '2.jpg');
INSERT INTO `cms_slide` VALUES ('3', '风景三', null, '3.jpg');

-- ----------------------------
-- Table structure for `cms_user`
-- ----------------------------
DROP TABLE IF EXISTS `cms_user`;
CREATE TABLE `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `locked` int(11) DEFAULT '0' COMMENT '0:正常,1:禁用',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `role` varchar(1) DEFAULT '0' COMMENT '0:普通用户,1:管理员',
  `url` varchar(200) DEFAULT NULL COMMENT '个人博客网址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cms_user
-- ----------------------------
INSERT INTO `cms_user` VALUES ('137', 'nb', '8d1c9457e01d9803f1caaeab87c8c07a', '牛百', '2019-10-10', '1', '1', '2019-10-03 09:58:41', '2019-10-03 09:58:41', '0', null);
INSERT INTO `cms_user` VALUES ('138', '王三', '8d1c9457e01d9803f1caaeab87c8c07a', 'wangsan', '2019-10-10', '0', '0', '2019-10-03 09:58:41', '2019-10-23 09:58:44', '0', null);
INSERT INTO `cms_user` VALUES ('152', 'zl', '8d1c9457e01d9803f1caaeab87c8c07a', '赵六', null, '1', '0', '2019-10-22 11:12:02', '2019-10-22 11:12:02', '0', null);
INSERT INTO `cms_user` VALUES ('153', 'admin', '8d1c9457e01d9803f1caaeab87c8c07a', '管理员', null, '1', '0', '2019-10-22 11:12:02', '2019-10-22 11:12:02', '1', null);
INSERT INTO `cms_user` VALUES ('155', '今天头条', '8d1c9457e01d9803f1caaeab87c8c07a', '今天头条', null, '1', '0', '2019-10-22 11:12:02', '2019-10-22 11:12:02', '0', 'https://www.jd.com/');
INSERT INTO `cms_user` VALUES ('156', '田七', '8d1c9457e01d9803f1caaeab87c8c07a', '田七', null, '1', '0', '2019-11-07 16:06:45', '2019-11-07 16:06:45', '0', null);
INSERT INTO `cms_user` VALUES ('157', '李四', '8d1c9457e01d9803f1caaeab87c8c07a', '李四', null, '1', '0', '2019-11-07 16:08:57', '2019-11-07 16:08:57', '0', null);
INSERT INTO `cms_user` VALUES ('159', 'bawei', '8d1c9457e01d9803f1caaeab87c8c07a', 'bawei', null, '1', '1', '2019-11-08 13:12:23', '2019-11-08 13:12:23', '0', null);
INSERT INTO `cms_user` VALUES ('160', '1707E', '8d1c9457e01d9803f1caaeab87c8c07a', '1707E', null, '1', '0', '2019-11-12 14:17:22', '2019-11-12 14:17:22', '0', null);
INSERT INTO `cms_user` VALUES ('161', 'yangchunpo', '111111', null, null, '1', '0', null, null, '0', null);
INSERT INTO `cms_user` VALUES ('162', 'yangchunpo222', '111111', null, null, '1', '0', null, null, '0', null);
INSERT INTO `cms_user` VALUES ('168', '1707', '8d1c9457e01d9803f1caaeab87c8c07a', null, null, '1', '0', null, null, '0', null);
INSERT INTO `cms_user` VALUES ('169', '17077', '8d1c9457e01d9803f1caaeab87c8c07a', null, null, '1', '0', '2019-11-20 10:50:06', null, '0', null);
