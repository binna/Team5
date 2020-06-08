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
		
		// 매개변수 받아오기
		int cQno = Integer.parseInt(request.getParameter("no"));
		String cid = request.getParameter("Comment_id");
		String content = request.getParameter("commentContent");
		
		System.out.println("no " + cQno);
		System.out.println("content " + content);
		System.out.println("cid " + cid);
		
		try {
			// 트랜잭션 수행하기
			cnt = dao.insert(cQno, content, cid);
			
		} catch(SQLException e) {}
		
		request.setAttribute("CommentInsert", cnt);

	} // end execute

} // end Commend