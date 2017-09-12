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

select * from study_members;

drop table study_info;
create sequence study_num;

select * from study_info;

select * from mvcnotice;

insert into mvcnotice values('�߰��޴�..','2017-09-09');
