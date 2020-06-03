package com.yoon.common;

public class D {
	
	public static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	   public static String URL ="jdbc:oracle:thin:@localhost:1521:XE";
	   public static String UID = "team5";
	   public static String UPW = "team5";
	   
	   public static String SQL_WRITE_SELECT= //모든물건가져오기
	   "SELECT * FROM product";
	   
	   public static String SQL_WRITE_SELECT_BY_UID= //카테고리별로 물건 가져오기
	   "SELECT * FROM product WHERE pcode=?";
	   
	   public static String SQL_PQLIST_SELECT_ALL_TODO = //관리자모드에서 모든 문의내역 확인
			   "SELECT p.PBRAND ,p.PNAME ,q.PQCONTENT ,q.PQANSWER " + 
			   "FROM PRODUCT p JOIN PQUESTION q " + 
			   "ON p.PID =q.PQID" + 
			   ";"; 
	   public static String SQL_PQLIST_SELECT_BY_UID_TODO = //자신의 문의내역만 확인
			   "SELECT p.PBRAND ,p.PNAME ,q.PQCONTENT ,q.PQANSWER " + 
			   "FROM PRODUCT p JOIN PQUESTION " + 
			   "ON p.PID =q.PQID " + 
			   "WHERE q.PQUID ='?';";
	   public static String SQL_PQLIST_SELECT_ALL= //모든물건가져오기
			   "SELECT p.PBRAND ,p.PNAME ,q.PQid,q.PQpid,q.PQuid,q.PQregdate,q.PQcontent,q.PQANSWER FROM PRODUCT p INNER JOIN PQUESTION q ON p.PID =q.PQID" ;

}
