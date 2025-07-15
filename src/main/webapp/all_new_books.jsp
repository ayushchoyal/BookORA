<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DB.DBConnect"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>

<style type="text/css">

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

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<body style="background: linear-gradient(to bottom right, #ffe0b2, #ffffff);">
<br><br><br><br><br>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<c:if test="${empty userobj}">

		<c:redirect url="login.jsp" />

	</c:if>

	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
                showToast();
                function showToast(content)
                {
                    $('#toast').addClass("display");
                    $('#toast').html(content);
                    setTimeout(() => {
                        $("#toast").removeClass("display");
                    }, 2000)
                }
            </script>

		<c:remove var="addCart" scope="session" />
	</c:if>

	<div class="container-fluid">
		<div class="row p-3">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getAllNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3 mb-4">
				<div class="card crd-ho">
					<div class="card-body text-center">

						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<P>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row justify-content-center">


							<%
							if(u==null){
							%>
								<a href="login.jsp" class="btn  btn-sm ml-2"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">Add cart</a>
							<%}else { %>
							
								<a  href="cart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>" class="btn  btn-sm ml-2"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">Add cart</a>
							
							<%} %>



							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn  btn-sm ml-1"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;">View Details</a> 
								<a href="addcart?bid=<%=b.getBookId()%>&&id=<%=u.getId() %>"
								class="btn  btn-sm ml-1"style="background: linear-gradient(to right, #f76b1c, #ffcc00); color:black;"><i
								class="fa-solid fa-rupee-sign"></i> <%=b.getPrice()%></a>


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