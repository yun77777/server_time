<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

 <!-- Navigation-->
 <!-- Image and text -->
<!-- <nav class="navbar navbar-dark bg-conflowerblue">
  <a class="navbar-brand" href="/test.do">
        <img src="/se2/img/dog.png" style="width:10%;height:auto"><br>댕댕몰
        </a>
</nav>
  -->
 
<nav class="navbar navbar-expand-lg navbar-dark bg-conflowerblue">
<!--         <nav class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
    <a class="navbar-brand ml-5" href="/test.do">
        <img src="/se2/img/dog.png" style="width:10%;height:auto;margin:0 10px">
        <br><i class="fas fa-gem me-3"></i>댕댕몰
    </a>
    
    <div class="container">
        
        <%-- <c:if test="${empty member}">
        	<a href="#myModal" class="" data-toggle="modal">로그인</a>
        </c:if>
        <c:if test="${!empty member}">
        	<a onclick="fn_logout()" class="nav-link" href="/user/logout.do">로그아웃</a>
        </c:if> --%>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        
        
        <form id="navForm" method="post">
        	<input type="hidden" id="itemType" name="itemType">
        </form>
            
            
            <ul class="navbar-nav ml-auto">
            
	<!--                         <li class="nav-item"><a class="nav-link" href="/about.do">About</a></li>
	 -->                        
				<li class="nav-item ml-3"><a class="nav-link" href="#" onclick="fn_itemList('top')">상의</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#" onclick="fn_itemList('bottom')">하의</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#" onclick="fn_itemList('shoes')">신발</a></li>
				<li class="nav-item ml-3"><a class="nav-link" href="#" onclick="fn_itemList('pet')">반려동물용품</a></li>
				
				<li class="nav-item ml-3"><a class="nav-link" href="/boardList.do">게시판</a></li>
                <li class="nav-item ml-3"><a class="nav-link" href="#" onclick="fn_chk_login('${member.ID}')">장바구니</a></li>
<!--                         <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
 -->                        
<!--  <li class="nav-item"><a class="nav-link" href="/chatting.do">Chat</a></li>
 -->                
 
 <c:if test="${not empty member}">
            	<li class="nav-item ml-5"><p class="nav-link">환영합니다 <b>${member.ID}</b> 고객님!</p></li>
<%--                     	<li class="nav-item"><p class="nav-link">Welcome <b>${login.ID}</b>!</p></li> --%>
</c:if>
            <c:if test="${not empty member}">
<!--                <li class="nav-item"><a class="nav-link" href="/user/myPage.do">My Page</a></li>
 --><!--                <li class="nav-item"><a onclick="fn_logout()" class="nav-link" href="/user/logout.do">Log Out</a></li>
 -->               <li class="nav-item dropdown ml-3">
                   <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:blue">${member.ID}</a>
                   <div class="dropdown-menu dropdown:hover dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                       <a class="dropdown-item" href="/user/myPage.do">회원 정보 관리</a>
                       <a class="dropdown-item" href="/cartList.do">장바구니</a>
                       <a class="dropdown-item" href="/orderList2.do">주문 내역</a>
                   </div>
               </li>
			</c:if>
			
<%-- <c:if test="${empty member}">
  <li class="nav-item"><a class="nav-link" href="/user/login.do">sign In</a></li>
  <li class="nav-item"><a class="nav-link" href="/signUp.do">Sign Up</a></li>
</c:if> --%>

<!-- manage -->
            <c:if test="${not empty member.MNG_DIV and member.MNG_DIV eq 'Y'}">
<li class="nav-item dropdown ml-3">
                     <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color:red">관리</a>
                   <div class="dropdown-menu dropdown:hover dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                       <a class="dropdown-item" href="/mng/itemList.do">상품 관리</a>
                       <a class="dropdown-item" href="/mng/boardList.do">게시판 관리</a>
                       <a class="dropdown-item" href="/mng/mngCommonCodes.do">공통코드 관리</a>
                       <a class="dropdown-item" href="/mng/orderList.do">주문 내역 관리</a>
                       <a class="dropdown-item" href="portfolio-3-col.html">상품평 관리</a>
                       <a class="dropdown-item" href="/mng/customerList.do">고객 관리</a>
                   </div>
               </li>
</c:if>
				<li class="nav-item ml-5">
				 <c:if test="${empty member}">
		        	<a class="nav-link" href="#myModal" class="" data-toggle="modal">로그인</a>
		        </c:if>
		        <c:if test="${!empty member}">
		        	<a onclick="fn_logout()" class="nav-link" href="/user/logout.do">로그아웃</a>
		        </c:if>
				</li>
            </ul>
        </div>
    </div>
</nav>

<!-- <script>
function fn_logout(){
	alert('f');
	if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response);
	        	alert('카카오 로그아웃');
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    } else{
	    	//window.location.href= '<c:url value="/user/logout.do"/>';
	    }
}

</script> -->


