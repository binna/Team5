package com.kim.write;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kim.beans.PurchaseDAO;

public class WriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int cnt = 0;
		PurchaseDAO dao = new PurchaseDAO();
		
		// 매개변수 받아오기
		String pcuid = request.getParameter("pcuid");
		int pcaddressnum = Integer.parseInt(request.getParameter("pcaddressnum"));
		String pcaddress = request.getParameter("pcaddress");
		int ptotalprice = Integer.parseInt(request.getParameter("ptotalprice"));
		String pccontent=request.getParameter("pccontent");
		int pccardnum = Integer.parseInt(request.getParameter("pccardnum"));
		int pclpid= Integer.parseInt(request.getParameter("pclpid"));
		int pclpnt= Integer.parseInt(request.getParameter("pclpnt"));


			try {
				cnt = dao.insert(pcuid,pcaddressnum,pcaddress,ptotalprice,pccontent,pccardnum,pclpid,pclpnt);
			} catch(SQLException e) {
				e.printStackTrace();
			}
			
			
		request.setAttribute("result", cnt);

	} // end execute()

} // end Command
















