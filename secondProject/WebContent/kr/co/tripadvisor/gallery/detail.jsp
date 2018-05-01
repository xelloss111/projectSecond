<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery</title>
	<!-- common css -->
	<link rel="stylesheet" type="text/css" href="css/common.css" media="all">
	<!-- modal css -->
	<link rel="stylesheet" type="text/css" href="css/jquery.modal.min.css" media="all">
	<!-- Remember to include jQuery :) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- web font -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>

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
.wrap {
	width: 100%;
	height: 100%;
}
aside {
	box-sizing: border-box;
	width: 10%;
	height: 100%;
	position: relative;
	margin-left: 10%; 

	letter-spacing: 2px;
	float: left;
	padding-top:30px;
}
.accordion_navi {float:left; width: 100%; color:#444; margin:10px;}
.accordion_navi h3 {height:50px; line-height:50px; 
	text-indent:12px; 
	color:#000;
}
.accordion_navi h3.over {cursor:pointer;} /* 마우스 오버 스타일*/
.accordion_navi h3.selected {cursor:default;} /* 선택 스타일*/
.accordion_navi > div > ul {
	text-indent:1rem;
}
.accordion_navi > div > ul li a {
	display:block; color:#444;
}
.accordion_navi > div > ul li a:hover {
	color:skyblue; text-decoration: none;
}
article {
	padding-top: 30px;
	width: 70%;
	height: auto;
	margin-right: 10%;
	float: left;
	position: relative;
}
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



</style>
</head>
<body>
	<div class='wrap'>
		
		
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h3><i class="fas fa-paper-plane"></i>
					Tip Board
				</h3>
				<div>
					<ul>
						<li><a href="#">- 글쓰기</a></li>
					</ul>
				</div>
				<h3><i class="fas fa-camera-retro"></i>	
					Gallery
				</h3>
				<div>
					<ul>
						<li><a href="#">- 글쓰기</a></li>
					</ul>
				</div>
			</div><!-- accordion_navi 끝 -->
		</aside>
		 
		<!-- 본문 -->
		<article>
			
			<div class="content_box">
			<p align="left" style="color:gray">${area}>${attract}</p>
			
			
			    <h1>${board.title}</h1>

			    
			    <p align="right">${board.id}</p>
			    <p align="right">${board.regDate}</p>
			    
					<div class="content"><br>
					<c:forEach var="image" items="${imgList}">
					<a href="<c:url value='/galleryImg${image.path}/${image.sysName}'/>" >
						<img src="<c:url value='/galleryImg${image.path}/${image.sysName}'/>"  title="원본사진보기" width="80%" />
					</a>
					</c:forEach>
					</div>
					
					
			 </div><!-- content_box END -->
			 
			
		    <div class="sc_submit">
			  <button onclick="location.href ='delete?boardNo=${board.boardNo}'">DELETE</button>
			  <button onclick="location.href ='updateForm?boardNo=${board.boardNo}'">UPDATE</button>
		    </div>


 <%--  댓글 파트입니다.  --%>	
	 <form action="updateComment" method="post">
		<input type="hidden" name="boardNo" value="${board.boardNo}" />
		<input type="hidden" name="commentNo" value="${commentNo}" />
		<%-- 댓글 목록 --%>
		<div id="commentList"></div>
	 </form>
		
	 <%-- 댓글 관련 파트 시작 --%>		
	 <form id="rForm" class="form-inline">
		<div id="comment">
		    <div class="form-group">
			    <input type="text" name="id" class="form-control" value="${sessionScope.user.id}" readonly />
		    </div>
		    <div class="form-group">
			    <input type="text" name="content" class="form-control input-wp1" placeholder="내용을 입력하세요">
		    </div>
		  	<button class="btn btn-primary">등록</button>
		</div>
	 </form>
		
	<script>
	function commentDelete(commentNo) {
		$.ajax({
			url: "<c:url value='/gallery/deleteComment'/>",
			data: {
				no: "${board.boardNo}", 
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
			url: "<c:url value='/gallery/updateComment'/>",
			type: "POST",
			data: {
				no: "${board.boardNo}", 
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
			url: "<c:url value='/gallery/writeComment'/>",
			type: "POST",
			data: {
				no: "${board.boardNo}", 
				content: $("#rForm input[name='content']").val(), 
				writer: $("#rForm input[name='writer']").val()
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
		html += '<table class="table table-bordered">';
		html += '	<colgroup>'; 
		html += '		<col width="7%">'; 
		html += '		<col width="*">'; 
		html += '		<col width="14%">'; 
		html += '		<col width="10%">'; 
		html += '	</colgroup>'; 
		  
		for (var i = 0; i < result.length; i++) {
			var comment = result[i];
			html += '<tr id="row' + comment.commentNo + '">';
			html += '	<td>' + comment.id + '</td>';
			html += '	<td>' + comment.content + '</td>';
			var date = new Date(comment.regDate);
			var time = date.getFullYear() + "-" 
			         + (date.getMonth() + 1) + "-" 
			         + date.getDate() + " "
			         + date.getHours() + ":"
			         + date.getMinutes() + ":"
			         + date.getSeconds();
			html += '	<td>' + time + '</td>';  
			html += '	<td>';    
			html += '		<a href="javascript:commentUpdateForm(' + comment.commentNo + ')" class="btn btn-success btn-sm" role="button">수정</a>';    
			html += '		<a href="javascript:commentDelete(' + comment.commentNo + ')" class="btn btn-danger btn-sm" role="button">삭제</a>';    
			html += '	</td>';    
			html += '</tr>';
		}
		if (result.length == 0) {
			html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
		}
		html += "</title>";
		$("#commentList").html(html);
	}
	
	// 댓글 목록 조회
	function commentList() {
		$.ajax({
			url: "<c:url value='/board/commentList'/>",
			data: {no: "${board.boardNo}"},
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