package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;


public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		consDAO dao = new consDAO();
		
		// 매개변수 받아오기
		String carea = request.getParameter("CompanyArea");
		String csuid = request.getParameter("csuid");
		String content = request.getParameter("csphonenume");
		
		System.out.println(carea + "   " + csuid + content);
		
//		if(name != null && subject != null &&
//				name.trim().length() > 0 && subject.trim().length() > 0) {
//			
//			try {
//				cnt = dao.insert(subject, content, name);
//			} catch(SQLException e) {
//				e.printStackTrace();
//			}
//			
//		} // end if
//			
//		request.setAttribute("result", cnt);

	} // end execute()

} // end Command