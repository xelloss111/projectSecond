<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>

</head>
<body>

<header class='header' style="background-color: skyblue;"><a href="/secondProject/kr/co/tripadvisor/index.jsp" class='nav_logo'><span>tripadvisor</span></a>

	<nav>
		<ul>
			<li class="nav_ui topBotomBordersOut"><a href="/secondProject/kr/co/tripadvisor/board/list"> <i
					class="fas fa-paper-plane"></i> Tip Board
			</a></li>
			<li class="nav_ui topBotomBordersOut"><a href="/secondProject/gallery/index"> <i
					class="fas fa-camera-retro"></i> Gallery
			</a></li>
			<li class="nav_ui topBotomBordersOut"><a href="#"> <i
					class="fas fa-check-circle"></i> Notice
			</a></li>
		</ul>
	</nav>
	
	<div class='login_ui'>
		<c:choose>
		<c:when test="${empty sessionScope.user}">
			<a href="#ex1" rel="modal:open">LOGIN</a> &nbsp; &nbsp; 
		</c:when>
		<c:otherwise>
			${sessionScope.user.name}님 접속
			<a href="<c:url value="/user/logout" />">LOGOUT</a>
		</c:otherwise>
		</c:choose>	
		
			
		<c:choose>
		<c:when test="${empty sessionScope.user}">
		<a href="#ex2" rel="modal:open">SIGN UP</a>
		</c:when>
		<c:otherwise>
		<a href="<c:url value="/user/mypage" />">MY PAGE</a>
		</c:otherwise>
		</c:choose>	
		
	</div>
</header>


<!-- Modal HTML embedded directly into document -->
<form action="${pageContext.request.contextPath}/user/login" class="login_form modal" id="ex1" style="display: none;">
	<h1>LOGIN</h1>
	<br> <br>
	<p>
		<label>ID</label><input type="text" name="id" />
	</p>
	<p>
		<label>Password</label><input type="password" name="pass" />
	</p>
	<p>
		<input type="submit" value="LOGIN" class="login_but" />
	</p><br>
	<a href="" style="color:gray">아이디찾기</a>|<a href="" style="color:gray">비밀번호찾기</a>
	
<!-- 네이버 로그인 영역 -->
		<div id="naverIdLogin">
			<a id="naverIdLogin_loginButton" href="#" role="button"><img src="https://static.nid.naver.com/oauth/big_g.PNG" width=320></a>
		</div>
</form>
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "TFVjBEkov7Mxr3z9S3wC",
				callbackUrl: "http://localhost:8000/secondProject/kr/co/tripadvisor/member/naverlogin.jsp",
				isPopup: false, /* 팝업을 통한 연동처리 여부 */
				loginButton: {color: "white", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
			}
		);
		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
		
		</script>
	
	
<!-- Modal HTML embedded directly into document -->
<form method="post" action="${pageContext.request.contextPath}/user/singup" class="login_form modal" id="ex2" style="display:none;">
	<h1> SIGN UP </h1><br><br>
		<p><label>ID</label><input type="text" name="id" id="id"/></p>
		<p id="idresult"><p>
		<script>
		$("#id").keyup(function (e) {
			
			$.ajax({
				url: "/secondProject/signajax",
				type: "post",
				data: {
				id :  $("#id").val()
				},
				dataType: "json",
				success: function (data) {
					var result = "이미 사용중인 아이디 입니다.";
					if(data.idresult==0) {
						result = "사용 가능한 아이디 입니다.";		
					}
					$("#idresult").text(result);
				}
			});
		});
		</script>
		
		
		<p><label>Password</label><input type="password" name="pass" id="pass"/></p>
		<p><label>PasswordCheck</label><input type="password" id="passcheck"/></p>	 
		<p id="passresult"></p>
		
		<script>
		$("#passcheck").keyup(function (e) {
			
			$.ajax({
				url: "/secondProject/signajax",
				type: "post",
				data: {
				pass : $("#pass").val(),
				passcheck : $("#passcheck").val()
				},
				dataType: "json",
				success: function (data) {
					var result = "";
					if(data.passresult == 'false') {
					result = "비밀번호가 일치하지 않습니다.";
					}
					$("#passresult").text(result);
				}
			});
		});
		</script>
		
		
		<p><label>Email</label><input type="text" name="email" id="email"/></p>
		<p id="emailresult"><p>
		<p><button type="button" id="auth" class="email_but">EmailAuth</button></p><br>
		<p id="authNum"></p>
		
		<script>
		$("#email").keyup(function (e) {
			
			$.ajax({
				url: "/secondProject/signajax",
				type: "post",
				data: {
				email :  $("#email").val()
				},
				dataType: "json",
				success: function (data) {
					var result = "이미 가입된 이메일 입니다.";
					if(data.emailresult==0) {
						result = "가입 가능한 이메일 입니다.";		
					}
					$("#emailresult").text(result);
				}
			});
		});
		</script>
		
		
			<script type="text/javascript">
 		 	$("#auth").click(function (e) {
 		 		e.preventDefault();
 		 		console.log(e);

 		 		$.ajax({
					url: "/secondProject/emailauth",
					type: "post",
					data: {
					email :  $("#ex2 input[name='email']").val()
					},
					dataType: "json",
					success: function (data) {
					   console.log(data);
						$("#authNum").html("<input type='text' id='userauth' placeholder='인증번호를 입력하세요.' maxlength=5 />");
						  $("#userauth").keyup(function () {
							  if(this.value.length == 5) {  
							  if(this.value==data.authNum) {
								  alert("이메일 인증 성공:계속 작성해주십시오.");
								  $("#name").prop("disabled", false);
								  $("#birth").prop("disabled", false);
								  $("#name").attr("style", "");
								  $("#birth").attr("style", "");
							  } else {
								  alert("이메일 인증 실패:다시 입력해주십시오.");
								  this.focus();
								  this.select();
								  $("#name").prop("disabled", true);
								  $("#birth").prop("disabled", true);
								  $("#name").attr("style", "background-color:#aaa");
								  $("#birth").attr("style", "background-color:#aaa");
								  
							 	 }
							  }
						  });
					}, //sucsess
					
					error: function(request,status,error){
				        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				}); //ajax
			}); // $auth
 		 	 </script>
		 	 <p><label>Name</label><input type="text" name="name" id="name"/></p>
		 	 <p><label>BirthDate</label><input type="text" placeholder="19700101" maxlength="8" name="birth" id="birth"/></p>
		 	 <p><label>Gender</label>
		 	 <label for="male">&nbsp;&nbsp;male<input type="radio" id="male" name="sex" value="1" /></label>
             <label for="female">&nbsp;&nbsp;female<input type="radio" id="female" name="sex" value="2" /></label>
			 </p>
		 	 <p><input type="submit" value="SIGN UP" class="login_but" /></p>
		</form>
		</body>
		</html>