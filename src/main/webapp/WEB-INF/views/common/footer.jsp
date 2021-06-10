<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<!-- Footer-->
<!-- <footer class="py-5 bg-conflowerblue"
	style="clear: both; position: relative">
	        <footer class="py-5 bg-dark" style="clear:both;position:relative">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2021</p>
	</div>
</footer>

 -->

<!--  -->
<!-- Footer -->
<footer class="bg-conflowerblue text-center text-lg-start bg-light text-muted">
  <!-- Section: Social media -->
  <section
    class="text-white d-flex justify-content-center justify-content-lg-between p-4 border-bottom"
  >
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
     <!--  <span>Get connected with us on social networks:</span> -->
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
      <a href="https://www.facebook.com/" class="me-4 m-2 text-reset" onchange="if(this.value) window.open(this.value);" target="_blank">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a href="https://twitter.com/?lang=ko" class="me-4 m-2 text-reset" onchange="if(this.value) window.open(this.value);" target="_blank">
        <i class="fab fa-twitter"></i>
      </a>
      <a href="https://www.google.co.kr/" class="me-4 m-2 text-reset" onchange="if(this.value) window.open(this.value);" target="_blank">
        <i class="fab fa-google"></i>
      </a>
      <a href="https://www.instagram.com/" class="me-4 m-2 text-reset" onchange="if(this.value) window.open(this.value);" target="_blank">
        <i class="fab fa-instagram"></i>
      </a>
      
      
      <!-- <a href="" class="me-4 text-reset">
        <i class="fab fa-linkedin"></i>
      </a> -->
      <a href="https://github.com/yun77777" class="me-4 text-reset" onchange="if(this.value) window.open(this.value);" target="_blank">
        <i class="fab fa-github">
        </i>
      </a>
    </div>
    <!-- Right -->
  </section>
  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="text-white container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
          <!-- Content -->
          <h6 class="text-uppercase fw-bold mb-4">
          <a href="#" onclick="location.href='/test.do'">
            <i class="fas fa-gem me-3"></i>댕댕몰
          </a></h6>
          <p>
	        댕댕용품의 모든 것
          </p>
        </div>
        <!-- Grid column -->
		<!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            연락처
          </h6>
          <p><i class="fas fa-home me-3"></i> 서울시</p>
          <p>
            <i class="fas fa-envelope me-3"></i>
            wyk0935@gmail.com
          </p>
          <p><i class="fas fa-phone me-3"></i> + 01 234 567 88</p>
          <p><i class="fas fa-print me-3"></i> + 01 234 567 89</p>
        </div>
        <!-- Grid column -->
        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
           상품
          </h6>
          <p>
          	<a class="text-reset" href="#" onclick="fn_itemList('top')">상의</a>
          </p>
          <p>
          	<a class="text-reset" href="#" onclick="fn_itemList('bottom')">하의</a>
          </p>
          <p>
          	<a class="text-reset" href="#" onclick="fn_itemList('shoes')">신발</a>
          </p>
          <p>
          	<a class="text-reset" href="#" onclick="fn_itemList('pet')">반려동물용품</a>
          </p>
        </div>
        <!-- Grid column -->

       

        
         <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
          은행 계좌
          </h6>
          <select class="form-select form-select-sm col-xs-2" onchange="if(this.value) window.open(this.value);"><option value="">인터넷뱅킹 바로가기   </option>
			<option value="https://www.kbstar.com/"> 국민은행</option>
			<option value="http://www.epost.go.kr/main.retrieveMainPage.comm"> 우체국</option>
			<option value="http://www.nonghyup.com/Main/main.aspx"> NH농협</option>
			<option value="http://www.standardchartered.co.kr/np/kr/Intro.jsp"> SC제일은행</option>
			<option value="https://www.wooribank.com/"> 우리은행</option>
			<option value="https://www.ibk.co.kr/"> IBK기업은행</option>
			<option value="https://www.kebhana.com/"> KEB하나은행</option>
			<option value="https://www.shinhan.com/index.jsp"> 신한은행</option>
			<option value="https://pib.kjbank.com/ib20/mnu/BPB0000000001"> 광주은행</option>
			<option value="https://www.dgb.co.kr/dgb_ebz_main.jsp"> 대구은행</option>
			<option value="https://www.jbbank.co.kr/"> 전북은행</option>
			<option value="https://www.busanbank.co.kr/"> 부산은행</option>
			<option value="https://www.citibank.co.kr/ComMainCnts0100.act"> 한국씨티은행</option>
			<option value="https://www.e-jejubank.com/JeJuBankInfo.do"> 제주은행</option>
			<option value="https://www.knbank.co.kr/ib20/mnu/BHP000000000001"> 경남은행</option></select>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <!-- Copyright -->
  <!-- <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2021 Copyright:
    <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div> -->
  <!-- Copyright -->
</footer>
<!-- Footer -->
<!--  -->


