package com.admin.servlet;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bookName");
            String author = req.getParameter("author");
            String price = req.getParameter("price");

            String status = req.getParameter("bookStatus");

            BookDtls b = new BookDtls();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setBookStatus(status);

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.updateEditBooks(b);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Book Update Succesfully..");
                resp.sendRedirect("admin/all_books.jsp");

            } else {
                session.setAttribute("FailedMsg", "Something wrong on server..");
                resp.sendRedirect("admin/all_books.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}