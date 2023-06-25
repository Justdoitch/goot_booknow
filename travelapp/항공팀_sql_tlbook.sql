--0625 항공팀 테이블생성

--지혁 입력

-- 항공_예약 테이블
CREATE TABLE tlbook.TBL_AIR_RESERVATIONS ( 
airResno NUMBER(10,0) CONSTRAINT PK_AIRRESNO_AIRRESERVATIONS PRIMARY KEY,
airRouteno NUMBER(10,0),
airLineId VARCHAR2(3),
airSellno NUMBER(10,0),
airClass VARCHAR2(10) DEFAULT 'E'
) TABLESPACE USERS;

-- 항공_첨부파일 테이블
CREATE TABLE tlbook.TBL_AIR_ATTACHMENTS ( 
airUuid VARCHAR2(50) CONSTRAINT PK_AIRUUID_ATTACH PRIMARY KEY,
airLineId NUMBER(10),
airUploadPath VARCHAR2(250) NOT NULL,
airFileName VARCHAR2(50) NOT NULL,
airFileType VARCHAR2(1) DEFAULT 'F'
) TABLESPACE USERS;

-- 항공_탑승객 테이블
CREATE TABLE TBL_AIR_PASSENGERS (
airPasno NUMBER(10,0) CONSTRAINT PK_AIRPASNO_AIRPASSENGERS PRIMARY KEY,
airResno NUMBER(10,0),
airPasName VARCHAR2(10) NOT NULL,
airPasGender VARCHAR2(10) NOT NULL,
airPasBdate DATE NOT NULL,
airPasNation VARCHAR2(10) DEFAULT 'KOR',
airDiscntRate NUMBER(1) DEFAULT 0
) TABLESPACE USERS;


-- 동현 입력

--항공 예약옵션 테이블 생성
CREATE TABLE TLBOOK.tbl_air_Reservation_option(
airResno number(10,0),
optWheelFlag number(1,0) DEFAULT 0,
optPetFlag number(1,0) DEFAULT 0,
optRugFlag number(1,0) DEFAULT 0
)TABLESPACE users ;

--항공 예약옵션 테이블 : 기본키 제약조건 추가
ALTER TABLE TLBOOK.tbl_air_Reservation_option
ADD CONSTRAINT pk_airResno_air_Reservation_option PRIMARY KEY(airResno);

--항공사 테이블 생성
CREATE TABLE TLBOOK.tbl_airLine(
airLineId VARCHAR2(3),
airLineNm VARCHAR2(25) NOT NULL,
airLineRegno VARCHAR2(15) NOT NULL,
airLinePersonNm VARCHAR2(25) NOT NULL,
airLinePersonNumber NUMBER(15) NOT NULL,
airLinePersonEmail VARCHAR2(30) NOT NULL
)TABLESPACE users ;

--항공 테이블 : 기본키 제약조건 추가
ALTER TABLE TLBOOK.tbl_airLine
ADD CONSTRAINT PK_airLineId_airLine PRIMARY KEY(airLineId);

--항공사 노선구매 테이블 생성
CREATE TABLE TLBOOK.tbl_air_Route_Buy(
airBuyno number(10,0),
airRouteno number(10,0),
airRouteBuyPrice number(10,0) NOT NULL,
airBuyDate Timestamp(0) DEFAULT systimestamp(0)
)TABLESPACE users ;

--항공사 노선구매 테이블 : 기본키 제약조건 추가
ALTER TABLE TLBOOK.tbl_air_Route_Buy
ADD CONSTRAINT PK_airBuyno_routeBuy PRIMARY KEY(airBuyno);

--항공사 노선판매 테이블 생성
CREATE TABLE TLBOOK.tbl_air_Route_Sell(
airSellno number(10,0),
userId VARCHAR2(25),
airSellDate Timestamp(0) DEFAULT systimestamp(0),
airSellStatus varchar2(20) DEFAULT '판매완료'
)TABLESPACE users ;

--항공사 노선판매 테이블 : 기본키 제약조건 추가
ALTER TABLE TLBOOK.tbl_air_Route_Sell
ADD CONSTRAINT PK_airSellno_airRouteSell PRIMARY KEY(airSellno);


-- 효준 입력

--항공_노선 테이블
CREATE TABLE tbl_air_route(
airRouteno NUMBER(10,0) CONSTRAINT PK_airRouteno_airRoute PRIMARY KEY ,
airLineId VARCHAR2(3),
depAirportNm VARCHAR2(25) NOT NULL,
arrAirportNm VARCHAR2(25) NOT NULL,
depPlandTime Timestamp(0) NOT NULL,
arrPlandTime Timestamp(0) NOT NULL,
economyCharge NUMBER(10,0) NOT NULL,
vihicleId VARCHAR2(10) NOT NULL,
seatCnt NUMBER(3,0) NOT NULL,
airModel VARCHAR2(10) NOT NULL
)TABLESPACE users;


-- --------------------------------------------------------

--QNA_첨부파일 테이블
CREATE TABLE tbl_QNA_Attfiles(
qaaUuid VARCHAR2(50) CONSTRAINT PK_qaaUuid_QNA_Attfiles PRIMARY KEY,
qaaUploadPath VARCHAR2(250) NOT NULL,
qaaFileName VARCHAR2(50) NOT NULL,
qaaFileType VARCHAR2(1) DEFAULT 'F',
qnaQno NUMBER(10)
)TABLESPACE users;


-- --------------------------------------------------------

CREATE TABLE tbl_QNA_Questions(
qnaQno number(10,0) CONSTRAINT PK_qnaQno_QNA_Questions PRIMARY KEY,
qnaQcategory VARCHAR2(200) NOT NULL,
qnaQtitle VARCHAR2(200) NOT NULL,
qnaQcontent VARCHAR2(2000) NOT NULL,
qnaQwriter VARCHAR2(50) NOT NULL,
qnaQregDate DATE DEFAULT sysdate,
qnaQmodDate TIMESTAMP(0) DEFAULT systimestamp(0),
qnaQprocFlag NUMBER(1) DEFAULT 0
)TABLESPACE users;


-- --------------------------------------------------------

CREATE TABLE tbl_QNA_Answers(
qnaAno number(10,0) CONSTRAINT PK_qnaAno_QNA_Answers PRIMARY KEY,
qnaAregDate DATE DEFAULT sysdate,
qnaAmodDate TIMESTAMP(0) DEFAULT systimestamp(0),
qnaAcontent VARCHAR2(2000) NOT NULL,
qnaAwriter VARCHAR2(50) NOT NULL,
qnaQno number(10,0)
)TABLESPACE users;


