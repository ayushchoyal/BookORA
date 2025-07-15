<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View: Book</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.book-card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 12px;
}

.book-img {
	height: 200px;
	width: auto;
	object-fit: cover;
	border-radius: 8px;
}

.feature-icon {
	font-size: 1.5rem;
}
</style>
</head>
<body>
<br><br><br>
	<%
		User u = (User)session.getAttribute("userobj"); 
	%>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
            
            <c:redirect url="login.jsp" />
            
        </c:if>


	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>


	<div class="container mt-5">
		<div class="card book-card p-4">
			<div class="row">
				<!-- Book Image -->
				<div class="col-md-4 text-center">
					<img src="books/<%=b.getPhotoName()%>" alt="image"
						class="book-img">
				</div>

				<!-- Book Details -->
				<div class="col-md-8">
					<h3 class="mb-3"><%=b.getBookName()%></h3>
					<p>
						<strong>Author:</strong> <span class="text-success "><%=b.getAuthor()%></span>
					</p>
					<p>
						<strong>Category:</strong> <span class="text-success "><%=b.getBookCategory()%></span>
					</p>

					<div class="row text-center mt-4">
						<div class="col-md-4">
							<i class="fa-solid fa-money-bill-wave text-success feature-icon"></i>
							<p>Cash On Delivery</p>
						</div>
						<div class="col-md-4">
							<i class="fa-solid fa-rotate-left text-danger feature-icon"></i>
							<p>Return Available</p>
						</div>
						<div class="col-md-4">
							<i class="fa-solid fa-truck text-primary feature-icon"></i>
							<p>Free Shipping</p>
						</div>
					</div>

					<!-- Optional Buttons -->
					<div class="mt-4">
						<a href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;"><i
							class="fa-solid fa-cart-arrow-down"></i> Add Cart</a> <a href=""
							class="btn" style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;"><i class="fa-solid fa-rupee-sign"></i>
							<%=b.getPrice()%></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>
