<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/client/gallery_common.css" media="all">
<title>Insert title here</title>
<style>
#d1 {
 text-align: center;
 padding-top: 50px;
}
.passbut {
border: 1px solid #aaa;
padding: 3.5px;
}
</style>
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
							href="${pageContext.request.contextPath}/kr/co/tripadvisor/board/writeform">- 글쓰기</a></li>
					</ul>
				</div>
				<h3>
					<i class="fas fa-camera-retro"></i> Gallery
				</h3>
				<div>
					<ul>
						<li><a href="${pageContext.request.contextPath}/kr/co/tripadvisor/gallery/writeform">- 사진 올리기</a></li>
					</ul>
				</div>
				<h3 id="menuScrap">
					<a href="${pageContext.request.contextPath}/kr/co/tripadvisor/user/scrap/scrapList"> <i
						class="fas fa-tags"></i> 스크랩
					</a>
				</h3>
				<h3>
					<a href="${pageContext.request.contextPath}/kr/co/tripadvisor/user/info"> <i class="far fa-smile"></i> 회원정보
					</a>
				</h3>
			</div>
			<!-- accordion_navi 끝 -->
		</aside>
		<!-- *************본문************* -->
		<article>
<!-- 스크랩 페이지 틀 -->

<!-- 비밀번호 재확인  : MypageController + mypage.jsp
세션에 있는 id랑 비밀번호가 일치하면 info.jsp 페이지(infouser controller타고)
-->

<div id="d1">
<h2>비밀번호를 입력하십시오.</h2>
<input type="password" name="infopass" id="infopass"/>
<button id="infopasscheck" type="button" class="passbut">확인</button>
<br><br><br>
<p>*네이버로그인회원은 탈퇴만 가능합니다.</p>
<button type="button" id="withdraw" style="color:red">네이버로그인 정보삭제</button>
</div>

<script type="text/javascript">
$("#withdraw").click(function (e) {
	if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
		location.href= "${pageContext.request.contextPath}/kr/co/tripadvisor/user/delete"; 
	}else{   //취소
	    return;
	}
});
</script>




<script>

$("#infopasscheck").click(function (e) {
	$.ajax({
		url: "/secondProject/kr/co/tripadvisor/user/passcheck",
		type: "post",
		data: {
		infopass :  $("input[name='infopass']").val()
		},
		dataType: "json",
		success: function (data) {
			console.log(data.result);
			if( data.result == "true") {
				window.location = "${pageContext.request.contextPath}/kr/co/tripadvisor/user/updateform.jsp";
			} else {
				alert("비밀번호가 틀렸습니다.");
			}
		}
		
	});
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