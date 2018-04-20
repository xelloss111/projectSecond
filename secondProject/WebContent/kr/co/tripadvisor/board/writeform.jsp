<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<title>tripadvisor</title>
	<meta charset="UTF-8">

	<!-- Remember to include jQuery :) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" type="text/javascript"></script>
	<!-- summernote-lite javaScript -->
	<script src="../../../../js/summernote-lite.js"></script>
	<!-- jQuery Modal -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<!-- web font -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
	<!-- common css -->
	<link rel="stylesheet" type="text/css" href="../../../../css/common.css" media="all">
	<!-- summernote-lite css -->
	<link rel="stylesheet" type="text/css" href="../../../../css/summernote-lite.css" media="all">
	<!-- modal css -->
	<link rel="stylesheet" type="text/css" href="../../../../css/jquery.modal.min.css" media="all">

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

	$(document).ready(function() {
     $('#summernote').summernote({
             height: 500,                 // set editor height
             minHeight: null,             // set minimum height of editor
             maxHeight: null,             // set maximum height of editor
             focus: true                  // set focus to editable area after initializing summernote
     });
});

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
article {
	padding-top: 30px;
	width: 60%;
	height: auto;
	margin-right: 10%;
	float: left;
	position: relative;
	padding: 5%;
}
.top_sel {
	width: 100%;
	height: 50px;
}
.sel_1 {
	width: 16%;
	float: left;
	height: 50px;
	line-height: 50px;
}
.sel_2 {
	width: 16%;
	float: left;
	height: 50px;
	line-height: 50px;
}
.b_title { width: 56%; 
	float: left; 
}
.b_title > h2 {display: inline-block;}
.b_title_input {
	width: 90%;
	background-color: white;

  border: thin solid #ddd;
  border-radius: 4px;
  display: inline-block;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;
    /* reset */
  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}
input:focus {
  border-color: skyblue;
  outline: 0;	
}
.btn {
	margin: 2% 0%;
	float: right;
	padding: 6px 12px;
	cursor:pointer;
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

.btn-b_write_but:active, .btn-b_write_but:focus, .btn-b_write_but:hover  {
	color: #fff;
	background-color: #2980b9;
}
select {

  /* styling */
  background-color: white;
  border: thin solid #ddd;
  border-radius: 4px;
  display: inline-block;
  font: inherit;
  line-height: 1.5em;
  padding: 0.5em 3.5em 0.5em 1em;

  /* reset */

  margin: 0;      
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-appearance: none;
  -moz-appearance: none;
}
select.round {
  background-image:
    linear-gradient(45deg, transparent 50%, gray 50%),
    linear-gradient(135deg, gray 50%, transparent 50%),
    radial-gradient(#ddd 70%, transparent 72%);
  background-position:
    calc(100% - 20px) calc(1em + 2px),
    calc(100% - 15px) calc(1em + 2px),
    calc(100% - .5em) .5em;
  background-size:
    5px 5px,
    5px 5px,
    1.5em 1.5em;
  background-repeat: no-repeat;
}

select.round:focus {
  background-image:
    linear-gradient(45deg, white 50%, transparent 50%),
    linear-gradient(135deg, transparent 50%, white 50%),
    radial-gradient(gray 70%, transparent 72%);
  background-position:
    calc(100% - 15px) 1em,
    calc(100% - 20px) 1em,
    calc(100% - .5em) .5em;
  background-size:
    5px 5px,
    5px 5px,
    1.5em 1.5em;
  background-repeat: no-repeat;
  border-color: skyblue;
  outline: 0;
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
			</div><!-- accordion_navi 끝 -->
		</aside>
		<!-- 본문 -->
		<article>
			<form method="post">
				<div class='top_sel'>
					<div class='sel_1'>
						<select class='round'>
							<option>서울</option>
							<option>광주</option>
							<option>경기</option>
							<option>호남</option>
							<option>인천</option>
							<option>부산</option>
							<option>강원</option>
							<option>영남</option>
							<option>대전</option>
							<option>대구</option>
							<option>충청</option>
							<option>제주</option>	
						</select>
					</div><!-- sel_1 END -->
					<div class='sel_2'>
						<select class='round'>
							<option>맛집</option>
							<option>숙소</option>
							<option>명소</option>
						</select>
					</div> <!-- sel_2 END -->
					<div class="b_title">
						<h2>제목 : </h2>
						<input type="text" name="b_title" class="b_title_input" />
					</div> <!-- b_title END -->
				</div><!-- top_sel END -->
				<div>
					<!-- ****************summer note**************** -->
					<textarea id="summernote" name="editordata"></textarea>
					<input type="submit" value="Send data" class="b_write_but btn" />
				</div>
			</form>
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