INSERT INTO MEMBER
(MEMBER_ACCOUNT, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_PHONE, MEMBER_NICKNAME, MEMBER_ADDRESS, MEMBER_EMAIL)
VALUES ('WILLIAM', 'PASSWORD', 'WILLIAM', '0930987654', 'WILL', '桃園市', 'WILL@TIBAME.COM'),
       ('TONY', 'PASSWORD', 'TONY', '0910123456', 'TONY', '平鎮市', 'TONY@TIBAME.COM'),
       ('JOHN', 'PASSWORD', 'JOHN', '0930139248', 'JOHN', '龜山區', 'JOHN@TIBAME.COM'),
       ('LAURA', 'PASSWORD', 'LAURA', '0930456123', 'LAURA', '台北市', 'LAURA@TIBAME.COM'),
       ('AMBER', 'PASSWORD', 'AMBER', '0987123456', 'AMBER', '台北市', 'AMBER@TIBAME.COM');

INSERT INTO MEAL_PRODUCT
(MEAL_NAME, MEAL_CONTENT, MEAL_CAL, MEAL_ALLERGEN, MEAL_PRICE, MEAL_RECIPE, LAUNCH)
VALUES ('百里香牛排', '1.牛里肌 2.百里香葉 3.鹽', 500, '無', 350, '1. 將牛肉取出解凍 2.充分煎烤至中心溫度72度', 1),
       ('起司義大利餃', '1.麵粉 2.起司 3.豬肉', 350, '1.麩質 2.起司', 150, '1.微波爐中火微波3分鐘即可享用', 1),
       ('蔥爆牛肉', '1.牛柳條 2.蔥段 3.鹽 4.辣椒少許', 300, '無', 200,
        '1.蔥段及辣椒以少許油爆香 2.加入牛肉及鹽翻炒至全熟', 1),
       ('柳州螺螄粉', '1.螺螄高湯 2.米粉 3.腐皮 4.辣油 5.酸筍', 600, '黃豆', 180,
        '1.沸水將米粉煮軟備用 2.將高湯煮滾倒入米粉 3.加入配料', 1),
       ('麻婆豆腐', '1.嫩豆腐 2.豆瓣醬 3.小蔥段', 350, '黃豆', 150,
        '1.少許油將豆腐表面煎至金黃 2.加入豆瓣醬稍微拌炒 3.加入小蔥段', 1),
       ('酪梨生酮餐', '1.酪梨 2.培根 3.雞蛋', 400, '雞蛋', 100, '1.將落梨籽挖出 2.鋪上培根 3.打入雞蛋200度烤15分鐘', 1),
       ('增肌雞胸餐', '1.舒肥雞胸 2.黑胡椒 3.鹽', 300, '無', 150, '1.將產品室溫解凍 2.煎至兩面金黃調味', 1),
       ('風味雞胸咖哩飯', '1.咖哩調理包(含雞肉、胡蘿蔔、各式香料) 2.即食米飯', 550, '無', 150,
        '1.調理包隔水加熱 2.米飯微波2分鐘 3.混合即可食用', 1),
       ('高纖風味凱薩沙拉', '1.蘿蔓 2.番茄 3.起司 4.硬麵包 5.凱薩醬', 200, '起司', 200, '1.將各式材料混勻即可食用', 1),
       ('香煎起司鮭魚', '1.鮭魚片 2.起司 3.柳松菇、玉米筍(熟) 4.鹽', 600, '起司', 250,
        '1.將鮭魚煎至金黃 2.鋪上起司片以200度烤5分鐘 3.蔬菜裝飾', 1),
       ('麻油猴頭菇', '1.猴頭菇 2.胡蘿蔔 3.青豆 4.麻油 5.芝麻', 250, '無', 200, '1.微波爐中火微波3分鐘即可享用', 1),
       ('藜麥疏食沙拉', '1.藜麥 2.各式蔬果', 200, '無', 250, '生鮮即食(冷藏後風味絕佳)', 1),
       ('香煎天貝', '1.黃豆 2.天貝菌 3.醬油', 250, '黃豆', 200, '1.將天貝切片 2.中火慢煎 3.適量醬油調味', 1);


INSERT INTO NUTRIENT_FEATURE (FEATURE_NAME)
VALUES ('低醣'),
       ('高纖'),
       ('高蛋白'),
       ('增肌'),
       ('生酮'),
       ('高脂'),
       ('低脂'),
       ('高維生素'),
       ('高熱量'),
       ('低熱量'),
       ('素食');

