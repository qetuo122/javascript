create table emp01
select * from emp;
CREATE TABLE schedule(
	NO NUMBER,
	refno NUMBER,
	content varchar2(500),
	fromDate DATE,
	toDate DATE,
	manager varchar2(500)
);
CREATE SEQUENCE sch_seq
	MINVALUE 1
	MAXVALUE 999999
	INCREMENT BY 1
	START WITH 1
	cache 20
	nocycle;
CREATE TABLE hiretab(
	NO NUMBER,
	refno NUMBER,
	show varchar2(500)
);
CREATE SEQUENCE hire_seq
	MINVALUE 1
	MAXVALUE 999999
	INCREMENT BY 1
	START WITH 1
	cache 20
	nocycle;
  CREATE TABLE CALENDAR 
   (	ID NUMBER, 
	TITLE VARCHAR2(100), 
	BEGIN VARCHAR2(100), 
	END VARCHAR2(100), 
	URL VARCHAR2(500), 
	CONTENT VARCHAR2(1000)
   );
CREATE SEQUENCE cal_seq
	MINVALUE 1
	MAXVALUE 999999
	INCREMENT BY 1
	START WITH 1
	cache 20
	nocycle;
  CREATE TABLE CHATT 
   (	CHATID NUMBER, 
	NAME VARCHAR2(30), 
	ISLOGIN VARCHAR2(1), 
	CHGROUP VARCHAR2(50)
   );	
	
	