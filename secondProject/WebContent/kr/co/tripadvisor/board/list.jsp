<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
<!-- common css -->
<link rel="stylesheet" type="text/css" href="../../../../css/client/common.css"
	media="all">
<!-- board_list css -->
<link rel="stylesheet" type="text/css" href="../../../../css/client/board_list.css"
	media="all">
<!-- modal css -->
<link rel="stylesheet" type="text/css"
	href="../../../../css/client/jquery.modal.min.css" media="all">
<!-- Remember to include jQuery :) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"
	type="text/javascript"></script>
<!-- jQuery Modal -->
<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"
	type="text/javascript"></script>
<!-- web font -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
	integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
	crossorigin="anonymous"></script>
</head>


<body>
	<div class='wrap'>
<!-- 		<header class='header' style="background-color: skyblue;"> -->

<!-- 			<a href="index.jsp" class='nav_logo'><span>tripadvisor</span></a> -->

<!-- 			<nav> -->
<!-- 				<ul> -->
<!-- 					<li class="nav_ui topBotomBordersOut"><a href="#"> <i -->
<!-- 							class="fas fa-paper-plane"></i> Tip Board -->
<!-- 					</a></li> -->
<!-- 					<li class="nav_ui topBotomBordersOut"><a href="#"> <i -->
<!-- 							class="fas fa-camera-retro"></i> Gallery -->
<!-- 					</a></li> -->
<!-- 					<li class="nav_ui topBotomBordersOut"><a href="#"> <i -->
<!-- 							class="fas fa-check-circle"></i> Notice -->
<!-- 					</a></li> -->
<!-- 				</ul> -->
<!-- 			</nav> -->

<!-- 			<div class='login_ui'> -->
<!-- 				<a href="#ex1" rel="modal:open">LOGIN</a> &nbsp; &nbsp; <a -->
<!-- 					href="#ex2" rel="modal:open">SIGN UP</a> -->
<!-- 			</div> -->
<!-- 		</header> -->
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h3>
					<i class="fas fa-paper-plane"></i> Tip Board
				</h3>
				<div>
					<ul>
						<li><a href="/secondProject/kr/co/tripadvisor/board/writeform">- 글쓰기</a></li>
					</ul>
				</div>
				<h3>
					<i class="fas fa-camera-retro"></i> Gallery
				</h3>
				<div>
					<ul>
						<li><a href="#">- 사진 올리기</a></li>
					</ul>
				</div>
			</div>
			<!-- accordion_navi 끝 -->
		</aside>
		<!-- 본문 -->
		<article>

			<div class="search_area">
				<form action="" method="">
					<div class="search_ctn">
						<div class="search_div1">
							<ul>
								<li class="search_li">주제 :</li>
								<li class="check_li"><input type="checkbox" id="s1"
									name="subject" value="1" /><label for="s1">맛집</label></li>
								<li class="check_li"><input type="checkbox" id="s2"
									name="subject" value="2" /><label for="s2">숙소</label></li>
								<li class="check_li"><input type="checkbox" id="s3"
									name="subject" value="3" /><label for="s3">명소</label></li>
							</ul>
						</div>

						<div class="search_div2">
							<ul>
								<li class="search_li">지역 :</li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r1" name="region" value="1" />
									<label for="r1">서울</label></li>
								<li><input type="checkbox" id="r2" name="region" value="2" />
									<label for="r2">인천</label></li>
								<li><input type="checkbox" id="r3" name="region" value="3" />
									<label for="r3">대전</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r4" name="region" value="4" />
									<label for="r4">광주</label></li>
								<li><input type="checkbox" id="r5" name="region" value="5" />
									<label for="r5">부산</label></li>
								<li><input type="checkbox" id="r6" name="region" value="6" />
									<label for="r6">대구</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r7" name="region" value="7" />
									<label for="r7">경기</label></li>
								<li><input type="checkbox" id="r8" name="region" value="8" />
									<label for="r8">강원</label></li>
								<li><input type="checkbox" id="r9" name="region" value="9" />
									<label for="r9">충청</label></li>
							</ul>
							<ul>
								<li><input type="checkbox" id="r10" name="region"
									value="10" /> <label for="r10">호남</label></li>
								<li><input type="checkbox" id="r11" name="region"
									value="11" /> <label for="r11">영남</label></li>
								<li><input type="checkbox" id="r12" name="region"
									value="12" /> <label for="r12">제주</label></li>
							</ul>
						</div>
					</div>
					<!-- search_ctn END -->
					<div class="search_box">
						<select name="search">
							<option value="">선택</option>
							<option value="1">ID</option>
							<option value="2">제목</option>
						</select> <input type="text" class="searchbox" />
						<button class="btn" type="submit">
							<i class="fas fa-search-plus" style="color: skyblue"></i>
						</button>
					</div>
					<!-- search_box END-->
				</form>
			</div>
			<!-- search_area END -->

			<div class='board_list'>
				<ul>
					<c:forEach var='b' items="${list}" >
						<li>
							<figure>
								<a href='detail?boardNo=${b.boardNo}'><div class="fi_div">
										<img src="../../../../images/trip_1.png">
									</div></a>
							</figure>
							<div>
								<h5>
									<a href='detail?boardNo=${b.boardNo}'>${b.title}</a>
								</h5>
								<span>주제 : ${b.attract} / 지역 : ${b.area}  </span> 
								<span><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd HH:mm" /></span> 
								<span>${b.id}</span>
								<span>조회수 : ${b.viewCnt}</span>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<!-- search_area -->
		</article>

