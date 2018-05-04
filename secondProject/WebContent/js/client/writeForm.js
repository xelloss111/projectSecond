/**
 * BoardWriteForm.js
 */

		$(document).ready(function() {
			
			$('#summernote').summernote({
				height: 350,
				minHeight: null,
				maxHeight: null,
				focus: false,
				callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
						}
					},
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
			})
		});
		
		// 프로젝트 경로
		var contextPath = getContextPath();
		
		var fileName = [];
		// 에디터에 파일 등록 후 url를 되돌려 받아 에디터에 뿌려주는 코드

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
// 				console.log(url);
				$(el).summernote("editor.insertImage", "http://localhost" + contextPath + "/down?path=" + url);
				// 프로젝트명, 파일 경로를 제외한 순수 파일이름만 가져오기
				let index = url.indexOf("=");
				// 배열에 각각의 파일명 저장
				fileName.push(url.substring(index + 1));
			}
		});
	}
		
	// 이미지 삭제
	function deleteFile(src) {
	    $.ajax({
	        data: {src : src},
	        type: "POST",
	        url: contextPath + "/fileDelete", 
	        cache: false,
	        success: function(resp) {
	        }
	    });
	}
	    
	// contextPath 가져오는 방법
	    function getContextPath() { 
	    	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	    	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	    }
	    ///////////////////////////////////////////////////////////////////////
		var postForm = function() {
			var editordata = $('textarea[name="editordata"]').html(
					$('#summernote').code());
		}
	
		$("#submit").click(function () {
			var formData = $("#postForm").serializeArray();
			
			for (let i = 0; i < fileName.length; i++) {
				formData.push({ name : 'file', value : fileName[i]});
			}		
// 			console.log(formData);
			$.ajax({
				type: "POST",
				data: formData,
				url: "write",
				success: function (url) {
					console.log(url);
					location.href = url;
				}
			});
		});
		
		// jQuery 시작 / 메뉴 마우스 오버 효과
		$(function() {
			$(".accordion_navi > div").hide();
			$(".accordion_navi h3").mouseover(function() {
				if (!($(this).hasClass("selected"))) {
					$(".accordion_navi > h3").removeClass("selected");
					$(this).addClass("selected");
					$(".accordion_navi>div").not().slideUp("slow");
					$("+div", this).slideDown("slow"); //$(this).find("+div")
				}
			})

		}); 
		
		// 글등록 체크 사항
		function submitCheck() {
			var pf = document.postForm;
			
			if (pf.area.selectedIndex == 0) {
				alert("지역을 선택해주세요.");
				return false;
			} else if(pf.attract.selectedIndex == 0) {
				alert("주제를 선택해주세요.");
				return false;
			} else if(pf.title.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} else if(pf.title.editordata == "") {
				alert("내용을 입력해주세요.");
				return false;
			} else {
				return true;
			};

		}	
		 