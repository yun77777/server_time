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
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" />
  <link href="<c:url value='/resources/css/base.css'/>" rel="stylesheet" />
  
  <script src="https://kit.fontawesome.com/a0043d9bc2.js" crossorigin="anonymous"></script>

</head>

<body>
  <h1 class="logo">@@@reference</h1>
${list }
  <div class="container">
    <button type="button" id="moveLeft" class="btn-nav">
      ᐊ
    </button>
    <div class="container-indicators">
      <div class="indicator active" data-index=0></div>
      <div class="indicator" data-index=1></div>
      <div class="indicator" data-index=2></div>
    </div>
    <div class="slider" id="mySlider">
      <div class="movie" id="movie0">
        <img src="<c:url value='/img/1.jpg'/>"  alt="" srcset="">
<!--           src="https://images.unsplash.com/photo-1585951237318-9ea5e175b891?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" -->
         
        <div class="description">
          <div class="description__buttons-container">
            <div class="description__button"><i class="fas fa-play"></i></div>
            <div class="description__button"><i class="fas fa-plus"></i></div>
            <div class="description__button"><i class="fas fa-thumbs-up"></i></div>
            <div class="description__button"><i class="fas fa-thumbs-down"></i></div>
            <div class="description__button"><i class="fas fa-chevron-down"></i></div>
          </div>
          <div class="description__text-container">
            <span class="description__match">97% Match</span>
            <span class="description__rating">TV-14</span>
            <span class="description__length">2h 11m</span>
            <br><br>
            <span>Explosive</span>
            <span>&middot;</span>
            <span>Exciting</span>
            <span>&middot;</span>
            <span>Family</span>
          </div>
        </div>
      </div>
    </div>
    <button type="button" id="moveRight" class="btn-nav">
      ᐅ
    </button>
  </div>


<script src="<c:url value='/resources/js/script.js'/>"></script>

</body>

</html>



