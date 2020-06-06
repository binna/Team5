package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;


public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		WriteDAO dao = new WriteDAO();	// DAO 객체 생성
		WriteDTO[] arr = null;
		
		try {
			// 트랜젝션 수행
			arr = dao.select();

			
		} catch(SQLException e) {
			// 만약에 CP 사용한다면
			// 여기서 NamingException도 처리해줘야 함
			e.printStackTrace();
		}
		
		// 페이징
		int curPage = 1;		// 현재 페이지(디폴트 1 page)
		int pageRows = 5;		// 한 페이지에 몇 개의 글 리스트? 
		int writePages = 10;	// 한 [페이징]에 몇 개의 페이지를 표시? 
		int totalCnt = 0;		// 글은 총 몇 개인지?
		int totalPage = 0;		// 총 몇 페이지 분량인지?
		
		dao = new WriteDAO();
		
		// page : 현재 몇 페이지?
		curPage = Integer.parseInt(request.getParameter("page"));
		
		try {
			// 트랜잭션 실행
			// 글 전체 개수 구하기
			totalCnt = dao.countAll();
			
			// 총 몇 페이지 분량인가?
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			
			// 몇 번째 row부터?
			int fromRow = (curPage - 1) * pageRows + 1;

			dao.selectFromRow(fromRow, pageRows);
		} catch(SQLException e) {
			 e.printStackTrace();
		}
		
		request.setAttribute("list", arr);
		
		request.setAttribute("writePages", writePages);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("pageRows", pageRows);
		request.setAttribute("totalCnt", totalCnt);
		
	} // end execute
		
} // end Command