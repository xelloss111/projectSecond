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
			<div id="noticeArea">
				<table class="table table-bordered table-hover table-condensed">
           		 	<thead>
            		  <tr>
            		    <th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th></th>
              		  </tr>
           			</thead>
              <c:forEach var="notice" items="${noticeList}">
                <tr>
              	  <td style="width:80px;">${notice.no}</td>
              	  <td style="width:640px;"><a href="detail?no=${notice.no}"><c:out value="${notice.title}" /></a></td>
              	  <td style="width:80px;"><c:out value="${notice.id}" /></td>
              	  <td style="width:120px;"><fmt:formatDate value='${notice.regDate}' pattern="yyyy-MM-dd" /></td>       
              	  <td style="width:70px">${notice.viewCnt}</td>       	  
                </tr>
              </c:forEach>
         	 </table>
       		 <p></p>
       		       		
			<div id="page">
				<c:if test="${paging.totalCount != 0 }">
				   <nav class="paging_area">
					<ul class="pagination">
					    <li class="<c:if test='${paging.prev eq false }'>disabled</c:if>">
					      <a href="${pageContext.request.contextPath}/kr/co/tripadvisor/notice/list?pageNo=${paging.startPage - 1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					  <c:forEach var="iContent" begin="${paging.startPage}" end="${paging.endPage}">
				      		<c:choose>
				      			<c:when test="${iContent == paging.pageNo}">
				      				<li class="active">
				      					<a href="${pageContext.request.contextPath}/kr/co/tripadvisor/notice/list?pageNo=${iContent}">${iContent}</a>
				      				</li>
				      			</c:when>
				      			<c:otherwise>
				      				<li>
				      					<a href="${pageContext.request.contextPath}/kr/co/tripadvisor/notice/list?pageNo=${iContent}">${iContent}</a>
				      				</li>
				      			</c:otherwise>
				      		</c:choose>
				      	</c:forEach>
				      	<li class="<c:if test='${paging.next eq false}'>disabled</c:if>">
					    <a href="${pageContext.request.contextPath}/kr/co/tripadvisor/notice/list?pageNo=${paging.endPage + 1}" aria-label="Next">
					      <span aria-hidden="true">&raquo;</span>
					    </a>
				       </li>
					</ul>
				 </nav>
				</c:if>
			</div>
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
		$("#noticeTitle").css("font-size", "30px").css("font-weight", "bold").css("border-bottom", "0.3px solid black")
						.css("padding-bottom", "5px");
		$("table").css("height", "400px").css("border", "0.3px solid black").css("border-collapse", "collapse");
		$("table th").css("border", "0.3px solid black");
		$("table tr").css("border", "0.3px solid black");
		$("table tr td").css("border", "0.3px solid black").css("padding-left", "20px").css("padding-top", "8px");
	});
	</script>
</body>
</html>