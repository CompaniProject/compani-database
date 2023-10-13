﻿CREATE TABLE "MEMBER" (
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"MEMB_PWD"	VARCHAR2(512)		NOT NULL,
	"MEMB_NM"	VARCHAR2(30)		NOT NULL,
	"MEMB_BIRTH_DT"	DATE		NOT NULL,
	"MEMB_EMAIL"	VARCHAR2(50)		NULL,
	"MEMB_TELNO"	VARCHAR2(11)		NULL,
	"CO_CD"	VARCHAR2(24)		NOT NULL,
	"MEMB_DEPT"	VARCHAR2(30)		NULL,
	"MEMB_WKGD"	VARCHAR2(30)		NULL,
	"MEMB_PHT_PATH"	VARCHAR2(256)		NULL,
	"MEMB_MSG"	VARCHAR2(500)		NULL,
	"MEMB_ACCP"	VARCHAR2(1)	DEFAULT 'N'	NOT NULL,
	"PERM_NO"	NUMBER(1)		NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMB_ACCP" IS 'Y/N';

COMMENT ON COLUMN "MEMBER"."PERM_NO" IS '1,2,3,4';

CREATE TABLE "BUSINESS" (
	"BUSS_NO"	NUMBER(10)		NOT NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"BUSS_UPCD"	NUMBER(10)		NULL,
	"BUSS_NM"	VARCHAR2(100)		NOT NULL,
	"BUSS_IMP"	VARCHAR2(10)		NULL,
	"BUSS_PRGRE"	NUMBER(3)	DEFAULT 0	NULL,
	"BUSS_FRDT"	DATE		NULL,
	"BUSS_TODT"	DATE		NULL,
	"BUSS_CMPLTDT"	DATE		NULL,
	"BUSS_ST"	VARCHAR2(10)	DEFAULT '진행중'	NOT NULL
);

COMMENT ON COLUMN "BUSINESS"."BUSS_IMP" IS 'HIGH,MID,LOW';

COMMENT ON COLUMN "BUSINESS"."BUSS_PRGRE" IS '0~100';

COMMENT ON COLUMN "BUSINESS"."BUSS_CMPLTDT" IS '진척도가 100이된 날짜';

COMMENT ON COLUMN "BUSINESS"."BUSS_ST" IS '진행중/완료/초과/초과완료';

CREATE TABLE "COMPANY" (
	"CO_CD"	VARCHAR2(24)		NOT NULL,
	"CO_NM"	VARCHAR2(100)		NOT NULL,
	"CO_RPSTR"	VARCHAR2(30)		NOT NULL,
	"CO_BIZNO"	VARCHAR2(13)		NOT NULL,
	"CO_DT"	DATE		NOT NULL
);

COMMENT ON COLUMN "COMPANY"."CO_CD" IS 'CPN001~';

CREATE TABLE "PROJECT" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"CO_NO"	VARCHAR2(24)		NOT NULL,
	"PRJT_NM"	VARCHAR2(100)		NULL,
	"PRJT_PUBCYN"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"PRJT_FDT"	DATE		NULL,
	"PRJT_TDT"	DATE		NULL,
	"PRJT_CMPLTDT"	DATE		NULL,
	"PRJT_ST"	VARCHAR2(6)		NULL
);

COMMENT ON COLUMN "PROJECT"."CO_NO" IS 'CPN001~';

COMMENT ON COLUMN "PROJECT"."PRJT_PUBCYN" IS 'Y/N';

COMMENT ON COLUMN "PROJECT"."PRJT_ST" IS '진행중/완료/보류';

CREATE TABLE "FILE" (
	"FILE_NO"	NUMBER(10)		NOT NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"BUSS_NO"	NUMBER(10)		NULL,
	"FILE_NM"	VARCHAR2(256)		NOT NULL,
	"FILE_PATH"	VARCHAR2(256)		NOT NULL,
	"FILE_TYPE"	VARCHAR2(24)		NULL,
	"FILE_DESCT"	VARCHAR2(512)		NULL,
	"FILE_DT"	DATE	DEFAULT SYSDATE	NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL
);

COMMENT ON COLUMN "FILE"."FILE_NM" IS '기존 파일명';

COMMENT ON COLUMN "FILE"."FILE_PATH" IS '경로+uuid파일명';

COMMENT ON COLUMN "FILE"."FILE_TYPE" IS '확장자명';

COMMENT ON COLUMN "FILE"."MEMB_ID" IS '회원아이디';

