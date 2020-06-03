
/* Drop Tables */
drop sequence web_seq;
DROp TABLE Web CASCADE CONSTRAINTS;


CREATE TABLE Web(
	pid number NOT NULL,
	pname varchar2(200) NOT NULL,
	pprice number DEFAULT 0 NOT NULL,
	ppurchasecnt number NOT NULL,
	pbrand varchar2(200),
	pimage clob,
	pcode number NOT NULL UNIQUE,
	pRIMARY KEY (pid)
);

SELECT * FROM Web;

CREATE SEQUENCE web_seq;

SELECT * FROM seq WHERE sequence_name = 'WEB_SEQ';

INSERT
	INTO
	Web (pid, pname, pprice, ppurchasecnt, pbrand, pimage, pcode)
VALUES (web_seq.nextval, '윤주네 가죽소파', 290000, 0 , '도두리 가구', 
'https://shopping-phinf.pstatic.net/main_1699083/16990834763.20191016111147.jpg'
,103);



SELECT * FROM test_write ORDER BY wr_uid DESC;
INSERT INTO Web(wr_uid, wr_subject, wr_content, wr_name)
	SELECT test_write_seq.nextVal, wr_subject, wr_content, wr_name FROM test_write;

ALTER TABLE Web DROp COLUMN ppurchasecnt;

COMMIT;

SELECT * FROM Web;
/*
ALTER TABLE webtest
ADD (   
	ppurchasecnt NUMBER
       );

SELECT * FROM webtest;	


--������
CREATE SEQUENCE WEBTEST;


--�ٷ��� ������ �ʿ�
SELECT * FROM test_write ORDER BY wr_uid DESC;
INSERT INTO test_write(wr_uid, wr_subject, wr_content, wr_name)
	SELECT test_write_seq.nextVal, wr_subject, wr_content, wr_name FROM test_write;

*/