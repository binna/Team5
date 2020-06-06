package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class DeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		WriteDAO dao = new WriteDAO();

		//입력한 값을 받아오기
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);

		try {			
			cnt = dao.deleteByQno(no);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("delete", cnt);

	} // end DeleteCommand()

} // end Command