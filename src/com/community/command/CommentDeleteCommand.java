package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class CommentDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		CommentDAO dao = new CommentDAO();

		//입력한 값을 받아오기
		int Cno = Integer.parseInt(request.getParameter("Cno"));
		int qno = Integer.parseInt(request.getParameter("qno"));
		System.out.println("커맨드");
		System.out.println(cnt);
		System.out.println(qno);
		
		try {			
			cnt = dao.deleteComment(Cno);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("delete", cnt);
		request.setAttribute("qno", qno);
	}
	

}
