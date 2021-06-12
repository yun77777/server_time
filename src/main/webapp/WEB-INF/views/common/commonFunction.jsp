<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>

<script>
    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요");
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
    
    function fn_sign_in() {
    	//var formData = $('#boardForm').serialize();
    	$('#loginForm').attr({
    		action : '<c:url value="/user/loginPost.do"/>',
    		target : '_self'
    	}).submit();
    }
    
    function fn_itemList(itemType) {
    	$('#itemType').val(itemType);
    	
    	$('#navForm').attr({
    		action : '<c:url value="/itemList.do"/>',
    		target : '_self'
    	}).submit();
    	
    }
    
    function fn_chk_login(id) {
		if(id.length==0)
			alert('로그인 후 이용해주세요');
		else
			window.location='<c:url value="/cartList.do"/>';

    }
    
    function fn_naverUrl() {
   	var url='${url}';
	window.location=url;

    }
    
    
    function fn_detail_pop(B_NO,B_TYPE){
    	$('#gdsNum').val(B_NO);
    	$('#B_TYPE').val(B_TYPE);
    	//itemDetailPopup
    	var  formData= $('#boardForm').serialize();
    	//alert(B_NO);
    /* 	$('.modal-body').append("afkjzxczxc"+$('#gdsNum').val());
     */	
    	
    	$.ajax({
    		url : "${pageContext.request.contextPath}/itemDetailPopup.do",
    		type : "post",
    		data : { gdsNum : B_NO },
    		success : function(result) {
    						
    		var obj=JSON.parse(result);
    		var detail = obj.detail ;
    		var imgList = obj.imgList ;
    		
    		$("#pp").html("");
    		
            $.each(detail, function( index, value ) {
       			$("#"+index+"").val(value);
       			//$("#pp").append(index+','+value+'<br>');
                console.log('element' ,index, value ); 
             });
            
    		 for (var i = 0; i <imgList.length; i++) {
    			  console.log('element', i, imgList[i]);
    			  console.log(imgList[i].gdsPrice);
    			  //$("#pp").append(i+','+imgList[i]+'<br>');
    			  //$("#pp").append(i+','+imgList[i].gdsPrice+'<br>');
    			  
    			  // #pp: 상세이미지 imgList div 영역
    			 /*  $("#pp").append(i+','+imgList[i].file+'<br>'); */
    			  
    			var img=imgList[i].file;
    			var file = $("#file").val(img);
    			var image="<c:url value='/img/"+img+"'/>"; //상품 상세 이미지
    			  $("#pp").append("<img class='card-img-top' src="+image+"><br><br>");
    /* 			  $("#pp").append(i+"<img class='card-img-top scale' src="+image+"><br>"); */
    			 
    			};
    			
    		
    		//상품상세설명
    		$("#name").html(detail.gdsName);
    		//상품상세설명
    		$("#price").html(detail.gdsPrice);
    		//상품상세설명
    /* 		$("#gdsStock").parent().parent().find('td').append(detail.gdsStock);
     */		//상품상세설명
    		//상품상세설명
    		$("#des").html(detail.gdsDes);
    		$("#des").html(detail.gdsDes);
    		
    		$("#orderForm #gdsName").val(detail.gdsName);
    		$("#orderForm #gdsPrice").val(detail.gdsPrice);
    		$("#orderForm #gdsStock").val(detail.gdsStock);
    /* 		$("#gdsStock").val(detail.gdsStock); */
    		$("#orderForm #totalPrice").val(detail.totalPrice);
    		$("#orderForm #gdsDes").val(detail.gdsDes);
    		
    		//$("#gdsDes").val("새로운 값을 지정합니다.");  //텍스트 에어리어에 새로 값을 지정.
    		
    		$("#rpsnImg").attr("src","<c:url value='/img/"+img+"'/>");
    		console.log('================================');
    		
    		$("#reviewDiv").html('zxczx');
    		$("#reviewDiv").append('<a href="#reviewPopup" class="nav-link" data-toggle="modal" onclick="fn_detail_pop('+detail.gdsNum+')">리뷰</a>');
    		
    		
    		
    		//제품상세(기존)
    		$("#create2").on("click",function(){ 
    			var gdsNum=$('#gdsNum').val();

    			//$(this).next().html("<button type='button' id='newButton'>ok</button>"); 
    			
    			fn_detail(gdsNum);
    			
    			});
    		
    		
    		//주문
    		$("#create").on("click",function(){ 
    			var userId = '${member.ID}';
    			if(userId.length==0){
    				alert('로그인 후 이용해주세요');
    			} else {
    				var gdsNum = $("#gdsNum").val();
    				var cartStock = 5;
    	/* 			var cartStock = $(".numBox").val(); */
    				//alert('gdsNum:'+gdsNum);
    				
    				var gdsNum = $("#gdsNum").val();
    				var userId = $("#userId").val();
    				var gdsName = $("#gdsName").val();
    				var gdsPrice = $("#gdsPrice").val();
    				var cartStock = $("#stock").val();
    				var gdsStock = cartStock;
    	/* 			var gdsStock = $(".numBox").val(); */
    				$('#gdsStock').val(gdsStock);
    				
    				var data = {
    						gdsNum : gdsNum,
    						gdsStock : gdsStock,
    						cartStock : cartStock,
    						gdsName : gdsName,
    						gdsPrice : gdsPrice,
    						orderProcessDetail : 'Y',
    						userId : userId ,
    						};
    				
    			$.ajax({
    					url : "/directOrderProcess.do",
    					type : "post",
    					data : data,
    					success : function(result){
    						$("#orderId").val(result.orderId);
    						
    						$('#orderForm').attr({
    	/* 					$('#boardForm').attr({ */
    							action : '<c:url value="/directOrderProcessDetail.do"/>',
    							target : '_self'
    						}).submit(); 
    					   	//location.replace("/directOrderProcessDetail.do");
    					},
    					error : function(){
    						alert("주문 실패");
    					}
    				});
    			
    			}
    			
    			
    			
    			});
    		// 주문
    		
    		}, // success 

    		error : function(xhr, status) {
    			alert(xhr + " : " + status);
    		}
    	});
    	
    }

