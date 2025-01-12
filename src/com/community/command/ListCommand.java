package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;


public class ListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 리스트 출력
		WriteDAO dao = new WriteDAO();
		WriteDTO[] arr = null;
		
		try {
			arr = dao.select();
		} catch(SQLException e) {
			System.out.println("ListCommand1 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("ListCommand1 트랜젝션 이외의 에러 발생");
		}
		
		// 페이징
		int curPage = 1;		// 현재 페이지(디폴트 1 page)
		int pageRows = 5;		// 한 페이지에 몇 개의 글 리스트? 
		int writePages = 10;	// 한 [페이징]에 몇 개의 페이지를 표시? 
		int totalCnt = 0;		// 글은 총 몇 개인지?
		int totalPage = 0;		// 총 몇 페이지 분량인지?
		
		dao = new WriteDAO();
		
		// 현재 몇 페이지인지 url로 받아오기
		curPage = Integer.parseInt(request.getParameter("page"));
		
		try {
			totalCnt = dao.countAll();
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			int fromRow = (curPage - 1) * pageRows + 1;
			dao.selectFromRow(fromRow, pageRows);
		} catch(SQLException e) {
			System.out.println("ListCommand2 트랜젝션 에러 발생");
		} catch (Exception e) {
			System.out.println("ListCommand2 트랜젝션 이외의 에러 발생");
		}
		
		request.setAttribute("list", arr);
		
		request.setAttribute("writePages", writePages);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("pageRows", pageRows);
		request.setAttribute("totalCnt", totalCnt);
		
	} // end execute()
		
} // end Command