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

<script type="text/javascript">
    //서버시간 불러오기
    var xmlHttp;
	var url=window.location.href.toString();
	$(document).ready(function(){
		$("#inputUrl").val(url);
	});
    function srvTime(){

        if (window.XMLHttpRequest) {//분기하지 않으면 IE에서만 작동된다.

            xmlHttp = new XMLHttpRequest(); // IE 7.0 이상, 크롬, 파이어폭스 등

            //헤더 정보만 받기 위해 HEAD방식으로 요청.
            xmlHttp.open('HEAD', url, false); // window.location.href.toString() or Target URL
/*             xmlHttp.open('HEAD', window.location.href.toString(), false); // window.location.href.toString() or Target URL */

            xmlHttp.setRequestHeader("Content-Type", "text/html");
            xmlHttp.send('');

            return xmlHttp.getResponseHeader("Date");   //받은 헤더정보에서 Date 속성만 적출

        }else if (window.ActiveXObject) {
            xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
            xmlHttp.open('HEAD',url,false);
            //xmlHttp.open('HEAD',window.location.href.toString(),false);
            xmlHttp.setRequestHeader("Content-Type", "text/html");
            xmlHttp.send('');
            return xmlHttp.getResponseHeader("Date");
        }
    }

    var st = srvTime();         // 한국 시간 -9
    var today = new Date(st);   // 한국 시간 +9

    function dpTime() {
        //var now = new Date();
        var now = new Date(srvTime());
        hours = now.getHours();
        minutes = now.getMinutes();
        seconds = now.getSeconds();

        if (hours > 12) {
            hours -= 12;
            ampm = "오후 ";
        } else {
            ampm = "오전 ";
        }
        if (hours < 10) {
            hours = "0" + hours;
        }
        if (minutes < 10) {
            minutes = "0" + minutes;
        }
        if (seconds < 10) {
            seconds = "0" + seconds;
        }
        document.getElementById("dpTime").innerHTML = "( " + ampm + hours + ":" + minutes + ":" + seconds + " )";
    }

    setInterval("dpTime()", 1000);
    
    

    function fn_search(){
		url=$("#inputUrl").val();
    }
</script>

<body>
    실시간 <b><span id="dpTime">loading...</span></b>
    
    <form id="timeForm" method="post">
    	<input type="text" id="inputUrl">
    </form>
    <button type="submit" onclick="fn_search()">검색</button>
</body>
</body>

</html>
