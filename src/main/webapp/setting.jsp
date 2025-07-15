<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook:Setting</title>

<style type="text/css">
	a {
		text-decoration: none;
		color: black;
	}

	a:hover {
		text-decoration: none; /* ensure no underline on hover */
		color: black;
	}

	.card:hover {
		transform: scale(1.03);
		transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
		box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
		cursor: pointer;
	}
</style>
</head>

<%@include file="all_component/allCss.jsp"%>
<body>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<h3 class="text-center my-5">Hello! ${userobj.name}</h3> <!-- Added margin using Bootstrap class -->

		<div class="row justify-content-center g-4">

			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card h-100 shadow-sm">
						<div class="card-body text-center">
							<div class="text-primary mb-2">
								<i class="fa-solid fa-id-card fa-3x"></i>
							</div>
							<h4>Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="order.jsp">
					<div class="card h-100 shadow-sm">
						<div class="card-body text-center">
							<div class="text-danger mb-2">
								<i class="fa-solid fa-box fa-3x"></i>
							</div>
							<h4>My Order</h4>
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4">
				<a href="helpline.jsp">
					<div class="card h-100 shadow-sm">
						<div class="card-body text-center">
							<div class="text-primary mb-2">
								<i class="fa-solid fa-user-circle fa-3x"></i>
							</div>
							<h4>Help Center</h4>
						</div>
					</div>
				</a>
			</div>

		</div>
	</div>
	<br>
	<%@include file="all_component/footer.jsp" %>
</body>
</html>
