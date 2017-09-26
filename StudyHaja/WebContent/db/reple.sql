create table Reply (
	num number(10) not null,
	reply_num number(10) not null,
	id varchar2(20) not null,
	content  nvarchar2(2000) not null,
	reg_date date,
	star number(10)
)SEGMENT creation IMMEDIATE;

drop sequence reply_num;
create sequence reply_num
start with 1
increment BY 1
maxvalue 999;


select * from Reply;

insert into Reply(id,content) values('mjw','하지마루욧');



delete from Reply;

drop table Reply;
