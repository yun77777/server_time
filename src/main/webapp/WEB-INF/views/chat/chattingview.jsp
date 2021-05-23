<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Simple Chat</title>
<%-- <link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
 --%>
</head>
<body>
	<%-- 	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
 --%>
	<div>
		<button type="button" onclick="openSocket();">대화방 참여</button>
		<button type="button" onclick="closeSocket();">대회방 나가기</button>
		<br /> <br /> <br /> 메세지 입력 : <input type="text" id="sender"
			value="${ID}" style="display: none;">
		<%--         <input type="text" id="sender" value="${sessionScope.id}" style="display: none;"> --%>
		<input type="text" id="messageinput">
		<button type="button" onclick="send();">메세지 전송${member.ID}</button>
<%-- 		<button type="button" onclick="send();">메세지 전송${ID}</button> --%>
		<button type="button" onclick="javascript:clearText();">대화내용
			지우기</button>
	</div>
	<!-- Server responses get written here -->
	<div id="messages"></div>

	<!-- websocket javascript -->
	<%-- <%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<%@ include file="/WEB-INF/views/common/floatingContent.jsp"%>
 --%>
</body>
<script type="text/javascript">
	var ws;
	var messages = document.getElementById("messages");

	function openSocket() {
		if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		//웹소켓 객체 만드는 코드
		ws = new WebSocket("ws://localhost:8080/echo.do");

		ws.onopen = function(event) {
			if (event.data === undefined) {
				return;
			}
			writeResponse(event.data);
		};

		ws.onmessage = function(event) {
			console.log('writeResponse');
			console.log(event.data)
			writeResponse(event.data);
		};

		ws.onclose = function(event) {
			writeResponse("대화 종료");
		}

	}

	function send() {
		// var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value;
		var text = document.getElementById("messageinput").value + ","
				+ document.getElementById("sender").value;
		ws.send(text);
		text = "";
	}

	function closeSocket() {
		ws.close();
	}

	function writeResponse(text) {
		messages.innerHTML += "<br/>" + text;
	}

	function clearText() {
		console.log(messages.parentNode);
		messages.parentNode.removeChild(messages)
	}

	
	//기본 위치(top)값
	var floatPosition = parseInt($(".sideBanner").css('top'))

	// scroll 인식
	$(window).scroll(function() {

		// 현재 스크롤 위치
		var currentTop = $(window).scrollTop();
		var bannerTop = currentTop + floatPosition + "px";

		//이동 애니메이션
		$(".sideBanner").stop().animate({
			"top" : bannerTop
		}, 500);

	}).scroll();
</script>
</html>