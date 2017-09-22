create table study_members(
   name varchar2(30) not null,
   id varchar2(20) not null primary key,
   passwd varchar2(12) not null,
   birth varchar2(6) not null,
  
   tel varchar2(15) not null,
   email varchar2(30),
   addr1 varchar2(30),
   addr2 varchar2(30),
   flag number(2) not null,
);

create table studymember(
   num number not null,
   name varchar2(30) not null,
   id varchar2(20) not null,
   passwd varchar2(12) not null,
   email varchar2(30) not null,
   sex varchar2(7) not null,
   hp varchar2(100) not null,-- 010 
   addr1 varchar2(100) not null, -- 도/시/동
   addr2 varchar2(100) not null, -- 상세 주소
   flag number(2) not null,
   reg_date date not null, -- 생성날짜
   constraint studymember_id_pk primary key(id)
)segment creation immediate;

create sequence Studymember_num;
desc Studymember;
drop table Studymember;
drop sequence Studymember_num;

select * from Studymember;
drop sequence room_num;
create sequence room_num;


insert into board(num, writer, subject, email, content, passwd, reg_date, ref, re_step, re_level, ip) 
		values(board_num.nextval, 'b', 'b', 'b', 'b', 'b', '2016-03-21', 1, 1, 1, 1);
		
insert into room(num, subject, area, location, pay) values(room_num.nextval, 'b', 'b', 'b', 'b');

update room set num=1;

insert into room (num, subject, area, location, pay, readcount) values (1, '스터디카페', '부산', '부산역앞', '2300원', '2')