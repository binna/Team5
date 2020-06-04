
/* Drop Tables */
drop sequence ph_seq;
DROp TABLE Purchase CASCADE CONSTRAINTS;


CREATE TABLE Purchase(
	pcid number NOT NULL,
	pcuid varchar2(50) NOT NULL UNIQUE,
	ptotalprice NUMBER,
	pcregdate DATE NOT NULL,
	pcstatus number NOT NULL,
	pcaddress varchar2(50) NOT NULL,
	pcaddressnum number NOT NULL UNIQUE,
	pccontent varchar2(50),
	pccardnum NUMBER NOT NULL,
	pRIMARY KEY (pcid)
);

SELECT * FROM Purchase;

CREATE SEQUENCE ph_seq;

SELECT * FROM seq WHERE sequence_name = 'PH_SEQ';

INSERT INTO Web (pid, pname, pprice,ppurchasecnt, pbrand, pimage, pcode)
VALUES (ph_seq.nextval,'bb',100000,0
,'1000',
'https://adcr.naver.com/adcr?x=V0g0luMns1ZjdsDilE99x////w==kzJNdlHe+QpyoQk7OLCKgtyjF+jaGEWHUJEtHYxm7ErVLnxpM+tnD2ZTKylzWrpKdQTdAJ0HkDlFS6F3wKsTplL0Eit7htt4NqlOpriN3hJoUxplIqVTHNkucQN4qYUBA5CXBQ4Cqj1qoYFqXMM40jm7UOQGN88aGkU4KrhJCS7mkDihFTxoVVoELQG2U7M4T4FN81Xwm6h/pSKKisgIdhQ8jXCLXmhkwWLsbIxbF6NlCSrnOtDB1+CztoVSuepRKIuT2UKhFSVemxxK3RDnouJS/wYfD3xcYfqo2cAeSpGpWWDnJsMnL9bYGjOhTHHfN15ksYD2q/mEwfeJ9dXLppc9yxhsuXzi8s/owfs+8ef8NBKXa3WdfppDUU0TqUWbq2e+1rZ3CLxdcicGc89ZdCMhtg9fZnbAQ5rJhDRRyqX5AcSVCfSXZG8VgvUA/2ICBaWhzcydnFlOv6yj5qGtHI7rpM6pRwnmivgE8f9tfMp8DbddqrmGMWxWM5nCGM9ru/ikNO8bpVtyZUnmueM8jbopBqjzYKkj7oaEUWEpG6OSs3uHUrAoh0BwjO4uYrd1f2eWyBAY3mw4CTcEdA2BdnQuCQkeWORWMQDmj9Jm10oy04qj8puLG6dcqMTy8+UKf7GpFgyc13WWte3KahE/Lgtm06mL82epivqp6QMtgTrALzFOiJ5w73k31UgOwqt44dMFH4R2d50zg4FnAKppwJ6auurSRVspFVdbExpnAumy7zSHo7c0BLkMW7kh+Aa1RQm8xh8hLJBbQ+6WKkLXpAClHl7eciFsFsyApfep0H/72keQgK7Syd6dGCVoKQprG' ,
103);



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