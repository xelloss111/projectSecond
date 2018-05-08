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
            <li id="stastics" class="treeview">
			  <a href="${pageContext.request.contextPath}/net/admin/stastics/index">
				<i class="fa fa-pie-chart"></i><span>통  계</span>
              </a>
            </li>
            <li id="manager" class="active treeview menu-open">
              <a href="#1">
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
          <button id="vallist" type="button" class="btn btn-success" >일괄수정</button>
        </div>
      </div>
      <p>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
          <table class="table table-bordered table-hover table-condensed">
            <thead>
              <tr>
                <th>
                	<input type="checkbox" name="all" id="all">
                </th>
                <th>번호</th><th>ID</th><th>이름</th><th colspan="2">권한</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="admin" items="${adminList}">
                <tr>
                  <td><input type="checkbox" name="chklist" id="${admin.no}">
              	  <td>${admin.no}</td>
              	  <td><c:out value="${admin.id}" /></td>
              	  <td><c:out value="${admin.name}" /></td>
              	  <td>
              	  <c:choose>
              	    <c:when test="${admin.noticeAuth == 't' }">
              	      <label class="checkbox-inline">
                      <input id="noticeAuth" name="auth" type="checkbox" checked data-toggle="toggle" value="1"> 공지
                      </label>
              	    </c:when>
              	    <c:otherwise>
              	      <label class="checkbox-inline">
                      <input id="noticeAuth" name="auth" type="checkbox" data-toggle="toggle" value="1"> 공지
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  <c:choose>
              	    <c:when test="${admin.boardAuth == 't' }">
          	    	  <label class="checkbox-inline">
                      <input id="boardAuth" name="auth" type="checkbox" checked data-toggle="toggle" value="2"> 게시판
                      </label>
              	    </c:when>
              	    <c:otherwise>
           	    	  <label class="checkbox-inline">
                      <input id="boardAuth" name="auth" type="checkbox" data-toggle="toggle" value="2"> 게시판
                      </label>
              	    </c:otherwise>
               	  </c:choose>
               	  <c:choose>
              	    <c:when test="${admin.userAuth == 't' }">
           	    	  <label class="checkbox-inline">
                      <input id="userAuth" name="auth" type="checkbox" checked data-toggle="toggle" value="3"> 회원
                      </label>
              	    </c:when>
              	    <c:otherwise>
          	    	  <label class="checkbox-inline">
                      <input id="userAuth" name="auth" type="checkbox" data-toggle="toggle" value="3"> 회원
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
            </tbody>
          </table>
        </div>
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8" align="center">
       	  <nav>
			<ul class="pagination">
  	          <li class="<c:if test='${paging.prev eq false }'>disabled</c:if>">
			    <c:if test="${paging.prev eq true}">
			      <a href="${pageContext.request.contextPath}/net/admin/management/admin?pageNo=${paging.pageNo - 1}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			      </c:if>
			    </li>
			  <c:forEach var="iContent" begin="${paging.startPage}" end="${paging.endPage}">
        		<c:choose>
        			<c:when test="${iContent == paging.pageNo}">
        				<li class="active">
        					<a href="#1">${iContent}</a>
        				</li>
        			</c:when>
        			<c:otherwise>
        				<li>
        					<a href="${pageContext.request.contextPath}/net/admin/management/admin?pageNo=${iContent}">${iContent}</a>
        				</li>
        			</c:otherwise>
        		</c:choose>
        	</c:forEach>
        	<li class="<c:if test='${paging.next eq false }'>disabled</c:if>">
			<c:if test="${paging.next eq true }">        	  
			    <a href="${pageContext.request.contextPath}/net/admin/management/admin?pageNo=${paging.endPage + 1}" aria-label="Next">
			      <span aria-hidden="true">&raquo;</span>
			    </a>
			 </c:if>
			  </li>
			</ul>
		 </nav>
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
  				<input name="registAuth" type="checkbox" data-toggle="toggle" value="1"> 공지
				</label>
				<label class="checkbox-inline">
  				<input name="registAuth" type="checkbox" data-toggle="toggle" value="2"> 게시판
				</label>
				<label class="checkbox-inline">
				<input name="registAuth" type="checkbox" data-toggle="toggle" value="3"> 회원 관리
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
	// 체크박스 클릭 시 prop 옵션을 변경
	// 조건이 선택한 체크박스의 prop 옵션에 따라 달라짐 (true, false);
	$("#all").click(function () {
		$("input[name='chklist']").prop("checked", $("#all").prop("checked"));

	});
	
	// 체크박스 선택에 따른 각 테이블 행 값을 추출하고 배열 및 객체에 저장, 그리고 서버와 통신
	$("#vallist").click(function () {
		var admin = {}
		var tdArr = new Array();
		var checkBox = $("input[name='chklist']:checked");
		
		// each를 사용하면 특정 객체 내부에 여러 객체가 존재하면 존재하는 갯수 만큼 반복을 돌면서
		// 별도의 명령을 수행
		checkBox.each(function(i) {
			// tr은 체크박스의 부모 (td) -> 부모 (tr)
			var tr = checkBox.parent().parent().eq(i);
			// tr의 자식 객체는 (td);
			var td = tr.children();
			
			// Row에 td들은 순서대로 나열
			// 0번째 : 체크박스 영역
			// 1번째 : 목록 번호
			// 2번째 : 매니저 ID
			// 3번째 : 매니저 이름
			// 4번째 : 권한 관리 체크박스 4종류
			var box = {}; 
			box["no"] = td.eq(1).text();
			box["id"] = td.eq(2).text();
			box["name"] = td.eq(3).text();
			var chkbox = td.eq(4).children();
			
			// 4번째 td의 체크박스의 id와 체크 상태를 가져오기 위해
			// 배열 선언
			var chklist = new Array();
			
			// 객체의 자식중 해당 이름을 가진 자식 객체만 넘겨받는다.
			// 이때 자식 객체가 여러 개일 수 있어 배열 변수에 넘겨준다.
			chklist = chkbox.find("input");
						
			// 4번째 TD는 여러개가 존재하기 때문에 for 문으로 값을 꺼내
			// 다시 하나의 객체로 묶어준 다음 배열에 push
			for (let i = 0; i < chklist.length; i++) {
				box[chklist[i].id] = chklist[i].checked;					
			}
			
			// 배열 안에 box 객체를 push
			tdArr.push(box);
		});	

		// JAVA에서 JSON형태로 값을 뽑아내기 위해
		// 별도의 객체의 키값을 지정하고 해당 키의 값을 tdArr 배열로 지정
		admin['admin'] = tdArr;
		
		// JSON 형태를 문자열로 넘겨주기 위해 파싱
		var jsonData = JSON.stringify(admin);
		
		$.ajax({
			url: contextPath + "/net/admin/management/updateManager",
			type: "post",
			data: {admin : jsonData},
			dataType: "json",
			traditional: true,
// 			contentType: "application/json",
			success: function(data) {
				console.log(data);
				location.href = data;
			},
			error: function(data){
				
			}
		});
	});
	
	
	function deleteAdmin(id) {
		if(confirm("정말 삭제하시겠습니까?")){
			// location.replace=`${pageContext.request.contextPath}`; // 기존 페이지를 새로운 페이지로 변경
			location.href = contextPath + "/net/admin/management/adminDelete?id=" + id;
			// document.form.submit; /* form 영역의 내용을 submit하겠다는 명령 */
		} else {
			return;
		};
	}

	var contextPath = getContextPath();
	function getContextPath() { // contextPath 가져오는 방법
		var hostIndex = location.href.indexOf( location.host ) + location.host.length;
		return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

</script>
</body>
</html>