<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>
 	<!-- Bootstrap 3.3.7 -->
<!-- 	<link rel="stylesheet" href="../../../../css/admin/bootstrap.min.css"> -->
	<!-- gallery common css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/client/gallery_common.css" media="all">

	<script type="text/javascript">
	$(function(){// jQuery 시작 / 메뉴 마우스 오버 효과
		$(".accordion_navi > div").hide();
		$(".accordion_navi h3").mouseover(function(){
			if (!($(this).hasClass("selected"))){
				$(".accordion_navi > h3").removeClass("selected");
				$(this).addClass("selected");
				$(".accordion_navi>div").not().slideUp("slow");
			$("+div",this).slideDown("slow"); //$(this).find("+div")
		}
	})

	}); //jQuery 종결 
</script>
<style type="text/css">

.content_box {
    text-align: center;
    box-sizing: border-box;
    margin: 0px 2%;
	width: 96%;

	padding: 30px;
	background: #f4faff;
}

.comment{
	text-align: center;
	box-sizing: border-box;
}


.comment_user{
padding: 5px;
width: 15%;
}

.comment_content{
padding: 5px;
width: 70%;
}

.co_bnt {
	background-color: #fff;
	font-family: 'Righteous', cursive; color: #999;
	width: 80px;
	height: 29px;
}

.re_bnt {
	background-color: #fff;
	font-family: 'Righteous', cursive; color: #999;
	width: 60px;
	height: 15px;
}

.comment_table {
    margin: 0 auto;
    margin-top: 10px;
    border : 1px solid grey;
    width: 95.5%;
}
.comment_table > tr, td {
	text-align: center;
    border : 1px dashed grey;
    padding: 2px 2px;
}

h1{ font-size: xx-large;}


.sc_submit {
	width: 96%;
	height: 30px;
	line-height: 30px;
	float: right;
	margin-top: 15px;
	margin-bottom: 15px;
}
.sc_submit > button {
	width: 80px;
	height: 30px;
	background-color: #999;
	font-family: 'Righteous', cursive; color: #fff;
	float: right;
	margin-right: 2%;
}

<!-- 댓글 -->

.row {
     margin-right: -15px; 
    margin-left: -15px;
}

.form-group {
	display : inline-block;
	margin-right: 3px;
	margin-bottom: 15px;
	height: 30px;
	padding: 5px 10px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 3px
}

.form-control {
    border-color: #d2d6de;
    display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;

}

.table {
	width: 1030px;
	margin-left: 325px;
 /* margin-right: auto;  */
}

