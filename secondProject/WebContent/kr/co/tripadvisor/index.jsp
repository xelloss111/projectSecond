<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<title>tripadvisor</title>
	<meta charset="UTF-8">
	<!-- common css -->
	<link rel="stylesheet" type="text/css" href="../../../css/common.css" media="all">
	<!-- modal css -->
	<link rel="stylesheet" type="text/css" href="../../../css/jquery.modal.min.css" media="all">
	<!-- minimal Scrollbar -->
	<link rel="stylesheet" type="text/css" href="../../../css/minimal scrollbar.css" media="all">
	<!-- header show -->
	<link rel="stylesheet" type="text/css" href="../../../css/headhesive.css" media="all">

	<!-- Remember to include jQuery :) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js" type="text/javascript"></script>
	<!-- jQuery Modal -->
	<script src="http://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js" type="text/javascript"></script>
	<!-- web font -->
	<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>

	<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Righteous');

		h1 {font-size: 30px;}
		h3 {font-size: 24px;}
		h5 {font-size: 20px;}
		hr { 
		    display: block;
		    margin-left: 45%;
		    margin-right: 45%;
		    border-style: solid;
		    border-width: 2px;
		    border-color: #ccc;
		} 
		.main_wrap { width: 100%; height: auto; }

		.vid {width: 100%; height: 100%; position:fixed; left: 0px; opacity: 0.5; }
		video {width: 100%; min-width: 1600px;
		 }

		.showHere {font-family: 'Righteous', cursive; color: #000; position: absolute; top: 15%; display: block; width: 50%; margin-left: 25%;
			 margin-right: 25%; z-index: 2; font-size: 4.5rem;  text-align: center; font-weight: bold;}

		.atribute1 {
			box-sizing: border-box;
			width: 100%;
			height: 550px;
			position: absolute;
			top: 700px;
			background-color: rgba( 255, 255, 255, 0.8 );
			text-align: center;
			padding-top: 2%;
		}
		.atribute1 > .cnt {
			width: 90%;
			height: 300px;
			margin-left: 5%;
			margin-right: 5%;;
			margin-top: 50px;
		}
		.cnt_view {
			box-sizing: border-box;
			width: 20.3333333%;
			height: 280px;
			float: left;
			margin: 10px 2%;
			padding-top: 2%;
		}

		.cnt_view > span {
			padding-top: 5%;
			font-size: 18px;
			display: block;
			font-weight: bold;
		}

		.atribute2 {
			box-sizing: border-box;
			width: 100%;
			height: 450px;
			position: absolute;
			top: 1250px;
		}
		.bt_img {
			box-sizing: border-box;
			background: #aaa;
			width: 40%;
			height: 450px;
			overflow: hidden;
			float: left;
		}
		.bt_img > img {
			width: 100%;
			background-size: contain;
		}
	    .crawling {
	    	box-sizing: border-box;
			width: 60%;
			height: 450px;
			background-color: rgba( 144, 209, 236, 0.8 );
			text-align: center;
			float: left;
			padding-top: 1%;
	    }
	    .crawling > ul > li {
	    	display: block;
	    	float: left;
	    	width: 45%;
	    	background-color: #eee;
	    	border: 1px solid #ccc;
	    	height: 100px;
	    	margin: 0px 1.5% 5px 2.5%;
	    }
	    .crawling > ul > li > a > img {
	    	width: 80px;
	    	height: 80px;
	    	margin: 10px;
	    	float: left;
	    }
	    .crawling > ul > li > div {
	    	float: left;
	    	width: 50%;
	    	height: 80px;
	    	font-size: 15px;
	    	text-align: left;
	    	padding-left: 5%;
	    }
	    .crawling > ul > li > div > span {
	    	display: block;
	    	width: 70%;
	    	font-size: 12px;
	    	margin: 2%;
	    }
	    .crawling >  h3 {
	    	color: #fff;
	    }
		content {
			position: absolute;
			left: 39%;
			top : 350px;
			width: 50%;
			height: 500px;
		}
		content > form > input {
			height: 30px;
			width: 300px;
			border: 2px solid skyblue;
			border-radius: 10px;
			background: #fff;
			opacity: 0.5;
			margin-right: 10px;
		}

	</style>
