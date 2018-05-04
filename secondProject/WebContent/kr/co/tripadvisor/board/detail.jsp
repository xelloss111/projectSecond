<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
	<!-- board_detail css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/board_detail.css" media="all">
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
							href="/secondProject/kr/co/tripadvisor/board/writeform">-
								글쓰기</a></li>
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
				<h3>
					<a href="#">
						<i class="fas fa-tags"></i>
						스크랩
					</a>
				</h3>
				<h3>
					<a href="#">
						<i class="far fa-smile"></i>
						회원정보
					</a>
				</h3>
			</div>
			<!-- accordion_navi 끝 -->
		</aside>

		<!-- 본문 -->
		<article>
			<!-- 상단 영역 -->
			<div align="center" class='top-sel'>
				<div class='sel_1'>
					지역 :
					<c:out value="${board.area}" />
				</div>
				<!-- sel_1 END -->
				<div class='sel_2'>
					주제 :
					<c:out value="${board.attract}" />
				</div>
				<!-- sel_2 END -->
				<div class="b_title">
					<h1>
						<c:out value="${board.title}" />
					</h1>

				</div>
				<!-- b_title END -->
			</div>
			<!-- top-sel END-->


			<div id="content">
				<!-- 내용 영역  -->
				${board.editordata}<br>
			</div>

			<div class="btn_div">
				<button type="submit" class="b_write_but btn" id="scrap_btn">SCRAP</button>
				
				
				<a href="UpdateFormBoard?boardNo=${board.boardNo}">
					<input type="submit" value="UPDATE" class="b_write_but btn" /> 
				</a> 
				<a href='delete?boardNo=${board.boardNo}'>
					<input type="submit" value="DELETE" class="b_write_but btn" id="delbtn" /> 
				</a>
				<a href="list">
					<input value="LIST" type="button" class="b_write_but btn" >
				</a>												
			</div>
			<!-- btn_div END -->


			<!-- 댓글 -->

			<div class="comment_div">
				<form method="post" action="WriteBoardComment" name="cForm" onsubmit="return commentCkeck()">
					<input type="hidden" name="boardNo" value="${board.boardNo}" />
					<table>
						<tr id="comment_trView" class="list_border">
							<!-- 댓글 등록 -->

							<td class="id_bold" id="id_tdView">
							<input type="text" name="id" value="${sessionScope.user.id}"
								readonly="readonly" id="id_view"/></td>
							<td id="content_tdView">
								<textarea name="content" rows="4" cols="60" placeholder="내용을 입력하세요" class="content_view" ></textarea>
							</td>
							<td id="btn_view"><input type="submit" value="submit" class="b_write_but btn"></td>
						</tr>
					</table>
				</form>


				<form action="UpdateBoardComment" method="post">
					<input type="hidden" name="boardNo" value="${board.boardNo}" /> 
					<input type="hidden" name="commentNo" value="${commentNo}" />

					<!-- 댓글 목록 -->

					<div id="commentList">
						<table width='80%' border='1'>
							<c:forEach var="comment" items="${commentList}">
								<c:choose>
								<%-- 댓글 수정 --%>
									<c:when test="${commentNo eq comment.commentNo}">
										<tr>
											<td class="id_bold"><c:out value="${comment.id}" /></td>
											<td id="content_reView">
												<textarea name="content" rows="5" cols="60" class="content_view" ><c:out value="${comment.content}" /></textarea>
											</td>
											<td colspan="2"><input value="update" type="submit" class="reupdatecmt btn" ></td>
										</tr>
									</c:when>
									<%-- 댓글 리스트 --%>
									<c:otherwise>
										<tr class="list_border">
											<td class="id_bold"><c:out value="${comment.id}" /></td>
											<td class="td_content"><c:out value="${comment.content}" /></td>
											<td class="td_date"><fmt:formatDate var="regDate"
													value="${comment.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
												<c:out value="${regDate}" />
											</td>
												
											<td class="td_btn">
											
											<a
												href="detail?commentNo=${comment.commentNo}&boardNo=${comment.boardNo}">
												<input value="update" type="button" class="c_write_but btn" >
												
											</a>
												
											<a href="DeleteBoardComment?commentNo=${comment.commentNo}&boardNo=${comment.boardNo}">
												<input value="delete" type="button" class="c_write_but btn" >
											</a>

											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${empty commentList}">
								<tr>
									<td colspan='4'>댓글이 존재하지 않습니다.</td>
								</tr>
							</c:if>
						</table>
					</div>
					<!-- commentList END -->
				</form>
			</div>
		</article>
	</div>
	<!-- wrap END -->

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
		/* 댓글영역 */
			var c = document.cForm;
			function isEmpty(obj, msg) {
				if(obj.value=="") {
					alert(msg);
					obj.focus();
					return true;
				}
				return false;
			}
		function commentCkeck() {
			if(isEmpty(c.content, "댓글을 등록해주세요,")) return false;
			
			c.content.value = c.content.value.replace(/^\s/gm, '');
			c.content.value = c.content.value.replace(/\r\n$/g, '');
		alert("코멘트가 등록되었습니다.")
		return true;
		}
	

		$(function() {
			switch("${board.area}") {
			case "2001" : $(".sel_1").text("지역 : 서울"); break;
			case "2002" : $(".sel_1").text("지역 : 광주"); break;
			case "2003" : $(".sel_1").text("지역 : 경기"); break;
			case "2004" : $(".sel_1").text("지역 : 호남"); break;
			case "2005" : $(".sel_1").text("지역 : 인천"); break;
			case "2006" : $(".sel_1").text("지역 : 부산"); break;
			case "2007" : $(".sel_1").text("지역 : 강원"); break;
			case "2008" : $(".sel_1").text("지역 : 영남"); break;
			case "2009" : $(".sel_1").text("지역 : 대전"); break;
			case "2010" : $(".sel_1").text("지역 : 대구"); break;
			case "2011" : $(".sel_1").text("지역 : 충청"); break;
			case "2012" : $(".sel_1").text("지역 : 제주"); break;
			}
		});
		$(function() {
			switch("${board.attract}") {
			case "1001" : $(".sel_2").text("주제 : 맛집"); break;
			case "1002" : $(".sel_2").text("주제 : 명소"); break;
			case "1003" : $(".sel_2").text("지역 : 숙소"); break;
			}
		});
	
		/* 스크랩 영역 */
		var codeNo = ${board.codeNo};
		var boardNo = ${board.boardNo};
		var id = '${sessionScope.user.id}';

		var contextPath = getContextPath();
		function getContextPath() { // contextPath 가져오는 방법
	    	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	    }
		
		$("#scrap_btn").click(function(){
			//console.log(id);
			$.ajax({
				  type: "POST",
				  url: contextPath + "/kr/co/tripadvisor/client/scrap",
				  data: {id:id, boardNo:boardNo, codeNo:codeNo},
				  success: 
					  function(){
					  alert("스크랩이 완료되었습니다.")
				  }
				});
			});
	</script>
</body>
</html>