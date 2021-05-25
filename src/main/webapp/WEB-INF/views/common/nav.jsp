<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
 <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/test.do">Mall</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    <c:if test="${not empty member}">
                    	<li class="nav-item"><p class="nav-link">Welcome <b>${member.ID}</b>!</p></li>
<%--                     	<li class="nav-item"><p class="nav-link">Welcome <b>${login.ID}</b>!</p></li> --%>
				    </c:if>
<!--                         <li class="nav-item"><a class="nav-link" href="/about.do">About</a></li>
 -->                        <li class="nav-item"><a class="nav-link" href="/boardList.do">Board</a></li>
<!--                         <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
 -->                        <li class="nav-item"><a class="nav-link" href="/chatting.do">Chat</a></li>
                        
                    <c:if test="${not empty member}">
                       <li class="nav-item"><a class="nav-link" href="/user/myPage.do">My Page</a></li>
                       <li class="nav-item"><a class="nav-link" href="/user/logout.do">Log Out</a></li>
                       <li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:blue">${member.ID}</a>
                           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                               <a class="dropdown-item" href="/user/myPage.do">My Page</a>
                               <a class="dropdown-item" href="/cartList.do">Cart</a>
                               <a class="dropdown-item" href="/orderList2.do">Order List</a>
                           </div>
                       </li>
				    </c:if>
                     <c:if test="${empty member}">
                        <li class="nav-item"><a class="nav-link" href="/user/login.do">sign In</a></li>
                        <li class="nav-item"><a class="nav-link" href="/signUp.do">Sign Up</a></li>
				    </c:if>
				    
				    <!-- manage -->
                    <c:if test="${not empty member.MNG_DIV and member.MNG_DIV eq 'Y'}">
						<li class="nav-item dropdown">
                           <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:red">Manage</a>
                           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                               <a class="dropdown-item" href="/itemList.do">Manage items</a>
                               <a class="dropdown-item" href="/boardList.do">Manage board</a>
                               <a class="dropdown-item" href="portfolio-2-col.html">Item list</a>
                               <a class="dropdown-item" href="portfolio-3-col.html">Check the reviews</a>
                               <a class="dropdown-item" href="portfolio-4-col.html">User list</a>
                           </div>
                       </li>
					</c:if>
                        
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdownPages" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Other Pages</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
                                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                                <a class="dropdown-item" href="faq.html">FAQ</a>
                                <a class="dropdown-item" href="404.html">404</a>
                                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </div>
        </nav>