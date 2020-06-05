package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;
import com.cons.beans.consDTO;

public class SelectCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		consDAO dao = new consDAO();
		consDTO [] arr = null;
		int csuid = Integer.parseInt(request.getParameter("csuid"));  // 매개변수 검증 필요

		try {
			arr = dao.selectByUid(csuid);  // 읽기 only
			request.setAttribute("selectUid", arr);
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}
	}

}
