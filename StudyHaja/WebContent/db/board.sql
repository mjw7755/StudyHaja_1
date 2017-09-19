drop table board;

-- 1. �뀒�씠釉� �깮�꽦
create table Board (
	num number(7) not null,				-- �궡遺��쟻�쑝濡� 泥섎━�맆 湲�踰덊샇 
	writer varchar2(20) not null,		--�옉�꽦�옄
	email varchar2(30) ,					-- 硫붿씪
	subject varchar2(50) not null,		 -- �젣紐�
	passwd varchar2(12) not null,   	 -- 鍮꾨�踰덊샇
	reg_date  date not null, 				 -- 湲��벖 �궇吏�   
	readcount   number(3) default 0,	  -- 議고쉶�닔
	ref  number  not null, 					-- 洹몃９( 湲��뿉 ���븳...)
	re_step number not null,					-- 洹몃９ �뒪�뀦
	re_level  number not null,				-- 洹몃９ �젅踰�
	content  nvarchar2(2000) not null,	-- 湲��궡�슜
	ip varchar2(20)  not null,   				--湲� �벖 怨녹쓽 �븘�씠�뵾
	constraint  board_num_pk  primary key(num)
	
) SEGMENT creation IMMEDIATE ;

-- 2. sequence �깮�꽦
create sequence board_num;		-- �옄�룞 利앷� 踰덊샇

select max(num) from board;

select * from board;

insert into board(num, writer, subject, email, content, passwd, reg_date, ref, re_step, re_level, ip) 
		values(board_num.nextval, 'b', 'b', 'b', 'b', 'b', '2016-03-21', 1, 1, 1, 1);
		
		
select count(*) from board;


select rownum, num, writer, ref from (select num, writer, ref from BOARD order by ref desc) where writer='a';


select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, r  
	from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount, rownum r 
		from(select num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip, readcount 
			from board order by ref desc, re_step asc) order by ref desc, re_step asc, re_level asc, reg_date asc) where r>=1 and r<=50;

select * from board;
delete from board;

UPDATE BOARD SET RE_STEP = RE_STEP + 1, RE_LEVEL = RE_LEVEL + 1 WHERE ref=1;

SELECT MAX(RE_STEP) FROM BOARD where ref = 83 and re_level = 1