create table study_info (
	num number(7) not null,		-- ���������� ó���� �۹�ȣ 
	subject varchar2(100) not null,		--����
	kind1 varchar2(30) not null,			-- �з�1
	kind2 varchar2(50) not null,		 -- �з�2
	s_date date not null,   	 -- ���۳�¥
	e_date  date not null, 		 -- ����¥   
	readcount   number(3) default 0,	  -- ��ȸ��
	day varchar2(50) not null, --����
	place1 varchar2(50) not null, --���1
	place2 varchar2(50) not null, --���2
	place3 varchar2(50) not null, --���3
	people number not null, --�ο� 
	content nvarchar2(2000) not null, --����
	ip varchar2(20)  not null,  --�� �� ���� ������
	reg_date date not null,
	s_hour varchar2(20) not null,
	s_minute varchar2(20) not null,
	e_hour varchar2(20) not null,
	e_minute varchar2(20) not null,
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

SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE (select id from study_members) = 'aa';

select * from study_members;
SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE CONTENT='하하하하';
drop table study_info;
rollback

SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE subject = '토익';
SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE '%subject%' LIKE '%토익%';

create sequence study_num;
SELECT NUM,KIND2,SUBJECT,REG_DATE,READCOUNT FROM STUDY_INFO WHERE ? = ?;
SUBJECT LIKE  and COLUMN_NAME=
select * from study_info;

alter table study_info add(format_time varchar2(10));

select * from mvcnotice;
select count(*) from study_info;
select subject,kind2,s_date,e_date,day,s_hour,s_minute,e_hour,e_minute,place1,place2,place3,people,content from study_info where num = 47;
insert into mvcnotice values('�߰��޴�..','2017-09-09');
