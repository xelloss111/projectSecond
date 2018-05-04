<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
<meta charset="UTF-8">
	<!-- board_wirteform css -->
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/board_updateform.css" media="all">
	
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
							href="/secondProject/kr/co/tripadvisor/board/writeform"">-
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
					<a href="/secondProject/kr/co/tripadvisor/member/scrap/scrapList">
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
			<form action="UpdateBoard" id="postForm" method="post" >
				<input type="hidden" name="boardNo" value="${board.boardNo}" />

				<div class='top_sel'>
					<div class='sel_1'>
						<select class='round' name="area" id="area_selected">
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
						<select class='round' name="attract" id="attract_selected">
							<option>주제</option>
							<option value="1001">맛집</option>
							<option value="1002">명소</option>
							<option value="1003">숙소</option>
						</select>
					</div>
					<!-- sel_2 END -->
					<div class="b_title">
						<h2>제목 :</h2>
						<input type="text" name="title" value="${board.title}"
							class="b_title_input" />
					</div>
					<!-- b_title END -->
				</div>
				<!-- top_sel END -->



				<div>
					<!-- ****************summer note**************** -->
					<textarea name="editordata" id="summernote">${board.editordata}</textarea>
					<button type="submit" class="btn btn-primary">update</button>
					<button class="btn btn-primary" id="updateCancel">cancel</button>
				</div>
			</form>
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
////////////////////////////////////////////////semmer note/////////////
		$(document).ready(function() {
			$('#summernote').summernote({
				height: 350,
				minHeight: null,
				maxHeight: null,
				focus: false,
				callbacks: {
				// 콜백 함수로 에디터에 이미지 등록하기
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
						}
					},
				
					// 콜백 함수로 에디터의 이미지 삭제하기
					onMediaDelete : function(target) {
						alert(target[0].src);
						deleteFile(target[0].src);
					}
				},
				dialogsFade: true,
				fontNames: ['Roboto Light', 'Roboto Regular', 'Roboto Bold'],
				toolbar: [
				['fontname', ['fontname']],
				['fontsize', ['fontsize']],
				['font', ['style','bold', 'italic', 'underline', 'clear']],
				['color', ['color']],
				['para', ['ul', 'ol', 'paragraph']],
				//['height', ['height']],
				['table', ['table']],
				['insert', ['picture','link']],
				['view', ['fullscreen', 'codeview']],
				//['misc', ['undo','redo']]
				]
			});
		});
		
		var contextPath = getContextPath();
		
		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data: form_data,
				type: "POST",
				url: contextPath + "/fileUpload",
				cache: false,
				contentType: false,
				processData: false,
				success: function(url) {
					console.log(url);
					$(el).summernote("editor.insertImage", "http://localhost" + contextPath+ "/down?path=" + url);
				}
			});
		}
		
		function deleteFile(src) {
		    $.ajax({
		        data: {src : src},
		        type: "POST",
		        url: contextPath + "/fileDelete", // replace with your url
		        cache: false,
		        success: function(resp) {
		            console.log(resp);
		        }
		    });
		}
	    
	    function getContextPath() { // contextPath 가져오는 방법
	    	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	    }
/////////////////////////////////////////////////////////////////////////////
		/* selected */
		$(function() {
			$("#area_selected").val("${board.area}").attr("selected", "true");
		});

		$(function() {
			$("#attract_selected").val("${board.attract}").attr("selected",
					"true");
		});
// 		$(function() {
// 			$("#updateCancel").
// 		})
	</script>
</body>
</html>
