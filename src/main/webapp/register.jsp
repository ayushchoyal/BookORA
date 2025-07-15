<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eBook:register</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	
	
	<br><br><br><br>
	
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div style="text-align: center;">
							<i class="fa-solid fa-user-plus"></i>
						</div>
						
						    <c:if test="${not empty succMsg }">
                                <p class="text-center text-success">${succMsg}</p>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>
                            
                                

                            <c:if test="${not empty failedMsg }">
                                <p class="text-center text-danger">${failedMsg}</p>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>

						
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">User Name <span
									style="color: red;">*</span></label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="User Name" required="required" name="name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address <span
									style="color: red;">*</span></label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email" required="required" name="email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number <span
									style="color: red;">*</span></label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Phone Number"
									required="required" name="phone">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password <span
									style="color: red;">*</span></label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password" required="required" name="password">
							</div>
                            <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" name="check" 
                                           id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                            </div>
							<div style="display: flex; justify-content: center; gap: 5px;">
								<button type="submit" class="btn btn-primary">Submit</button>
								<a href="login.jsp" class="btn btn-primary">Login</a>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>