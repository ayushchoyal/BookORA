<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent book</title>
<style>
.crd-ho {
	background-color: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	position: relative;
	overflow: visible;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

/* Hover effect: lift the card */
.crd-ho:hover {
	transform: translateY(-8px); /* card moves up */
	background: linear-gradient(to bottom right, #ffe0b2, #ffffff);
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
	transform: scale(1.03);
	z-index: 2;
}

/* Top-left orange line */
.crd-ho::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 50%;
	height: 50%;
	border-top: 3px solid orange;
	border-left: 3px solid orange;
	opacity: 0;
	transition: all 0.3s ease;
	pointer-events: none;
}

/* Bottom-right orange line */
.crd-ho::after {
	content: '';
	position: absolute;
	bottom: 0;
	right: 0;
	width: 50%;
	height: 50%;
	border-bottom: 3px solid orange;
	border-right: 3px solid orange;
	opacity: 0;
	transition: all 0.3s ease;
	pointer-events: none;
}

/* Show lines on hover */
.crd-ho:hover::before, .crd-ho:hover::after {
	opacity: 1;
}
</style>
</head>
<%@include file="all_component/allCss.jsp"%>
<body style="background: linear-gradient(to bottom right, #ffe0b2, #ffffff);">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${empty userobj}">
            
            <c:redirect url="login.jsp" />
            
        </c:if>
<br><br><br><br><br>
	 <div class="container-fluid">
            <div class="row p-3">


                <% BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                    List<BookDtls> list = dao.getAllRecentBook();
                    for (BookDtls b : list) {
                %>

                <div class="col-md-3 mb-4">
                    <div class="card crd-ho">
                        <div class="card-body text-center">

                            <img alt="" src="books/<%=b.getPhotoName()%>" style="width: 100px;
                                 height: 150px"
                                 class="img-thumblin">
                            <p><%=b.getBookName()%></p>
                            <p><%=b.getAuthor()%></p>
                            <P>Category: <%=b.getBookCategory()%></p>
                            <div class="row justify-content-center">


                               <%
							if(u==null){
							%>
								<a href="login.jsp" class="btn  btn-sm ml-2"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">Add cart</a>
							<%}else { %>
							
								<a  href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-2"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">Add cart</a>
							
							<%} %>



                                <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn  btn-sm ml-1"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">View Details</a>


                                <a href="addcart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-1"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;"><i class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>


                            </div> 
                        </div>
                    </div>
                </div>
                <%
                    }
                %>


            </div>

        </div>


	<%@include file="all_component/footer.jsp"%>
</body>
</html>