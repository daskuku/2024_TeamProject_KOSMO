<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link href="/style/main/loginFormStyle.css" rel="stylesheet">
<script src="/js/main/loginFormScript.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<%
if( request.getAttribute( "flag" ) != null && !request.getAttribute( "flag" ).equals( "" ) ) {
	int flag = (Integer)request.getAttribute( "flag" );
	
	out.println( " <script type='text/javascript'> " );
	if( flag == 0 ) {	//로그인성공
		out.println( " alert('로그인에 성공했습니다.'); " );
		out.println( " location.href='./home.do'" );
	} else if( flag == 1 ) {	//비번틀림
		out.println( " alert('비밀번호가 틀립니다.'); " );
		out.println( " location.href='./loginForm.do' " );
	} else if( flag == 2 ) {	//회원정보없음
		out.println( " alert('회원정보가 없습니다. 회원가입해주세요.'); " );
		out.println( " location.href='./loginForm.do' " );
	} else {					//기타 에러났을 때 또는 맨처음 시작
		out.println( " location.href='./loginForm.do' " );
	}
	out.println( " </script> " );
}
%>

<script>

window.Kakao.init("c40a24972ddf874831b7ec6734025145");

function kakaoLogin() {
    window.Kakao.Auth.login({
        scope: 'profile_nickname', // 기본 프로필 정보만 요청
        success: function(authObj) {
            window.Kakao.API.request({
                url: '/v2/user/me',
                success: res => {
                    const name = res.properties.nickname;
                    
                    console.log(name);
                    
                    // form의 hidden input에 값 설정
                    $('#kakaoname').val(name);
                    
                    // 특정 URL로 리디렉션
                    window.location.href = "/loginProc.do";
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        },
        fail: function(error) {
            console.log(error);
        }
    });
}

	function doLogin()
	{
		var midobj=$(".mid");
		var pwdobj=$(".password");
		
		var mid = midobj.val();
		var password = pwdobj.val();
		
		if(mid.trim() == '') {
	        alert("아이디를 입력해주세요.");
	        midobj.val("");
	        return;
	    }
		
		if(password.trim() == '') {
	        alert("비밀번호를 입력해주세요.");
	        pwdobj.val("");
	        return;
	    }
		
		/* if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(mid) == false)
		{	

			alert("아이디는 영어 대/소문자 와 숫자로만 입력 가능합니다. 5 ~ 20자 이내")
			midobj.val("");
			return;
		}
		
		
		if(new RegExp(/^[a-zA-Z0-9]{5,20}$/).test(pwdobj.val()) == false)
		{
			alert("암호는 영어 대/소문자 와 숫자로만 입력 가능합니다. 5~20자 이내")
			pwdobj.val("");
			return;		
		} */
		
		
		$.ajax({
			//----------------------------------------------------------
			//WAS 에 접속할 URL 주소 지정
			//----------------------------------------------------------
			url   : "/loginProc.do" 
			//----------------------------------------------------------
			//form 태그 안의 입력양식 데이터. 즉, 파라미터값을 보내는 방법 지정.
			//----------------------------------------------------------
			,type : "post"
			//----------------------------------------------------------
			//WAS 에 보낼 파라미터명과 파라미터값을 설정하기  ?파라미터명=파라미터값&파라미터명=파라미터값~~
			//----------------------------------------------------------
			,data : $("[name='loginForm']").serialize()
					//,data : "mid =" + mid + "&pwd =" + pwd
					//,data : {"mid":mid, "pwd":pwd} <-JSON // serialize() 방식 말고 이 두 가지 방법도 가능함.
			//----------------------------------------------------------
			//WAS 의 응답을 성공적으로 받았을 경우 실행할 익명함수 설정.
			//이때, 익명함수의 매개변수로 WAS 의 응답물이 들어 온다.
			//----------------------------------------------------------
				//--------------------------
				//WAS 의 응답물이
				//1행1열의 데이터라면 숫자 or 문자로 들어오고
				//1행n열의 데이터라면 JSON 으로 들어오고
				//n행1열의 데이터라면 Array 으로 들어오고
				//n행m열의 데이터라면 다량의 JSON 이 저장된 Array 객체로 들어온다.
				//--------------------------
				
			,success : function(midpwdCnt){
				//--------------------------
				//만약에 매개변수의 데이터가 1이면
				//만약에 WAS 가 응답한 데이터가 1이면
				//만약에 아이디와 암호의 존재 개수가 1이면
				//--------------------------
				if(midpwdCnt == 1)
				{
					//--------------------------
					//alert("로그인 성공")
					//location 객체의 href 메소드를 호출하여
					//WAS로 URL 주소 '/boardList.do' 로 접속시도하고 
					//새로운 HTML 문서를 받아서 현재 화면에 실행한다.
					//즉, 새로운 화면을 연다.
					//<주의> href 메소드를 호출하여
					//WAS로 접속 할때는 get 방식으로 접속한다.
					//--------------------------
					location.href='/mainForm.do';
				}
				else
				{
					alert("로그인 실패")
				}
			}
			,error 	 : function(){alert("오류 발생!")}
			
		}) 
	}
	
	function enterkey()
	{
	   
	   if(window.event.keyCode == 13)
	   {
		   doLogin();
	   }
	}
	
</script>

</head>
<body>
    <%@ include file="/WEB-INF/jsp/header.jsp" %>
    <div class="loginFormContainer">
    	<div class="loginTitle">
    		<p>로그인</p>
    	</div>
		<form name="loginForm" onsubmit="return false">
			<table align="center" style="margin-top:100px;">
				<tr>
					<th class="loginFormMidTh">아이디</th>
					<td>
						<input type="text" name="mid" class="mid" style="width: 305px; height: 30px; margin-right: 100px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;">
						<!-- class 값은 JQuery, CSS에서 통합적으로 사용하기 위해 설정 -->
						<!-- name 값은 파라미터명="파라미터값"으로 사용되며 대부분의 경우 DB의 Column명과 일치함 -->
					</td>
				</tr>
				<tr><td></td></tr>
				<tr>
					<th class="loginFormPwdTh">비밀번호</th>
					<td>
						<input type="password" name="password" class="password" style="width: 305px; height: 30px; border-radius: 10px; border: 1px solid #c59246e0; padding: 5px 15px;" onkeyup="enterkey()">
					</td>
				</tr>
			</table>
			<div class="loginAndautoLogin">
				<input type="button" value="로그인" class="loginbtn" onclick="doLogin()">
			</div>
			<div class="memberRegAndInfoFind">
				<input type="button" value="회원가입" class="regBtn" style="cursor:pointer" onclick="location.replace('/memberRegForm.do')">
				<input type="button" value="회원정보찾기" class="memberInfoFindBtn" style="cursor:pointer" onclick="location.replace('/memberInfoFindForm.do')">
			</div>
			<!-- <div class="kakaobtn">		
				<input type="hidden" name="kakaoname" id="kakaoname" />
				<a href="javascript:kakaoLogin();"> 
					<img src="/image/kakao_login_medium_narrow.png">
				</a>
			</div> -->
			<p style="color: #999999; text-align: center; margin-top: 10px;"> * 관리자 모드가 있음 </p>
			
		</form>
		
	</div>
	<%@ include file="/WEB-INF/jsp/footer.jsp" %>
</body>
</html>
