DROP DATABASE IF EXISTS JIHAOSHI;
CREATE DATABASE JIHAOSHI;
USE JIHAOSHI;

CREATE TABLE MEMBER
(
    MEMBER_NO       INT          NOT NULL AUTO_INCREMENT,
    MEMBER_ACCOUNT  VARCHAR(20)  NOT NULL,
    MEMBER_PASSWORD VARCHAR(40)  NOT NULL,
    MEMBER_NAME     VARCHAR(10)  NOT NULL,
    MEMBER_PHONE    VARCHAR(10)  NOT NULL,
    MEMBER_NICKNAME VARCHAR(10)  NOT NULL,
    MEMBER_ADDRESS  VARCHAR(100) NOT NULL,
    MEMBER_EMAIL    VARCHAR(30)  NOT NULL,
    MEMBER_STATE    TINYINT      NOT NULL DEFAULT 1,
    PRIMARY KEY (MEMBER_NO)
);

CREATE TABLE MEAL_PRODUCT
(
    MEAL_NO        INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEAL_NAME      VARCHAR(15)  NOT NULL,
    MEAL_CONTENT   VARCHAR(50)  NOT NULL,
    MEAL_CAL       INT          NOT NULL,
    MEAL_ALLERGEN  VARCHAR(15)  NOT NULL,
    MEAL_PRICE     INT          NOT NULL,
    MEAL_PHOTO     LONGBLOB,
    SALE_VOLUME    INT          NOT NULL DEFAULT 0,
    MEAL_RECIPE    VARCHAR(150) NOT NULL,
    COMMENT_PEOPLE INT          NOT NULL DEFAULT 0,
    COMMENT_SCORE  INT          NOT NULL DEFAULT 0,
    LAUNCH         TINYINT      NOT NULL DEFAULT 0,
    UPDATE_TIME    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE NUTRIENT_FEATURE
(
    FEATURE_NO   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FEATURE_NAME VARCHAR(10) NOT NULL
);

CREATE TABLE NUTRIENT_FEATURE_DETAIL
(
    MEAL_NO    INT NOT NULL,
    FEATURE_NO INT NOT NULL,
    CONSTRAINT FK_NDETAIL_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO),
    CONSTRAINT FK_NDETAIL_FEATURENO FOREIGN KEY (FEATURE_NO) REFERENCES NUTRIENT_FEATURE (FEATURE_NO),
    PRIMARY KEY (MEAL_NO, FEATURE_NO)
);

CREATE TABLE MEAL_ORDER
(
    ORDER_NO     INT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEMBER_NO    INT       NOT NULL,
    ORDER_TIME   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ORDER_PRICE  INT       NOT NULL,
    ORDER_STATUS TINYINT   NOT NULL DEFAULT 0,
    CONSTRAINT FK_ORDER_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE MEAL_ORDER_DETAIL
(
    ORDER_NO    INT NOT NULL,
    MEAL_NO     INT NOT NULL,
    MEAL_PRICE  INT NOT NULL,
    MEAL_VOLUME INT NOT NULL,
    CONSTRAINT FK_ODETAIL_ORDER FOREIGN KEY (ORDER_NO) REFERENCES MEAL_ORDER (ORDER_NO),
    CONSTRAINT FK_ODETAIL_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO),
    PRIMARY KEY (ORDER_NO, MEAL_NO)
);

CREATE TABLE MEAL_COLLECTION_DETAIL
(
    MEMBER_NO INT NOT NULL,
    MEAL_NO   INT NOT NULL,
    CONSTRAINT FK_COLLECTION_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT FK_COLLECTION_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO),
    PRIMARY KEY (MEMBER_NO, MEAL_NO)
);

CREATE TABLE MEAL_REFUND
(
    REFUND_NO     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEMBER_NO     INT          NOT NULL,
    ORDER_NO      INT          NOT NULL,
    REFUND_PRICE  INT          NOT NULL,
    REFUND_REASON VARCHAR(100) NOT NULL,
    APPLY_TIME    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    REFUND_STATUS TINYINT(1) NOT NULL DEFAULT 0,
    CONSTRAINT FK_REFUND_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT FK_REFUND_ORDER FOREIGN KEY (ORDER_NO) REFERENCES MEAL_ORDER (ORDER_NO)
);

