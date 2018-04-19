<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트립팁 어드민 - 매니저 관리</title>
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
            <li class="active treeview menu-open">
              <a href="${pageContext.request.contextPath}/net/admin/management/index">
                <i class="fa fa-laptop"></i><span>매니저 관리</span>
              </a>
            </li>
            <li class="treeview">
              <a href="user_management.html">
                <i class="fa fa-user-o"></i><span>회원 관리</span>
              </a>
            </li>
            <li class="treeview">
              <a href="noticelist.html">
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
    <h1>매니저 관리</h1>
    <ol class="breadcrumb">
      <li><a href="index.html"><i class="fa fa-laptop"></i>Home</a></li>
      <li class="active">manager_management</li>
    </ol>
  </section>
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" align="right">
	    <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" data-backdrop="static">매니저 추가</button>
          <button type="button" class="btn btn-success" >Success</button>
        </div>
      </div>
      <p>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <table class="table table-bordered table-hover table-condensed">
            <thead>
              <tr>
                <th>번호</th><th>ID</th><th>이름</th><th colspan="2">권한</th>
              </tr>
            </thead>
              <c:forEach var="admin" items="${adminList}">
                <tr>
              	  <td>${admin.no}</td>
              	  <td><c:out value="${admin.id}" /></td>
              	  <td><c:out value="${admin.name}" /></td>
              	  <td>
              	  <c:choose>
              	    <c:when test="${admin.noticeAuth == 't' }">
              	      <label class="checkbox-inline">
                      <input type="checkbox" checked data-toggle="toggle" value="1"> 공지
                      </label>
              	    </c:when>
              	    <c:otherwise>
              	      <label class="checkbox-inline">
                      <input type="checkbox" data-toggle="toggle" value="1"> 공지
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  
               	  <c:choose>
              	    <c:when test="${admin.boardAuth == 't' }">
          	    	  <label class="checkbox-inline">
                      <input type="checkbox" checked data-toggle="toggle" value="2"> 자유게시판
                      </label>
              	    </c:when>
              	    <c:otherwise>
           	    	  <label class="checkbox-inline">
                      <input type="checkbox" data-toggle="toggle" value="2"> 자유게시판
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  
               	  <c:choose>
              	    <c:when test="${admin.galleryAuth == 't' }">
           	    	  <label class="checkbox-inline">
                      <input type="checkbox" checked data-toggle="toggle" value="3"> 갤러리
                      </label>
              	    </c:when>
                    <c:otherwise>
           	          <label class="checkbox-inline">
                      <input type="checkbox" data-toggle="toggle" value="3"> 갤러리
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  
               	  <c:choose>
              	    <c:when test="${admin.userAuth == 't' }">
           	    	  <label class="checkbox-inline">
                      <input type="checkbox" checked data-toggle="toggle" value="4"> 유저
                      </label>
              	    </c:when>
              	    <c:otherwise>
          	    	  <label class="checkbox-inline">
                      <input type="checkbox" data-toggle="toggle" value="4"> 유저
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  </td>
               	  <td align="center">
              	  	<%--
              	  	<button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/net/admin/management/adminDelete?id=${admin.id}'">삭제</button>
              	  	 --%>
              	  	<button class="btn btn-danger" onclick="javascript:deleteAdmin('${admin.id}');">삭제</button>
              	  </td>
                </tr>
              </c:forEach>
          </table>
        </div>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" align="center">
        	<c:if test="${paging.pageNo > 1}">
        		<a href="${pageContext.request.contextPath}/net/admin/management/index?pageNo=${paging.pageNo - 1}">◀</a>
        	</c:if>
        	<c:forEach var="iContent" begin="${paging.startPage}" end="${paging.endPage}">
        		<c:choose>
        			<c:when test="${iContent == paging.pageNo}">
        				<a href="${pageContext.request.contextPath}/net/admin/management/index?pageNo=${iContent}"><b>[${iContent}]</b></a>
        			</c:when>
        			<c:otherwise>
        				<a href="${pageContext.request.contextPath}/net/admin/management/index?pageNo=${iContent}">[${iContent}]</a>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	<c:if test="${paging.pageNo < paging.totalPage}">
        		<a href="${pageContext.request.contextPath}/net/admin/management/index?pageNo=${paging.pageNo + 1}">▶</a>
        	</c:if>
<!--           <a href="#">◀</a> -->
<!--           <a href="#">[1]</a> -->
<!--           <a href="#">[2]</a> -->
<!--           <a href="#">[3]</a> -->
<!--           <a href="#">[4]</a> -->
<!--           <a href="#">[5]</a> -->
<!--           <a href="#">▶</a> -->
        </div>
        </div>
      </div>
    </div>
    	
	 <!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	   <div class="modal-dialog">
	     <div class="modal-content">
	       <div class="modal-header">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	         <h4 class="modal-title" id="myModalLabel">매니저 추가</h4>
	       </div>
	       <div class="modal-body">
	       <form action="${pageContext.request.contextPath}/net/admin/management/adminSubmit" method="post">
     			<div class="form-group has-feedback">
   			    <input type="text" class="form-control" placeholder="Id" name="id">
   			</div>
   		    <div class="form-group has-feedback">
       			<input type="password" class="form-control" placeholder="Password" name="pass">
    			</div>
   		    <div class="form-group has-feedback">
       			<input type="text" class="form-control" placeholder="이름" name="name">
    			</div>
   			<p>권한</p>
    			<div class="form-group has-feedback">
     			<label class="checkbox-inline">
  				<input type="checkbox" data-toggle="toggle" name="auth" value="1"> 공지
				</label>
				<label class="checkbox-inline">
  				<input type="checkbox" data-toggle="toggle" name="auth" value="2"> 자유게시판
				</label>
				<label class="checkbox-inline">
				<input type="checkbox" data-toggle="toggle" name="auth" value="3"> 갤러리
				</label>
				<label class="checkbox-inline">
				<input type="checkbox" data-toggle="toggle" name="auth" value="4"> 회원 관리
				</label>
    			</div>
	       <div class="modal-footer">
	         <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	         <button type="submit" class="btn btn-primary">등록</button>
	       </div>
	       </form>
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
function deleteAdmin() {
	
	function getContextPath() { // contextPath 가져오는 방법
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};
	
	var contextPath = getContextPath();
	
	if(confirm("정말 삭제하시겠습니까?")){
		// location.replace=`${pageContext.request.contextPath}`; // 기존 페이지를 새로운 페이지로 변경
		location.href = contextPath + "/net/admin/management/adminDelete?id=" + id;
		// document.form.submit; /* form 영역의 내용을 submit하겠다는 명령 */
	} else {
		return;
	};
}

</script>
</body>
</html>