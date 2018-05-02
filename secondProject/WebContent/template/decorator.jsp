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
	<!-- board_detail css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/board_detail.css" media="all">
	<!-- board_list css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/board_list.css" media="all">
	<!-- paging css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/paging.css" media="all">
	<!-- summernote-lite css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/summernote-lite.css" media="all">
	<!-- board_wirteform css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/board_wirteform.css" media="all">
	<!-- board_wirteform css -->
	<link rel="stylesheet" type="text/css"
	href="/secondProject/css/client/board_wirteform.css" media="all">
	
	<!-- Remember to include jQuery :) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- web font -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<!-- summernote-lite javaScript -->
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