<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- board_list css -->
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/board_list.css" media="all">
	<!-- paging css -->
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/paging.css" media="all">
	
</head>
<body>
	<div class='wrap'>
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h5>
					<i class="fas fa-paper-plane"></i> Tip Board
				</h5>
				<div>
					<ul>
						<li><a href="/secondProject/kr/co/tripadvisor/board/writeform">- 글쓰기</a></li>
					</ul>
				</div>
				<h5>
					<i class="fas fa-camera-retro"></i> Gallery
				</h5>
				<div>
					<ul>
						<li><a href="#">- 사진 올리기</a></li>
					</ul>
				</div>
				<h5 id="menuScrap">
					<a href="/secondProject/kr/co/tripadvisor/client/scrapList"><i class="fas fa-tags"></i> 스크랩</a>
				</h5>
				<h5>
					<a href="#"><i class="far fa-smile"></i> 회원정보</a>
				</h5>
			</div>
			<!-- accordion_navi 끝 -->
		</aside>
		
	<article>
	<div id="noticeTitle">공지 사항</div><p>
		<div class="container-fluid"><p><p>
			<div class="row">
	      		<div class="col-md-1"></div>
    	  		<div class="col-md-10" id="title">
     	 			<h5>${notice.title}</h5>
     	 		</div>
     		</div>
			<div class="row">
      			<div class="col-md-1"></div>
      			<div class="col-md-5" id="writer">
      				<i class="fa fa-user-o"></i><span>${notice.id}</span>
      			</div>
      			<div class="col-md-5" id="info">
      				<i class="fa fa-calendar-check-o"></i><span>&nbsp;작성일&nbsp;</span><strong><fmt:formatDate value="${notice.regDate}" pattern="yyyy/MM/dd HH:mm:ss" /></strong>
      				<span> | </span>
      				<i class="fa fa-eye"></i><span>조회수</span><strong>${notice.viewCnt}</strong>
      			</div>
      		</div>
      <div class="row">
      	<div class="col-md-1"></div>
      	<div class="col-md-10" id="content">
      		${notice.content}
      	</div>
      </div>
      <p>
    </div>
    <div align="right">
	    <a href="${pageContext.request.contextPath}/kr/co/tripadvisor/notice/list">목록으로 돌아가기</a>
    </div>
	</article>
</div>		
		
		
	<!-- script 영역 -->
	<script type="text/javascript">
		$(function() {// jQuery 시작 / 메뉴 마우스 오버 효과
			$(".accordion_navi > div").hide();
			$(".accordion_navi h5").mouseover(function() {
				if (!($(this).hasClass("selected"))) {
					$(".accordion_navi > h5").removeClass("selected");
					$(this).addClass("selected");
					$(".accordion_navi>div").not().slideUp("slow");
					$("+div", this).slideDown("slow"); //$(this).find("+div")
				}
			})

		}); //jQuery 종결
	
	$("document").ready(function () {
		$("article").css("margin", "0px 30px").css("padding-top","20px");
		$("#noticeTitle").css("font-size", "30px").css("font-weight", "bold").css("padding-bottom", "5px");
		$("table").css("border", "0.3px solid black").css("border-collapse", "collapse");
		$("table th").css("border", "0.3px solid black");
		$("table tr").css("border", "0.3px solid black");
		$("table tr td").css("border", "0.3px solid black");
		$("#title").css("border-top", "2px solid slategray").css("background", "#3C8DBC").css("color", "white");
		$("#writer").css("padding", "10px 15px").css("border-top", "0.3px solid slategray").css("border-bottom", "0.3px solid slategray")
					.css("font-size", "12px");
		$("#info").css("text-align", "right").css("padding", "10px 15px").css("border-top", "0.3px solid slategray")
				.css("border-bottom", "0.3px solid slategray").css("font-size", "12px");
		$("#content").css("height", "300px").css("padding","20px").css("overflow", "auto")
					.css("border-bottom", "0.3px solid slategray");
		$("div.col-md-5 span").css("padding-left", "5px").css("padding-right", "5px");
	});
	</script>

</body>
</html>