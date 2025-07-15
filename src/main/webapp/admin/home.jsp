<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:home</title>
<%@include file="allCss.jsp" %>

        <style type="text/css">

            a{
                text-decoration: none;
                color: black;
            }
            a:hover{
                text-decoration:none;
                color: black;
            }
            #head{
            	font-size: 30px;
            }
        </style>
</head>
<body>
<br>
    <%@include file="navbar.jsp"%>
        
        <c:if test="${empty userobj}">
            
            <c:redirect url="../login.jsp" />
            
        </c:if>
<div class="mt-5 text-center" id="head">Admin Panel</div>

        <div class="container">
            <div class="row p-5">
                <div class="col-md-3">
                    <a href="add_books.jsp">
                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
                                <h4> Add Books </h4>
                                -----

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="all_books.jsp">

                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-book-open fa-3x text-danger"></i><br>
                                <h4> All Books </h4>
                                -----

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="orders.jsp">
                        <div class="card">

                            <div class="card-body text-center">
                                <i class="fa-solid fa-box fa-3x text-warning"></i><br>
                                <h4> Orders </h4>
                                -----

                            </div>
                        </div>
                    </a>
                </div>

                <div class="col-md-3">
                    <a href="../logout" data-toggle="modal" data-target="#staticBackdrop">

                        <div class="card">
                            <div class="card-body text-center">
                                <i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
                                <h4> Logout </h4>
                                -----

                            </div>
                        </div>
                    </a>
                </div>


            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="text-center">
                            <h4> Do You want to logout</h4>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a href="../logout" class="btn btn-primary text-white"> Logout</a>
                        </div>

                    </div>
                    <div class="modal-footer">

                    </div>
                </div>
            </div>
        </div>

        <!-- end logout modal -->

        <div style="margin-top: 100px;">
            <%@include file="footer.jsp" %>
        </div>
</body>
</html>