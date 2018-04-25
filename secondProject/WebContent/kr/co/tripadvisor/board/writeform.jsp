<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
<meta charset="UTF-8">

<!-- Remember to include jQuery :) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"
	type="text/javascript"></script>
	
<!-- summernote-lite javaScript -->
<script src="../../../../js/client/summernote-lite.js"></script>

<!-- jQuery Modal -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"
	type="text/javascript"></script>
	
<!-- jQuery Modal -->
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>

<!-- web font -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
	integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
	crossorigin="anonymous"></script>

<!-- summernote-lite css -->
<link rel="stylesheet" type="text/css"
	href="../../../../css/client/summernote-lite.css" media="all">
	
<!-- board_wirteform css -->
<link rel="stylesheet" type="text/css"
	href="../../../../css/client/board_wirteform.css" media="all">


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

	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500, // set editor height
			minHeight : null, // set minimum height of editor
			maxHeight : null, // set maximum height of editor
			focus : true,
			onImageUpload : function(files, editor, welEditable) {
	            sendFile(files[0], editor, welEditable);
	        },
	        lang : 'ko-KR'
		// set focus to editable area after initializing summernote
		});
	});

</script>
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
						<li><a href="/secondProject/kr/co/tripadvisor/board/writeform"">- 글쓰기</a></li>
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
			<form action="writeboard" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" value="tester" /> <input
					type="hidden" name="codeNo" value="3001" />
				<div class='top_sel'>
					<div class='sel_1'>
						<select class='round' name="area">
							<option>지역</option>
							<option value="2001">서울</option>
							<option value="2002">광주</option>
							<option value="2003">경기</option>
							<option value="2004">호남</option>
							<option value="2005">인천</option>
							<option value="2006">부산</option>
							<option value="2007">강원</option>
							<option value="2008">영남</option>
							<option value="2009">대전</option>
							<option value="2010">대구</option>
							<option value="2011">충청</option>
							<option value="2012">제주</option>
						</select>
					</div>
					<!-- sel_1 END -->
					<div class='sel_2'>
						<select class='round' name="attract">
							<option>주제</option>
							<option value="1001">맛집</option>
							<option value="1002">숙소</option>
							<option value="1003">명소</option>
						</select>
					</div>
					<!-- sel_2 END -->
					<div class="b_title">
						<h2>제목 :</h2>
						<input type="text" name="title" class="b_title_input" />
					</div>
					<!-- b_title END -->
				</div>
				<!-- top_sel END -->



				<div>
					<!-- ****************summer note**************** -->
					<textarea id="summernote" name="editordata"></textarea>
					<input type="submit" value="Send data" class="b_write_but btn" />
				</div>
			</form>
		</article>

	</div>
	<!-- wrap END -->
</body>
</html>