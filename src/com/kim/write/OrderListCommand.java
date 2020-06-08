package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.beans.OrderDAO;
import com.kim.beans.OrderDTO;

public class OrderListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		OrderDAO dao = new OrderDAO(); //DAO 객체 생성
		OrderDTO [] arr=null;
		String pcuid = request.getParameter("pcuid");
		try {
			//트랜직션수행
			arr= dao.select(pcuid);
			
			//"list" 란 name 으로 request 에 arr 값 전달
			//즉 request 에 담아서 컨트롤러에 전달되는 셈.
			request.setAttribute("list", arr);
			
		} catch(SQLException e) {
			// 만약 CP 사용한다면
			//NamingException 도 처리 해야함 .
			
			e.printStackTrace();
		}

	}


}
