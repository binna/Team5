package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.consDAO;
import com.cons.beans.consDTO;

public class SelectCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Selectcommand 들어옴");
		consDAO dao = new consDAO();
		consDTO[] arr = null;
		String value = request.getParameter("value"); // 매개변수 검증 필요
		String valueName = request.getParameter("valueName"); // 매개변수 검증 필요
		// System.out.println(value);
		// System.out.println(valueName);

		switch (valueName) {
		// 상담신청순서
		case "csno":
			int csno = Integer.parseInt(value);
			System.out.println("csno switch 들어옴");

			try {
				arr = dao.selectByCsno(csno);
				request.setAttribute("list", arr);
				System.out.println("csno switch 나옴");

			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}
			break;

		// 유저아이디
		case "csuid":
			try {
				arr = dao.selectByCsuid(value);
				request.setAttribute("list", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}

			break;

		// 유저이름
		case "csname":
			try {
				System.out.println("정종훈 열일중");
				arr = dao.selectByCSNAME(value);
				request.setAttribute("list", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}

			break;

		// 업체이름
		case "cname":
			try {
				arr = dao.selectByCNAME(value);
				request.setAttribute("list", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}
			break;

		// 전화번호
		case "cstel":
			try {
				arr = dao.selectByCTEL(value);
				request.setAttribute("list", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}
			break;

		// 시공지역
		case "csarea":
			try {
				arr = dao.selectByCSAREA(value);
				request.setAttribute("list", arr);
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다
				e.printStackTrace();
			}
			break;
		} // end switch

	}
} // end class