.btn {
	display: inline-block; 
	padding: 6px 12px;
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42857143;
	text-align: center;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
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
			</div><!-- accordion_navi 끝 -->
		</aside>
		 
		<!-- 본문 -->
			
		<article>
			<div class="content_box">
			<p align="left" style="color:gray">${area}>${attract}</p>
			
			
			    <h1>${board.title}</h1>

			    
			    <p align="right">글쓴이 : ${board.id}</p>
			    <p align="right">
			    <fmt:formatDate var="regDate" value="${board.regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
			    <c:out value="${regDate}" />
			    </p>
			    <p align="right" style="color:gray">조회수 ${board.viewCnt}</p>
			    
					<div class="content"><br>
					<c:forEach var="image" items="${imgList}">
					<a href="<c:url value='/galleryImg${image.path}/${image.sysName}'/>" >
						<img src="<c:url value='/galleryImg${image.path}/${image.sysName}'/>"  title="원본사진보기" width="80%" />
					</a>
					</c:forEach>
					</div>
					
					
			 </div><!-- content_box END -->
			 <div class="sc_submit">
		      <button type="submit" class="b_write_but btn" id="scrap_btn">SCRAP</button>
			 </div>
		
			<c:if test="${sessionScope.user.id==board.id}">
		    <div class="sc_submit">
			  <button onclick="location.href ='updateform?boardNo=${board.boardNo}'">UPDATE</button>
			  <button onclick="location.href ='delete?boardNo=${board.boardNo}'">DELETE</button>
		    </div>
			</c:if>

			 <script>
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

				<%-- 댓글 관련 파트 시작 --%>
				<form id="rForm" class="form-inline">
					<div id="comment">
						<div class="form-group">
							<input type="text" name="id" class="form-control" value="${sessionScope.user.id}"	readonly />
						</div>
						<div class="form-group">
							<input type="text" name="content" class="form-control input-wp1" placeholder="내용을 입력하세요">
						</div>
						<button class="btn btn-primary">등록</button>
					</div>
				</form>
	
		
		</div>	
      	
		<div class="row">
			<%--  댓글 파트입니다.  --%>
			<form action="updateComment" method="post">
				<input type="hidden" name="boardNo" value="${board.boardNo}" />
				<input type="hidden" name="commentNo" value="${commentNo}" />
				<%-- 댓글 목록 --%>
				<div id="commentList"></div>
			</form>
			<p>
		</div>
		
	</div>
 </section>
</div>      	
</div>

<script>
	// 게시물 수정 시 파라메터 값으로 입력 받을 값 JSP에서 JS로 
	var num = ${board.boardNo};
	console.log(num);

	function getContextPath() { // contextPath 가져오는 방법
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	}
	
	var contextPath = getContextPath();

	$("document").ready(function () {
		$("#title").css("border-top", "2px solid slategray").css("background", "#3C8DBC").css("color", "white");
		$("#writer").css("padding", "10px 15px").css("border-top", "0.3px solid slategray").css("border-bottom", "0.3px solid slategray")
					.css("font-size", "12px");
		$("#info").css("text-align", "right").css("padding", "10px 15px").css("border-top", "0.3px solid slategray")
				.css("border-bottom", "0.3px solid slategray").css("font-size", "12px");
		$("#content").css("height", "330px").css("padding","20px").css("overflow", "auto")
					.css("border-bottom", "0.3px solid slategray");
		$("div.col-md-5 span").css("padding-left", "5px").css("padding-right", "5px");
		$(".form-group input[name='content']").css("width", "670px");
	});
	
	
	// 댓글 처리	
	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/kr/co/tripadvisor/gallery/deleteComment'/>",
			data: {
				boardNo : "${board.boardNo}", 
				commentNo: commentNo
			},
			dataType: "json",
			success: makeCommentList
		});
	}
	
	function commentUpdateForm(commentNo) {
		
		$("#commentList tr[id^=row]").show();
		$("#commentList tr[id^=modRow]").remove();
		
		var modId = $("#row" + commentNo + " > td:eq(0)").text();
		var modContent = $("#row" + commentNo + " > td:eq(1)").text();
		
		var html = '';
		html += '<tr id="modRow' + commentNo + '">';
		html += '	<td>' + modId + '</td>';
		html += '	<td>';
		html += '		<div class="form-group">';
		html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
		html += '		</div>';
		html += '	</td>';
		html += '	<td colspan="2">'; 
		html += '		<a href="javascript:commentUpdate(' + commentNo + ');" class="btn btn-success btn-sm" role="button">수정</a>';
		html += '		<a href="javascript:commentCancel(' + commentNo + ');" class="btn btn-warning btn-sm" role="button">취소</a>';
		html += '	</td>';
		html += '</tr>';
		$("#row" + commentNo).after(html);	
		$("#row" + commentNo).hide();
	}
	
	function commentUpdate(commentNo) {
		$.ajax({
			url: "<c:url value='/kr/co/tripadvisor/gallery/updateComment'/>",
			type: "POST",
			data: {
				boardNo: "${board.boardNo}", 
				content: $("#modRow" + commentNo + " input[name=content]").val(), 
				commentNo: commentNo
			},
			dataType: "json",
			success: function (result) {
				makeCommentList(result);
			} 
		});
	}
	
	function commentCancel(commentNo) {
		$("#row" + commentNo).show();
		$("#modRow" + commentNo).remove();
	}
	
	// 댓글 등록 처리
	$("#rForm").submit(function (e) {
		e.preventDefault();
		
		$.ajax({
			url: "<c:url value='/kr/co/tripadvisor/gallery/writeComment'/>",
			type: "POST",
			data: {
				boardNo: "${board.boardNo}", 
				content: $("#rForm input[name='content']").val(), 
				id : $("#rForm input[name='id']").val()
			},
			dataType: "json"
		})
		
		.done(function (result) {
			if (!'${sessionScope.user.id}') {
				$("#rForm input[name='writer']").val("");
			}
			$("#rForm input[name='content']").val("");
			
			makeCommentList(result);
		});
		
	});	
	
	// 댓글 목록 만드는 공통 함수
	function makeCommentList(result) {
		console.dir(result);
		var html = "";
		html += '<div class="row">';
		html += '	<div class="col-md-1"></div>';
		html += '	<div class="col-md-10">';
		html += '		<table class="table table-bordered">';
		html += '			<colgroup>'; 
		html += '				<col width="7%">'; 
		html += '				<col width="*">'; 
		html += '				<col width="14%">'; 
		html += '				<col width="14%">'; 
		html += '			</colgroup>';

		
		for (var i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<tr id="row' + comment.commentNo + '">';
			html += '	<td>' + comment.id + '</td>';
			html += '	<td >' + comment.content + '</td>';
			var date = new Date(comment.regDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '	<td id="time">' + time + '</td>';  
			html += '	<td>';    
			
			var userId = '${sessionScope.user.id}'
			console.log(userId, comment.id);
			console.log(userId == comment.id)
			
			if(userId == comment.id) {
			html += '		<a href="javascript:commentUpdateForm(' + comment.commentNo + ')" class="btn btn-success btn-sm" role="button">수정</a>';    
			html += '		<a href="javascript:commentDelete(' + comment.commentNo + ')" class="btn btn-danger btn-sm" role="button">삭제</a>'; 
			} else {
				html += '-'
// 				$("#time").attr("colspan", "2");
			}
			
			html += '	</td>';    
			
			html += '</tr>';
		}

		
		
		
		
		
		if (result.length == 0) {
			html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
		}
		html += "</table>";
		html += '	</div>';
		html += '</div>';  
		$("#commentList").html(html);
	}
	
	// 댓글 목록 조회
	function commentList() {
		$.ajax({
			url: "<c:url value='/kr/co/tripadvisor/gallery/commentList'/>",
			data: {boardNo: "${board.boardNo}"},
			dataType: "json", 
			success: makeCommentList
		});
	}
	
	// 상세 페이지 로딩시 댓글 목록 조회 ajax 호출
	commentList();	
	
	</script>	
			
	</article>
 
</div><!-- wrap END -->
</body>
</html>