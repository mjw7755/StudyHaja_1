create table Reply (
	id varchar2(20) not null,
	content  nvarchar2(2000) not null,
	reg_date date,
	star number(10)
)SEGMENT creation IMMEDIATE;

select * from Reply;

insert into Reply(id,content) values('mjw','하지마루욧');

create sequence reply_num;

delete from Reply;

drop table Reply;
