<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta charset="UTF-8">
	<title>tripadvisor</title>
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

.top_sel {
	width: 100%;
	height: 50px;
}
.sel_1 {
	width: 16%;
	float: left;
	height: 50px;
	line-height: 50px;
}
.sel_2 {
	width: 16%;
	float: left;
	height: 50px;
	line-height: 50px;
}
.b_title { width: 56%; 
	float: left; 
}
.b_title > h2 {display: inline-block;}
.b_title_input {
	width: 90%;
	background-color: white;

  border: thin solid #ddd;
  border-radius: 4px;
  display: inline-block;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;
    /* reset */
  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}
input:focus {
  border-color: skyblue;
  outline: 0;	
}
.btn {
	margin: 2% 0%;
	float: right;
	padding: 6px 12px;
	cursor:pointer;
	border: 1px solid transparent; /* 부모색상 동일 */
	border-radius: 4px;
	font-family: 'Righteous', cursive;
}

.btn:active {
	box-shadow: 0 3px 5px rgba(0, 0, 0, .125) inset;
}

.btn:focus, .btn:hover {
	color: #333;
	text-decoration: none;
}
/* Button 3e */
.b_write_but {
	color: #fff;
	background-color: #87ceeb;
}

.btn-b_write_but:active, .btn-b_write_but:focus, .btn-b_write_but:hover  {
	color: #fff;
	background-color: #2980b9;
}
select {

  /* styling */
  background-color: white;
  border: thin solid #ddd;
  border-radius: 4px;
  display: inline-block;
  font: inherit;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;

  /* reset */

  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}
select.round {
  background-image:
    linear-gradient(45deg, transparent 50%, gray 50%),
    linear-gradient(135deg, gray 50%, transparent 50%),
    radial-gradient(#ddd 70%, transparent 72%);
  background-position:
    calc(100% - 20px) calc(1em + 2px),
    calc(100% - 15px) calc(1em + 2px),
    calc(100% - .5em) .5em;
  background-size:
    5px 5px,
    5px 5px,
    1.5em 1.5em;
  background-repeat: no-repeat;
}

select.round:focus {
  background-image:
    linear-gradient(45deg, white 50%, transparent 50%),
    linear-gradient(135deg, transparent 50%, white 50%),
    radial-gradient(gray 70%, transparent 72%);
  background-position:
    calc(100% - 15px) 1em,
    calc(100% - 20px) 1em,
    calc(100% - .5em) .5em;
  background-size:
    5px 5px,
    5px 5px,
    1.5em 1.5em;
  background-repeat: no-repeat;
  border-color: skyblue;
  outline: 0;
}

#textcontent {

resize : none;
width: 85.2%;
height: 300px;
border: thin solid #ddd;
border-radius: 4px;
font-size: larger;
padding: 10px;

}

input[type="file"] {
margin: 3px;
border: thin solid #ddd;
border-radius: 4px;
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
			<form method="post" action="${pageContext.request.contextPath}/kr/co/tripadvisor/gallery/update" enctype="multipart/form-data">
			    <input type='hidden' name='boardNo' value='${board.boardNo}' />
				<input type="hidden" name="codeNo" value="3002" />
				<div class='top_sel'>
					<div class='sel_1'>
						<select class='round' name="area" id="area">
							<option value="">지역</option>
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
						<script>
							$("#area").val("${board.area}").prop("selected", true);
						</script>
					</div><!-- sel_1 END -->
					<div class='sel_2'>
						<select class='round' name="attract" id="attract">
							<option value="">주제</option>
							<option value="1001">맛집</option>
							<option value="1002">명소</option>
							<option value="1003">숙소</option>
						</select>
						<script>
							$("#attract").val("${board.attract}").prop("selected", true);
						</script>
					</div> <!-- sel_2 END -->
					<div class="b_title">
						<h2>제목 : </h2>
						<input type="text" name="title" class="b_title_input" value="${board.title}" />
					</div> <!-- b_title END -->
				</div><!-- top_sel END -->
				<div>

						<textarea id="textcontent" name="editordata" maxlength="50" >${board.editordata}</textarea>
						<c:set var="n" value="1" />
						
						<c:forEach var="image" items="${imageList}">
						<div class="imageupdate">
						<p id="${image.imageNo}">${image.oriName}<button type="button" class="imgbut">&emsp;x</button></p> <!-- ajax로 바로 삭제 -->
						<input id="i${n}" type="hidden" value="${image.imageNo}" />
						<c:set var="n" value="${n+1}" />
						</div>
						</c:forEach>
						
						<input type="file" name="attatch1" value="첨부파일"><br>
						<input type="file" name="attatch2"><br>
						<input type="file" name="attatch3">
						
					    <input type="submit" value="Update data" class="b_write_but btn" />
				</div>
			</form>
		</article>	

	</div><!-- wrap END -->
	<script type="text/javascript">
	
	$(".imgbut").click ( function () {
		var id;
		var no;
		id = $(this).parent().parent();
		no = id.children();
		no = no.eq(1).val();
		console.log(no);
		$.ajax({
			url: "/secondProject/kr/co/tripadvisor/file/imagedel",
			type: "post",
			data: {
			imageNo :  no
			},
			dataType: "json",
			success: function (data) {
				console.log(data);
				$("#"+no).html("");
			}
		});
		
	});
	

	</script>
</body>
</html>