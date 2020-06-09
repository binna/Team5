package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.WriteDAO;

public class ReportWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;

		Integer[] arr = null;
		
		WriteDAO dao = new WriteDAO();

		// 매개변수 받아오기
		String title = request.getParameter("question[title]");	// 제목
		String content = request.getParameter("content");		// 질문 내용
		String keyword = request.getParameter("keyword");		// 키워드
		String qid = request.getParameter("qid");				// 작성자
		
		
		dao = new WriteDAO();
		
		if(cnt != 0) {
			try {
				// 트랜젝션 수행
				arr = dao.QnoSelect();
				
				// 모든 no의 값을 전달
				request.setAttribute("Qno", arr);
				
			} catch(SQLException e) {
				e.printStackTrace();
			} 
		} // end if
		
		request.setAttribute("result", cnt);
		
	} // end execute()

} // end commend