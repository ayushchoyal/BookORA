<style>
.dropdown:hover .dropdown-menu {
	display: block;
}
</style>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>




<!-- logout modal -->
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="text-center">
					<h4>Do You want logout</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../logout" class="btn btn-primary text-white"> Logout</a>
				</div>

			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- end logout modal -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom fixed-top">
	<a href="home.jsp"> <img style="width: 150px; height: 50px; border-radius: 15px; "
		src="../books/logo1.jpg" alt="logo">
	</a> <a class="navbar-brand ml-4" href="#"><i
		class="fa-solid fa-house-chimney-window"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>
	</div>
	<div class="col-md-8 text-right ">


			<c:if test="${not empty userobj}">

					<div style="font-size: 20px"><b>${userobj.name}</b></div>
				</div>
			</c:if>


			<c:if test="${empty userobj }">


				<a href="../login.jsp" class="btn btn-success "><i
					class="fa-solid fa-right-to-bracket"></i> Login</a>



			</c:if>
		</div>
	
</nav>
