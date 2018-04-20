<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<title>tripadvisor</title>
	<meta charset="UTF-8">
	<!-- common css -->
	<link rel="stylesheet" type="text/css" href="../../../../css/common.css" media="all">
	<!-- modal css -->
	<link rel="stylesheet" type="text/css" href="../../../../css/jquery.modal.min.css" media="all">
	<!-- Remember to include jQuery :) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- web font -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>

	<script type="text/javascript">
	$(function(){// jQuery 시작 / 메뉴 마우스 오버 효과
		$(".accordion_navi > div").hide();
		$(".accordion_navi h3").mouseover(function(){
			if (!($(this).hasClass("selected"))){
				$(".accordion_navi > h3").removeClass("selected");
				$(this).addClass("selected");
				$(".accordion_navi>div").not().slideUp("slow");
			$("+div",this).slideDown("slow"); //$(this).find("+div")
		}
	})

	}); //jQuery 종결 
</script>
<style type="text/css">
.wrap {
	width: 100%;
	height: 100%;
}
aside {
	box-sizing: border-box;
	width: 10%;
	height: 100%;
	position: relative;
	margin-left: 10%; 

	letter-spacing: 2px;
	float: left;
	padding-top:30px;
}
.accordion_navi {float:left; width: 100%; color:#444; margin:10px;}
.accordion_navi h3 {height:50px; line-height:50px; 
	text-indent:12px; 
	color:#000;
}
.accordion_navi h3.over {cursor:pointer;} /* 마우스 오버 스타일*/
.accordion_navi h3.selected {cursor:default;} /* 선택 스타일*/
.accordion_navi > div > ul {
	text-indent:1rem;
}
.accordion_navi > div > ul li a {
	display:block; color:#444;
}
.accordion_navi > div > ul li a:hover {
	color:skyblue; text-decoration: none;
}
.accordion_navi > h3 > a {
	display:block; color:#000;
}

article {
	padding-top: 30px;
	padding-left: 5%;
	width: 65%;
	height: auto;
	margin-right: 10%;
	float: left;
	position: relative;
}
article > h1 {
	margin-left: 2%;
}
.board_list {
	margin: 0px 0% 0px 2%;
	width: 96%;
	height: auto;
}
.board_list li {
	margin: 2% 1% 2% 0px;
	box-sizing: border-box;
	width: 18.4%;
	height: 300px;
	border: 1px solid #111;
	float: left;
}
.board_list li:last-child {
	margin: 2% 0% 2% 0px;
}
.board_list li figure {
	width: 150px;
	height: 150px;
	margin: 20px auto;
	overflow: hidden;
}
.board_list li figure img {
	width: 150;
	height: 150px;
}
.board_list li .fi_div {
	transform: scale(1);
	-webkit-transform: scale(1);
	-moz-transform: scale(1);
	-ms-transform: scale(1);
	-o-transform: scale(1);
	transition: all 0.3s ease-in-out; 
}
.board_list li .fi_div:hover {
	transform: scale(1.2);
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
}
.board_list li h5 {
	margin: 5% 2%;
}
.board_list li span {
	display: block;
	box-sizing: border-box;
	width: 100%;
	font-size: 12px;
	margin: 2%;
}
</style>
</head>


<body>
	<div class='wrap'>
		<header class='header' style="background-color: skyblue;">

			<a href="index.jsp" class='nav_logo'><span>tripadvisor</span></a>

			<nav>
				<ul>
					<li class="nav_ui topBotomBordersOut">
						<a href="#">
							<i class="fas fa-paper-plane"></i>
							Tip Board
						</a>
					</li>
					<li class="nav_ui topBotomBordersOut">
						<a href="#">
							<i class="fas fa-camera-retro"></i>	
							Gallery
						</a>
					</li>
					<li class="nav_ui topBotomBordersOut">
						<a href="#">
							<i class="fas fa-check-circle"></i>
							Notice
						</a>
					</li>
				</ul>
			</nav>
			
			<div class='login_ui'>
				<a href="#ex1" rel="modal:open">LOGIN</a> &nbsp; &nbsp; 
				<a href="#ex2" rel="modal:open">SIGN UP</a>
			</div>
		</header>
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h3><i class="fas fa-paper-plane"></i>
					Tip Board
				</h3>
				<div>
					<ul>
						<li><a href="#">- 글쓰기</a></li>
					</ul>
				</div>
				<h3><i class="fas fa-camera-retro"></i>	
					Gallery
				</h3>
				<div>
					<ul>
						<li><a href="#">- 사진 올리기</a></li>
					</ul>
				</div>
				<h3>
					<a href="#">
						<i class="fas fa-tags"></i>
						스크랩
					</a>
				</h3>
				<h3>
					<a href="#">
						<i class="far fa-smile"></i>
						회원정보
					</a>
				</h3>
			</div><!-- accordion_navi 끝 -->
		</aside>
		<!-- *************본문************* -->
		<article>
			<h1>내정보 (MyInfo) - 스크랩</h1>
			<div class='board_list'>
				<ul>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_2.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 숙소 / 지역 : 호남 </span>
							<span>2018-03-30 23:25</span>
							<span>lama</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_3.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 강원 </span>
							<span>2018-03-30 23:26</span>
							<span>hr kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_4.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
					<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>
										<li>
						<figure>
							<a href="#"><div class="fi_div"><img src="images/trip_1.png"></div></a>
						</figure>
						<div>
							<h5>Title</h5>
							<span>주제 : 맛집 / 지역 : 서울 </span>
							<span>2018-03-30 20:11</span>
							<span>mini kim</span>
						</div>
					</li>

				</ul>
			</div>
		</article>	

		<!-- Modal HTML embedded directly into document -->
		<form action="" class="login_form modal" id="ex1" style="display:none;">
			<h1> LOGIN </h1><br><br>
			<p><label>ID</label><input type="text" /></p>
			<p><label>Password</label><input type="password" /></p>
			<p><input type="submit" value="LOGIN" class="login_but" /></p>
		</form>
		<!-- Modal HTML embedded directly into document -->
		<form action="" class="login_form modal" id="ex2" style="display:none;">
			<h1> SIGN UP </h1><br><br>
			<p><label>ID</label><input type="text" /></p>
			<p><label>Password</label><input type="password" /></p>
			<p><label>PasswordCheck</label><input type="password" /></p>
			<p><label>Email</label><input type="text" /></p>
			<p><label>Name</label><input type="text" /></p>
			<p><label>Gender</label>
				<label for="male">&nbsp;&nbsp;male<input type="radio" id="male" name="gender" value="1" /></label>
				<label for="female">&nbsp;&nbsp;female<input type="radio" id="female" name="gender" value="2" /></label>
			</p>
			<p><input type="submit" value="SIGN UP" class="login_but" /></p>
		</form>
	</div><!-- wrap END -->
</body>
</html>