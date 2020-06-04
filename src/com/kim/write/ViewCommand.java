package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.beans.WriteDAO;
import com.kim.beans.WriteDTO;

public class ViewCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO(); //DAO 객체 생성
		WriteDTO [] arr=null;
		int uid = Integer.parseInt(request.getParameter("pid"));
		// 매개변수 받아오기



		try {
			//트랜직션수행
			arr= dao.readByUid(uid);
			request.setAttribute("view", arr);
			
		} catch(SQLException e) {

			e.printStackTrace();
		}

	}
}
