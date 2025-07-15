<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Recent book</title>
    <%@include file="all_component/allCss.jsp"%>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>

    <%
        User u = (User) session.getAttribute("userobj");
    %>

    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <div class="container-fluid">
        <div class="row p-3">

            <%
                String ch = request.getParameter("ch");
                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                List<BookDtls> list = dao.getBookBySearch(ch);

                if (list != null && list.size() > 0) {
                    for (BookDtls b : list) {
            %>

            <div class="col-md-3">
                <div class="card crd-ho">
                    <div class="card-body text-center">
                        <img alt="" src="books/<%=b.getPhotoName()%>" style="width: 100px; height: 150px" class="img-thumblin">
                        <p><%=b.getBookName()%></p>
                        <p><%=b.getAuthor()%></p>
                        <p>Category: <%=b.getBookCategory()%></p>

                        <div class="row justify-content-center">
                            <%
                                if (u == null) {
                            %>
                                <a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add cart</a>
                            <%
                                } else {
                            %>
                                <a href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add cart</a>
                            <%
                                }
                            %>
                            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm ml-1">
                                <i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <%
                    }
                } else {
            %>
                <div class="col-md-12 text-center">
                    <h4 class="text-danger">No books found matching your search.</h4>
                </div>
            <%
                }
            %>

        </div>
    </div>

    <%@include file="all_component/footer.jsp"%>
</body>
</html>