INSERT INTO NUTRIENT_FEATURE_DETAIL(MEAL_NO, FEATURE_NO, FEATURE_NAME)
values (1, 3, '高蛋白'),
       (1, 4, '增肌'),
       (2, 6, '高脂'),
       (3, 3, '高蛋白'),
       (3, 4, '增肌'),
       (4, 9, '高熱量'),
       (5, 3, '高蛋白'),
       (6, 1, '低醣'),
       (6, 5, '生酮'),
       (6, 6, '高脂'),
       (7, 1, '低醣'),
       (7, 3, '高蛋白'),
       (7, 4, '增肌'),
       (7, 7, '低脂'),
       (8, 3, '高蛋白'),
       (9, 2, '高纖'),
       (9, 8, '高維生素'),
       (10, 3, '高蛋白'),
       (10, 9, '高熱量'),
       (11, 2, '高纖'),
       (11, 11, '素食'),
       (12, 2, '高纖'),
       (12, 7, '低脂'),
       (12, 10, '低熱量'),
       (12, 11, '素食'),
       (13, 3, '高蛋白'),
       (13, 4, '增肌'),
       (13, 11, '素食');

insert into Online_course_comment(member_no, course_no, comment_content)
values (1, 5, '非常滿意'),
       (2, 4, '滿意'),
       (3, 3, '普通'),
       (4, 2, '不滿意'),
       (5, 1, '非常不滿意');

insert into Online_course_comment_report(member_no, comment_no, report_reason)
values (1, 5, '垃圾郵件、惡意軟體及網路詐騙'),
       (2, 4, '暴力內容'),
       (3, 3, '仇恨言論'),
       (4, 2, '色情內容'),
       (5, 1, '騷擾、霸凌和威脅');

insert into backend_manager
    (manager_name, manager_ip, manager_account, manager_password)
values ('Ada', '1010193', 'Boss', 'password'),
       ('Alisa', '1010199', 'Manager', 'password'),
       ('Anna', '1010200', 'ViceMgr', 'password'),
       ('Ava', '1010201', 'CS', 'password'),
       ('Bess', '1010202', 'CS2', 'password');

INSERT INTO `jihaoshi`.`authority` (`AUTHORITY_NAME`)
VALUES ('網站管理'),
       ('客服管理'),
       ('課程管理'),
       ('商品管理'),
       ('員工管理');


INSERT INTO `jihaoshi`.`authority_detail` (`MANAGER_NO`, `AUTHORITY_NO`)
VALUES ('1', '1'),
       ('1', '2'),
       ('1', '3'),
       ('1', '4'),
       ('2', '2'),
       ('2', '3'),
       ('2', '4'),
       ('3', '2'),
       ('3', '3'),
       ('4', '2'),
       ('5', '2'),
       ('1', '5'),
       ('2', '5');



