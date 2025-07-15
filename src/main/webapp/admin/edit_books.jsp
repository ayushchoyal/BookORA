<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import="com.entity.BookDtls"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:edit</title>
        <%@include file="allCss.jsp" %>
    </head>
    <body style="background-color: #f0f2f2;">
        <%@include file="navbar.jsp"%>
<br><br><br>
        <div class="container">
            <div class="row p-2">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="text-center"> Edit Books </h4>

                           

                            <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                                BookDtls b = dao.getBookById(id);
                            %>



                            <form action="../editbooks" method="post">
                                <input type="hidden" name="id" value="<%=b.getBookId()%>">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Book Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="bookName" value="<%=b.getBookName()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Author's Name*</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" name="author" value="<%=b.getAuthor()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Price*</label>
                                    <input type="number" class="form-control" id="exampleInputPassword1" name="price" value="<%=b.getPrice()%>">
                                </div>



                                <div class="form-group">
                                    <label for="inputState">Book Status</label>
                                    <select id="inputState" name="bookStatus" class="form-control">
                                        <%
                                            if ("Active".equals(b.getBookStatus())) {
                                        %>
                                         <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                        <%
                                        } else {
                                        %>
                                        <option value="Inactive">Inactive</option>
                                        <option value="Active">Active</option>
                                        <%
                                            }
                                          %>


                                    </select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="margin-top: 130px;">
            <%@include file="footer.jsp" %>
        </div>

    </body>