</script>
<script>
Kakao.init('0280f7076bc693fac40abb703230b06b'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	window.Kakao.Auth.login({
       // scope: 'profile, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
        success: function(response) {
            console.log(response); // 로그인 성공하면 받아오는 데이터
            console.log(response.access_token);
            
            window.Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: function(response) {
                    console.log(response);
                    const kakao_account=response.kakao_account;
                    console.log(kakao_account);

                },
                fail: function(error) {
                    console.log(error);
                }
            });
/*            window.location.href= '<c:url value="/user/kakaoOauth.do"/>';
 */            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
        },
        fail: function(error) {
            console.log(error);
        }
    });
  }
  
  
function fn_order_detail_pop(orderId, pageType) {
	$('#orderId').val(orderId);
	
	var pageType=pageType;
	if(pageType!='orderMng')
		pageType='';

	$.ajax({
		url : "${pageContext.request.contextPath}/orderDetailViewPopup.do",
		type : "post",
		data : {
			orderId : orderId,
			pageType : pageType
			
		},
		success : function(result) {
			var obj = JSON.parse(result);
			var detailList = obj.detailList;
			var pageType = obj.pageType;
			var content = '<section id="content"><div class="table-responsive-lg"><table class="table">';

			for (var i = 0; i < detailList.length; i++) {
				console.log('element', i, detailList[i]);
				console.log(detailList[i].gdsName);
				var image = "<c:url value='/img/"+detailList[i].representative_file+"'/>";
				// #pp: 상세이미지 imgList div 영역
						
				content+='<colgroup><col width="*"><col width="20%"><col width="*"></colgroup>';
				content += '<tr><td rowspan="5">'
					+ "<img class='card-img-top' src=" + image
					+ " style='width:200px; height:auto'>"
					+ '</td><td colspan="2"></td></tr>';
				
				
				content += '<tr><td>번호</td><td>'
						+ (i+1) + '</td></tr>';
				content += '<tr><td>상품명</td><td>'
						+ (detailList[i].gdsName) + '</td></tr>';
				
				content += '<tr><td>주문 수량</td><td>'
						+ (detailList[i].cartStock) + '</td></tr>';
				content += '<tr><td>가격</td><td>'
						+ (detailList[i].amount) + '</td></tr>';

			}

			content += '</table></div></section>';
			$("#itemDetail").html(content);

			var orderContent = '<table class="table table-hover table-dark">';
			orderContent += '<tr><td>주문 번호</td><td>'
					+ (detailList[0].orderId) + '</td></tr>';
			orderContent += '<tr><td>주문 고객</td><td>'
					+ (detailList[0].userId) + '</td></tr>';
			orderContent += '<tr><td>연락처</td><td>'
					+ (detailList[0].orderPhon) + '</td></tr>';
			orderContent += '<tr><td>주소</td><td>'
					+ (detailList[0].userAddr) + ', '
					+ (detailList[0].userAddr2) + ', '
					+ (detailList[0].userAddr3) + '</td></tr>';
			orderContent += '</table>'

			$("#orderInfo").html('<hr>' + orderContent);
			
			var button='';
			
			if(pageType=='orderMng'){
				button+='<button type="button" onclick="fn_deliver('+detailList[0].orderId+')" class="btn btn btn-info btn-sm float-right ml-1">발송</button>'
				button+='<button type="button" onclick="fn_cancel('+detailList[0].orderId+')" class="btn btn btn-danger btn-sm float-right ml-1">취소</button>'
			}
			button+='<button type="button" class="btn btn-secondary btn-info btn-sm float-right ml-1"" data-dismiss="modal">확인</button>'
			$(".modal-footer").html('<hr>' + button);
			

		}
	});
}

