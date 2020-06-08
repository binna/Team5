package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class UpdateCommand implements Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		WriteDAO dao = new WriteDAO();
		

		//입력한 값을 받아오기
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("question[title]");
		String content = request.getParameter("content");
		String keyword = request.getParameter("keyword");
		
		try {			
			cnt = dao.update(title, content, keyword, no);
		} catch (SQLException e) {
			e.printStackTrace();
		}


		request.setAttribute("update", cnt);

	}

}
