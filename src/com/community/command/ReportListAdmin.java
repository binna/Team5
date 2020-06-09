package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class ReportListAdmin implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ReportDAO dao = new ReportDAO();
		ReportDTO [] arr = null;
		
		try {
			arr = dao.select();
			request.setAttribute("select", arr);
			
		} catch (SQLException e) {  
			e.printStackTrace();
		}
		
	} // end execute

} // end Command