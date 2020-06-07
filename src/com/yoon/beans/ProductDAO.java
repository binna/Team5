package com.yoon.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.kim.beans.WriteDTO;
import com.yoon.common.D;

public class ProductDAO {

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null; // SELECT 결과, excuteQuery()

	public ProductDAO() {
		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.UID, D.UPW);
			System.out.println("ProductDAO생성");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();

	}
	
	 public ProductDTO [] createArray(ResultSet rs) throws SQLException{
		  ProductDTO[] arr = null; //DTO 배열

		  ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
		  
		  while(rs.next()) {
			  
				
				int pid = rs.getInt("pid");
				String pname= rs.getString("pname");
				String pprice= rs.getString("pprice");
				String pbrand = rs.getString("pbrand");
				String pimage = rs.getString("pimage");
				int pcode = rs.getInt("pcode");
			
				
				
				
				
				ProductDTO dto = new ProductDTO(pid, pname, pprice, pbrand, pimage, pcode);
	
				
				list.add(dto);
		  }
				int size = list.size();
				if(size==0)return null;
				
				arr = new ProductDTO[size];
				list.toArray(arr); //List -> 배열
				return arr;
				
		
	  }
	  //전체 SELECT
	  public ProductDTO [] select() throws SQLException{
		  ProductDTO [] arr = null;
		  
		  try {
			  pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
			  rs = pstmt.executeQuery();
			  arr = createArray(rs);
		  }finally {
			close();
		  }
		  
		  return arr;
	  }
	  

		public ProductDTO [] readByUid(int pid) throws SQLException{
			ProductDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
				pstmt.setInt(1, pid);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			
			return arr;
		} // end readByUid()
		
		

}
