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
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM Company";
	
	// WHERE CAREA = '?'
}
