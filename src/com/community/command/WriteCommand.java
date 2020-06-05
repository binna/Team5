package com.community.command;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.DAO;
import com.community.beans.DTO;


public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// insert가 성공했는지 확인하기
		int cnt = 0;
		// insert에 성공했다면 Qno값을 받아오기
		// 등록 성공 후 View 단으로 가기 위해 필요
		DTO[] arr = null;
		
		DAO dao = new DAO();

		// 매개변수 받아오기
		String title = request.getParameter("question[title]");	// 제목
		String content = request.getParameter("content");		// 질문 내용
		String keyword = request.getParameter("keyword");		// 키워드
		
		// title과 content는 null 이면 안됨
		if(title != null && content != null
				&& title.trim().length() > 0 && content.trim().length() > 0) {
			
			try {
				cnt = dao.insert(title, content, keyword);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
		} // end if
		
		if(cnt != 0) {
			try {
				// 트랜젝션 수행
				arr = dao.selectByQtitle(title);
				
				// "list"란 name으로 request에 arr 값 전달
				// 즉, request에 담아서 컨트롤러에 전달되는 셈!
				request.setAttribute("Qno", arr);
			} catch(SQLException e) {
				e.printStackTrace();
			} 
		} // end if
		
		request.setAttribute("result", cnt);
		
	} // end execute()

} // end Command