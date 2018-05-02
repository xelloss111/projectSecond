<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <li class="treeview">
			  <a href="${pageContext.request.contextPath}/net/admin/stastics/index">
				<i class="fa fa-pie-chart"></i><span>통  계</span>
              </a>
            </li>
            <li class="treeview">
              <a href="${pageContext.request.contextPath}/net/admin/management/index">
                <i class="fa fa-laptop"></i><span>매니저 관리</span>
              </a>
            </li>
            <li class="treeview">
              <a href="user_management.html">
                <i class="fa fa-user-o"></i><span>회원 관리</span>
              </a>
            </li>
            <li class="active treeview menu-open">
              <a href="${pageContext.request.contextPath}/net/admin/notice/list">
                <i class="fa fa-edit"></i><span>공지 관리</span>
              </a>
            </li>
            <li class="treeview">
              <a href="board_management.html">
                <i class="fa fa-clipboard"></i><span>게시판 관리</span>
              </a>
            </li>
          </ul>
        </section>
      </aside>
<div class="content-wrapper">
<!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>공지 상세 보기</h1>
    <ol class="breadcrumb">
      <li><a href="index.html"><i class="fa fa-edit"></i>Home</a></li>
      <li class="active">Notice</li>
    </ol>
  </section>
  <section class="content">
    <div class="container-fluid"><p><p>
      <div class="row">
      	<div class="col-md-1"></div>
      	<div class="col-md-10" id="title" style="border-top: 2px solid slategray; background:#3C8DBC; color: white">
      		<h5>${notice.title}</h5>
      	</div>
      </div>
      <div class="row">
      	<div class="col-md-1"></div>
      	<div class="col-md-5" id="writer" style="padding: 10px 15px; border-top: 0.3px solid slategray; border-bottom:0.3px solid slategray; font-size: 12px">
      		<i class="fa fa-user-o"></i><span style="padding-left: 5px; padding-right: 5px;">${notice.id}</span>
      	</div>
      	<div class="col-md-5" id="info" style="text-align: right; padding: 10px 15px; border-top: 0.3px solid slategray; border-bottom:0.3px solid slategray; font-size: 12px">
      		<i class="fa fa-calendar-check-o"></i><span style="padding-left: 5px; padding-right: 5px;">&nbsp;작성일&nbsp;</span><strong><fmt:formatDate value="${notice.regDate}" pattern="yyyy/MM/dd HH:mm:ss" /></strong>
      		<span id="bar" style="padding-left: 5px; padding-right: 5px"> | </span>
      		<i class="fa fa-eye"></i><span style="padding-left: 5px; padding-right: 5px;">조회수</span><strong>1,111</strong>
      	</div>
      </div>
      <div class="row">
      	<div class="col-md-1"></div>
      	<div class="col-md-10" id="content" style="height: 330px; padding: 20px; overflow: auto; border-bottom: 0.3px solid slategray;">
      		${notice.content}
      	</div>
      </div>
      <p>
      <div class="row">
      	<div class="col-md-1"></div>
      	<div class="col-md-10" align="right">
      		<button class="btn btn-warning" id="modify">수정</button>
      		<button class="btn btn-danger" id="delete" onclick="javascript:deleteNotice(${notice.no})">삭제</button>
      	</div>
      </div>
    </div>
 </section>
</div>      	
</div>
<!-- jQuery 3 -->
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
<!-- ChartJS -->
<script src="../../../js/admin/Chart.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../js/admin/demo.js"></script>
<script src="../../../js/admin/bootstrap-toggle.min.js"></script>
<script>
	var num = ${notice.no};
	console.log(num);
	$("#modify").on("click", function () {
		var contextPath = getContextPath();
		location.href = contextPath + "/net/admin/notice/updateForm?no=" + num;
	});

function moveWriteForm(){
	var contextPath = getContextPath();
	location.href = contextPath + "/net/admin/notice/writeForm";
}

function getContextPath() { // contextPath 가져오는 방법
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

function deleteNotice(no) {
	var contextPath = getContextPath();
	
	if(confirm("정말 삭제하시겠습니까?")){
		// location.replace=`${pageContext.request.contextPath}`; // 기존 페이지를 새로운 페이지로 변경
		location.href = contextPath + "/net/admin/notice/noticeDelete?no=" + no;
		// document.form.submit; /* form 영역의 내용을 submit하겠다는 명령 */
	} else {
		return;
	};
}
</script>
</body>
</html>