CREATE TABLE Member
(
	id varchar2(20) NOT NULL PRIMARY KEY UNIQUE,
	pw varchar2(20) NOT NULL,
	name varchar2(20) NOT NULL,
	 
);


SELECT * FROM mEMBER


INSERT INTO "MEMBER" VALUES ('aaaa','12334','홍길동')


DROP TABLE "MEMBER" 

CREATE TABLE "MEMBER" 
(
	-- 사용자 아이디입니다.
	id varchar2(20) NOT NULL UNIQUE,
	pw varchar2(20) NOT NULL,
	-- 사용자이름
	name varchar2(10) NOT NULL,
	-- 0 : 남자
	-- 1 : 여자 
	gender number DEFAULT 0 NOT NULL,
	tel varchar2(11) NOT NULL,
	email varchar2(20) NOT NULL,
	-- 0 : 활성화 
	-- 1 : 비활성화 (탈퇴) 
	state number DEFAULT 0 NOT NULL,
	-- 0 : 회원
	-- 1 : 관리자 
	super number NOT NULL,
	address varchar2(100) NOT NULL,
	zipcode number NOT NULL,
	-- 사용자 주민번호
	jumin number NOT NULL,
	-- 관리자 
	passchangeDate date NOT NULL,
	-- 관리자
	moditime date NOT NULL,
	image varchar2(200),
	nickname varchar2(10) NOT NULL,
	-- 관리자페이지에서 필요
	regdate date,
	-- 관리자페이지에서 필요
	logtime date,
	-- 1,2,3 (필수 약관들)
	-- 4.(선택)
	-- 
	yaggwan number NOT NULL,
	-- 0 이용빈도 낮음
	-- 1 재가입
	-- 2 개인정보 보호
	-- 3 회원특혜/ 쇼핑혜택부족
	-- 4 콘텐츠/제품정보/상품 부족
	-- 5 기타
	taltoe number NOT NULL,
	-- 탈퇴 사유 입력 
	memo clob,
	PRIMARY KEY (id)
)