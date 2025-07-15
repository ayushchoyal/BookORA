


<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin: Orders Books</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body>
    <br><br><br>
        <c:if test="${empty userobj}">

            <c:redirect url="../login.jsp" />

        </c:if>
        <%@include file="navbar.jsp"%>

        <h3 class="text-center">Hello Admin!</h3>

        <table class="table">
            <thead class=" text-black">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    
                    <th scope="col">Price</th>
                    <th scope="col">Payment type</th>

                </tr>
            </thead>
            <tbody>

                <%
                    BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
                    List<BookOrder> blist = dao.getAllOrder();
                    for (BookOrder b : blist) {
                %>
                <tr>
                    <th scope="row"><%=b.getOrderId()%></th>
                    <td><%=b.getName()%></td>
                    <td><%=b.getEmail()%></td>
                    <td><%=b.getAddress()%></td>
                    <td><%=b.getPhone()%></td>
                    <td><%=b.getBookName()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getPaymentType()%></td>
                    

                </tr>
                <%
                    }

                %>



            </tbody>
        </table>


        <div style="margin-top: 130px;">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
