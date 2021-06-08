<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>



  <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" />

    <!--PELOCULAS RECOMENDADS-->
<c:if test="${!empty list1}">
<div class="peliculas-recomendadas contenedor">
      <div class="contenedor-titulo-controles">
        <h3>상의</h3>
        <small><a href="#">더보기</a></small>
        <div class="indicadores">

        </div>
      </div>

	<div class="contenedor-principal">
	        <button type="button" role="button" id="flecha-izquierda" class="flecha-izquierda"> < </button>
	
	        <div class="contenedor-carrusel">
	          <div class="carrusel">
	<c:forEach var="result" items="${list1}" varStatus="status">
	            <%-- <div class="pelicula">
	              <a href="#">
					<img src="<c:url value='/img/${result.representative_file}'/>" alt="no image" />              </a>
	            </div> --%>
	  <figure class="thumbnail round firstRow snip1384">
	<!--   <figure class="thumbnail round pelicula snip1384"> -->
			 <img class="list_img" src="<c:url value='/img/${result.representative_file}'/>" alt="no image" />
			 <figcaption>
			   <h3>${result.gdsName}</h3>
	<%-- <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${result.gdsPrice}" /> 원<br />
	 --%>
			   <p>${result.gdsPrice} 원</p><i class="ion-ios-arrow-right"></i>
			 </figcaption>
			 <a href="#!" onclick="fn_detail_pop('${result.gdsNum}')" data-toggle="modal"
				data-target="#exampleModalLong"></a>
		</figure>
	</c:forEach>
	          </div>
	        </div>
	
	        <button type="button" role="button" id="flecha-derecha" class="flecha-derecha"> ></button>
	      </div>
	</div>
</c:if>
    <!--***********************-->
    <!--SUSPENSO-->
<c:if test="${!empty list2}">
<div class="peliculas-recomendadas contenedor">
<c:if test="${empty list1}">
	<div class="contenedor-titulo-controles">
        <h3>하의</h3>
        <small><a href="#">더보기</a></small>
        <div class="indicadores">

        </div>
      </div>
</c:if>
<c:if test="${!empty list1}">
	<div class="contenedor-titulo-controles">
        <h3>하의</h3>
        <small><a href="#">더보기</a></small>
        <div class="indicadores">

        </div>
      </div>
</c:if>
	
	      <!-- <div class="contenedor-titulo-controles contenedor-titulo-controles2">
	        <h3>하의</h3>
	        <small><a href="#">더보기</a></small>
	        <div class="indicadores">
	
	        </div>
	      </div> -->
	
	<div class="contenedor-principal contenedor-principal2">
	        <button type="button" role="button" id="flecha-izquierda2" class="flecha-izquierda"> < </button>
	
	        <div class="contenedor-carrusel contenedor-carrusel2">
	          <div class="carrusel">
	<c:forEach var="result" items="${list2}" varStatus="status">
	            <%-- <div class="pelicula">
	              <a href="#">
					<img src="<c:url value='/img/${result.representative_file}'/>" alt="no image" />              </a>
	            </div> --%>
	  <figure class="thumbnail secondRow snip1384">
	<!--   <figure class="thumbnail pelicula snip1384"> -->
			 <img class="list_img" src="<c:url value='/img/${result.representative_file}'/>" alt="no image" />
			 <figcaption>
			   <h3>${result.gdsName}</h3>
	<%-- <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${result.gdsPrice}" /> 원<br />
	 --%>
			   <p>${result.gdsPrice} 원</p><i class="ion-ios-arrow-right"></i>
			 </figcaption>
			 <a href="#!" onclick="fn_detail_pop('${result.gdsNum}')" data-toggle="modal"
				data-target="#exampleModalLong"></a>
		</figure>
	</c:forEach>
	          </div>
	        </div>
	
	        <button type="button" role="button" id="flecha-derecha2" class="flecha-derecha"> > </button>
	  </div>
	</div>
</c:if>
  <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
  <script src="<c:url value='/resources/js/main.js'/>" ></script>
  