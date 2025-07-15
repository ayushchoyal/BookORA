
<%@page import="com.entity.BookOrder"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<br><br><br><br><br>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<p class="text-center text-danger">${failedMsg }</p>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container p-1">
		<h5 class="text-center text-primary">Your Order</h5>

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Action</th>
				</tr>
			</thead>

			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnect.getConn());
				List<BookOrder> blist = dao.getBook(u.getEmail());
				for (BookOrder b : blist) {
				%>


				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
					<td><a href="remove_order?oid=<%=b.getOrderId()%>"
						class="btn btn-sm btn-danger">Order Cancel</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>
