<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style>
.centeringContainer {
	text-align: center;
}

.centered {
	display: table;
	margin-left: auto;
	margin-right: auto;
	display: inline-block;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	<%@ include file="/WEB-INF/views/common/popup/orderPopup.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/orderDetailPopup.jsp"%>
	<form id="detailForm" method="post">
		<input type="hidden" id="orderId" name="orderId">
	</form>
	<section class="py-5">
		<div class="container">
			<h3>주문 완료 상품</h3>
			<div class="orderInfo">
				
					
					<div id="row">
						<div class="table-responsive-lg">
							<table class="table">
							<c:forEach items="${orderList}" var="orderList" varStatus="status">
							<tr>
							<th class="table-active">${status.index+1}</th>
								<td colspan="2" class="table-active"></td>
							</tr>
								<tr>
									<td rowspan="4">
										<div class="text-center">
										<a href="#!"
											onclick="fn_detail_pop('${orderList.gdsNum}')"
											data-toggle="modal" data-target="#exampleModalLong"> 
											<!-- <img class="card-img-top rounded" -->
											<img class="card-img-top"
												src="<c:url value='/img/${orderList.representative_file}'/>"
												style="height: 200px;width:auto" alt="no image" />
										</a></div>
									</td>
									<td>주문번호</td>
									<td>${orderList.orderId}</td>
								</tr>
								
								<tr>
									<td>상품명</td>
									<td>
									<a href="#" onclick="fn_order_detail_pop('${orderList.orderId}')" onclick="fn_order_detail_pop('${orderList.orderId}')"
												data-toggle="modal" data-target="#orderDetailPopup">
									${orderList.gdsName} <c:if test="${orderList.cnt eq 1}"> 1</c:if><c:if test="${orderList.cnt ne 1}">외 ${orderList.cnt-1}</c:if> 건</a>
									</td>
								</tr>
								<tr>
									<td>가격</td>
									<td><fmt:formatNumber pattern="###,###,###"
											value="${orderList.amount}" /> 원
									</td>
								</tr>
								<tr>
									<td>상태</td>
									<td>${orderList.delivery}</td>
								</tr>
								
								<%-- <tr>
									<td>주문번호</td>
									<td colspan="2">${orderList.orderId}</td>
								</tr> --%>
								<tr>
									<td class="text-center">수령인</td>
									<td colspan="2">${orderList.orderRec}</td>
								</tr>
								<tr>
									<td class="text-center">주소</td>
									<td colspan="2">(${orderList.userAddr1}) ${orderList.userAddr2}, ${orderList.userAddr3}
									</td>
								</tr>
								</c:forEach>
								<%-- <tr>
									<td>가격</td>
									<td colspan="2"><fmt:formatNumber pattern="###,###,###"
											value="${orderList.amount}" /> 원
										</p></td>
								</tr>
								<tr>
									<td>상태</td>
									<td colspan="2">${orderList.delivery}</td>
								</tr>
								<tr>
									<td>주문수량</td>
									<td colspan="2">${orderList.cartStock}</td>
								</tr>
								<tr>
									<td>상품명</td>
									<td colspan="2">
									<a href="#" onclick="fn_order_detail_pop('${orderList.orderId}')" onclick="fn_order_detail_pop('${orderList.orderId}')"
												data-toggle="modal" data-target="#orderDetailPopup">
									${orderList.gdsName} <c:if test="${orderList.cnt eq 1}"> 1</c:if><c:if test="${orderList.cnt ne 1}">외 ${orderList.cnt-1}</c:if> 건</a>
									</td>
								</tr> --%>
							</table>
							</div>
						</div>
						
						<br>
						<br>
						
					
				

				<div id="row">
					<c:if test="${empty orderList}">
						<p>
							<span>주문내역이 없습니다.</span>
						</p>
					</c:if>
				</div>
			
			</div>
		</div>
	</section>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
	function fn_list(no) {
		//$('#currentPageNo').val(no);
		window.location = '<c:url value="/boardList.do"/>';

		/* $('#boardForm').attr({
			action : '<c:url value="/boardList.do"/>',
			target : '_self'
		}).submit(); */
	};

	function fn_detail(orderId) {
		$('#detailForm #orderId').val(orderId);

		$('#detailForm').attr({
			action : '<c:url value="/orderDetailView.do" />',
			target : '_self'
		}).submit();

	}

	function fn_btn(no) {
		var formData = $('#boardForm').serialize();
		$.ajax({
			cache : false,
			url : "${pageContext.request.contextPath}/boardDetail.do",
			type : 'POST',
			data : formData,
			success : function(data) {
			}, // success 

			error : function(xhr, status) {
				alert(xhr + " : " + status);
			}
		}); // $.ajax */

	}

	function fn_insert() {
		//var formData = $('#boardForm').serialize();
		$('#boardForm #no').attr('disabled', false);
		var formData = new FormData($("#boardForm")[0]);
		$.ajax({
			url : "${pageContext.request.contextPath}/insertBoard.do",
			type : "post",
			enctype : 'multipart/form-data',
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				alert('success');
				fn_list();
			}, // success 

			error : function(xhr, status) {
				alert(xhr + " : " + status);
			}
		});
	}

	function fn_delete() {
		//var formData = $('#boardForm').serialize();
		$('#boardForm #no').attr('disabled', false);
		var formData = new FormData($("#boardForm")[0]);
		$.ajax({
			url : "${pageContext.request.contextPath}/deleteBoard.do",
			type : "post",
			enctype : 'multipart/form-data',
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				alert('success');
				fn_list();
			}, // success 

			error : function(xhr, status) {
				alert(xhr + " : " + status);
			}
		});
	}

	$(function() {
		$("#submit").click(
				function() {
					oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD",
							[]);
					//textarea의 id를 적어줍니다.

					var selcatd = $("#selcatd > option:selected").val();
					var title = $("#title").val();
					var content = document.getElementById("content").value;
					alert(content);
					if (selcatd == "") {
						alert("카테고리를 선택해주세요.");
						return;
					}
					if (title == null || title == "") {
						alert("제목을 입력해주세요.");
						$("#title").focus();
						return;
					}
					if (content == "" || content == null || content == '&nbsp;'
							|| content == '<br>' || content == '<br/>'
							|| content == '<p>&nbsp;</p>') {
						alert("본문을 작성해주세요.");
						oEditors.getById["content"].exec("FOCUS"); //포커싱
						return;
					} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.

					var result = confirm("작성하시겠습니까?");

					if (result) {
						alert("작성 완료!");
						/* 			$("#boardForm").submit();
						 */fn_insert();
					} else {
						return;
					}
				});
	})

</script>

</html>

