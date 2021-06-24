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
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<form style="display: inline">
			<input type="text" value="http://localhost:8080/test.do"
			class="input" id="searchInput"
			onfocus="document.getElementById('searchInput').focus()"> 
			<input
			type="submit" value="Search" class="buttonSearch"
			onclick="getServerTime('Y');">
	</form>
	<br>

		<div id="timeDiv"></div>
		<script type="text/javascript">
    	//var url=window.location.href.toString();
		var url=$("#searchInput").val();

		$(document).ready(function(){
    		//$("#searchInput").val(url);

			$(".buttonSearch").on("click",function(){
				//alert(url);
			});
			
		}); 
	    window.onload = function() {
	    	var url=$("#searchInput").val();
/* 	    	var url=window.location.href.toString(); */
	    	/* $(".buttonSearch").on("click",function(){
				alert(url);
			}); */
	    	getServerTime();
	      };

		function getServerTime(input) {
			//url=$("#searchInput").val();
		    try {
	            //FF, Opera, Safari, Chrome
	            xmlHttp = new XMLHttpRequest();
	        }
	        catch (err1) {
	            //IE
	            try {
	                xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
	            }
	            catch (err2) {
	                try {
	                    xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
	                }
	                catch (eerr3) {
	                    //AJAX not supported, use CPU time.
	                    alert("AJAX not supported");
	                }
	            }
	        }
	        if(input=='Y'){
	    		url=$("#searchInput").val();
	        	alert(url);
	        }
	        	
        	xmlHttp.open('HEAD', url, false);

	        xmlHttp.setRequestHeader("Content-Type", "text/html");
	        xmlHttp.send('');
	       var date=xmlHttp.getResponseHeader("Date");

            document.getElementById('timeDiv').innerHTML = '<h1>'+date+'</h1><br>';
			setInterval(getServerTime,1000);
			
		}
		
	</script>
</body>

</html>
