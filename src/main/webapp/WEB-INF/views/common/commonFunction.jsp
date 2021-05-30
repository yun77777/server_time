<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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