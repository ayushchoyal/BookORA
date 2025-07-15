<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.user.servlet.DeleteOrderServlet"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook</title>

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

.main {
	margin-top: 50px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.img {
	width: 300px;
	height: 300px;
}

.line {
	width: 500px;
}
</style>
<%@include file="all_component/allCss.jsp"%>

</head>
<body
	style="background: linear-gradient(to bottom right, #ffe0b2, #ffffff);">
	<%@include file="all_component/navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<br>
	<br>
	<br>
	<div class="main">
		<div>
			<h2 class="line">
				<b style="color: #FF9001">"From timeless tales to trending
					reads."</b> Discover stories that match your speed.
			</h2>
			<br>
			<h3>
				<b style="color: #FF9001">BookORA</b> – Turn the Page, Change Your
				World.
			</h3>
		</div>
		<div>
			<img class="img mr-4" style="width: 250px; height: 350px;"
				src="all_component/img/banar1.png">
		</div>
	</div>




	<div class="container">
		<h3 class="text-center">Recent Books</h3>
		<div class="row">


			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3 mb-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%>


						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">Add cart</a>
							<%
							} else {
							%>

							<a style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"
								href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId()%>"
								class="btn  btn-sm ml-2">Add cart</a>

							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">View Details</a>
							
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							} else {
							%>
							
							<a href="addcart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							}
							%>
						</div>


					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-1">
			<a href="all_recent_book.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>
	</div>
	<br>
	<br>

	<div class="container">
		<h3 class="text-center">New Books</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3 mb-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<P>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">Add cart</a>
							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId()%>"
								class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">Add cart</a>

							<%
							}
							%>




							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn  btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">View Details</a>
							
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							} else {
							%>
							
							<a href="addcart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>

		<div class="text-center mt-1">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>



	<br>
	<br>

	<div class="container">
		<h3 class="text-center">Old Books</h3>
		<div class="row">

			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list1 = dao1.getOldBook();
			for (BookDtls b : list1) {
			%>

			<div class="col-md-3 mb-4">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p>
							<%=b.getBookName()%>


						</p>
						<p>
							<%=b.getAuthor()%>


						</p>
						<p>
							Category:
							<%=b.getBookCategory()%>


						</p>
						<div class="row">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">Add cart</a>
							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId()%>"
								class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">Add cart</a>

							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn  btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;">View Details</a>
							
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn  btn-sm ml-2"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							} else {
							%>
							
							<a href="addcart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-1"
								style="background: linear-gradient(to right, #f76b1c, #ffcc00); color: black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>
		</div>

		<div class="text-center mt-1">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>
	</div>
	<br>

	<%@include file="all_component/footer.jsp"%>

</body>

</html>