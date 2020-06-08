package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.CommentDAO;
import com.community.beans.CommentDTO;
import com.community.beans.WriteDAO;
import com.community.beans.WriteDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();	// DAO 객체 생성
		WriteDTO[] arr = null;
		
		// Qno 값 받아 오기, id 값 받아오기
		int no = Integer.parseInt(request.getParameter("no"));
		
		try {
			// 트랜잭션 수행
			arr = dao.clickReadByQno(no);
			request.setAttribute("view", arr);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} // end try catch
		
		// 등록된 댓글 모두 보기
		CommentDAO dao2 = new CommentDAO();	// DAO 객체 생성
		CommentDTO[] arr2 = null;
		
		try {
			// 트랜젝션 수행
			arr2 = dao2.select(no);
			request.setAttribute("CommentList", arr2);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}

	} // end execute

} // end command