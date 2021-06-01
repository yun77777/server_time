<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style> .centeringContainer { text-align: center; } .centered { display: table; margin-left: auto; margin-right: auto; display: inline-block; } </style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<!-- Page Content-->
<section id="container">
		<div id="container_box">
		
			<section id="content">
				<p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
				
				<ul class="detailList">
					<c:forEach items="${detailList}" var="orderList">
					<li>
					<div>
		 				<a href="#!" onclick="fn_detail_pop('${orderList.gdsNum}')" data-toggle="modal" data-target="#exampleModalLong">
					    	<img class="card-img-top" src="<c:url value='/img/${orderList.representative_file}'/>" style="width:100px" alt="no image" />
					    </a>
					    <br />
					    <p><span>상품명</span>${orderList.gdsName}</p>
					    <p><span>주문수량</span>${orderList.cartStock}</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
					</div>
					</li>
					</c:forEach>
				</ul>
				
				<ul class="detailList">
					<li>
					<div>
					    <br>
						<p><span>수령인</span>${detail.orderRec}</p>
						<p><span>주소</span>(${detail.userAddr1}) ${detail.userAddr2} ${detail.userAddr3}</p>
						<p><span>상태</span>${detail.delivery}</p>
					</div>
					</li>
				</ul>
			</section>
			
		</div>
	</section>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
</html>

