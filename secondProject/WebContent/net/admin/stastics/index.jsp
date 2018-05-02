<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트립팁 어드민 통계</title>
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

	<!--  Google chart -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
	<!-- Google Font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
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
				<li id="stastics" class="active treeview menu-open">
					<a href="#1">
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
				<li id="notice" class="treeview">
					<a href="${pageContext.request.contextPath}/net/admin/notice/list">
						<i class="fa fa-edit"></i><span>공지 관리</span>
					</a>
				</li>
				<li id="board" class="treeview">
					<a href="#">
						<i class="fa fa-clipboard"></i><span>게시판 관리</span>
					</a>
			</ul>
		</section>
	</aside>

	<div class="content-wrapper">
	<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>사이트 통계
			<small>- 주요 지표</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="index"><i class="fa fa-pie-chart"></i>Home</a></li>
				<li class="active">stastics</li>
			</ol>
		</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-md-1">
				<form id="mForm" action="${pageContext.request.contextPath}/net/admin/stastics/search" method="POST">
					<input type="date" name="date">
					<button id="stastic" type="button">검색</button>
				</form>
			</div>
		</div>
			
		<div class="row">
			<div class="col-md-1"></div>
   		    <div class="col-md-10" align='center'>
        		<div class="chart" id='revenue-chart'></div>
			</div>
		</div>
    </section>
    <!-- /.content -->
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
<!-- AdminLTE for demo purposes -->
<script src="../../../js/admin/demo.js"></script>
<script>
function getContextPath() { // contextPath 가져오는 방법
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}

var contextPath = getContextPath();

	// 날짜 선택 후 검색 버튼 클릭 시 발생하는 이벤트 처리
	$("#stastic").click(function() {
		var form = $("#mForm").serialize();
		var info = [];
		var options = {	title: "지표별 통계", seriesType: 'bars', height: 400};
		info.push(['집계일자', '자유게시판', '갤러리', '공지', '유저', '게시판 댓글', '갤러리 댓글', '스크랩']);
		$.ajax({
	// 		type: "POST",
			data: form,
	// 		dataType: "json",
			url: "search",
			success: function(data) {
				// 얼럿 메시지는 배열 타입이 아니기 때문에
				// 인덱스 요소에 대괄호가 있는지 검사 
				if (data.indexOf('[') == -1) {
					alert(data);
					return;
				}
				
				// 문자열을 JSON 타입으로 파싱
				var value = JSON.parse(data);
							
				for (let i = 0; i < value.length; i++) {
					var val = [];
					// 문자열로 된 날짜를 다시 날짜 형식 객체로 생성
					var d = new Date(value[i].stasticsDate);
					// 날짜 포맷을 변경한 수 배열에 삽십
					val.push(getFormattedDate(d));
					// 나머지 통계 정보를 배열에 삽입
					val.push(value[i].boardCount);
					val.push(value[i].galleryCount);
					val.push(value[i].noticeCount);
					val.push(value[i].userCount);
					val.push(value[i].boardCommentCount);
					val.push(value[i].galleryCommentCount);
					val.push(value[i].scrapCount);
					info.push(val);
				}
				
				// 구글 차트 버전 최신으로 세팅
				google.charts.load('current', {'packages':['corechart']});
	
				// 콜백 함수 호출
				google.charts.setOnLoadCallback(function() {
					var chart = new google.visualization.ComboChart(document.querySelector('#revenue-chart'));
					chart.draw(google.visualization.arrayToDataTable(info), options);
				});
			}
		});
	});

	// 날짜 데이터 포맷 변환 함수
	function getFormattedDate(date) {
		var year = date.getFullYear();
	
		var month = (1 + date.getMonth()).toString();
		month = month.length > 1 ? month : '0' + month;
		
		var day = date.getDate().toString();
		day = day.length > 1 ? day : '0' + day;
			
		return year + '-' + month + '-' + day;
	}
	
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