<!-- 		<!-- Modal HTML embedded directly into document --> -->
<!-- 		<form action="" class="login_form modal" id="ex1" -->
<!-- 			style="display: none;"> -->
<!-- 			<h1>LOGIN</h1> -->
<!-- 			<br> -->
<!-- 			<br> -->
<!-- 			<p> -->
<!-- 				<label>ID</label><input type="text" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>Password</label><input type="password" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<input type="submit" value="LOGIN" class="login_but" /> -->
<!-- 			</p> -->
<!-- 		</form> -->
<!-- 		<!-- Modal HTML embedded directly into document --> -->
<!-- 		<form action="" class="login_form modal" id="ex2" -->
<!-- 			style="display: none;"> -->
<!-- 			<h1>SIGN UP</h1> -->
<!-- 			<br> -->
<!-- 			<br> -->
<!-- 			<p> -->
<!-- 				<label>ID</label><input type="text" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>Password</label><input type="password" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>PasswordCheck</label><input type="password" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>Email</label><input type="text" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>Name</label><input type="text" /> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<label>Gender</label> <label for="male">&nbsp;&nbsp;male<input -->
<!-- 					type="radio" id="male" name="gender" value="1" /></label> <label -->
<!-- 					for="female">&nbsp;&nbsp;female<input type="radio" -->
<!-- 					id="female" name="gender" value="2" /></label> -->
<!-- 			</p> -->
<!-- 			<p> -->
<!-- 				<input type="submit" value="SIGN UP" class="login_but" /> -->
<!-- 			</p> -->
<!-- 		</form> -->
<!-- 	</div> -->
	<!-- wrap END -->
	
	<script type="text/javascript">
	$(function() {// jQuery 시작 / 메뉴 마우스 오버 효과
		$(".accordion_navi > div").hide();
		$(".accordion_navi h3").mouseover(function() {
			if (!($(this).hasClass("selected"))) {
				$(".accordion_navi > h3").removeClass("selected");
				$(this).addClass("selected");
				$(".accordion_navi>div").not().slideUp("slow");
				$("+div", this).slideDown("slow"); //$(this).find("+div")
			}
		})

	}); //jQuery 종결
</script>
</body>
</html>