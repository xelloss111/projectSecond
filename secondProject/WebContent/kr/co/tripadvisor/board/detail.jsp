<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>tripadvisor</title>
<meta charset="UTF-8">
<!-- common css -->
<link rel="stylesheet" type="text/css" href="../../../../css/common.css"
	media="all">
<!-- modal css -->
<link rel="stylesheet" type="text/css"
	href="../../../../css/jquery.modal.min.css" media="all">
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
	padding-top: 30px;
}

.accordion_navi {
	float: left;
	width: 100%;
	color: #444;
	margin: 10px;
}

.accordion_navi h3 {
	height: 50px;
	line-height: 50px;
	text-indent: 12px;
	color: #000;
}

.accordion_navi h3.over {
	cursor: pointer;
} /* 마우스 오버 스타일*/
.accordion_navi h3.selected {
	cursor: default;
} /* 선택 스타일*/
.accordion_navi>div>ul {
	text-indent: 1rem;
}

.accordion_navi>div>ul li a {
	display: block;
	color: #444;
}

.accordion_navi>div>ul li a:hover {
	color: skyblue;
	text-decoration: none;
}

article {
	padding-top: 30px;
	width: 66%;
	height: auto;
	margin-right: 10%;
	float: left;
	position: relative;
	padding: 2%;
}

/* 버튼 영역 / 버튼 스타일 */
.btn_div {
	width: 100%;
	height: 50px;
	line-height: 50px;
	margin-bottom: 2%;
}

.btn {
	margin: 2% 1%;
	float: right;
	padding: 6px 12px;
	cursor: pointer;
	border: 1px solid transparent; /* 부모색상 동일 */
	border-radius: 4px;
	font-family: 'Righteous', cursive;
}

.btn:active {
	box-shadow: 0 3px 5px rgba(0, 0, 0, .125) inset;
}

.btn:focus, .btn:hover {
	color: #333;
	text-decoration: none;
}
/* Button 3e */
.b_write_but {
	color: #fff;
	background-color: #87ceeb;
}

.btn-b_write_but:active, .btn-b_write_but:focus, .btn-b_write_but:hover
	{
	color: #fff;
	background-color: #2980b9;
}
/* 댓글 영역 */
.comment_div {
	width: 100%;
	height: 100px;
	border: 1px solid #ddd;
}

.comment {
	text-align: center;
	box-sizing: border-box;
}

.comment_user {
	padding: 5px;
	width: 15%;
}

.comment_content {
	padding: 5px;
	width: 70%;
}

.co_bnt {
	background-color: #fff;
	font-family: 'Righteous', cursive;
	color: #999;
	width: 80px;
	height: 29px;
}

.re_bnt {
	background-color: #fff;
	font-family: 'Righteous', cursive;
	color: #999;
	width: 60px;
	height: 15px;
}

.comment_table {
	margin: 0 auto;
	margin-top: 10px;
	border: 1px solid grey;
	width: 95.5%;
}

.comment_table>tr, td {
	text-align: center;
	border: 1px dashed grey;
	padding: 2px 2px;
}

h1 {
	font-size: xx-large;
}

.sc_submit {
	width: 96%;
	height: 30px;
	line-height: 30px;
	float: right;
	margin-top: 15px;
	margin-bottom: 15px;
}

.sc_submit>button {
	width: 80px;
	height: 30px;
	background-color: #999;
	font-family: 'Righteous', cursive;
	color: #fff;
	float: right;
	margin-right: 2%;
}

.top_sel {
	width: 100%;
	height: 100px;
	margin: 10px;
}

.sel_1 {
	width: 16%;
	float: left;
	height: 100px;
	line-height: 50px;
}

.sel_2 {
	width: 16%;
	float: left;
	height: 100px;
	line-height: 50px;
}

.b_title {
	width: 68%;
	height: 100px;
}

.b_title>h1 {
	display: inline-block;
}
</style>

</head>


