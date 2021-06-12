<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<hr class="my-0" />

	<form id="boardForm" method="post">
		<div class="container container-lg" >
			<%@ include file="/WEB-INF/views/common/slideImgs.jsp"%>
		</div>
	</form>
	
<style>
#orderPopup {
  overflow: auto;
}
#reviewPopup {
  overflow: auto;
}
</style>
	
<%@ include file="/WEB-INF/views/common/popup/orderPopup.jsp"%>
<%@ include file="/WEB-INF/views/common/popup/reviewPopup.jsp"%> 
<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 




<form id="orderForm" method="post" enctype="multipart/form-data">
<input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
<input type="hidden" name="ID" value="${member.ID}" />
<input type="hidden" id="userId" name="userId" value="${member.ID}" />
<input type="hidden" id="orderProcessDetail" name="orderProcessDetail" value="Y" />
<input type="hidden" id="gdsPrice" name="gdsPrice"/>
<input type="hidden" id="gdsStock" name="gdsStock" />
<input type="hidden" id="gdsName" name="gdsName" />
<input type="hidden" id="file" name="file" />
<input type="hidden" id="orderId" name="orderId" />
<input type="hidden" id="cartNum" name="cartNum">	
</form>

<!-- <aside style="float: left; width: 20%">
	<h3>최근글</h3>
	<ul>
		<li>목록1</li>
		<li>목록2</li>
	</ul>

	<div id="floatMenu" class="floatMenu"
		style="position: absolute; width: 200px; height: 200px; right: 50px; top: 550px; background-color: #606060; color: #fff;">
		<span>최근에 본 상품</span>
	</div>
</aside> -->


<hr class="my-0" />

<!-- 메인 이미지 css -->
