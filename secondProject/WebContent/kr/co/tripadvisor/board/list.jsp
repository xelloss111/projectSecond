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
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/board_list.css" media="all">
	<!-- paging css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/paging.css" media="all">
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
			</div>
			<!-- accordion_navi 끝 -->
		</aside>
		<!-- 본문 -->
		<article>

			<div class="search_area">
				<form action="/secondProject/kr/co/tripadvisor/board/list" method="get" id="searchForm">
					<div class="search_ctn">
						<div class="search_div1">
							<ul>
								<li class="search_li">주제 :</li>
								<li class="check_li"><input type="checkbox" id="s1"
									name=attract value="1001" /><label for="s1">맛집</label></li>
								<li class="check_li"><input type="checkbox" id="s3"
									name="attract" value="1002" /><label for="s3">명소</label></li>
								<li class="check_li"><input type="checkbox" id="s2"
									name="attract" value="1003" /><label for="s2">숙소</label></li>
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
						</select> 
						<input type="text" class="searchbox" name="searchWord"/>
							
						<button class="btn" type="submit">
							<i class="fas fa-search-plus" style="color: skyblue"></i>
						</button>
					</div>
					<!-- search_box END-->
				</form>
			</div>
			<!-- search_area END -->

			<div class='board_list'>
				<ul>
					<c:if test="${empty searchList}">
						<div>
							<h1>입력된 게시물이 아직 없어요!</h1>
						</div>
					</c:if>
					<c:forEach var='b' items="${searchList}">
						<li>
							<figure>
								<a
									href='detail?boardNo=${b.boardNo}&area=${b.area}&attract=${b.attract}'>
									<div class="fi_div">
										<img
											src='/secondProject/down?path=${b.boardImage.path}&sName=${b.boardImage.sysName}' />
									</div>
								</a>
							</figure>
							<div>

								<h5>
									<a
										href='detail?boardNo=${b.boardNo}&area=${b.area}&attract=${b.attract}'>${b.title}</a>
								</h5>
								<span id="sel_${b.boardNo}">지역 : ${b.area} </span>

								<script type="text/javascript">
									var result = ""
									switch ("${b.area}") {
									case "2001":
										result = "서울";
										break;
									case "2002":
										result = "광주";
										break;
									case "2003":
										result = "경기";
										break;
									case "2004":
										result = "호남";
										break;
									case "2005":
										result = "인천";
										break;
									case "2006":
										result = "부산";
										break;
									case "2007":
										result = "강원";
										break;
									case "2008":
										result = "영남";
										break;
									case "2009":
										result = "대전";
										break;
									case "2010":
										result = "대구";
										break;
									case "2011":
										result = "충청";
										break;
									case "2012":
										result = "제주";
										break;

									};
									$("#sel_${b.boardNo}").text(
											"지역 : " + result);
								</script>

								<span id="sel2_${b.boardNo}">주제 : ${b.attract} </span>

								<script type="text/javascript">
									var count = 1;
									var result = ""
									switch ("${b.attract}") {
									case "1001":
										result = "맛집";
										count++;
										break;
									case "1002":
										result = "명소";
										count++;
										break;
									case "1003":
										result = "숙소";
										count++;
										break;
									};
									$("#sel2_${b.boardNo}").text(
											"주제 : " + result);
								</script>

								<span><fmt:formatDate value="${b.regDate}"
										pattern="yyyy-MM-dd HH:mm:ss" /></span> <span>${b.id}</span> <span>조회수
									: ${b.viewCnt}</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- 버튼 영역 -->
							<div>
								<a href="/secondProject/kr/co/tripadvisor/board/writeform">
									<input value="WRITE" type="button" class="c_write_but btn" >
								</a>							
							</div>
			<div>
				<c:if test="${paging.totalCount != 0 }">
					<nav class="paging_area">
						<ul class="pagination">
							<li class="<c:if test='${paging.prev eq false }'>disabled</c:if>">
								<a
								href="${pageContext.request.contextPath}/kr/co/tripadvisor/board/list?pageNo=${paging.startPage - 1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a>
							</li>
							<c:forEach var="iContent" begin="${paging.startPage}"
								end="${paging.endPage}">
								<c:choose>
									<c:when test="${iContent == paging.pageNo}">
										<li class="active"><a
											href="${pageContext.request.contextPath}/kr/co/tripadvisor/board/list?pageNo=${iContent}">${iContent}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="${pageContext.request.contextPath}/kr/co/tripadvisor/board/list?pageNo=${iContent}">${iContent}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="<c:if test='${paging.next eq false}'>disabled</c:if>">
								<a
								href="${pageContext.request.contextPath}/kr/co/tripadvisor/board/list?pageNo=${paging.endPage + 1}"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
							</li>
						</ul>
					</nav>
				</c:if>
			</div>
			<!-- search_area -->
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