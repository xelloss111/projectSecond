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
		<a href="#ex2" rel="modal:open">SIGN UP</a>
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
	</p>
</form>
<!-- Modal HTML embedded directly into document -->
<!-- Modal HTML embedded directly into document -->
<form method="post" action="${pageContext.request.contextPath}/user/singup" class="login_form modal" id="ex2" style="display:none;">
	<h1> SIGN UP </h1><br><br>
		<p><label>ID</label><input type="text" name="id"/></p>
		<p><label>Password</label><input type="password" name="pass"/></p>
		<p><label>PasswordCheck</label><input type="password" /></p>	 
		<p><label>Email</label><input type="text" name="email" id="email"/>
		<button type="button" id="auth" class="email_but">EmailAuth</button></p>
		<p id="authNum"></p>
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