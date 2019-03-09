  CREATE TABLE CALENDAR 
   (	ID NUMBER, 
	TITLE VARCHAR2(100), 
	BEGIN VARCHAR2(100), 
	END VARCHAR2(100), 
	URL VARCHAR2(500), 
	CONTENT VARCHAR2(1000)
   );
CREATE SEQUENCE cal_seq
	MINVALUE 6
	MAXVALUE 999999
	INCREMENT BY 1
	START WITH 6
	cache 20
	nocycle;
	
INSERT INTO SCOTT.CALENDAR
(ID, TITLE, "BEGIN", "END", URL, CONTENT)
VALUES(1, '일정등록', '2019-03-05', '2019-03-06', NULL, '내용');
INSERT INTO SCOTT.CALENDAR
(ID, TITLE, "BEGIN", "END", URL, CONTENT)
VALUES(2, '등록연습', '2019-03-04', '2019-03-05', NULL, '등록111');
INSERT INTO SCOTT.CALENDAR
(ID, TITLE, "BEGIN", "END", URL, CONTENT)
VALUES(3, '일정등록합니다.', '2019-03-06', '2019-03-07', NULL, '내용');
INSERT INTO SCOTT.CALENDAR
(ID, TITLE, "BEGIN", "END", URL, CONTENT)
VALUES(4, '일정등록합니다.', '2019-03-20T07:00:00', '2019-03-20T09:30:00', NULL, '내용1');
INSERT INTO SCOTT.CALENDAR
(ID, TITLE, "BEGIN", "END", URL, CONTENT)
VALUES(5, '일정등록(변경)', '2019-03-07T07:30:00', '2019-03-08T09:00:00', NULL, '내용2');
	