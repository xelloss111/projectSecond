<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
	<!-- board_list css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/client/board_list.css" media="all">
	<!-- paging css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/client/paging.css" media="all">
	<!-- gallery css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/client/thumbnail-gallery.css">
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
		<!-- 본문 -->
		<article>

			<div class="search_area">
				<form action="" method="post">
					<div class="search_ctn">
						<div class="search_div1">
							<ul>
								<li class="search_li">주제 :</li>
								<li class="check_li"><input type="checkbox" id="s1" name="attract"
									name="subject" value="1001" /><label for="s1">맛집</label></li>
								<li class="check_li"><input type="checkbox" id="s2" name="attract"
									name="subject" value="1003" /><label for="s2">숙소</label></li>
								<li class="check_li"><input type="checkbox" id="s3" name="attract"
									name="subject" value="1002" /><label for="s3">명소</label></li>
							</ul>
						</div>

						<div class="search_div2">
							<ul>
								<li class="search_li">지역 :</li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r1" name="area"
									value="2001" /> <label for="r1">서울</label></li>
								<li><input type="checkbox" id="r2" name="area"
									value="2005" /> <label for="r2">인천</label></li>
								<li><input type="checkbox" id="r3" name="area"
									value="2009" /> <label for="r3">대전</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r4" name="area"
									value="2002" /> <label for="r4">광주</label></li>
								<li><input type="checkbox" id="r5" name="area"
									value="2006" /> <label for="r5">부산</label></li>
								<li><input type="checkbox" id="r6" name="area"
									value="2010" /> <label for="r6">대구</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r7" name="area"
									value="2003" /> <label for="r7">경기</label></li>
								<li><input type="checkbox" id="r8" name="area"
									value="2007" /> <label for="r8">강원</label></li>
								<li><input type="checkbox" id="r9" name="area"
									value="2011" /> <label for="r9">충청</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r10" name="area"
									value="2004" /> <label for="r10">호남</label></li>
								<li><input type="checkbox" id="r11" name="area"
									value="2008" /> <label for="r11">영남</label></li>
								<li><input type="checkbox" id="r12" name="area"
									value="2012" /> <label for="r12">제주</label></li>
							</ul>
						</div>
					</div>
					<!-- search_ctn END -->
					<div class="search_box">
						<select name="searchType">
							<option>선택</option>
							<option value="id">ID</option>
							<option value="title">제목</option>
						</select> <input type="text" class="searchbox" name="searchWord"/>
						<button class="btn" type="submit">
							<i class="fas fa-search-plus" style="color: skyblue"></i>
						</button>
					</div>
					<!-- search_box END-->
				</form>
			</div>
			<!-- search_area END -->




<div class="container gallery-container">
	<div class="tz-gallery">
		<div class="row">
		<c:forEach var="board" items="${boardList}">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                
                <c:set var="loop_flag" value="false" />
                <c:forEach var="image" items="${imageList}">
                <c:if test="${not loop_flag }">
                <c:if test="${board.boardNo == image.boardNo}">
                        <img src="${pageContext.request.contextPath}/galleryImg${image.path}/thumb_${image.sysName}""/> 
                     <c:set var="loop_flag" value="true" />
                </c:if>
                   </c:if>
                </c:forEach>   
                    
                <div class="caption">
                    <a href="detail?boardNo=${board.boardNo}"><h4>${board.title}</h4></a>
                    <p>${board.editordata}</p>
                    <p>photo by ${board.id}</p>
                </div>
                </div>
            </div>
        </c:forEach>
		</div>
    </div>
</div>

<div class="sc_submit">
	<button onclick="location.href ='writeform'">WRITE</button>
</div>




		</article>
	</div>

	<!-- script 영역 -->
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