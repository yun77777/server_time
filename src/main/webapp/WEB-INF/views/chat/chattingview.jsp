<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
</head>
<body>

</body>

<script type="text/javascript">
var sock=new SockJS("<c:url value='/echo'/>");
sock.onmessage=onMessage;
sock.onClose=onClose;

$(function(){
	$("#sendBtn").click(function(){
		console.log("send message...");
		sednMessage();
	});
});

function sendMessage(){
	sock.send($("message").val());
}

function onMessage(evt){
	var data=evt.data;
	var sessionid=null;
	var message=null;
	
	var strArray=data.split('|');
	
	for(var i=0; i<strArray.length; i++){
		console.log("str["+i+"]: "+strArray[i]);
	}

	var currentuser_session=$("#sessionuserid").val();
	console.log("current session id: "+currentuser_session);
	
	sessioid=strArray[0];
	message=strArray[1];
	
	if(sessioni==currentuser_session){
		var printHTML="<div class='well'>";
		printHTML+="<div class='alert alert-info'>";
		printHTML+="<string>["+sessionid+"]->"+message+"</strong>";
		printHTML+="</div>";
		printHTML+="</div>";
		
		$("#chatdata").append(printHTML);
	} else{
		var printHTML="<div class='well'>";
		pirntHTML+="<div class='alert alert-warning'>";
		pirntHTML+="<string>["+sessionid+"]->"+message+"</string>";
		printHTML+="</div>";
		printHTML+="</div>";
		
		$("#chatdata").append(printHTML);
	}
	
	console.log("chatting data: "+data);
}

function onClose(evt){
	$("#data").append("disconnection");
}
	

</script>
</html>


