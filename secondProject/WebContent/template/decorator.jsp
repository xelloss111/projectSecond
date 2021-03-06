<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">

<title><sitemesh:write property="title" /></title>
<!-- common css -->
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/common.css"
	media="all">
	<!-- modal css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/jquery.modal.min.css" media="all">
	<!-- minimal Scrollbar -->
	<link rel="stylesheet" type="text/css" href="/secondProject/css/client/minimal_scrollbar.css" media="all">
	<!-- summernote-lite css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/summernote-lite.css" media="all">


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"
		type="text/javascript"></script>

	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<!-- web font -->
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<script src="/secondProject/js/client/summernote-lite.js"></script>


<sitemesh:write property="head" />

</head>
<body>
	<div class="container">
		<div class="header">
			<c:import url="/decorator/topMenu.jsp"></c:import>
		</div>
		<div class="content">
			<sitemesh:write property="body" />
		</div>
		<!-- 		<div class="footer"> -->
		<%-- 			<c:import url="/decorator/footer.jsp"></c:import> --%>
		<!-- 		</div> -->
	</div>
</body>
</html>