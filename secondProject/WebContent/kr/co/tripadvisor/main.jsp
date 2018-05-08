<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
	<title>tripadvisor</title>
	<meta charset="UTF-8">
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
		.over{
			white-space : nowrap;
			overflow : hidden;
			text-overflow: ellipsis;
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
		.email_but {
		    box-sizing: border-box;
	 	    color: white; 
		    background: #aaa;
		    border: 0;
	 		padding: 5px 10px; 
			float: right;
			font-size: 0.8rem;
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
		<!-- 본문 시작 -->
			<span class='showHere'>tripadvisor</span>

			<content>
				<form action="/secondProject/kr/co/tripadvisor/board/searchList" method="get" id="searchForm">
					<input type="text" name="searchWord">
					<button type="submit" id='submit'>
						<i class="fas fa-search-plus" style="font-size: 22px; color: #fff"></i>
					</button>
				</form>
			</content>

			<div class="atribute1">
				<H3>여행 정보를 공유하고 스크랩해보세요!</H3><br>
				<hr><br>
				<h5>좋았거나 혹은 그렇지 않았던 <br>
				숙박, 식당 등의 추억을 기록해주세요. </h5>

				<div class="cnt">
					<div class="cnt_view" style="margin-left: 14%; ">
						<i class="fas fa-paper-plane" style="font-size: 28px;color: skyblue;"></i>
						<span>Tip Board</span><br>
						<hr><br><br>
						<p>
							여행지에서 경험한<br>
							맛집, 숙소, 명소 정보를<br>
							공유해보세요.<br>
						</p>
					</div>
					<div class="cnt_view">
						<i class="fas fa-camera-retro" style="font-size: 28px;color: skyblue;"></i>	
						<span>Trip Gallery</span><br>
						<hr><br><br>
						<p>
							행복했던 순간을 찍어<br>
							갤러리에 공유하고<br>
							다른 여행자들의 사진을<br>
							함께 즐겨요!<br>
						</p>
					</div>
					<div class="cnt_view" style="margin-right: 2%;">
						<i class="fas fa-tags" style="font-size: 28px;color: skyblue;"></i>	
						<span>Tip Scrap</span><br>
						<hr><br><br>
						<p>
							다른 여행자들의 <br>
							여행정보를 스크랩하고<br>
							다음 여행계획 때<br>
							활용해보세요!<br>
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
					<c:if test="${empty list}">
						<li>
							<h1>입력된 게시물이 아직 없어요!</h1>
						</li>
					</c:if>
					<c:forEach var='board' items="${list}" end="5" step="1">
						<li>
						
						
						<c:choose>
								<c:when test = "${board.codeNo == 3001}">
									<a href='board/detail?boardNo=${board.boardNo}&area=${board.area}&attract=${board.attract}' >
									<c:choose>
									<c:when test = "${board.boardImage.path == null}">
											<img src="/secondProject/images/notimage.png">
									</c:when>
									
									<c:when test = "${board.boardImage.path != null}">
										<img src='/secondProject/down?path=${board.boardImage.path}&sName=${board.boardImage.sysName}' />
									</c:when>
							</c:choose>
<%-- 											<img src='/secondProject/down?path=${board.boardImage.path}&sName=${board.boardImage.sysName}' /> --%>
									</a>
								</c:when>
								
								<c:when test = "${board.codeNo == 3002}">
								<a href='gallery/detail?boardNo=${board.boardNo}&area=${board.area}&attract=${board.attract}' >
								
								<c:choose>
									<c:when test = "${board.boardImage.path == null}">
											<img src="/secondProject/images/notimage.png">
									</c:when>
									
									<c:when test = "${board.boardImage.path != null}">
										<img src='/secondProject/galleryImg/${board.boardImage.path}/${board.boardImage.sysName}' />
									</c:when>
							</c:choose>
<%-- 										<img src='/secondProject/down?path=${board.boardImage.path}&sName=${board.boardImage.sysName}' /> --%>
								</a>
								</c:when>
							</c:choose>
<%-- 							<a href='board/detail?boardNo=${board.boardNo}&area=${board.area}&attract=${board.attract}'> --%>
<%-- 								<img src='/secondProject/down?path=${board.boardImage.path}&sName=${board.boardImage.sysName}' /> --%>
<!-- 							</a> -->
							<div>
								<h5 class="over">${board.title}</h5>
								<span id="sel2_${board.boardNo}">주제 : ${board.attract} </span>
								<span id="sel_${board.boardNo}">지역 : ${board.area} </span>
								<script type="text/javascript">
									var count = 1;
									var result = ""
									switch("${board.attract}") {
										case "1001" : result = "맛집"; count++; break;
										case "1002" : result = "명소"; count++; break;
										case "1003" : result = "숙소"; count++; break;
									};
									$("#sel2_${board.boardNo}").text("주제 : "+result);
									var result = ""
										switch("${board.area}") {
											case "2001" : result = "서울"; break;
											case "2002" : result= "광주"; break;
											case "2003" : result= "경기"; break;
											case "2004" : result= "호남"; break;
											case "2005" : result= "인천"; break;
											case "2006" : result= "부산"; break;
											case "2007" : result= "강원"; break;
											case "2008" : result= "영남"; break;
											case "2009" : result= "대전"; break;
											case "2010" : result= "대구"; break;
											case "2011" : result= "충청"; break;
											case "2012" : result= "제주"; break;
											
										};
										$("#sel_${board.boardNo}").text("지역 : "+result);
								</script>
								<span>${board.id}</span>
							</div>
						</li>
					</c:forEach>
					</ul>

				</div>
			</div><!-- atribute2 END -->

 		<!-- foote -->
 		<footer>
			<span> MINI PROJECT 2 TEAM ONE</span>
		</footer> 	

	</div><!-- main_wrap END -->

<script type="text/javascript">
// 	$("#submit").click(function() {
// 		console.log($("input[name='searchWord']").val());
// 	});
	
// 	$("input[name='searchWord']").blur(function() {
// 		console.log($(this).val());
// 	})
</script>
</body>
</html>