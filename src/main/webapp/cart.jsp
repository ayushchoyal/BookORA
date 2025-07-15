<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DB.DBConnect"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBoohk:cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<br><br><br><br><br>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	  <c:if test="${not empty succMsg}">
            <div class="alert alert-success" role="alert">
                ${succMsg}
            </div>
            
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        
                

        <c:if test="${not empty failedMsg}">
            <div class="alert alert-danger text-center" role="alert">
                ${failedMsg}
            </div>
            
            <c:remove var="failedMsg" scope="session"/>
        </c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-6">

				<div class="card mt-2">
					<h3 class="text-center">Your items</h3>
					<div class="card-body">
						<table class="table table-striped">
							<thead>

								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>


								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice += Double.parseDouble(c.getPrice());
								%>




							</thead>
							<tbody>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>

									<td></td>
									<td></td>
									<td class="fw-bold fs-4">Total Price</td>
									<td class="fw-bold fs-4"><%=String.format("%.2f", totalPrice)%></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>

			</div>
			<div class="col-md-6">

				<div class="card mt-2">
					<h3 class="text-center">Address Details</h3>
					<div class="card-body">
						<form action="order" method="post">

							<input type="hidden" value="${userobj.id}" name="id">


							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" name="username"
										value="${userobj.name}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="Email"
										class="form-control" id="inputPassword4" name="email"
										value="${userobj.email}" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="text" class="form-control" id="inputEmail4" name="phone"
										value="${userobj.phone}" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="address"
										required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input
										type="number" class="form-control" id="inputPassword4"
										name="pincode" required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="all_recent_book.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>



						</form>

					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>