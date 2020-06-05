package com.munity.common;

/*
 * DB 접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * 
 * XML, 초기화 파라미터 등에서 관리하는 것이 좋다.
 * 
 */

/*  Question DB 속성명
	Qno Number	// 게시글 No
	Qtitle varchar2(20)	// 제목 -> 20자 미만 받으면 안됨
	Qcontent clob	// 내용물
	Qregdate date	// 날짜
	Qclickcnt number	// 조회수
	Qkeyword varchar2(50) // 키워드
*/

/*
	private int no;			// 게시글 No
	private String title; 	// 게시글 제목 글자수 : 7 ~ 20자
	private String content;	// 게시글 안의 내용물 : 제한 없음
	private String date;	// 날짜
	private int clickCnt;	// 클릭수
	private String keyword;	// 키워드
*/
/*
 * CREATE SEQUENCE SEQ_question_Qno INCREMENT BY 1 START WITH 1;
 * */

public class CommunityD {
	
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	public static final String USERID = "team5"; // DB 접속 계정 정보
	public static final String USERPW = "team5";
	
	// 쿼리문 작성하기
	// 전체 검색하기
	public static final String SQL_WRITE_SELECT 
	= "SELECT * FROM Question ORDER BY Qno DESC";  

	// 데이터 삽입하기
	public static final String SQL_WRITE_INSERT = "INSERT INTO Qno "
			+ "(Qno, Qtitle, Qcontent, Qregdate, Qclickcnt, Qkeyword) "
			+ "VALUES(SEQ_question_Qno.nextval, ?, ?, ?, ?, ?)";

}