CREATE TABLE "BUSINESS_REPLY" (
	"REPLY_NO"	NUMBER(10)		NOT NULL,
	"BUSS_NO"	NUMBER(10)		NOT NULL,
	"REPLY_CNTN"	VARCHAR2(1000)		NULL,
	"REPLY_DT"	DATE	DEFAULT SYSDATE	NULL,
	"PUBCYN"	VARCHAR2(1)	DEFAULT 'Y'	NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"REPLY_UPNO"	NUMBER(10)		NULL
);

COMMENT ON COLUMN "BUSINESS_REPLY"."PUBCYN" IS 'Y/N';

COMMENT ON COLUMN "BUSINESS_REPLY"."MEMB_ID" IS '회원아이디';

CREATE TABLE "ISSUE" (
	"ISSU_NO"	NUMBER(10)		NOT NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"BUSS_NO"	NUMBER(10)		NULL,
	"MEMB_ID"	VARCHAR2(24)		NULL,
	"ISSU_TTL"	VARCHAR2(100)		NOT NULL,
	"ISSU_CNTN"	VARCHAR2(2048)		NULL,
	"ISSU_KND"	VARCHAR2(20)		NOT NULL,
	"ISSU_RANK"	VARCHAR2(20)		NOT NULL,
	"ISSU_ST"	VARCHAR2(20)	DEFAULT 'UNSOLVE'	NOT NULL,
	"ISSU_DT"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "ISSUE"."MEMB_ID" IS '회원아이디';

COMMENT ON COLUMN "ISSUE"."ISSU_KND" IS 'BUG, IMPR, FUNC, BUSS';

COMMENT ON COLUMN "ISSUE"."ISSU_RANK" IS '매우낮음, 낮음, 보통, 높음, 매우높음';

COMMENT ON COLUMN "ISSUE"."ISSU_ST" IS 'SOLVE/UNSOLVE/UNSOLVABLE';

CREATE TABLE "BUSINESS_MEMBER" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"BUSS_NO"	NUMBER(10)		NOT NULL
);

CREATE TABLE "PROJECT_HASHTAG" (
	"PRJT_HT_NO"	NUMBER(10)		NOT NULL,
	"PRJT_HT_NM"	VARCHAR2(100)		NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL
);

