<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.1.min.js"></script>

<title>Insert title here</title>
</head>
<body>

	<div class='wrap'>
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h3>
					<i class="fas fa-paper-plane"></i> Tip Board
				</h3>
				<div>
					<ul>
						<li><a
							href="/secondProject/kr/co/tripadvisor/board/writeform">- 글쓰기</a></li>
					</ul>
				</div>
				<h3>
					<i class="fas fa-camera-retro"></i> Gallery
				</h3>
				<div>
					<ul>
						<li><a href="#">- 사진 올리기</a></li>
					</ul>
				</div>
				<h3 id="menuScrap">
					<a href="/secondProject/kr/co/tripadvisor/member/scrap/scrapList"> <i
						class="fas fa-tags"></i> 스크랩
					</a>
				</h3>
				<h3>
					<a href="#"> <i class="far fa-smile"></i> 회원정보
					</a>
				</h3>
			</div>
			<!-- accordion_navi 끝 -->
		</aside>
		<!-- *************본문************* -->
		<article>
<!-- 스크랩 페이지 틀 -->
<h2>MyInfo페이지 접속성공</h2>

<!-- info form에 session에 있는 user정보 불러오고 -->
<!-- 사용자가 수정해서 submit하면 
updateuser controller에서 처리하고 : updateuser맵퍼... '성공적으로 수정되었습니다' 얼럿
/user/info 페이지로 리다이렉트-->

<form id="info" method="post" action="${pageContext.request.contextPath}/kr/co/tripadvisor/user/update">
		<p><label>ID</label><input type="text" name="id" value="${sessionScope.user.id}" readonly /></p>
		<p><label>Password</label><input type="password" name="pass" value="${sessionScope.user.pass}" id="infopass"/></p>
		<p><label>PasswordCheck</label><input type="password" value="${sessionScope.user.pass}" id="infopasscheck"/></p>
		<p id="infopassresult"></p>	 
		<p><label>Email</label><input type="text" name="email" id="infoemail" value="${sessionScope.user.email}"/>
		<button type="button" id="infoauth" class="email_but">EmailAuth</button></p>
		<input type='text' id='infouserauth' placeholder='인증번호를 입력하세요.' maxlength=5 />
		<p><label>Name</label><input type="text" name="name" id="infoname" value="${sessionScope.user.name}" readonly/></p>
		<p><label>BirthDate</label><input type="text" placeholder="19700101" maxlength="8" name="birth" id="birth" value="${sessionScope.user.birth}" readonly/></p>
		<p><input type="submit" value="수정" class="login_but" id="infobut" /></p>
</form>

<script type="text/javascript">

			$("#infopasscheck").keyup(function (e) {
				
				$.ajax({
					url: "/${sessionScope.user.email}/kr/co/tripadvisor/user/signajax",
					type: "post",
					data: {
					pass : $("#infopass").val(),
					passcheck : $("#infopasscheck").val()
					},
					dataType: "json",
					success: function (data) {
						var result = "";
						if(data.passresult == 'false') {
						result = "비밀번호가 일치하지 않습니다.";
						}
						$("#infopassresult").text(result);
					}
				});
			});

			$("#infoemail").keyup(function (e) {
				 $("#infobut").attr("type", "button");
			});

			$("#infoauth").click(function (e) {
 		 		$.ajax({
					url: "/${sessionScope.user.email}/kr/co/tripadvisor/user/emailauth",
					type: "post",
					data: {
					email :  $("#info input[name='email']").val()
					},
					dataType: "json",
					success: function (data) {
						console.log(data)
						  $("#infouserauth").keyup(function () {
							  if(this.value.length == 5) {  
							  if(this.value==data.authNum) {
								  alert("이메일 인증 성공:계속 작성해주십시오.");
								  $("#infobut").attr("type", "submit");
							  } else {
								  alert("이메일 인증 실패:다시 입력해주십시오.");
								  $("#infobut").attr("type", "button");
								  
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


<button id="withdraw">탈퇴</button>
<script type="text/javascript">
$("#withdraw").click(function (e) {
	if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
		location.href= "${pageContext.request.contextPath}/kr/co/tripadvisor/user/delete"; 
	}else{   //취소
	    return;
	}
});
</script>

</article>
</div> <!-- wrap -->
	<script type="text/javascript">
		$(function() {// jQuery 시작 / 메뉴 마우스 오버 효과
			$(".accordion_navi > div").hide();
			$(".accordion_navi h3").mouseover(function() {
				if (!($(this).hasClass("selected"))) {
					$(".accordion_navi > h3").removeClass("selected");
					$(this).addClass("selected");
					$(".accordion_navi>div").not().slideUp("slow");
					$("+div", this).slideDown("slow"); //$(this).find("+div")
				}
			})

		}); //jQuery 종결
	</script>
</body>
</html>