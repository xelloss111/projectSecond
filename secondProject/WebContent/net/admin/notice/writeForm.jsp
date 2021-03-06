<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- Tell the browser to be responsive to screen width -->
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="../../../css/admin/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="../../../css/admin/font-awesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="../../../css/admin/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="../../../css/admin/AdminLTE.min.css">
	<!-- iCheck -->
	<link rel="stylesheet" href="../../../css/admin/blue.css">
	<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="../../../css/admin/_all-skins.min.css">
	<link rel="stylesheet" href="../../../css/admin/bootstrap-toggle.min.css">
	
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" href="../../../css/client/summernote-lite.css">
<!-- 	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet"> -->
	
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body>

 <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <header class="main-header">
      <!-- Logo -->
        <a href="index" class="logo">
          <span class="logo-lg"><b>TripTip</b>Admin</span>
        </a>
      <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
          <div class="navbar-custom-menu">
            <div class="col-md-10" style="padding-top: 6.5px">
              <form method="post" action="${pageContext.request.contextPath}/net/admin/main/logout">
                <button type="submit" class="btn btn-info">Log-out</button>
              </form>
            </div>
          </div>
        </nav>
      </header>
     <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <section class="sidebar">
          <ul class="sidebar-menu">
            <li id="stastics" class="treeview">
			  <a href="${pageContext.request.contextPath}/net/admin/stastics/index">
				<i class="fa fa-pie-chart"></i><span>통  계</span>
              </a>
            </li>
            <li id="manager" class="treeview">
              <a href="${pageContext.request.contextPath}/net/admin/management/admin">
                <i class="fa fa-laptop"></i><span>매니저 관리</span>
              </a>
            </li>
            <li id="user" class="treeview">
              <a href="${pageContext.request.contextPath}/net/admin/management/user">
                <i class="fa fa-user-o"></i><span>회원 관리</span>
              </a>
            </li>
            <li id="notice" class="active treeview menu-open">
              <a href="${pageContext.request.contextPath}/net/admin/notice/list">
                <i class="fa fa-edit"></i><span>공지 관리</span>
              </a>
            </li>
            <li id="board" class="treeview">
              <a href="${pageContext.request.contextPath}/net/admin/board/index">
                <i class="fa fa-clipboard"></i><span>게시판 관리</span>
              </a>
            </li>
          </ul>
        </section>
      </aside>
      
<div class="content-wrapper">
<!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>공지 등록 페이지</h1>
    <ol class="breadcrumb">
      <li><a href="index.html"><i class="fa fa-edit"></i>Home</a></li>
      <li class="active">Notice</li>
    </ol>
  </section>

  <section class="content">
    <div class="container-fluid">
   	  <form id="mForm" method="post" action="write">
 	  	 <input type="hidden" name="codeNo" value="3004" />
   	  	 <input type="hidden" name="id" value='admin' />
	     <div class="row">
    	    <div class="col-md-1"></div>
    	    <div class="col-md-10"><input type="text" class="form-control" placeholder="제목을 입력하세요" name="title" /><p></div>
		 </div>
	     <div class="row">
    	    <div class="col-md-1"></div>
    	    <div class="col-md-10"><textarea id="summernote" name="editordata"></textarea><p></div>
		 </div>
		 <div class="row">
	  		<div class="col-md-1"></div>
	  		<div class="col-md-10" align="right"><button id="submit" type="button" class="btn btn-success">등록</button></div>
		 </div>
	  </form>
     </div>
   </section>
  </div>
</div>
<!-- jQuery 3 -->
<script src="../../../js/admin/jquery.js"></script>
<script src="../../../js/admin/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../../js/admin/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="../../../js/admin/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="../../../js/admin/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="../../../js/admin/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="../../../js/admin/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../../../js/admin/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="../../../js/admin/jquery.slimscroll.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="../../../js/client/summernote-lite.js"></script>
<script>
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
		});
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
				console.log(fileName);
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
	            console.log(resp);
	        }
	    });
	}
    
	
	// contextPath 가져오는 방법
    function getContextPath() { 
    	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
    	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
    }
    
    // 등록 버튼 클릭 시 form에 파일 이름을 추가하여 글쓰기 컨트롤러에 전송
    // 결과 성공 시 리스트 페이지로 이동
	$("#submit").click(function () {
		var formData = $("#mForm").serializeArray();
		if (fileName != null) {
			for (let i = 0; i < fileName.length; i++) {
				formData.push({ name : 'file', value : fileName[i]});
			}		
		}
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
    
    
	$("ul.sidebar-menu li").click(function () {
		var nAuth = `${admin.noticeAuth}`;
		var uAuth = `${admin.userAuth}`;
		var pAuth = `${admin.boardAuth}`;
		var id = `${admin.id}`;
		
		if (this.id === "manager" && id === "admin") {
			location.href = contextPath + "/net/admin/management/admin";
		} else if (this.id === "user" && uAuth === 't') {
			location.href = contextPath + "/net/admin/management/user";
		} else if (this.id === "notice" && nAuth === 't') {
			location.href = contextPath + "/net/admin/notice/list";
		} else if (this.id === "board" && pAuth === 't') {
			location.href = contextPath + "/net/admin/board/index";
		} else if (this.id === "stastics") {
			location.href = contextPath + "/net/admin/stastics/index";
		} else {
			alert("해당 페이지의 접근 권한이 없습니다. 슈퍼 관리자에게 문의하세요");
			return false;
		}
	});
</script>
</body>
</html>