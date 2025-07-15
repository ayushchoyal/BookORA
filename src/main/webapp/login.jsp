<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBook:login</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@ include file="all_component/navbar.jsp"%>
	<br><br><br><br>
	<div class="container mt-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div style="text-align: center;">
							<i class="fa-solid fa-user-plus"></i>
						</div>

                            <c:if test="${not empty failedMsg }">

                                <h5 class="text-center text-danger">${failedMsg}</h5>
                                <c:remove var="failedMsg" scope="session" />


                            </c:if>
                                
                                <c:if test="${not empty succMsg }">

                                <h5 class="text-center text-success">${succMsg }</h5>
                                <c:remove var="succMsg" scope="session" />


                            </c:if>
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address <span
									style="color: red;">*</span></label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									required="required" name="email">

							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password <span
									style="color: red;">*</span></label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>

							<div style="display: flex; justify-content: center;">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>

							<div style="display: flex; justify-content: center;">
								<a href="register.jsp">Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>