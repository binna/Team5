package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.WriteDAO;
import com.community.beans.WriteDTO;

public class ListAdminCommand implements Command {

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
		
		request.setAttribute("list", arr);
		
	} // end ListAdminCommand()

} // end Command