
--사업자테이블 
CREATE TABLE tlbook.tbl_business_users(
    busId varchar2(20), 
    busName varchar2(10),
    busRegNum varchar2(12) unique not null,
    busCertified number(1,0) default 0    
)tablespace users;

alter table tlbook.tbl_business_users
add constraint pk_busId_bus_users
primary key(busId);

--상세거래테이블 (tbl_ht_buy_transactions)
CREATE TABLE tlbook.tbl_ht_buy_transactions(
    htBuyTranId number(10,0),
    htBuyTranDate timestamp(0) default systimestamp(0),
    htBuyTranType varchar2(20),
    htBuyCost number(10,2) not null
)tablespace users;

alter table tlbook.tbl_ht_buy_transactions
add constraint pk_htBuyTranId_ht_buy_tran
primary key(htBuyTranId);


--숙소구입 맵핑 테이블 (tbl_ht_buy_mapping)
CREATE TABLE tlbook.tbl_ht_buy_mapping(
    htBuyTranId number(10,0),
    htRooBuyDateId number(10,0)
)tablespace users;

alter table tlbook.tbl_ht_buy_mapping
add constraint fk_htBuyTranId_buy_map foreign key(htBuyTranId)
references tlbook.tbl_ht_buy_transactions(htBuyTranId)
ON DELETE CASCADE;

alter table tlbook.tbl_ht_buy_mapping
add constraint fk_htRooBuyDateId_buy_map foreign key(htRooBuyDateId)
references tlbook.tbl_ht_room_buy_date(htRooBuyDateId)
ON DELETE CASCADE;

create index tlbook.idx_htBuyTranId_htRooBuyDateId
ON tlbook.tbl_ht_buy_mapping(htBuyTranId,htRooBuyDateId);

alter table tlbook.tbl_ht_buy_mapping
add constraint pk_BuyTranId_RooBuyDateId_map PRIMARY KEY(htBuyTranId,htRooBuyDateId)
USING INDEX tlbook.idx_htBuyTranId_htRooBuyDateId;

alter table tlbook.tbl_ht_buy_mapping
add constraint fk_BuyTranId_RooBuyDateId_map foreign key(htBuyTranId,htRooBuyDateId)
references tlbook.tbl_ht_buy_mapping (htBuyTranId,htRooBuyDateId)
ON DELETE CASCADE;





--숙소예약테이블 (tbl_ht_reservations )
CREATE TABLE tlbook.tbl_ht_reservations(
    htResNo number(10,0),
    htRooSellDateId number(10,0),
    htResName varchar2(30),
    htResStatus number(1,0),
    htResPeopleCount number(2,0),
    htResCheckIn timestamp(0) default systimestamp,
    htResCheckOut timestamp(0) default systimestamp,
    htResEmail varchar2(50) not null,
    htResPhone varchar2(15) not null
)tablespace users;

alter table tlbook.tbl_ht_reservations
add constraint pk_htResNo_ht_reserve
primary key(htResNo);


alter table tlbook.tbl_ht_reservations
add constraint fk_htRooSellDateId_ht_reserve
foreign key(htRooSellDateId) 
references tlbook.tbl_ht_room_sell_date(htRooSellDateId) ON DELETE CASCADE;



-- HT_REVIEWS 테이블 생성
CREATE TABLE TLBOOK.ht_reviews(
htRevNo NUMBER(10,0),
userid varchar2(30),
htRevStar NUMBER(1,0)   DEFAULT 0,
htRevLike NUMBER(10,0)   DEFAULT 0, 
htRevTitle VARCHAR2(200) NOT NULL, 
htRevContents VARCHAR2(2000)   NOT NULL,
htRevRegDate DATE   DEFAULT sysdate, 
htRevDelFlag NUMBER(1) DEFAULT 0, 
htNo NUMBER(10,0) 
) TABLESPACE users ;


ALTER TABLE TLBOOK.tbl_ht_reviews
ADD CONSTRAINT pk_htRevNo_reviews 
PRIMARY KEY (htRevNo) ;

ALTER TABLE ht_reviews 
ADD CONSTRAINT FK_userId_reviews 
FOREIGN KEY (userId)
REFERENCES tbl_users(userId) ON DELETE CASCADE ; 

ALTER TABLE ht_reviews
ADD CONSTRAINT FK_htNo_reviews
FOREIGN KEY (htNo)
REFERENCES tbl_hotels(htNo) ON DELETE CASCADE  ;


-- tbl_ht_room_attachFiles 테이블 생성 
create TABLE TLBOOK.tbl_ht_room_attachFiles(
uuid varchar2(300),
uploadPath varchar2(250) not null,
fileName varchar2(100) not null,
fileType char(1) default 'I',
htRooNo number(10,0)
) tablespace users;

alter table TLBOOK.tbl_ht_room_attachFiles
add CONSTRAINT pk_uuid_ht_attachFiles PRIMARY KEY(uuid);

alter table tlbook.tbl_ht_room_attachFiles
add constraint fk_htRooNo_ht_room_attach foreign key(htRooNo)
references tlbook.tbl_ht_rooms(htRooNo) on delete cascade;

-- tbl_ht_room_sell_date 테이블 생성 

create TABLE TLBOOK.tbl_ht_room_sell_date(
htRooSellDateId number(10,0),
htRooSellPrice number(10,2) not null,
htRooSellDate timestamp(0) default systimestamp(0),
htRooNo number(10,0)
) tablespace users;

alter table TLBOOK.tbl_ht_room_sell_date
add CONSTRAINT pk_htRooSellDateId_sell_date PRIMARY key(htRooSellDateId);

