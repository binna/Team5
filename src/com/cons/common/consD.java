package com.cons.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 */
public class consD {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	public static final String USERID = "team5"; // DB 접속 계정 정보
	public static final String USERPW = "team5";

	// 회사Info DB
	public static final String SQL_COM_SELECT = // 회사 INFO 읽어오기
			"SELECT * FROM Company";

	public static final String SQL_COM_SELECT_BY_UID = // 글 읽어 오기
			"SELECT * FROM Company WHERE Cno = ?";

	public static final String SQL_CONS_WRITE = // 상담 신청서 입력
			"INSERT INTO Consulting VALUES(cons_write_seq.nextval,?,?,?,?)";
	// WHERE CAREA = '?'

	// 상담신청 DB
	public static final String SQL_CONS_SELECT = // 회사 INFO 읽어오기
			"SELECT c2.*, c1.CNAME FROM COMPANY c1 INNER JOIN CONSULTING c2 ON c1.CNO =c2.CNO";

	// 상담신청수정 DB
	public static final String SQL_CONS_UPDATE = // 회사 INFO 읽어오기
			"UPDATE Consulting SET CSUID = ?, CSAREA = ?, CSTEL =? WHERE CSNO = ?";
	
	
}