<body>
	<div class='wrap'>
		<header class='header' style="background-color: skyblue;">

			<a href="index.jsp" class='nav_logo'><span>tripadvisor</span></a>

			<nav>
				<ul>
					<li class="nav_ui topBotomBordersOut"><a href="#"> <i
							class="fas fa-paper-plane"></i> Tip Board
					</a></li>
					<li class="nav_ui topBotomBordersOut"><a href="#"> <i
							class="fas fa-camera-retro"></i> Gallery
					</a></li>
					<li class="nav_ui topBotomBordersOut"><a href="#"> <i
							class="fas fa-check-circle"></i> Notice
					</a></li>
				</ul>
			</nav>

			<div class='login_ui'>
				<a href="#ex1" rel="modal:open">LOGIN</a> &nbsp; &nbsp; <a
					href="#ex2" rel="modal:open">SIGN UP</a>
			</div>
		</header>
		<!-- 메뉴  -->
		<aside>
			<div class="accordion_navi">
				<h3>
					<i class="fas fa-paper-plane"></i> Tip Board
				</h3>
				<div>
					<ul>
						<li><a href="#">- 글쓰기</a></li>
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
		<!-- 본문 -->
		<article>
			<!-- 상단 영역 -->
			<div align="center" class='top-sel'>
				<div class='sel_1'>지역 : 서울</div>
				<!-- sel_1 END -->
				<div class='sel_2'>주제 : 맛집</div>
				<!-- sel_2 END -->
				<div class="b_title">
					<h1>제목</h1>

				</div>
				<!-- b_title END -->
			</div>
			<!-- top-sel END-->
			<div>
				<!-- 내용 영역  -->
				<p align="center">
					주말 나들이도 좋지만 마음을 채우는 독서에 취미를 가져보기로 했던 2015년.<br> 목표했던만큼 읽지는
					못했지만<br> 올해 내가 읽었던 책중에서 베스트 5권을 소개하려한다.<br>
				</p>
				<div align="center">
					<h1>오늘은 태안</h1>
				</div>
				<div align="center">
					<img src="../../../../images/trip_1.png" width="541" height="300">
				</div>
				<p>얘기꾼 여행서 '오늘은' 시리즈 태안편이다. 두 작가가 일곱 해변 길을 걸으며 겪는 에피소드가 펼쳐진다.
					태안의 아름다운 풍경과 바다와 함께 살아가는 사람들의 이야기를 담았다. 책을 읽다보면 바람이 머무는 태안으로 훌쩍 떠나게
					될 것이다. 누구나 한 번쯤은 바다여행을 꿈꾼다. 흐르는 시간에 쉼은 없지만, 가끔 쉼이 필요할 때가 아닐까 생각한다.
					작은 꾸러미 하나 메고 바람이 머무는 곳으로 떠나보라고 권하고 싶다. 수평선을 바라보는 순간 크게 느껴졌던 근심도 한낱
					모래알갱이처럼 작게 보이고, 시간은 천천히 흐르고 마음은 바다처럼 넓어질 것이다.</p>
				<div align="center">
					<table>
						<tr>
							<td colspan="2"><b>오늘은 태안</b></td>
						</tr>
						<tr>
							<td>저자</td>
							<td>김미정, 전현서</td>
						</tr>
						<tr>
							<td>출판</td>
							<td>얘기꾼</td>
						</tr>
						<tr>
							<td>발매</td>
							<td>2015.07.13.</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="btn_div">
				<button type="submit" class="b_write_but btn">SCRAP 1</button>
				<input type="submit" value="UPDATE" class="b_write_but btn" /> <input
					type="submit" value="DELETE" class="b_write_but btn" />
			</div>
			<div class="comment_div">
				<div class="comment_list">
					<table class="comment_table">
						<tr>
							<td width="17%">asklhaq</td>
							<td width="50%">즐거운 여행 다녀오세요ㅎㅎ</td>
							<td width="20%">2018.04.09 19:35:47</td>
							<td width="13%"><button class=re_bnt>update</button>
								<button class=re_bnt>delete</button></td>
						</tr>
						<tr>
							<td>tripto</td>
							<td>상하이는 역시 야경과 샤오롱빠오~_~_~_~_~_~_~_~_집에가고싶다~_~_~_댓글100자 넉넉해요</td>
							<td>2018.04.24 19:35:47</td>
							<td><button class=re_bnt>update</button>
								<button class=re_bnt>delete</button></td>
						</tr>
					</table>
				</div>
			</div>
		</article>

		<!-- Modal HTML embedded directly into document -->
		<form action="" class="login_form modal" id="ex1"
			style="display: none;">
			<h1>LOGIN</h1>
			<br>
			<br>
			<p>
				<label>ID</label><input type="text" />
			</p>
			<p>
				<label>Password</label><input type="password" />
			</p>
			<p>
				<input type="submit" value="LOGIN" class="login_but" />
			</p>
		</form>
		<!-- Modal HTML embedded directly into document -->
		<form action="" class="login_form modal" id="ex2"
			style="display: none;">
			<h1>SIGN UP</h1>
			<br>
			<br>
			<p>
				<label>ID</label><input type="text" />
			</p>
			<p>
				<label>Password</label><input type="password" />
			</p>
			<p>
				<label>PasswordCheck</label><input type="password" />
			</p>
			<p>
				<label>Email</label><input type="text" />
			</p>
			<p>
				<label>Name</label><input type="text" />
			</p>
			<p>
				<label>Gender</label> <label for="male">&nbsp;&nbsp;male<input
					type="radio" id="male" name="gender" value="1" /></label> <label
					for="female">&nbsp;&nbsp;female<input type="radio"
					id="female" name="gender" value="2" /></label>
			</p>
			<p>
				<input type="submit" value="SIGN UP" class="login_but" />
			</p>
		</form>
	</div>
	<!-- wrap END -->
</body>
</html>