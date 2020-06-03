package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.WriteDAO;


public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		WriteDAO dao = new WriteDAO();
		System.out.println("여기 오니? 1");
		
		// 매개변수 받아오기
		String title = request.getParameter("question[title]");	// 제목
		String content = request.getParameter("content");		// 질문 내용
		String keyword = request.getParameter("keyword");		// 키워드
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(keyword);
		
		// title과 content는 null 이면 안됨
		if(title != null && content != null
				&& title.trim().length() > 0 && content.trim().length() > 0) {
			System.out.println("여기 오니? 2");
			
			try {
				cnt = dao.insert(title, content, keyword);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
		
		request.setAttribute("result", cnt);
		
	} // end execute()

} // end Command