INSERT INTO PHYSICAL_COURSE( COURSE_NAME, COURSE_HR, COURSE_PRICE, COURSE_TEACHER, COURSE_DATE, COURSE_LOCATION, COURSE_INFO, COURSE_STATUS, CREATE_DATE, UPDATE_TIME, SIGN_UP_START_DAY, SIGN_UP_END_DAY, MAX_SIGN_UP_PEOPLE, MIN_SIGN_UP_PEOPLE, CURRENT_SIGN_UP_PEOPLE)
VALUES
    ( '三杯雞', 3, 2000, '阿基師',  str_to_date('2022-11-15', '%Y-%m-%d'), 'A001', '三杯雞做法簡便，以採用三杯主要調味料得名，通常需用到一兩半的三黃子雞，醬油（需用清湯淺色醬油，即頭抽）一杯、茶油或豬油一杯並甜酒釀一杯，另加蒜頭或蔥白、薑片，用砂缽和泥爐（以南豐縣所產為最佳）烹調，燜燒至湯汁將盡時淋上麻油即成。', 0, STR_TO_DATE('2021-01-03','%Y-%m-%d'), NOW(), STR_TO_DATE('2022-08-01','%Y-%m-%d'), STR_TO_DATE('2022-11-12','%Y-%m-%d'), 35, 5, 0),
    ( '舒肥雞', 2, 1400, '阿慶師', STR_TO_DATE('2022-11-17','%Y-%m-%d'), 'A001', '舒肥雞胸肉作為低熱量、低脂肪、高蛋白的食物，對於有在重訓、健身的人來說是一個很棒的營養補給，調理上也並不麻煩，也能搭配主食與其他配菜輕鬆準備好美味的一餐。美味多汁、低負擔高營養的舒肥雞，推薦給正在低卡、熱量控制、減脂飲食的你。', 0, STR_TO_DATE('2022-07-15','%Y-%m-%d'), NOW(), STR_TO_DATE('2022-08-02','%Y-%m-%d'), STR_TO_DATE('2022-11-14','%Y-%m-%d'), 35, 5, 0),
    ( '青醬蛤蠣義大利', 2, 1200, '簡單哥', STR_TO_DATE('2022-11-25','%Y-%m-%d'), 'A002', '醬義大利麵向來很討喜，不輸清炒第一名的白酒蛤蜊。將青醬結合白酒蛤蜊口味的義大利麵，更讓人難以抵擋。今天要教大家煮這道麵點，不只不會失敗，重點是超級美味，學會它就能橫著走。',0, STR_TO_DATE('2021-08-20','%Y-%m-%d'), NOW(), STR_TO_DATE('2022-08-03','%Y-%m-%d'), STR_TO_DATE('2022-11-22','%Y-%m-%d'), 20, 5, 0),
    ( '日式味增炸豬排', 2, 1500, 'MASA', STR_TO_DATE('2022-12-02','%Y-%m-%d'), 'A002', '名古屋的著名料理，炸好的豬排淋上以八丁味噌為主的醬汁，拿來做炸豬排丼或炸豬排三明治也都很適合~~', 0, STR_TO_DATE('2022-02-25','%Y-%m-%d'), NOW(), STR_TO_DATE('2022-08-04','%Y-%m-%d'), STR_TO_DATE('2022-11-30','%Y-%m-%d'), 20, 5, 0),
    ( '古早味滷肉飯', 2, 1000, '聖凱師', STR_TO_DATE('2022-12-10','%Y-%m-%d'), 'A003', '滷肉飯是臺灣流行的一道豬肉丁（或絞肉）飯菜餚，滷肉飯的特色和製作的關鍵部分在於肉醬和肉汁', 0, STR_TO_DATE('2022-04-19','%Y-%m-%d'), NOW(), STR_TO_DATE('2022-08-05','%Y-%m-%d'), STR_TO_DATE('2022-12-7','%Y-%m-%d'), 15, 5, 0);

INSERT INTO PHYSICAL_COURSE_PROMOTION_PROJECT( PROJECT_NAME, START_DATE, END_DATE, PROM_DESCRIPTION, UPDATE_TIME)
VALUES
    ('週年慶促銷', STR_TO_DATE('2022-10-01','%Y-%m-%d'), STR_TO_DATE('2022-11-15','%Y-%m-%d'), '針對1週年慶，全站課程打9折', NOW()),
    ('一起健康專案', STR_TO_DATE('2022-10-01','%Y-%m-%d'), STR_TO_DATE('2022-12-31','%Y-%m-%d'), '舒肥系列打85折', NOW()),
    ('懷舊之味', STR_TO_DATE('2022-10-01','%Y-%m-%d'), STR_TO_DATE('2022-10-15','%Y-%m-%d'), '古早味滷肉飯打95折', NOW());

INSERT INTO PHYSICAL_COURSE_PROMOTION_DETAIL( PROJECT_NO, COURSE_NO, PROM_PRICE)
VALUES
    (1, 1, 90),
    (1, 2, 90),
    (1, 3, 90),
    (1, 4, 90),
    (1, 5, 90),
    (2, 2, 85),
    (3, 5, 95);
INSERT INTO `jihaoshi`.`physical_course_comment` (`COURSE_NO`, `MEMBER_NO`, `COMMENT_CONTENT`)
VALUES ('1', '1', '簡單,快速,好吃'),
       ('1', '3', '阿基師太厲害了'),
       ('2', '2', '實作成功,口感軟嫩不乾柴'),
       ('3', '3', '風味特殊,令人難忘'),
       ('2', '1', '阿慶師教學認真,希望能開更多課程'),
       ('4', '3', '道地的日式做法'),
       ('5', '1', '傳統的台灣小吃'),
       ('4', '2', '油炸食物難度較高,不易成功'),
       ('5', '2', '有阿罵的味道'),
       ('5', '3', '看似簡單的料理竟有如此複雜的工序'),
       ('3', '4', '在家做出餐廳級別的料理');