function fn_customer_detail_pop(userId) {
	$('#userId').val(userId);

	$.ajax({
		url : "${pageContext.request.contextPath}/mng/customerDetailopup.do",
		type : "post",
		data : {
			userId : userId
		},
		success : function(result) {
			var obj = JSON.parse(result);
			//var detail = obj.detail ;
			var detail = obj.detail;
			var content = '<section id="content"><div class="table-responsive-lg"><table class="table">';

				console.log(detail.gdsName);
				content+='<colgroup><col width="30%"><col width="*"></colgroup>';
				content += '<tr><td>아이디</td><td>'
						+ (detail.ID) + '</td></tr>';
				content += '<tr><td>이름</td><td>'
						+ (detail.NAME) + '</td></tr>';
				content += '<tr><td>주소</td><td>'
						+ (detail.ADDRESS) + '</td></tr>';
				content += '<tr><td>연락처</td><td>'
						+ (detail.CONTACT) + '</td></tr>';
				content += '<tr><td>휴대폰번호</td><td>'
						+ (detail.PHONE) + '</td></tr>';
				content += '<tr><td>이메일</td><td>'
						+ (detail.EMAIL) + '</td></tr>';

			content += '</table></div></section>';
			$("#itemDetail").html(content);

		}
	});
}
  
  
  
  

function fn_review_popup(orderId, pageType) {
	$('#orderId').val(orderId);
	
	var pageType=pageType;
	if(pageType!='orderMng')
		pageType='';

	$.ajax({
		url : "${pageContext.request.contextPath}/reviewPopup.do",
		type : "post",
		data : {
			orderId : orderId,
			pageType : pageType
			
		},
		success : function(result) {
			var obj = JSON.parse(result);
			var detailList = obj.detailList;
			var pageType = obj.pageType;
			var content = '<section id="content"><div class="table-responsive-lg"><table class="table">';

			for (var i = 0; i < detailList.length; i++) {
				console.log('element', i, detailList[i]);
				console.log(detailList[i].gdsName);
				var image = "<c:url value='/img/"+detailList[i].representative_file+"'/>";
				// #pp: 상세이미지 imgList div 영역
						
				content+='<colgroup><col width="*"><col width="20%"><col width="*"></colgroup>';
				content += '<tr><td rowspan="5">'
					+ "<img class='card-img-top' src=" + image
					+ " style='width:200px; height:auto'>"
					+ '</td><td colspan="2"></td></tr>';
				
				
				content += '<tr><td>번호</td><td>'
						+ (i+1) + '</td></tr>';
				content += '<tr><td>상품명</td><td>'
						+ (detailList[i].gdsName) + '</td></tr>';
				
				content += '<tr><td>주문 수량</td><td>'
						+ (detailList[i].cartStock) + '</td></tr>';
				content += '<tr><td>가격</td><td>'
						+ (detailList[i].amount) + '</td></tr>';

			}

			content += '</table></div></section>';
			$("#a").html(content);

			var orderContent = '<table class="table table-hover table-dark">';
			orderContent += '<tr><td>주문 번호</td><td>'
					+ (detailList[0].orderId) + '</td></tr>';
			orderContent += '<tr><td>주문 고객</td><td>'
					+ (detailList[0].userId) + '</td></tr>';
			orderContent += '<tr><td>연락처</td><td>'
					+ (detailList[0].orderPhon) + '</td></tr>';
			orderContent += '<tr><td>주소</td><td>'
					+ (detailList[0].userAddr) + ', '
					+ (detailList[0].userAddr2) + ', '
					+ (detailList[0].userAddr3) + '</td></tr>';
			orderContent += '</table>'

			$("#b").html('<hr>' + orderContent);
			
			var button='';
			
			if(pageType=='orderMng'){
				button+='<button type="button" onclick="fn_deliver('+detailList[0].orderId+')" class="btn btn btn-info btn-sm float-right ml-1">발송</button>'
				button+='<button type="button" onclick="fn_cancel('+detailList[0].orderId+')" class="btn btn btn-danger btn-sm float-right ml-1">취소</button>'
			}
			button+='<button type="button" class="btn btn-secondary btn-info btn-sm float-right ml-1"" data-dismiss="modal">확인</button>'
			$(".modal-footer").html('<hr>' + button);
			

		}
	});
}  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    } else{
    	//window.location.href= '<c:url value="/user/logout.do"/>';

    	
    }
  }  
</script>


<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample2_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample2_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample2_postcode').value = data.zonecode;
                document.getElementById("sample2_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample2_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>