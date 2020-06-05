package com.cons.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cons.beans.comDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int cnt = 0;
		comDAO dao = new comDAO();

		// 매개변수 받아오기
		String csuid = request.getParameter("csuid");
		int cno = Integer.parseInt(request.getParameter("cno"));
		String carea = request.getParameter("CompanyArea");
		String c1 = request.getParameter("cstel01");
		String c2 = request.getParameter("cstel02");
		String c3 = request.getParameter("cstel03");
		String cstel = c1 + c2 + c3;

		// System.out.println(csuid + " " + cno + " " + carea + " " + cstel);
		try {
			cnt = dao.insert(csuid, cno, carea, cstel);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("result", cnt);

	} // end execute()

} // end Command