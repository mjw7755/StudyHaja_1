create table study_info (
	num number(7) not null,		-- 내부적으로 처리될 글번호 
	subject varchar2(100) not null,		--제목
	kind1 varchar2(30) not null,			-- 분류1
	kind2 varchar2(50) not null,		 -- 분류2
	s_date date not null,   	 -- 시작날짜
	e_date  date not null, 		 -- 끝날짜   
	readcount   number(3) default 0,	  -- 조회수
	day varchar2(50) not null, --요일
	s_time varchar2(20) not null, --시작 시간
	e_time varchar2(20) not null, --끝 시간
	place1 varchar2(20) not null, --장소1
	place2 varchar2(20) not null, --장소2
	place3 varchar2(50) not null, --장소3
	people number not null, --인원 
	content nvarchar2(2000) not null, --내용
	ip varchar2(20)  not null,  --글 쓴 곳의 아이피
	constraint  study_num_pk  primary key(num)
	
)SEGMENT creation IMMEDIATE;

create table study_members(
	name varchar2(30) not null,
	id varchar2(20) not null primary key,
	passwd varchar2(12) not null,
	birth varchar2(6) not null,
	sex varchar2(7) not null,
	tel varchar2(15) not null,
	email varchar2(30),
	flag number(2) not null,
	reg_date date not null
)segment creation immediate;

select * from study_members;

drop table study_info;
create sequence study_num;

select * from study_info;