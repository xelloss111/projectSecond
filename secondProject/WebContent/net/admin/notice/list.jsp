<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트립팁 어드민 - 공지 관리</title>
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
  <c:if test="${!empty alert}">
  <script>
  	alert(${alert});
  </script>
  </c:if>

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
              <a href="#1">
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
    <h1>공지 관리</h1>
    <ol class="breadcrumb">
      <li><a href="index.html"><i class="fa fa-edit"></i>Home</a></li>
      <li class="active">Notice</li>
    </ol>
  </section>
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" align="right">
	        <button type="button" class="btn btn-success" onclick="moveWriteForm()">공지 등록</button>
        </div>
      </div>
      <p>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <table class="table table-bordered table-hover table-condensed">
            <thead>
              <tr>
                <th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th><th></th>
              </tr>
            </thead>
              <c:forEach var="notice" items="${noticeList}">
                <tr>
              	  <td style="width:80px;">${notice.no}</td>
              	  <td style="width:640px;"><a href="detail?no=${notice.no}"><c:out value="${notice.title}" /></a></td>
              	  <td style="width:80px;"><c:out value="${notice.id}" /></td>
              	  <td style="width:120px;"><fmt:formatDate value='${notice.regDate}' pattern="yyyy-MM-dd" /></td>       
              	  <td style="width:70px">${notice.viewCnt}</td>       	  
               	  <td align="center">
              	  	<%--
              	  	<button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/net/admin/management/adminDelete?id=${admin.id}'">삭제</button>
              	  	 --%>
              	  	<button class="btn btn-danger" onclick="javascript:deleteNotice('${notice.no}');">삭제</button>
              	  </td>
                </tr>
              </c:forEach>
          </table>
        </div>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" align="center">
		<c:if test="${paging.totalCount != 0 }">
       	  <nav>
			<ul class="pagination">
  	          <li class="<c:if test='${paging.prev eq false }'>disabled</c:if>">
			    <c:if test="${paging.prev eq true}">
			      <a href="${pageContext.request.contextPath}/net/admin/notice/list?pageNo=${paging.startPage - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			      </c:if>
			    </li>
			  <c:forEach var="iContent" begin="${paging.startPage}" end="${paging.endPage}">
        		<c:choose>
        			<c:when test="${iContent == paging.pageNo}">
        				<li class="active">
        					<a href="${pageContext.request.contextPath}/net/admin/notice/list?pageNo=${iContent}">${iContent}</a>
        				</li>
        			</c:when>
        			<c:otherwise>
        				<li>
        					<a href="${pageContext.request.contextPath}/net/admin/notice/list?pageNo=${iContent}">${iContent}</a>
        				</li>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
         	<li class="<c:if test='${paging.next eq false }'>disabled</c:if>">
			<c:if test="${paging.next eq true }">  
			    <a href="${pageContext.request.contextPath}/net/admin/notice/list?pageNo=${paging.endPage + 1}" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			    </a>
			    </c:if>
	        </li>
			</ul>
		 </nav>
		</c:if>
        </div>
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
	}
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