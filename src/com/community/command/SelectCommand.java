package com.community.command;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class SelectCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		WriteDTO [] arr = null;
		
		int no = Integer.parseInt(request.getParameter("no"));  // 매개변수 검증 필요

		try {
			arr = dao.onlySelectByQno(no);  // 읽기 only
			request.setAttribute("select", arr);
			
		} catch (SQLException e) {  
			e.printStackTrace();
		}

	} // end SelectCommand

} // end Command