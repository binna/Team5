package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class CommentWriteCommend implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;	// insert가 성공했는지 확인하기
		
		CommentDAO dao = new CommentDAO();	// DAO 객체 생성
		
		// 게시글 번호 받아오기 - 반드시 들어가야 할  PK
		int cQno = Integer.parseInt(request.getParameter("no"));
		
		// 매개변수 받아오기
		String content = request.getParameter("commentContent");
		
		System.out.println(content);
		
		try {
			// 트랜잭션 수행하기
			cnt = dao.insert(cQno, content);
		} catch(SQLException e) {}
		
		request.setAttribute("CommentInsert", cnt);

	} // end execute

} // end Commend