CREATE TABLE MEAL_REFUND_DETAIL
(
    REFUND_NO INT NOT NULL,
    MEAL_NO   INT NOT NULL,
    CONSTRAINT FK_RDETAIL_REFUND FOREIGN KEY (REFUND_NO) REFERENCES MEAL_REFUND (REFUND_NO),
    CONSTRAINT FK_RDETAIL_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO),
    PRIMARY KEY (REFUND_NO, MEAL_NO)
);

CREATE TABLE MEAL_COMMENT
(
    COMMENT_NO      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEAL_NO         INT          NOT NULL,
    MEMBER_NO       INT          NOT NULL,
    COMMENT_CONTENT VARCHAR(300) NOT NULL,
    COMMENT_TIME    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    COMMENT_SCORE   INT          NOT NULL DEFAULT 0,
    COMMENT_STATUS  TINYINT      NOT NULL DEFAULT 1,
    CONSTRAINT FK_COMMENT_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO),
    CONSTRAINT FK_COMMENT_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE MEAL_COMMENTS_REPORT
(
    REPORT_NO     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COMMENT_NO    INT          NOT NULL,
    MEMBER_NO     INT          NOT NULL,
    REPORT_REASON VARCHAR(100) NOT NULL,
    REPORT_TIME   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    REPORT_STATUS TINYINT      NOT NULL DEFAULT 0,
    CONSTRAINT FK_REPORT_COMMENT FOREIGN KEY (COMMENT_NO) REFERENCES MEAL_COMMENT (COMMENT_NO),
    CONSTRAINT FK_REPORT_MEMBER FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE MEAL_PROMOTION_PROJECT
(
    PROJECT_NO        INT           NOT NULL AUTO_INCREMENT PRIMARY KEY,
    PROJECT_NAME      VARCHAR(30)   NOT NULL,
    START_DATE        TIMESTAMP     NOT NULL,
    END_DATE          TIMESTAMP     NOT NULL,
    PROMOTION_CONTENT VARCHAR(1000) NOT NULL,
    UPDATE_DATE       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE MEAL_PROMOTION_DETAILS
(
    PROJECT_NO      INT NOT NULL,
    MEAL_NO         INT NOT NULL,
    PROMOTION_PRICE INT NOT NULL,
    CONSTRAINT FK_PDETAIL_PROJECT FOREIGN KEY (PROJECT_NO) REFERENCES MEAL_PROMOTION_PROJECT (PROJECT_NO),
    CONSTRAINT FK_PDETAIL_MEALNO FOREIGN KEY (MEAL_NO) REFERENCES MEAL_PRODUCT (MEAL_NO)
);

CREATE TABLE FORUM_ARTICLE
(
    ARTICLE_NO      INT          NOT NULL AUTO_INCREMENT,
    MEMBER_NO       INT          NOT NULL,
    ARTICLE_TIME    TIMESTAMP             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ARTICLE_CONTENT VARCHAR(300) NOT NULL,
    ARTICLE_STATUS  TINYINT      NOT NULL DEFAULT 1,
    PRIMARY KEY (ARTICLE_NO),
    CONSTRAINT FK_FORUM_ARTICLE_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE FORUM_COMMENT
(
    COMMENT_NO      INT          NOT NULL AUTO_INCREMENT,
    ARTICLE_NO      INT          NOT NULL,
    MEMBER_NO       INT          NOT NULL,
    COMMENT_TIME    TIMESTAMP             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    COMMENT_CONTENT VARCHAR(100) NOT NULL,
    COMMENT_STATUS  TINYINT      NOT NULL DEFAULT 1,
    PRIMARY KEY (COMMENT_NO),
    CONSTRAINT FK_FORUM_COMMENT_ARTICLE_NO FOREIGN KEY (ARTICLE_NO) REFERENCES FORUM_ARTICLE (ARTICLE_NO),
    CONSTRAINT FK_FORUM_COMMENT_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE FORUM_ARTICLE_REPORT
(
    ARTICLE_REPORT_NO INT          NOT NULL AUTO_INCREMENT,
    ARTICLE_NO        INT          NOT NULL,
    MEMBER_NO         INT          NOT NULL,
    REPORT_REASON     VARCHAR(100) NOT NULL,
    REPORT_STATUS     TINYINT      NOT NULL DEFAULT 0,
    PRIMARY KEY (ARTICLE_REPORT_NO),
    CONSTRAINT FK_FORUM_ARTICLE_REPORT_ARTICLE_NO FOREIGN KEY (ARTICLE_NO) REFERENCES FORUM_COMMENT (COMMENT_NO),
    CONSTRAINT FK_FORUM_ARTICLE_REPORT_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE FORUM_COMMENT_REPORT
(
    COMMENT_REPORT_NO INT          NOT NULL AUTO_INCREMENT,
    COMMENT_NO        INT          NOT NULL,
    ARTICLE_NO        INT          NOT NULL,
    MEMBER_NO         INT          NOT NULL,
    REPORT_REASON     VARCHAR(100) NOT NULL,
    REPORT_STATUS     TINYINT      NOT NULL DEFAULT 0,
    PRIMARY KEY (COMMENT_REPORT_NO),
    CONSTRAINT FK_FORUM_COMMENT_REPORT_COMMENT_NO FOREIGN KEY (COMMENT_NO) REFERENCES FORUM_COMMENT (COMMENT_NO),
    CONSTRAINT FK_FORUM_COMMENT_REPORT_ARTICLE_NO FOREIGN KEY (ARTICLE_NO) REFERENCES FORUM_ARTICLE (ARTICLE_NO),
    CONSTRAINT FK_FORUM_COMMENT_REPORT_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE BACKEND_MANAGER
(
    MANAGER_NO       INT         NOT NULL AUTO_INCREMENT,
    MANAGER_NAME     VARCHAR(20) NOT NULL,
    MANAGER_IP       VARCHAR(20) NOT NULL,
    MANAGER_ACCOUNT  VARCHAR(20) NOT NULL,
    MANAGER_PASSWORD VARCHAR(20) NOT NULL,
    MANAGER_STATUS   TINYINT     NOT NULL DEFAULT 1,
    PRIMARY KEY (MANAGER_NO)
);

CREATE TABLE LATEST_NEWS
(
    NEWS_NO      INT          NOT NULL AUTO_INCREMENT,
    NEWS_NAME    VARCHAR(50)  NOT NULL,
    UPDATE_DATE  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    NEWS_CONTENT VARCHAR(500) NOT NULL,
    PRIMARY KEY (NEWS_NO)
);

CREATE TABLE PHYSICAL_COURSE
(
    COURSE_NO                INT           NOT NULL AUTO_INCREMENT COMMENT '實體課程編號',
    COURSE_NAME              VARCHAR(50)   NOT NULL COMMENT '實體課程名稱',
    COURSE_HR                INT           NOT NULL COMMENT '上課時數',
    COURSE_PRICE             INT           NOT NULL COMMENT '課程費用',
    COURSE_TEACHER           CHAR(12)      NOT NULL COMMENT '授課老師',
    COURSE_DATE              TIMESTAMP     NOT NULL COMMENT '開課時間',
    COURSE_LOCATION          CHAR(12)      NOT NULL COMMENT '上課教室',
    COURSE_INFO              VARCHAR(1000) NOT NULL COMMENT '課程簡介',
    COURSE_STATUS            INT           NOT NULL DEFAULT 0 COMMENT '狀態',
    COURSE_ON_BOARD_DATE     TIMESTAMP     NOT NULL COMMENT '上架日期',
    COURSE_UPDATE_TIME       TIMESTAMP     NOT NULL COMMENT '修改日期',
    COURSE_SIGN_UP_START_DAY DATETIME      NOT NULL COMMENT '報名開始日期',
    COURSE_SING_UP_END_DAY   DATETIME      NOT NULL COMMENT '報名結束日期',
    MAX_SIGN_UP_PEOPLE       INT           NOT NULL COMMENT '人數上限',
    MIN_SIGN_UP_PEOPLE       INT           NOT NULL COMMENT '人數下限',
    CURRENT_SIGN_UP_PEOPLE   INT           NOT NULL DEFAULT 0 COMMENT '目前報名人數',
    PRIMARY KEY (COURSE_NO)
);

CREATE TABLE PHYCAL_COURSE_REG_LIST
(
    COURSE_NO INT       NOT NULL,
    MEMBER_NO INT       NOT NULL,
    REG_DATE  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT PHYCAL_COURSE_REG_LIST_COURSE_NO FOREIGN KEY (COURSE_NO) REFERENCES PHYSICAL_COURSE (COURSE_NO),
    CONSTRAINT PHYCAL_COURSE_REG_LIST_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    PRIMARY KEY (COURSE_NO, MEMBER_NO)
);

CREATE TABLE PHYSICAL_COURSE_PROMOTION_PROJECT
(
    PROJECT_NO       INT         NOT NULL AUTO_INCREMENT COMMENT '促銷專案編號',
    PROJECT_NAME     VARCHAR(30) NOT NULL COMMENT '促銷專案名稱',
    START_DATE       DATETIME    NOT NULL COMMENT '開始日期',
    END_DATE         DATETIME    NOT NULL COMMENT '結束日期',
    PROM_DESCRIPTION TEXT        NOT NULL COMMENT '促銷活動敘述',
    PROM_STATUS      TINYINT     NOT NULL COMMENT '促銷活動狀態',
    UPDATE_TIME      TIMESTAMP   NOT NULL COMMENT '編輯時間',

    PRIMARY KEY (PROJECT_NO)
);

CREATE TABLE PHYSICAL_COURSE_PROMOTION_DETAIL
(
    PROJECT_NO INT NOT NULL AUTO_INCREMENT COMMENT '促銷專案編號',
    COURSE_NO  INT NOT NULL COMMENT '促銷專案名稱',
    PROM_PRICE INT NOT NULL COMMENT '促銷價格',

    PRIMARY KEY (PROJECT_NO, COURSE_NO),
    CONSTRAINT FK_PC_COURSE_NO FOREIGN KEY (COURSE_NO) REFERENCES PHYSICAL_COURSE (COURSE_NO),
    CONSTRAINT FK_PCPP_PROJECT_NO FOREIGN KEY (PROJECT_NO) REFERENCES PHYSICAL_COURSE_PROMOTION_PROJECT (PROJECT_NO)

);

CREATE TABLE PHYSICAL_COURSE_COMMENT
(
    COMMENT_NO      INT          NOT NULL AUTO_INCREMENT,
    COURSE_NO       INT          NOT NULL,
    MEMBER_NO       INT          NOT NULL,
    COMMENT_CONTENT VARCHAR(300) NOT NULL,
    COMMENT_STATUS  TINYINT      NOT NULL DEFAULT 1,
    CONSTRAINT FK_PHYSICAL_COURSE_COMMENT_MEMBER_NO FOREIGN KEY (MEMBER_NO)
        REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT FK_PHYSICAL_COURSE_COMMENT_COURSE_NO FOREIGN KEY (COURSE_NO)
        REFERENCES PHYSICAL_COURSE (COURSE_NO),
    PRIMARY KEY (COMMENT_NO)
);

CREATE TABLE PHYSICAL_COURSE_COMMENT_REPORT
(
    REPORT_NO           INT          NOT NULL AUTO_INCREMENT,
    MEMBER_NO           INT          NOT NULL,
    COMMENT_NO          INT          NOT NULL,
    PHY_COM_REP_CONTENT VARCHAR(100) NOT NULL,
    REPORT_STATUS       TINYINT      NOT NULL DEFAULT 1,
    CONSTRAINT FK_PHYSICAL_COURSE_MEMBER_NO FOREIGN KEY (MEMBER_NO)
        REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT FK_PHYSICAL_COURSE_COMMENT_NO FOREIGN KEY (COMMENT_NO)
        REFERENCES PHYSICAL_COURSE_COMMENT (COMMENT_NO),
    PRIMARY KEY (REPORT_NO)
);

CREATE TABLE FAQ
(
    FAQ_NO    INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FAQ_QUE   VARCHAR(30)  NOT NULL,
    FAQ_ANS   VARCHAR(100) NOT NULL,
    FAQ_CLASS VARCHAR(30)  NOT NULL
);

CREATE TABLE ONLINE_COURSE_COMMENT
(
    COMMENT_NO      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEMBER_NO       INT          NOT NULL,
    COURSE_NO       INT          NOT NULL,
    COMMENT_CONTENT VARCHAR(300) NOT NULL,
    COMMENT_PEOPLE  INT          NOT NULL DEFAULT 0,
    COMMENT_SCORE   INT          NOT NULL DEFAULT 0,
    COMMENT_STATUS  TINYINT      NOT NULL DEFAULT 1,
    CONSTRAINT ONLINE_COURSE_COMMENT FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO)
);

CREATE TABLE ONLINE_COURSE_COMMENT_REPORT
(
    REPORT_NO     INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    MEMBER_NO     INT          NOT NULL,
    COMMENT_NO    INT          NOT NULL,
    REPORT_REASON VARCHAR(100) NOT NULL,
    REPORT_STATUS TINYINT      NOT NULL DEFAULT 0,
    CONSTRAINT ONLINE_COURSE_COMMENT_REPORT_MEMBER_NO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    CONSTRAINT ONLINE_COURSE_COMMENT_REPORT_COMMENT_NO FOREIGN KEY (COMMENT_NO) REFERENCES ONLINE_COURSE_COMMENT (COMMENT_NO)
);

CREATE TABLE SERVICE_RECORD
(
    RECORD_NO      INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NAME           VARCHAR(10)  NOT NULL,
    RECORD_CONTENT VARCHAR(100) NOT NULL,
    UPDATE_DATE    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE AUTHORITY
(
    AUTHORITY_NO   INT         NOT NULL AUTO_INCREMENT,
    AUTHORITY_NAME VARCHAR(20) NOT NULL,
    PRIMARY KEY (AUTHORITY_NO)
);

CREATE TABLE AUTHORITY_DETAIL
(
    MANAGER_NO   INT NOT NULL,
    AUTHORITY_NO INT NOT NULL,
    CONSTRAINT FK_AD_MANAGERNO FOREIGN KEY (MANAGER_NO) REFERENCES BACKEND_MANAGER (MANAGER_NO),
    CONSTRAINT FK_AD_AUTHORITYNO FOREIGN KEY (AUTHORITY_NO) REFERENCES AUTHORITY (AUTHORITY_NO),
    PRIMARY KEY (MANAGER_NO, AUTHORITY_NO)
);

CREATE TABLE ONLINE_COURSE
(
    COURSE_NO      INT          NOT NULL PRIMARY KEY,
    COURSE_NAME    VARCHAR(20)  NOT NULL,
    COURSE_HR      INT          NOT NULL,
    COURSE_TEACHER VARCHAR(20)  NOT NULL,
    COURSE_INFO    VARCHAR(100) NOT NULL,
    COURSE_PRICE   INT          NOT NULL,
    COURSE_STATUS  TINYINT      NOT NULL DEFAULT 0,
    UPDATE_DATE    TIMESTAMP             DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    COMMENT_PEOPLE INT          NOT NULL DEFAULT 0,
    COMMENT_SCORE  INT          NOT NULL DEFAULT 0
);

CREATE TABLE ONLINE_COURSE_ORDER
(
    ORDER_NO    INT NOT NULL AUTO_INCREMENT,
    MEMBER_NO   INT NOT NULL,
    ORDER_TIME  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ORDER_PRICE INT NOT NULL,
    CONSTRAINT FK_OCD_MEMBERNO FOREIGN KEY (MEMBER_NO) REFERENCES MEMBER (MEMBER_NO),
    PRIMARY KEY (ORDER_NO)
);

CREATE TABLE ONLINE_COURSE_ORDER_DETAIL
(
    ORDER_NO     INT NOT NULL,
    COURSE_NO    INT NOT NULL,
    COURSE_PRICE INT NOT NULL,
    CONSTRAINT FK_OCOD_ORDERNO FOREIGN KEY (ORDER_NO) REFERENCES ONLINE_COURSE_ORDER (ORDER_NO),
    CONSTRAINT FK_OCOD_COURSENO FOREIGN KEY (COURSE_NO) REFERENCES ONLINE_COURSE (COURSE_NO),
    PRIMARY KEY (ORDER_NO, COURSE_NO)
);