insert into forum_article(member_no, article_name, article_content)
values (1, '溏心蛋另類作法',
        '溏心蛋電鍋版-電鍋內放入兩張沾溼的廚房紙巾，再把蛋放進去，按下去電鍋開關，計時13分鐘，再把蛋放到冷水裡，帶冷卻後，即可剝殼。剝殼後，可以加點日式醬油泡或自制醬汁浸泡溏心蛋！'),
       (2, '蒸蛋好方法',
        '蒸蛋光滑、軟嫩的秘訣蒸蛋的比例蛋跟水1：1.5，且要多過篩幾次，過篩後如果表面還有泡泡的話，就用湯匙撈起，蒸的時候鍋蓋下記得要留個縫隙，這樣蒸起來就會很漂亮了。'),
       (3, '愛煮飯', '在家自煮，傳遞愛意，營造家的氛圍'),
       (4, '維生素A功效？',
        '維生素A對眼睛、皮膚、免疫系統的功能至關緊要，但口服和外用功效不同，過量攝取還會提高前列腺癌和老年骨折的風險，最好從維生素A食物獲取日常所需。'),
       (5, '帥東煮菜療癒又好吃',
        '根據科學研究結果發現，透過做料理，可以療癒我們的心靈，幫助紓解壓力喔！ 而且廚師長得帥，身心療育');
insert into forum_comment (article_no, member_no, comment_content)
values (1, 1, "感謝版主分享好方法"),
       (2, 1, "蒸蛋好吃，感謝分享"),
       (3, 2, "好溫暖"),
       (1, 2, "溏心蛋的蛋黃，軟軟好噁心"),
       (2, 3, "好吃+1"),
       (3, 3, "出門在外，好想有家的感覺"),
       (4, 2, "原來是這樣吃"),
       (4, 1, "讚，新增知識了"),
       (5, 3, "帥東是個好男孩"),
       (5, 2, "看帥東煮菜，就是欣賞藝術");
insert into forum_article_report (article_no, member_no, report_reason)
values (1, 1, '文章講得簡單做得難，時間不夠，省錢好難'),
       (2, 2, '純粹想檢舉文章，沒理由'),
       (3, 3, '單身羅漢腳，只能自己吃'),
       (4, 1, '沒理由,檢舉就對了'),
       (1, 3, '這溏心蛋作法，覺得太繁瑣'),
       (2, 1, '蒸蛋製作比例有問題，覺得爛'),
       (3, 2, '家人都說我煮得不好吃，難過'),
       (4, 2, '資訊給得太少，覺得不行'),
       (5, 1, '長得帥就是欠檢舉'),
       (5, 3, '人不能太完美，所以給檢舉');
insert into forum_comment_report (comment_no, article_no, member_no, report_reason)
values (1, 1, 1, '太敷衍的感謝了'),
       (1, 1, 4, '這留言我覺得不行'),
       (1, 1, 2, '就是想檢舉'),
       (2, 2, 1, '感謝太敷衍了'),
       (2, 2, 2, '這留言，就是得檢舉'),
       (3, 3, 1, 'QQ羅漢腳'),
       (3, 3, 3, '幫羅漢腳拍拍'),
       (9, 5, 3, '這留言沒有檢舉空間'),
       (9, 5, 1, '手癢檢舉一下');

insert into latest_news
    (news_name, news_content)
values ('吃得健康又省錢',
        '講到省錢自然不在話下，在外面吃一餐的費用還要考慮到餐廳的租金、人力、營運支出，價錢三倍翻都算合理，卻苦了我們的荷包，其實健康飲食真的不用這麼貴，自己做好料實在又便宜！'),
       ('提升生活的品質',
        '只有一個人時，完全沉浸在做菜的愉快氛圍中，享受和自己相處的難得時光。我很喜歡做菜時從無到有的過程，自己喜歡吃什麼就做什麼，甜一點或鹹一點，都能隨心所欲掌握，聞著香噴噴的料理，超級有成就感的！'),
       ('防疫飲食靠自己', '不用吃外食，避免確診風險，靠自己煮，病毒遠離你'),
       ('三餐這樣做，全穀雜糧輕鬆吃',
        '近日來嚴重特殊傳染性肺炎（武漢肺炎）疫情使得人心惶惶，除戴口罩、勤洗手及減少出入公共場所外，我們也需要透過聰明飲食提高自身抵抗力，捍衛身體健康。國人在選擇三餐時，不要忽略攝取全榖雜糧對保持自體健康的益處與重要性。全榖雜糧中含有豐富的維生素B群、維生素E、礦物質及膳食纖維等多種營養素，維生素B群主要有調節新陳代謝、維持皮膚和肌肉健康、增強免疫系統和神經系統等功能；維生素E則是重要的脂溶性抗氧化劑，有助於保護心血管、減少自由基等；膳食纖維可以幫助腸蠕動、保護腸黏膜細胞與調節腸內細菌，維持腸道健康。'),
       ('亞洲人飲食六大趨勢轉變　「吃健康」取代「吃粗飽」',
        '開始變成希望用原型食物來做，原型就是任何食物原始的形狀，甚至有些人真的會去找有機食物，這有機不是除了我們說有機的目的以外，它可能是連種植的地，有沒有這些很重要的一些複合性礦物質，其實都會去找，所以我覺得在這幾年間，民眾對於飲食的一個型態的期待值，開始出現了一些轉變。');

