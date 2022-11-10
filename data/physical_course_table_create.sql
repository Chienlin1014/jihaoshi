CREATE DATABASE IF NOT EXISTS Jihaoshi;

use Jihaoshi;

DROP TABLE IF EXISTS Physical_course_promotion_detail;
DROP TABLE IF EXISTS Physical_course_promotion_project;
DROP TABLE IF EXISTS Physical_course;

create table Jihaoshi.Physical_course (
    course_no int not null auto_increment comment'實體課程編號',
    course_name varchar(50) not null comment '實體課程名稱',
    course_hr int not null comment '上課時數',
    course_price int not null comment '課程費用',
    course_teacher char(12) not null comment '授課老師',
    course_date timestamp not null comment '開課時間',
    course_location char(12) not null comment '上課教室',
    course_info varchar(1000) not null comment '課程簡介',
    course_status int not null default 0 comment '狀態',
    create_date timestamp not null default current_timestamp comment '上架日期',
    update_time timestamp not null default current_timestamp on update current_timestamp  comment '修改日期',
    sign_up_start_day date not null comment '報名開始日期',
    sign_up_end_day date not null comment '報名結束日期',
    max_sign_up_people int not null comment '人數上限',
    min_sign_up_people int not null comment '人數下限',
    current_sign_up_people int not null default 0 comment '目前報名人數',
    pic longblob comment '課程照片',

	primary key (course_no)
);

insert into Physical_course( course_name, course_hr, course_price, course_teacher, course_date, course_location, course_info, course_status, create_date, update_time, sign_up_start_day, sign_up_end_day, max_sign_up_people, min_sign_up_people,	current_sign_up_people)
values
( '三杯雞', 3, 2000, '阿基師', str_to_date('2022-11-15','%Y-%m-%d'), 'A001', '三杯雞做法簡便，以採用三杯主要調味料得名，通常需用到一兩半的三黃子雞，醬油（需用清湯淺色醬油，即頭抽）一杯、茶油或豬油一杯並甜酒釀一杯，另加蒜頭或蔥白、薑片，用砂缽和泥爐（以南豐縣所產為最佳）烹調，燜燒至湯汁將盡時淋上麻油即成。', 0, str_to_date('2021-01-03','%Y-%m-%d'), now(), str_to_date('2022-08-01','%Y-%m-%d'), str_to_date('2022-11-12','%Y-%m-%d'), 35, 5, 0),
( '舒肥雞', 2, 1400, '阿慶師', str_to_date('2022-11-17','%Y-%m-%d'), 'A001', '舒肥雞胸肉作為低熱量、低脂肪、高蛋白的食物，對於有在重訓、健身的人來說是一個很棒的營養補給，調理上也並不麻煩，也能搭配主食與其他配菜輕鬆準備好美味的一餐。美味多汁、低負擔高營養的舒肥雞，推薦給正在低卡、熱量控制、減脂飲食的你。', 0, str_to_date('2022-07-15','%Y-%m-%d'), now(), str_to_date('2022-08-02','%Y-%m-%d'), str_to_date('2022-11-14','%Y-%m-%d'), 35, 5, 0),
( '青醬蛤蠣義大利',	2, 1200, '簡單哥', str_to_date('2022-11-25','%Y-%m-%d'), 'A002', '醬義大利麵向來很討喜，不輸清炒第一名的白酒蛤蜊。將青醬結合白酒蛤蜊口味的義大利麵，更讓人難以抵擋。今天要教大家煮這道麵點，不只不會失敗，重點是超級美味，學會它就能橫著走。',0, str_to_date('2021-08-20','%Y-%m-%d'), now(), str_to_date('2022-08-03','%Y-%m-%d'), str_to_date('2022-11-22','%Y-%m-%d'), 20, 5, 0),
( '日式味增炸豬排', 2, 1500, 'MASA', str_to_date('2022-12-02','%Y-%m-%d'), 'A002', '名古屋的著名料理，炸好的豬排淋上以八丁味噌為主的醬汁，拿來做炸豬排丼或炸豬排三明治也都很適合~~', 0, str_to_date('2022-02-25','%Y-%m-%d'), now(), str_to_date('2022-08-04','%Y-%m-%d'), str_to_date('2022-11-30','%Y-%m-%d'), 20, 5, 0),
( '古早味滷肉飯', 2, 1000, '聖凱師', str_to_date('2022-12-10','%Y-%m-%d'), 'A003', '滷肉飯是臺灣流行的一道豬肉丁（或絞肉）飯菜餚，滷肉飯的特色和製作的關鍵部分在於肉醬和肉汁', 0, str_to_date('2022-04-19','%Y-%m-%d'), now(), str_to_date('2022-08-05','%Y-%m-%d'), str_to_date('2022-12-7','%Y-%m-%d'), 15, 5, 0);


create table Jihaoshi.Physical_course_promotion_project (
    project_no int not null auto_increment comment'促銷專案編號',
    project_name varchar(30) not null comment '促銷專案名稱',
    start_date date not null comment '開始日期',
    end_date date not null comment '結束日期',
    prom_description varchar(300) not null comment '促銷活動敘述',
    prom_status tinyint not null default 0 comment '促銷活動狀態',
    update_time timestamp not null default current_timestamp on update current_timestamp comment '編輯時間',

	primary key (project_no)
);

insert into Physical_course_promotion_project( project_name, start_date, end_date, prom_description, update_time)
values
('週年慶促銷', str_to_date('2022-10-01','%Y-%m-%d'), str_to_date('2022-11-15','%Y-%m-%d'), '針對1週年慶，全站課程打9折', now()),
('一起健康專案', str_to_date('2022-10-01','%Y-%m-%d'), str_to_date('2022-12-31','%Y-%m-%d'), '舒肥系列打85折', now()),
('懷舊之味', str_to_date('2022-10-01','%Y-%m-%d'), str_to_date('2022-10-15','%Y-%m-%d'), '古早味滷肉飯打95折', now());



create table Jihaoshi.Physical_course_promotion_detail (
    project_no int not null auto_increment comment'促銷專案編號',
    course_no int not null comment '促銷專案名稱',
    prom_price int not null comment '促銷價格',

	primary key (project_no, course_no),
	constraint FK_PC_course_no foreign key (course_no) references Physical_course (course_no),
    constraint FK_PCPP_project_no foreign key (project_no) references Physical_course_promotion_project (project_no)
       
);

insert into Physical_course_promotion_detail( project_no, course_no, prom_price)
values
(1,	1, 9),
(1,	2, 9),
(1,	3, 9),
(1,	4, 9),
(1,	5, 9),
(2,	2, 85),
(3,	5, 95);
