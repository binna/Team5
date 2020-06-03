package com.community.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.command.Command;
import com.community.command.WriteCommand;

@WebServlet("*.community")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommunityController() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		// 컨트롤러는 다음 두개를 선택해야 한다.
		String viewPage = null;   // 어떠한 뷰? --> 페이지
		Command command = null;   // 어떠한 커맨드? --> 어떠한 로직 수행.
		
		// URL로부터 URI, ContextPath, Command 분리 
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		// 컨트롤러는 커멘드에 따라, 로직을 수행하고
		// 결과를 내보낼 view를 결정한다.
		switch(com) {
		case "/community/write.community":
			viewPage = "/community/write.jsp";
			break;
			
		case "/community/writeOk.community":
			command = new WriteCommand();
			command.execute(request, response);
			viewPage = "/community/writeOk.jsp";
			break;
		
		} // end switch()
		
		// request를 위에서 결정한 view에 forward 해줌.
		if(viewPage != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
				
	} // end actionDo()

} // end controller