insert into Online_course(course_name, course_hr, course_teacher, course_info, course_price, course_video)
values ('韓式煎餅', '1小時', '呂冬玲', '教你做出酥酥脆脆的道地韓式煎餅', 0, 'dK3GPvvGo9g'),
       ('大阪燒', '30分鐘', '賴品薰', '喜歡吃大阪燒的你，保證讓你零失敗', 1680, 'Y-1K1TIBHbw'),
       ('麻油三杯雞', '2小時', '賈劍凌', '美味的台菜料理讓你輕鬆上桌', 999, 'O6jpeQMmZk4'),
       ('自製奶酥醬', '40分鐘', '盧加一', '健康又美味的果醬，按照步驟一次把你教會', 0, 'wW6gyU-6tLs'),
       ('蛋包飯', '1小時30分鐘', '陳渴橘', '大人小孩都愛吃的蛋包飯，你絕對不能錯過', 888, 'OekEUvPvFeA'),
       ('越式春捲', '50分鐘', '蔡鳴荒', '餐廳吃很貴，自己動手作超簡單', 1180, 'i-FhcmyLyGg'),
       ('打拋豬炒飯','45分鐘','鄭麗聲','夏天吃飯沒胃口?酸酸辣辣讓你開胃',789,'Y-W9ZbIKCL4'),
       ('口水雞','1小時','林駿盛','美味關鍵，雞肉要冰鎮',890,'KfCqJ1e-qeg'),
       ('滷五花肉','1小時30分鐘','余諾划','讓家常滷肉不油膩！滷五花肉必學！',1280,'SJRGDywl0pk'),
       ('馬鈴薯蛋餅','35分鐘','朱紅人','薯餅蛋餅合而為一，一次雙享受！',500,'2lT3tvJCNxY'),
       ('蕃茄海鮮義大利麵','45分鐘','鄭運汝','一鍋到底，番茄海鮮義大利麵輕鬆上桌！！吃過大讚～',800,'7jH34Y3gDOM'),
       ('涼拌白菜','30分鐘','鄭駿生','材料簡單又便宜，想吃隨時做！',600,'3z5jHLfIIx0');

insert into FAQ(FAQ_que, FAQ_ans, FAQ_class)
values ('購物一定要加入會員嗎 ',
        '第一次購物請先加入會員再開始購物，才可享有多項會員服務',
        '購物 Shopping'),
       ('加入會員需要付費嗎 ',
        '請您點選「加入會員」連結，設定您個人的會員帳號及密碼及基本資料即可加入，此服務均為免費 ',
        '會員服務 Member'),
        ('可以修改帳號嗎 ',
        '由於會員帳號與訂購記錄等資料息息相關，故無法更改。若您欲修改帳號，請先申請「刪除帳號」再重新申請 ',
        '會員服務 Member'),
       ('貨到付現說明 ',
        '若您選擇貨到付，商品將寄送至訂單資料上的收件地址，送件時宅配人員將當場收款(限台灣本島地區)。',
        '訂單 Order'),
       ('訂購後何時可以拿到商品(國內) ',
        '若訂單內商品都有庫存，商品將於1~2個工作天內出貨，會員可於出貨後2-5天內收到。',
        '包裹寄送 Delivery'),
       ('什麼是Coupon ',
        'Coupon是活動贈品，為一組英文與阿拉伯數字的組合序號或是全阿拉伯數字的序號，會員可於有效期限內，在本站消費時使用。',
        '折價券 Coupon');