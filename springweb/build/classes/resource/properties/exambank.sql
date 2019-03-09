CREATE TABLE exambank(
	NO NUMBER PRIMARY KEY,
	extype VARCHAR2(3),
	content varchar2(1000),
	coranswer varchar2(500),
	credte DATE
);
CREATE SEQUENCE exambank_seq
	MINVALUE 1
	MAXVALUE 99999
	INCREMENT BY 1
	START WITH 1
	cache 20;

INSERT INTO exambank values(exambank_seq.nextval,'주','4 + 5','9',sysdate);
SELECT * FROM exambank;