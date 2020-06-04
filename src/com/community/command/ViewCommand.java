package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.DAO;
import com.community.beans.DTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		DAO dao = new DAO();	// DAO 객체 생성
		DTO[] arr = null;
		
		// Qno 값 받아 오기
		int no = Integer.parseInt(request.getParameter("no"));
		
		try {
			// 트랜잭션 수행
			arr = dao.readByQno(no);
			
			// "view"란 name으로 request에 arr 값 전달
			// 즉, request에 담아서 컨트롤러에 전달되는 셈!
			request.setAttribute("view", arr);
			
		} catch(SQLException e) {
			// 만약 ConnectionPool을 사용한다면 
			// 여기서 NamingException도 catch 해야 한다.
			e.printStackTrace();
		} // end try catch

	} // end execute

} // end command