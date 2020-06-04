package com.kimcommon;

public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";  
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  
	public static final String USERID = "team5";  
	public static final String USERPW = "team5";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM Web"; 

	  
	  public static final String SQL_WRITE_SELECT_BY_UID =
	  "SELECT * FROM Web WHERE pid = ?";
	  
}