alter table tlbook.tbl_ht_room_sell_date
add constraint fk_htRooNo_sell_date foreign key(htRooNo)
references tlbook.tbl_ht_rooms(htRooNo) on delete cascade;

-- tbl_ht_room_buy_date 테이블 생성 
create table TLBOOK.tbl_ht_room_buy_date(
htRooBuyDateId number(10,0),
htRooBuyPrice number(10,2) not null,
htRooBuyDate timestamp(0) default systimestamp(0),
htRooNo number(10,0)
)tablespace users;

alter table TLBOOK.tbl_ht_room_buy_date
add ConstraInt pk_htRooBuyDateId_buy_date primary key(htRooBuyDateId);


alter table tlbook.tbl_ht_room_buy_date
add constraint fk_htRooNo_buy_date foreign key(htRooNo)
references tlbook.tbl_ht_rooms(htRooNo) on delete cascade;



--상세판테테이블 (tbl_ht_sell_transactions)
create table tlbook.tbl_ht_sell_transactions(
    htSellTranId number(10,0),
    userId VARCHAR2(30),
    htSellTranDate timestamp(0) default systimestamp(0),
    htSellTranPayment varchar2(20),
    htSellStatus varchar2(20) default '판매완료',
    htSellPrice number(10,2) 
)tablespace users;


alter table  tlbook.tbl_ht_sell_transactions
add constraint pk_sellTranId_ht_sell_tran primary key(htSellTranId);

alter table tlbook.tbl_ht_sell_transactions
add constraint fk_userId_ht_sell_tran foreign key(userId)
references tlbook.tbl_users(userId) on delete cascade;

--숙소판매 매핑테이블 (tbl_ht_sell_mapping) 
create table tlbook.tbl_ht_sell_mapping(
    htSellTranId number(10,0),
    htResNo number(10,0) 
)tablespace users;

alter table tlbook.tbl_ht_sell_mapping
add constraint fk_htSellTranId_sell_map foreign key(htSellTranId)
references tlbook.tbl_ht_sell_transactions(htSellTranId)
ON DELETE CASCADE;

alter table tlbook.tbl_ht_sell_mapping
add constraint fk_htResNo_sell_map foreign key(htResNo)
references tlbook.tbl_ht_sell_transactions(htSellTranId)
on delete cascade;

create index tlbook.idx_htSellTranId_htResNo
ON  tlbook.tbl_ht_sell_mapping(htSellTranId,htResNo);

alter table tlbook.tbl_ht_sell_mapping
add constraint pk_htSellTranId_htResNo_map primary key(htSellTranId,htResNo)
using index tlbook.idx_htSellTranId_htResNo;

alter table tlbook.tbl_ht_sell_mapping
add constraint fk_htSellTranId_htResNo_map foreign key(htSellTranId,htResNo)
references tlbook.tbl_ht_sell_mapping(htSellTranId,htResNo) 
on delete cascade;

--tbl_ht_rooms (방 테이블)


CREATE TABLE TLBOOK.tbl_ht_rooms (
htRooNo NUMBER(10,0),
htRooType VARCHAR2(50) NOT NULL,
htRooPrice NUMBER(10) NOT NULL,
htNo NUMBER (10,0) 
)TABLESPACE users;


-- 기본키 제약 조건 추가

ALTER TABLE TLBOOK.tbl_ht_rooms
ADD CONSTRAINT pk_htRooNo_ht_rooms PRIMARY KEY (htRooNo);

ALTER TABLE TLBOOK.tbl_ht_rooms
ADD CONSTRAINT fk_htNo_ht_rooms FOREIGN KEY(htNo)
REFERENCES TLBOOK.tbl_hotels(htNo) ON DELETE CASCADE;


--tbl_ht_attachFiles (숙소 첨부 파일)
CREATE TABLE TLBOOK.tbl_ht_attachFiles (
uuid VARCHAR2(300) NOT NULL,
uploadPath VARCHAR2(250) NOT NULL,
fileName VARCHAR2(100) NOT NULL,
fileType CHAR(1) DEFAULT 'I', 
htNo NUMBER (10,0) 
)TABLESPACE users;


ALTER TABLE TLBOOK.tbl_ht_attachFiles
ADD CONSTRAINT pk_uuid_ht_attachFiles PRIMARY KEY (uuid);

ALTER TABLE TLBOOK.tbl_ht_attachFiles
ADD CONSTRAINT fk_htNo_ht_attach FOREIGN KEY(htNo)
REFERENCES TLBOOK.tbl_hotels(htNo) ON DELETE CASCADE;


---tbl_hotels (숙소 테이블)
CREATE TABLE TLBOOK.tbl_hotels (
htNo NUMBER(10,0),
htName VARCHAR2(50) NOT NULL,
htRank NUMBER(1) DEFAULT 0,
htAddress VARCHAR2(100) NOT NULL,
htType VARCHAR2(50) NOT NULL,
htPhone VARCHAR2(10) NOT NULL,
htEmail VARCHAR2(50),
busId VARCHAR2(20),
htStartDate TIMESTAMP(0) DEFAULT SYSTIMESTAMP,
htEndDate TIMESTAMP(0) DEFAULT SYSTIMESTAMP
)TABLESPACE users;

ALTER TABLE TLBOOK.tbl_hotels
ADD CONSTRAINT pk_htNo_hotels PRIMARY KEY (htNo);

ALTER TABLE TLBOOK.tbl_hotels
ADD CONSTRAINT fk_busId_hotels FOREIGN KEY(busId)
REFERENCES TLBOOK.tbl_business_users(busId) ON DELETE CASCADE;






