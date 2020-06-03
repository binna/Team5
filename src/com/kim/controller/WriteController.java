package com.kim.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.write.Command;
import com.kim.write.ListCommand;
import com.kim.write.ViewCommand;

@WebServlet("*.do")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public WriteController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() 호출");

		request.setCharacterEncoding("utf-8");

		// 컨트롤러 선택
		String viewPage = null; // 페이지선택
		Command command = null; // 커맨드 선택

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println(uri);
		System.out.println(conPath);
		System.out.println(com);

		// view결정
		// command 선택
		switch (com) {
		case "/detail2.do":
			command = new ListCommand();
			command.execute(request, response);
			viewPage = "detail2.jsp";
			break;
			
		case "/detail.do":
			command = new ViewCommand();
			command.execute(request, response);
			viewPage = "detail.jsp";
			break;

		} // end switch

		// request 를 위에서 결정된 view 에 forward 해줌.

		if (viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}

	}// end actionDo()

}// end class