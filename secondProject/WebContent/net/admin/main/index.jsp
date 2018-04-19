<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트립팁 어드민 페이지</title>
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
	<body class="hold-transition login-page">
		<div class="login-box">
  		<div class="login-logo">
    		<a href="${pageContext.request.contextPath}/net/admin/main"><b>TripTip</b>Admin</a>
  		</div>
  		<!-- /.login-logo -->
  		<div class="login-box-body">
  			<c:choose>
  				<c:when test="${!empty errMsg}">
  					<p style="color: red;" class="login-box-msg">${errMsg}</p>
  				</c:when>
  				<c:otherwise>
		   			<p class="login-box-msg">관리자 페이지 로그인</p>
  				</c:otherwise>
  			</c:choose>
    		<form action="${pageContext.request.contextPath}/net/admin/main/login" method="post">
      			<div class="form-group has-feedback">
      			  <input type="text" class="form-control" placeholder="id" name="id">
      			</div>
      			<div class="form-group has-feedback">
        			<input type="password" class="form-control" placeholder="password" name="pass">
      			</div>
				<div class="row">
        			<!-- /.col -->
        			<div class="col-xs-4"></div>
        			<div class="col-xs-4">
         				<button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
       			 	</div>
        			<!-- /.col -->
    			</div>
			</form>
		</div>
	</div>
	
<!-- jQuery 3 -->
<script src="../../../js/admin/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../../js/admin/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../../js/admin/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>