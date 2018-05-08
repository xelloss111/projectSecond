<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
<!-- member_scrapList css -->
<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/member_scrapList.css" media="all">
<meta charset="UTF-8">
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
			<h1>내정보 (MyInfo) - 스크랩</h1>
			<div class='board_list'>
				<ul>
					<c:if test="${empty list}">
						<li>
							<h1>스크랩 정보가 아직 없어요!</h1>
						</li>
					</c:if>
					<c:forEach var='b' items="${list}">
						<li>
							<figure>
								<c:choose>
									<c:when test="${b.codeNo == 3001}">
										<a
											href='/secondProject/kr/co/tripadvisor/board/detail?boardNo=${b.boardNo}&area=${b.board.area}&attract=${b.board.attract}'>



											<c:choose>
												<c:when test="${b.board.boardImage.path == null}">
													<img src="/secondProject/images/notimage.png">
												</c:when>

												<c:when test="${b.board.boardImage.path != null}">
													<img
														src='/secondProject/down?path=${b.board.boardImage.path}&sName=${b.board.boardImage.sysName}' />
												</c:when>
											</c:choose>
											 <%-- 	<img src='/secondProject/down?path=${b.board.boardImage.path}&sName=${b.board.boardImage.sysName}' /> --%>
										</a>
									</c:when>

									<c:when test="${b.codeNo == 3002}">
										<a
											href='/secondProject/kr/co/tripadvisor/gallery/detail?boardNo=${b.boardNo}&area=${b.board.area}&attract=${b.board.attract}'>
											<c:choose>
												<c:when test="${b.board.boardImage.path == null}">
													<img src="/secondProject/images/notimage.png">
												</c:when>

												<c:when test="${b.board.boardImage.path != null}">
													<img src='/secondProject/galleryImg/${b.board.boardImage.path}/${b.board.boardImage.sysName}' />
												</c:when>
											</c:choose> <%-- <img src='/secondProject/down?path=${b.board.boardImage.path}&sName=${b.board.boardImage.sysName}' /> --%>
										</a>
									</c:when>
								</c:choose>
								<!-- 								<a -->
								<%-- 									href='/secondProject/kr/co/tripadvisor/board/detail?boardNo=${b.boardNo}&area=${b.board.area}&attract=${b.board.attract}'> --%>
								<!-- 									<div class="fi_div"> -->
								<!-- 										<img -->
								<%-- 											src='/secondProject/down?path=${b.board.boardImage.path}&sName=${b.board.boardImage.sysName}' /> --%>
								<!-- 									</div> -->
								<!-- 								</a> -->
							</figure>
							<div>
								<h5 class="over">

									<c:choose>
										<c:when test="${b.codeNo == 3001}">
											<a
												href='/secondProject/kr/co/tripadvisor/board/detail?boardNo=${b.boardNo}&area=${b.board.area}&attract=${b.board.attract}'>${b.board.title}
											</a>
										</c:when>

										<c:when test="${b.codeNo == 3002}">
											<a
												href='/secondProject/kr/co/tripadvisor/gallery/detail?boardNo=${b.boardNo}&area=${b.board.area}&attract=${b.board.attract}'>${b.board.title}
											</a>
										</c:when>
									</c:choose>
								</h5>
								<span id="sel_${b.boardNo}">지역 : ${b.board.area} </span>

								<script type="text/javascript">
									var result = ""
									switch ("${b.board.area}") {
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

								<span id="sel2_${b.boardNo}">주제 : ${b.board.attract} </span>

								<script type="text/javascript">
									var count = 1;
									var result = ""
									switch ("${b.board.attract}") {
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
										pattern="yyyy-MM-dd HH:mm:ss" /></span> <span>${b.board.id}</span>
							</div>
							<div>
								<a
									href="/secondProject/kr/co/tripadvisor/user/scrap/deleteScrap?ScrapNo=${b.scrapNo}">
									<input value="DELETE" type="button" class="c_write_but btn"
									id="scrapdelbtn">
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</article>
	</div>
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

		$("#scrapdelbtn").click(function() {
			alert("스크랩 삭제가 완료되었습니다.")
		});
	</script>
</body>
</html>