</head>
<body>
	<div class="main_wrap">
		<!-- 배경 -->
		<figure class='vid'>
			<video autoplay="autoplay" loop="loop" muted="muted">
				<source src="../../../backgroundvideo/backgroundvideo1.mp4">
			</video>
		</figure>
		<header class='header'>
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
		<!-- 본문 시작 -->
			<span class='showHere'>tripadvisor</span>

			<content>
				<form action="" method="">
					<input type="" name="" value="">
					<button>
						<i class="fas fa-search-plus" style="font-size: 22px; 	color: #fff"></i>
					</button>
				</form>
			</content>

			<div class="atribute1">
				<H3>여행 정보를 공유하고 스크랩해보세요!</H3><br>
				<hr><br>
				<h5>좋았거나 혹은 그렇지 않았던 <br>
				숙박, 식당 등의 추억을 기록해주셈 </h5>

				<div class="cnt">
					<div class="cnt_view" style="margin-left: 14%; ">
						<i class="fas fa-paper-plane" style="font-size: 28px;color: skyblue;"></i>
						<span>Tip Board</span><br>
						<hr><br><br>
						<p>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
						</p>
					</div>
					<div class="cnt_view">
						<i class="fas fa-camera-retro" style="font-size: 28px;color: skyblue;"></i>	
						<span>Trip Gallery</span><br>
						<hr><br><br>
						<p>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
						</p>
					</div>
					<div class="cnt_view" style="margin-right: 2%;">
						<i class="fas fa-tags" style="font-size: 28px;color: skyblue;"></i>	
						<span>Tip Scrap</span><br>
						<hr><br><br>
						<p>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
							여행지에서 블라블라<br>
						</p>						

					</div>	
				</div> <!-- cnt END -->
			</div><!-- atribute1 END -->



			<div class="atribute2">
				<div class="bt_img">
					<img src="../../../images/trip_5.png">
				</div>
				<div class="crawling">
					<h3>Recent posts</h3><br>
					<hr style="border-color: #fff;"><br>
					<ul>
						<li>
							<a href="#"><img src="../../../images/trip_1.png"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 맛집 / 지역 : 서울 </span>
								<span>2018-03-30 20:11</span>
								<span>mini kim</span>
							</div>
						</li>
						<li>
							<a href="#"><img src="../../../images/trip_2.png"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 숙소 / 지역 : 호남 </span>
								<span>2018-03-30 23:25</span>
								<span>lama</span>
							</div>
						</li>
						<li>
							<a href="#"><img src="../../../images/trip_3.png"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 맛집 / 지역 : 강원 </span>
								<span>2018-03-30 23:26</span>
								<span>hr kim</span>
							</div>
						</li>
						<li>
							<a href="#"><img src="../../../images/trip_4.png"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 맛집 / 지역 : 서울 </span>
								<span>2018-03-30 20:11</span>
								<span>mini kim</span>
							</div>
						</li>
						<li>
							<a href="#"><img src="../../../images/trip_5.png"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 맛집 / 지역 : 서울 </span>
								<span>2018-03-30 20:11</span>
								<span>mini kim</span>
							</div>
						</li>
						<li><a href="#"><img src="../../../images/1.jpg"></a>
							<div>
								<h5>Title</h5>
								<span>주제 : 맛집 / 지역 : 서울 </span>
								<span>2018-03-30 20:11</span>
								<span>mini kim</span>
							</div></li>
					</ul>

				</div>
			</div><!-- atribute2 END -->

 		<!-- foote -->
 		<footer>
			<span> MINI PROJECT 2 TEAM ONE</span>
		</footer> 	

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
	</div><!-- main_wrap END -->

	<!-- JavaScript  -->
 <script type="text/javascript" src="../../../js/headhesive.min.js"></script>
    <script>

        // Set options
        var options = {
            offset: '.showHere',
            offsetSide: 'top',
            classes: {
                clone:   'header--clone',
                stick:   'header--stick',
                unstick: 'header--unstick'
            }
        };

        // Initialise with options
        var header = new Headhesive('.header', options);

        // Headhesive destroy
        // banner.destroy();
    </script>
</body>
</html>