create table study_info (
	num number(7) not null,		-- ���������� ó���� �۹�ȣ 
	subject varchar2(100) not null,		--����
	kind1 varchar2(30) not null,			-- �з�1
	kind2 varchar2(50) not null,		 -- �з�2
	s_date date not null,   	 -- ���۳�¥
	e_date  date not null, 		 -- ����¥   
	readcount   number(3) default 0,	  -- ��ȸ��
	day varchar2(50) not null, --����
	s_time varchar2(20) not null, --���� �ð�
	e_time varchar2(20) not null, --�� �ð�
	place1 varchar2(20) not null, --���1
	place2 varchar2(20) not null, --���2
	place3 varchar2(50) not null, --���3
	people number not null, --�ο� 
	content nvarchar2(2000) not null, --����
	ip varchar2(20)  not null,  --�� �� ���� ������
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

create table studyboard (
	num number(7) not null,
	id varchar2(20) ,
	title varchar2(30) not null,
	content varchar2(2000) not null,
	path varchar2(100),
	reg_date date not null,
	readcount number(7) not null,
	ref number not null,
	re_step number not null,
	re_level number not null,
	constraint  studyboard_num_pk  primary key(num)
)segment creation immediate;

insert into STUDYBOARD
values (studyboard_num.nextval, 'id', 'title', 'content', 'path', '2016-03-21'
, 1, 1, 1, 1);

insert into STUDYBOARD
values (studyboard_num.nextval, '', 'title', 'content', '', '2016-03-21'
, 1, 1, 1, 1);

delete from studyboard;

create sequence study_board_num;

drop sequence study_board_num;

drop table studyboard;


select * from study_members;

drop table study_info;
create sequence study_num;

select * from study_info;

select * from studyboard;