<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<form action="" class="login_form modal" id="findIdForm" style="display: none;">
<div id="idResult">
 <h1>아이디 찾기</h1>
 이름    : <input type="text" name="name"/><br>
 이메일 : <input type="text" name="email"/><br>
  <button type="button" id="findId">찾기</button>
</div>
  <script>
	$("#findId").click(function (e) {
	 		$.ajax({
			url: "${pageContext.request.contextPath}/user/find",
			type: "post",
			data: {
			name :  $("#findIdForm input[name='name']").val(),
			email :  $("#findIdForm input[name='email']").val()
			},
			dataType: "json",
			success: function (data) {
				console.log(data);
				$("#idResult").html("<h2>회원님의 아이디는 "+data.id+"입니다.</h2>");
				if(data.id == 'null') {
					$("#idResult").html("일치하는 회원정보가 없습니다.");
				}
				$(".close-modal").click(function () {
					$("#findIdForm").submit();
				});
			}, //sucsess
			error: function(){
				$("#idResult").html("처리 중 오류가 발생하였습니다.");
				$(".close-modal").click(function () {
					$("#findIdForm").submit();
				});
			}
		}); //ajax
	}); // click
  </script>
</form>

<form action="" class="login_form modal" id="findPassForm" style="display: none;">
<div id="passResult">
 <h1>비밀번호 찾기</h1>
 아이디 : <input type="text" name="id"/><br>
 이메일 : <input type="text" name="email"/><br>
 <button type="button" id="findPass">찾기</button>
</div>
   <script>
	$("#findPass").click(function (e) {
	 		$.ajax({
			url: "${pageContext.request.contextPath}/user/find",
			type: "post",
			data: {
			id : $("#findPassForm input[name='id']").val(),
			email : $("#findPassForm input[name='email']").val()
			},
			dataType: "json",
			success: function (data) {
				console.log(data);
				$("#passResult").html("<h2>회원님의 비밀번호는 "+data.pass+"입니다.</h2>");
				if(data.pass == 'null') {
					$("#passResult").html("일치하는 회원정보가 없습니다.");
				}
				$(".close-modal").click(function () {
					$("#findPassForm").submit();
				});
			}, //sucsess
			error: function(){
				$("#passResult").html("처리 중 오류가 발생하였습니다.");
				$(".close-modal").click(function () {
					$("#findPassForm").submit();
				});
			}
		}); //ajax
	}); // click
  </script>
</form>




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
	<a href="#findIdForm" rel="modal:open" style="color:gray">아이디찾기</a>|<a href="#findPassForm" rel="modal:open" style="color:gray">비밀번호찾기</a>
	
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
					if(data.idresult==0) {
						$("#idresult").text("사용 가능한 아이디 입니다.");
// 						$('#signBut').off("click");
// 					    $("#signBut").attr("type", "submit");
					}else {
						$("#idresult").text("이미 사용중인 아이디 입니다.");
// 						$("#signBut").attr("type", "button");
// 						$("#signBut").click(function (e) {
// 							  alert("이미 사용중인 아이디 입니다.");
// 						})
// 						$("#signBut").focus().select();
					}
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
					if(data.passresult == 'false') {
						$("#passresult").text("비밀번호가 일치하지 않습니다.");
// 						$("#signBut").attr("type", "button");
// 						$("#signBut").click(function (e) {
// 							  alert("입력하신 비밀번호가 일치하지 않습니다.");
// 						})
					}else {
						$("#passresult").text("");
// 						$('#signBut').off("click");
// 					    $("#signBut").attr("type", "submit");
					}
				}
				
			});
		});
		</script>
		
		
		<p><label>Email</label><input type="text" name="email" id="email"/></p>
		<p id="emailresult"><p>
		<p><button type="button" id="auth" class="email_but">EmailAuth</button></p><br>
<!-- 		<p id="authNum"></p> -->
		<input type="text" id="userauth" placeholder="인증번호를 입력하세요." maxlength=5 />
		
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
					if(data.emailresult==0) {
						$("#emailresult").text("가입 가능한 이메일 입니다.");	
// 						$('#signBut').off("click");
// 					    $("#signBut").attr("type", "submit");
					}else {
						$("#emailresult").text("이미 가입된 이메일 입니다.");
// 						$("#signBut").attr("type", "button");
// 						$("#signBut").click(function (e) {
// 							  alert("이미 가입된 이메일 입니다.");
// 						})
					}
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
// 						$("#authNum").html("<input type='text' id='userauth' placeholder='인증번호를 입력하세요.' maxlength=5 />");
// 						  $("#signBut").attr("type", "button");
						  $("#userauth").keyup(function () {
							  if(this.value.length == 5) {  
							  if(this.value==data.authNum) {
								  alert("이메일 인증 성공:계속 작성해주십시오.");
// 									$('#signBut').off("click");
								    $("#signBut").attr("type", "submit");
							  } else{
								  alert("이메일 인증 실패:다시 입력해주십시오.");
// 								  $("#signBut").attr("type", "button");
// 								  $("#signBut").click(function (e) {
// 									    alert("이메일 인증번호가 올바르지 않습니다.");
// 									})
								  
							 	 }
							  } else if(this.value.length < 5) {
// 								  $("#signBut").attr("type", "button");
// 								  $("#signBut").click(function (e) {
// 									    alert("이메일 인증번호가 올바르지 않습니다.");
// 									})
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
		 	 <p><input type="button" value="SIGN UP" class="login_but" id="signBut" /></p>
		</form>