package com.community.command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.community.beans.*;

public class CommentSelectAllAdmin implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		CommentDAO dao = new CommentDAO();
		CommentDTO[] arr = null;
		
		try {
			arr = dao.select();
			request.setAttribute("selectAdmin", arr);
			
		} catch (SQLException e) {  
			e.printStackTrace();
		}

	}

}
