package com.yoon.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yoon.write.Command;
import com.yoon.write.pquestionListCommand;
import com.yoon.write.productListCommand;
import com.yoon.write.questionUpdateCommand;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.y")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public controller() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);

	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		//컨트롤러는 다음 두개를 선택해야 한다. 
		String viewPage = null; //어떠한 뷰?-->페이지
		Command command = null; //어떠한 커맨드-->어떠한 로직 수행
		//url에 담겨온다. 이름에서 찢어내야한다. 
		
		//url 로 부터 URI,ContextPath, Command 분리
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch(com) {
		case "/storeMain.y":
			command = new productListCommand();
			command.execute(request, response);
			viewPage ="storeMain.jsp";
			break;
		case "/aQuestionList.y":
			command = new pquestionListCommand();
			command.execute(request, response);
			viewPage ="aQuestionList.jsp";
			break;
		case "/QuestionUpdateOk.y":
			command = new questionUpdateCommand();
			command.execute(request, response);
			viewPage ="QuestionUpdateOk.jsp";
			break;
		}
		
		
		if(viewPage!=null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
	}

}
