<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- Add CSS for navbar shadow -->
<style>
    .navbar.scrolled {
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        transition: box-shadow 0.3s ease-in-out;
    }
</style>

<!-- Logout Modal -->
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
                    <a href="logout" class="btn btn-primary text-white"> Logout</a>
                </div>
            </div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>
<!-- End Logout Modal -->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom fixed-top p-3">

    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a href="index.jsp"> <img src="books/logo1.jpg" alt="logo"
        style="width: 150px; height: 50px; border-radius: 15px;">
    </a>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <ul class="navbar-nav mr-auto ml-1">
            <li class="nav-item active "><a class="nav-link"
                href="index.jsp" style="color: black;"> <i
                    class="fa-solid fa-house"></i> Home <span class="sr-only">(current)</span>
            </a></li>
            <li class="nav-item active"><a class="nav-link"
                href="all_recent_book.jsp" style="color: black;"> <i
                    class="fa-solid fa-book-open"></i> Recent Book
            </a></li>
            <li class="nav-item active"><a class="nav-link"
                href="all_new_books.jsp" style="color: black;"> <i
                    class="fa-solid fa-book-open"></i> New Book
            </a></li>
            <li class="nav-item active"><a class="nav-link"
                href="all_old_books.jsp" style="color: black;"> <i
                    class="fa-solid fa-book-open"></i> Old Book
            </a></li>
        </ul>

        <div class=" mr-4">
            <form class="form-inline d-flex align-items-center w-100" action="search.jsp" method="post">
                <input class="form-control mr-2" type="search" name="ch"
                    placeholder="Search" aria-label="Search" style="flex: 1;">
                <button class="btn btn-search" type="submit">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </form>
        </div>

        <!-- Cart Icon -->
        <div class="ml-2">
            <a href="cart.jsp"> <i class="fa-solid fa-cart-plus fa-2x"
                style="color: black;"></i>
            </a>
        </div>

        <!-- User Login / Logout -->
        <div class="ml-4">
            <c:if test="${not empty userobj}">
                <div class="dropdown d-inline">
                    <button class="btn dropdown-toggle text-black"
                        type="button" id="userDropdown" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"
                        style="background-color:#FF9001 ;color: black; border: 2px solid black">
                         ${userobj.name}
                    </button>

                    <div class="dropdown-menu dropdown-menu-right mt-32"
                        aria-labelledby="userDropdown" style="background-color: #FF9001; color: black;">
                        <a class="dropdown-item" href="#" data-toggle="modal"
                            data-target="#staticBackdrop"> <i
                            class="fa-solid fa-right-from-bracket"></i> Logout
                        </a> <a class="dropdown-item" href="setting.jsp"> <i
                            class="fa-solid fa-gear"></i> Setting
                        </a> <a class="dropdown-item" href="helpline.jsp"> <i
                            class="fa-solid fa-phone"></i> Contact Us
                        </a>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn "
                    style="color: black;">
                    <i class="fa-solid fa-user fa-2x"></i> 
                </a>
            </c:if>
        </div>
    </div>
</nav>
<!-- End Navbar -->


<script>
    $(window).scroll(function () {
        if ($(this).scrollTop() > 0) {
            $('.navbar').addClass('scrolled');
        } else {
            $('.navbar').removeClass('scrolled');
        }
    });
</script>


