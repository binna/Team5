package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.beans.WriteDAO;
import com.kim.beans.WriteDTO;

public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		WriteDAO dao = new WriteDAO();  // DAO 객체 생성
		WriteDTO [] arr = null;  
		
		try {
			arr = dao.select();
			request.setAttribute("list", arr);
			
		} catch(SQLException e) {

			
			e.printStackTrace();
		}
	}
}



