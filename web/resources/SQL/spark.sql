create Table member(
EMAIL 		varchar2(20) primary key,
PASSWORD	varchar2(20) not null,
NAME		varchar2(20),
AGE			varchar2(20),
GENDER		varchar2(20)
);

create Table BOOKMARK(
BOOKMARK_EMAIL	varchar2(20),
BOOKMARK_NAME 	varchar2(50),
BOOKMARK_ADDR		varchar2(50),
BOOKMARK_TEL		varchar2(20)
);

create table SPark(
	PARKING_CODE	 	varchar2(50),
	PARKING_NAME	 	varchar2(50),
	ADDR		 	varchar2(50),
	PARKING_TYPE	 	varchar2(50),
	PARKING_TYPE_NM 	varchar2(50),
	OPERATION_RULE	 	varchar2(50),
	OPERATION_RULE_NM 	varchar2(50),
	TEL		 	varchar2(50),
	CAPACITY	 	varchar2(50),
	CUR_PARKING	 	varchar2(50),
	PAY_YN	 		varchar2(50),
	PAY_NM	 		varchar2(50),
	NIGHT_FREE_OPEN	 	varchar2(50),
	NIGHT_FREE_OPEN_NM 	varchar2(50),
	WEEKDAY_BEGIN_TIME 	varchar2(50),
	WEEKDAY_END_TIME 	varchar2(50),
	WEEKEND_BEGIN_TIME 	varchar2(50),
	WEEKEND_END_TIME 	varchar2(50),
	HOLIDAY_BEGIN_TIME 	varchar2(50),
	HOLIDAY_END_TIME 	varchar2(50),
	SATURDAY_PAY_YN 	varchar2(50),
	SATURDAY_PAY_NM 	varchar2(50),
	HOLIDAY_PAY_YN	 	varchar2(50),
	HOLIDAY_PAY_NM	 	varchar2(50),
	FULLTIME_MONTHLY 	varchar2(50),
	RATES		 	varchar2(50),
	TIME_RATE	 	varchar2(50),
	ADD_RATES	 	varchar2(50),
	ADD_TIME_RATE	 	varchar2(50),
	DAY_MAXIMUM	 	varchar2(50),
	LAT		 	varchar2(50),
	LNG		 	varchar2(50)
);

select *from SPark;

drop table Spark;

insert into MEMBER values('asdf@asdf.com', 'asdf', 'username', '18','man');

select *from member;

select count(*) from member;

drop table MEMBER;

insert into BOOKMARK values('asdf@asdf.com', '영등포로터리(시)', '영등포구 영등포동3가 111-1', '032-872-7078');
insert into BOOKMARK values('asdf@asdf.com', '동호대교(남)(시)', '강남구 압구정동 435-0', '02-445-0501');
insert into BOOKMARK values('asdf@asdf.com', '세종로주차장(시)', '종로구 세종로 80-1', '02-2290-6566');
insert into BOOKMARK values('asdf@asdf.com', '서인사마당공영(구)', '종로구 견지동 85-18', '02-2236-0052');

select * from bookmark;

delete from BOOKMARK where BOOKMARK_EMAIL='asdf@asdf.com';

drop table BOOKMARK;

commit;

select PARKING_NAME, ADDR, TEL FROM Spark where PARKING_CODE = '1540479';

select * from SPark;

SELECT * FROM BOOKMARK WHERE BOOKMARK_EMAIL='asdf@asdf.com' and BOOKMARK_NAME = '세종로주차장(시)';

