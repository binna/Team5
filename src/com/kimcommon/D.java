package com.kimcommon;

public class D {
	public static final String DRIVER = "oracle.jdbc.driver.OracleDriver";  
	public static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";  
	public static final String USERID = "team5";  
	public static final String USERPW = "team5";
	
	public static final String SQL_WRITE_SELECT = 
			"SELECT * FROM product"; 
	public static final String SQL_ORDER_SELECT =
			"SELECT a.PIMAGE ,a.PNAME ,a.PBRAND ,a.pid, b.PCADDRESS ,b.PCADDRESSNUM , b.PTOTALPRICE ,b.PCCONTENT ,b.PCLPCNT,b.PCREGDATE,b.PCSTATUS "+
			"FROM PRODUCT a inner join PURCHASE b "+
			"on a.PID =b.PID WHERE PCUID=?";
	
	/*
	 * public static final String SQL_ORDER_SELECT =
	 * "SELECT a.PIMAGE ,a.PNAME ,a.PBRAND ,a.pid, b.PCADDRESS ,b.PCADDRESSNUM , b.PTOTALPRICE ,b.PCCONTENT ,b.PCLPCNT,b.PCREGDATE,b.PCSTATUS "
	 * + "FROM PRODUCT a inner join PURCHASE b "+ "on a.PID =b.PID" ;
	 */
	
	public static final String SQL_WRITE_DELETE_BY_UID = 
			"DELETE FROM PURCHASE WHERE pid = ?";

	  
	  public static final String SQL_WRITE_SELECT_BY_UID =
	  "SELECT * FROM product WHERE pid = ?";
	  
		public static final String SQL_WRITE_INSERT = "INSERT INTO Purchase " +
				"(pcid, pcuid,pcaddressnum, pcaddress,ptotalprice,pccontent,pccardnum,pid,pclpcnt) " +
				"VALUES(ph_seq.nextval, ?, ?, ?, ?, ?,?,?,?)";
		
		public static final String SQL_WRITE_UPDATE=
				"UPDATE PURCHASE SET PCCONTENT=? WHERE PID=?";
		
		public static final String SQL_STATUS_UPDATE=
				"UPDATE PURCHASE SET PCSTATUS=? WHERE PID=?";
				
	  
}
