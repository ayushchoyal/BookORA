package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DAO.*;
import com.DB.*;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/remove_order")
public class DeleteOrderServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String order_id=req.getParameter("oid");
			BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
			boolean f = dao.orderDelete(order_id);
			HttpSession session = req.getSession();
			
		
			 if (f) {
		          session.setAttribute("succMsg", "Order Deleted Succesfully..");
		          resp.sendRedirect("order.jsp");

		     } else {
		          session.setAttribute("FailedMsg", "Something wrong on server..");
		          resp.sendRedirect("order.jsp");

		     }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