CREATE TABLE "PROJECT_FEEDBACK" (
	"PRJT_FDBK_NO"	NUMBER(10)		NOT NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"PRJT_FDBK_CNTN"	VARCHAR2(1024)		NOT NULL,
	"PRJT_FDBK_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "PROJECT_FEEDBACK"."MEMB_ID" IS '회원아이디';

CREATE TABLE "MEMBER_FEEDBACK" (
	"MEMB_FDBK_NO"	NUMBER(10)		NOT NULL,
	"MEMB_FDBK_WRITER"	VARCHAR2(24)		NOT NULL,
	"MEMB_FDBK_CNTN"	VARCHAR2(1024)		NOT NULL,
	"MEMB_FDBK_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMB_FDBK_OBJ"	VARCHAR2(24)		NOT NULL,
	"PRJT_NO"	NUMBER(10)		NOT NULL
);

CREATE TABLE "ISSUE_FILE" (
	"ISSU_FILE_NO"	NUMBER(10)		NOT NULL,
	"ISSU_FILE_NM"	VARCHAR2(256)		NOT NULL,
	"ISSU_FILE_PATH"	VARCHAR2(120)		NOT NULL,
	"ISSU_NO"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "ISSUE_FILE"."ISSU_FILE_NM" IS '기존파일명';

CREATE TABLE "QUESTION" (
	"QST_NO"	NUMBER(10)		NOT NULL,
	"QST_TTL"	VARCHAR2(256)		NOT NULL,
	"QST_CNTN"	VARCHAR2(1024)		NULL,
	"QST_DT"	DATE	DEFAULT SYSDATE	NULL,
	"QST_ST"	VARCHAR2(20)	DEFAULT 'N'	NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL
);

COMMENT ON COLUMN "QUESTION"."QST_ST" IS 'Y/N';

CREATE TABLE "LOG" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"LOG_JNO"	NUMBER(10)		NULL,
	"LOG_JCD"	VARCHAR2(20)		NULL,
	"LOG_DT"	DATE	DEFAULT SYSDATE	NULL,
	"MEMB_ID"	VARCHAR2(24)		NULL,
	"LOG_CNTN"	VARCHAR2(2048)		NULL
);

COMMENT ON COLUMN "LOG"."LOG_JNO" IS '이슈/파일/업무 번호(PK)';

COMMENT ON COLUMN "LOG"."LOG_DT" IS '분까지 표시';

CREATE TABLE "NOTIFICATION" (
	"NOTI_NO"	NUMBER(10)		NOT NULL,
	"MEMB_ID"	VARCHAR2(24)		NULL,
	"NOTI_MSG"	VARCHAR2(1000)		NULL,
	"NOTI_CONNO"	NUMBER(10)		NULL,
	"NOTI_DT"	DATE	DEFAULT SYSDATE	NULL,
	"NOTI_YN"	VARCHAR2(1)	DEFAULT 'N'	NULL,
	"NOTI_CD"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "NOTIFICATION"."NOTI_CONNO" IS '이슈/업무/프로젝트/피드백의 PK';

COMMENT ON COLUMN "NOTIFICATION"."NOTI_DT" IS '해당 날짜에 알림 전송, 분까지 표시';

COMMENT ON COLUMN "NOTIFICATION"."NOTI_YN" IS 'Y/N';

COMMENT ON COLUMN "NOTIFICATION"."NOTI_CD" IS '알림 종류';

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER(10)		NOT NULL,
	"FAQ_TTL"	VARCHAR2(256)		NOT NULL,
	"FAQ_CNTN"	VARCHAR2(1024)		NULL
);

CREATE TABLE "NOTICE" (
	"NOTI_NO"	NUMBER(10)		NOT NULL,
	"NOTI_TTL"	VARCHAR2(256)		NOT NULL,
	"NOTI_CNTN"	VARCHAR2(1024)		NULL,
	"NOTI_DT"	DATE	DEFAULT SYSDATE	NULL,
	"NOTI_INQ"	NUMBER	DEFAULT 0	NULL
);

CREATE TABLE "ISSUE_REPLY" (
	"ISSU_RPLY_NO"	NUMBER(10)		NOT NULL,
	"ISSU_NO"	NUMBER(10)		NOT NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"ISSU_RPLY_CNTN"	VARCHAR2(2048)		NULL,
	"ISSU_RPLY_DT"	DATE	DEFAULT SYSDATE	NULL
);

CREATE TABLE "QUESTION_FILE" (
	"QST_FILE_NO"	NUMBER(10)		NOT NULL,
	"QST_FILE_NM"	VARCHAR2(256)		NOT NULL,
	"QST_FILE_PATH"	VARCHAR2(1024)		NOT NULL,
	"QST_CD"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "QUESTION_FILE"."QST_FILE_NM" IS '기존파일명';

CREATE TABLE "PERMISSION" (
	"PERM_NO"	NUMBER(1)		NOT NULL,
	"PERM_NM"	VARCHAR2(20)		NOT NULL,
	"PERM_DESCT"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "PERMISSION"."PERM_NO" IS '1,2,3,4';

COMMENT ON COLUMN "PERMISSION"."PERM_NM" IS 'master, company, admin,user';

COMMENT ON COLUMN "PERMISSION"."PERM_DESCT" IS '마스터관리자, 회사관리자, 부관리자, 일반사원';

CREATE TABLE "QUESTION_REPLY" (
	"QST_NO"	NUMBER(10)		NOT NULL,
	"QST_RPLY"	VARCHAR2(1024)		NULL
);

CREATE TABLE "ISSUE_REPLY_FILE" (
	"ISSU_REPLY_FILE_NO"	NUMBER(10)		NOT NULL,
	"ISSU_RPLY_FILE_NM"	VARCHAR2(256)		NOT NULL,
	"ISSU_RPLY_FILE_PATH"	VARCHAR2(256)		NOT NULL,
	"ISSU_RPLY_NO"	NUMBER(10)		NOT NULL
);

COMMENT ON COLUMN "ISSUE_REPLY_FILE"."ISSU_RPLY_FILE_NM" IS '기존파일명';

CREATE TABLE "ISSUE_HASHTAG" (
	"ISSU_HT_NO"	NUMBER(10)		NOT NULL,
	"ISSU_NO"	NUMBER(10)		NOT NULL,
	"ISSU_HT_NM"	VARCHAR2(100)		NULL
);

CREATE TABLE "COMPANY_STATUS" (
	"CO_STAT_DT"	DATE		NOT NULL,
	"CO_CD"	VARCHAR2(24)		NOT NULL,
	"MM_BUSS_CMPL_CNT"	NUMBER		NULL,
	"MM_BUSS_UNCMPL_CNT"	NUMBER		NULL,
	"MM_BUSS_EXCECMPL_CNT"	NUMBER		NULL,
	"MM_ISSU_SOLVE_CNT"	NUMBER		NULL,
	"MM_ISSU_UNSOLVE_CNT"	NUMBER		NULL,
	"MM_ISSU_UNSOLVABLE_CNT"	NUMBER		NULL,
	"MM_BUSS_CMPL_RATE"	NUMBER		NULL,
	"MM_BUSS_UNCMPL_RATE"	NUMBER		NULL,
	"MM_BUSS_EXCECMPL_RATE"	NUMBER		NULL,
	"MM_ISSU_SOLVE_RATE"	NUMBER		NULL,
	"MM_ISSU_UNSOLVE_RATE"	NUMBER		NULL,
	"MM_ISSU_UNSOLVABLE_RATE"	NUMBER		NULL
);

COMMENT ON COLUMN "COMPANY_STATUS"."CO_STAT_DT" IS '월 단위';

CREATE TABLE "PROJECT_STATUS" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"BUSS_CMPL_CNT"	NUMBER		NULL,
	"BUSS_UNCMPL_CNT"	NUMBER		NULL,
	"BUSS_EXCE_CNT"	NUMBER		NULL,
	"ISSU_SOLVE_CNT"	NUMBER		NULL,
	"ISSU_UNSOLVE_CNT"	NUMBER		NULL,
	"ISSU_UNSOLVABLE_CNT"	NUMBER		NULL,
	"BUSS_CMPL_RATE"	NUMBER		NULL,
	"BUSS_UNCMPL_RATE"	NUMBER		NULL,
	"BUSS_EXCE_RATE"	NUMBER		NULL,
	"ISSU_SOLVE_RATE"	NUMBER		NULL,
	"ISSU_UNSOLVE_RATE"	NUMBER		NULL,
	"ISSU_UNSOLVABLE_RATE"	NUMBER		NULL
);

CREATE TABLE "COMPANY_STATUS_INFO" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"CO_STAT_DT"	DATE		NOT NULL,
	"CO_CD"	VARCHAR2(24)		NOT NULL
);

COMMENT ON COLUMN "COMPANY_STATUS_INFO"."CO_STAT_DT" IS '월 단위';

CREATE TABLE "PROJECT_MEMBER" (
	"PRJT_NO"	NUMBER(10)		NOT NULL,
	"MEMB_ID"	VARCHAR2(24)		NOT NULL,
	"PRJT_MEMB_PERM"	VARCHAR2(20)		NULL,
	"PRJT_FAV"	VARCHAR2(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "PROJECT_MEMBER"."PRJT_MEMB_PERM" IS 'PARTICIR,CRTR';

COMMENT ON COLUMN "PROJECT_MEMBER"."PRJT_FAV" IS 'Y/N';

CREATE TABLE "MEMBER_FEEDBACK_VIEW" (
	"PRJT_NO"	NUMBER(10)		NULL,
	"MEMB_ID"	VARCHAR2(24)		NULL,
	"MEMB_CMPL_BUSS_CNT"	NUMBER		NULL,
	"MEMB_UNCMPL_BUSS_CNT"	NUMBER		NULL,
	"MEMB_EXCE_BUSS_CNT"	NUMBER		NULL
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMB_ID"
);

ALTER TABLE "BUSINESS" ADD CONSTRAINT "PK_BUSINESS" PRIMARY KEY (
	"BUSS_NO"
);

ALTER TABLE "COMPANY" ADD CONSTRAINT "PK_COMPANY" PRIMARY KEY (
	"CO_CD"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "PK_PROJECT" PRIMARY KEY (
	"PRJT_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "PK_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "BUSINESS_REPLY" ADD CONSTRAINT "PK_BUSINESS_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "ISSUE" ADD CONSTRAINT "PK_ISSUE" PRIMARY KEY (
	"ISSU_NO"
);

ALTER TABLE "BUSINESS_MEMBER" ADD CONSTRAINT "PK_BUSINESS_MEMBER" PRIMARY KEY (
	"PRJT_NO",
	"MEMB_ID",
	"BUSS_NO"
);

ALTER TABLE "PROJECT_HASHTAG" ADD CONSTRAINT "PK_PROJECT_HASHTAG" PRIMARY KEY (
	"PRJT_HT_NO"
);

ALTER TABLE "PROJECT_FEEDBACK" ADD CONSTRAINT "PK_PROJECT_FEEDBACK" PRIMARY KEY (
	"PRJT_FDBK_NO"
);

ALTER TABLE "MEMBER_FEEDBACK" ADD CONSTRAINT "PK_MEMBER_FEEDBACK" PRIMARY KEY (
	"MEMB_FDBK_NO"
);

ALTER TABLE "ISSUE_FILE" ADD CONSTRAINT "PK_ISSUE_FILE" PRIMARY KEY (
	"ISSU_FILE_NO"
);

ALTER TABLE "QUESTION" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY (
	"QST_NO"
);

ALTER TABLE "NOTIFICATION" ADD CONSTRAINT "PK_NOTIFICATION" PRIMARY KEY (
	"NOTI_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTI_NO"
);

ALTER TABLE "ISSUE_REPLY" ADD CONSTRAINT "PK_ISSUE_REPLY" PRIMARY KEY (
	"ISSU_RPLY_NO"
);

ALTER TABLE "QUESTION_FILE" ADD CONSTRAINT "PK_QUESTION_FILE" PRIMARY KEY (
	"QST_FILE_NO"
);

ALTER TABLE "PERMISSION" ADD CONSTRAINT "PK_PERMISSION" PRIMARY KEY (
	"PERM_NO"
);

ALTER TABLE "QUESTION_REPLY" ADD CONSTRAINT "PK_QUESTION_REPLY" PRIMARY KEY (
	"QST_NO"
);

ALTER TABLE "ISSUE_REPLY_FILE" ADD CONSTRAINT "PK_ISSUE_REPLY_FILE" PRIMARY KEY (
	"ISSU_REPLY_FILE_NO"
);

ALTER TABLE "ISSUE_HASHTAG" ADD CONSTRAINT "PK_ISSUE_HASHTAG" PRIMARY KEY (
	"ISSU_HT_NO"
);

ALTER TABLE "COMPANY_STATUS" ADD CONSTRAINT "PK_COMPANY_STATUS" PRIMARY KEY (
	"CO_STAT_DT",
	"CO_CD"
);

ALTER TABLE "PROJECT_STATUS" ADD CONSTRAINT "PK_PROJECT_STATUS" PRIMARY KEY (
	"PRJT_NO"
);

ALTER TABLE "COMPANY_STATUS_INFO" ADD CONSTRAINT "PK_COMPANY_STATUS_INFO" PRIMARY KEY (
	"PRJT_NO",
	"CO_STAT_DT",
	"CO_CD"
);

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "PK_PROJECT_MEMBER" PRIMARY KEY (
	"PRJT_NO",
	"MEMB_ID"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_COMPANY_TO_MEMBER_1" FOREIGN KEY (
	"CO_CD"
)
REFERENCES "COMPANY" (
	"CO_CD"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_PERMISSION_TO_MEMBER_1" FOREIGN KEY (
	"PERM_NO"
)
REFERENCES "PERMISSION" (
	"PERM_NO"
);

ALTER TABLE "BUSINESS" ADD CONSTRAINT "FK_PROJECT_TO_BUSINESS_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "PROJECT" ADD CONSTRAINT "FK_COMPANY_TO_PROJECT_1" FOREIGN KEY (
	"CO_NO"
)
REFERENCES "COMPANY" (
	"CO_CD"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_PROJECT_TO_FILE_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "FILE" ADD CONSTRAINT "FK_BUSINESS_TO_FILE_1" FOREIGN KEY (
	"BUSS_NO"
)
REFERENCES "BUSINESS" (
	"BUSS_NO"
);

ALTER TABLE "BUSINESS_REPLY" ADD CONSTRAINT "FK_BUSINESS_TO_BUSINESS_REPLY_1" FOREIGN KEY (
	"BUSS_NO"
)
REFERENCES "BUSINESS" (
	"BUSS_NO"
);

ALTER TABLE "ISSUE" ADD CONSTRAINT "FK_PROJECT_TO_ISSUE_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "ISSUE" ADD CONSTRAINT "FK_BUSINESS_TO_ISSUE_1" FOREIGN KEY (
	"BUSS_NO"
)
REFERENCES "BUSINESS" (
	"BUSS_NO"
);

ALTER TABLE "BUSINESS_MEMBER" ADD CONSTRAINT "FK_PROJECT_MEMBER_TO_BUSINESS_MEMBER_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT_MEMBER" (
	"PRJT_NO"
);

ALTER TABLE "BUSINESS_MEMBER" ADD CONSTRAINT "FK_PROJECT_MEMBER_TO_BUSINESS_MEMBER_2" FOREIGN KEY (
	"MEMB_ID"
)
REFERENCES "PROJECT_MEMBER" (
	"MEMB_ID"
);

ALTER TABLE "BUSINESS_MEMBER" ADD CONSTRAINT "FK_BUSINESS_TO_BUSINESS_MEMBER_1" FOREIGN KEY (
	"BUSS_NO"
)
REFERENCES "BUSINESS" (
	"BUSS_NO"
);

ALTER TABLE "PROJECT_HASHTAG" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_HASHTAG_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "PROJECT_FEEDBACK" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_FEEDBACK_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "MEMBER_FEEDBACK" ADD CONSTRAINT "FK_PROJECT_TO_MEMBER_FEEDBACK_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "ISSUE_FILE" ADD CONSTRAINT "FK_ISSUE_TO_ISSUE_FILE_1" FOREIGN KEY (
	"ISSU_NO"
)
REFERENCES "ISSUE" (
	"ISSU_NO"
);

ALTER TABLE "LOG" ADD CONSTRAINT "FK_PROJECT_TO_LOG_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "ISSUE_REPLY" ADD CONSTRAINT "FK_ISSUE_TO_ISSUE_REPLY_1" FOREIGN KEY (
	"ISSU_NO"
)
REFERENCES "ISSUE" (
	"ISSU_NO"
);

ALTER TABLE "QUESTION_FILE" ADD CONSTRAINT "FK_QUESTION_TO_QUESTION_FILE_1" FOREIGN KEY (
	"QST_CD"
)
REFERENCES "QUESTION" (
	"QST_NO"
);

ALTER TABLE "QUESTION_REPLY" ADD CONSTRAINT "FK_QUESTION_TO_QUESTION_REPLY_1" FOREIGN KEY (
	"QST_NO"
)
REFERENCES "QUESTION" (
	"QST_NO"
);

ALTER TABLE "ISSUE_REPLY_FILE" ADD CONSTRAINT "FK_ISSUE_REPLY_TO_ISSUE_REPLY_FILE_1" FOREIGN KEY (
	"ISSU_RPLY_NO"
)
REFERENCES "ISSUE_REPLY" (
	"ISSU_RPLY_NO"
);

ALTER TABLE "ISSUE_HASHTAG" ADD CONSTRAINT "FK_ISSUE_TO_ISSUE_HASHTAG_1" FOREIGN KEY (
	"ISSU_NO"
)
REFERENCES "ISSUE" (
	"ISSU_NO"
);

ALTER TABLE "COMPANY_STATUS" ADD CONSTRAINT "FK_COMPANY_TO_COMPANY_STATUS_1" FOREIGN KEY (
	"CO_CD"
)
REFERENCES "COMPANY" (
	"CO_CD"
);

ALTER TABLE "PROJECT_STATUS" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_STATUS_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "COMPANY_STATUS_INFO" ADD CONSTRAINT "FK_PROJECT_STATUS_TO_COMPANY_STATUS_INFO_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT_STATUS" (
	"PRJT_NO"
);

ALTER TABLE "COMPANY_STATUS_INFO" ADD CONSTRAINT "FK_COMPANY_STATUS_TO_COMPANY_STATUS_INFO_1" FOREIGN KEY (
	"CO_STAT_DT"
)
REFERENCES "COMPANY_STATUS" (
	"CO_STAT_DT"
);

ALTER TABLE "COMPANY_STATUS_INFO" ADD CONSTRAINT "FK_COMPANY_STATUS_TO_COMPANY_STATUS_INFO_2" FOREIGN KEY (
	"CO_CD"
)
REFERENCES "COMPANY_STATUS" (
	"CO_CD"
);

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_PROJECT_TO_PROJECT_MEMBER_1" FOREIGN KEY (
	"PRJT_NO"
)
REFERENCES "PROJECT" (
	"PRJT_NO"
);

ALTER TABLE "PROJECT_MEMBER" ADD CONSTRAINT "FK_MEMBER_TO_PROJECT_MEMBER_1" FOREIGN KEY (
	"MEMB_ID"
)
REFERENCES "MEMBER" (
	"MEMB_ID"
);

