
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
	<title>Gallery</title>
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


	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!--     <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
    <link rel="stylesheet" href="../css/client/thumbnail-gallery.css">




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
article {
	padding-top: 30px;
	width: 70%;
	height: auto;
	margin-right: 10%;
	float: left;
	position: relative;
}
.search_area {			
	text-align: center;
	box-sizing: border-box;
	margin: 0px 2%;
	width: 96%;
	height: 435px;
	border: 1px solid #000;
}

.search_div1 {
	width: 96%;
	margin: 2% auto;
	height: 50px;
	line-height: 50px;
	background-color: rgba( 220, 220, 220, 0.6 );

}
.search_div2 {
	width: 96%;
	margin: 2% auto;
	height: 200px;
	background-color: rgba( 220, 220, 220, 0.6 );
}
.search_div2 ul {
	width: 20%;
	height: 200px;
	float: left;
}
.search_div2 li {
	float: left;
	width: 100%;
	margin: 10% 5% 5% 5%;
}
.sc_submit {
	width: 96%;
	height: 30px;
	line-height: 30px;
	float: right;
	margin-bottom: 15px;
}
.sc_submit > button {
	width: 80px;
	height: 30px;
	background-color: #999;
	font-family: 'Righteous', cursive; color: #fff;
	float: right;
	margin-right: 2%;
}

.search_box {
	width: 96%;
	margin: 2% auto;
	height: 50px;
	line-height: 50px;
}
.search_li {
	width: 20%;
	padding: 0% 5% 0% 5%;
	line-height: 50px;
	margin: 0 auto;
	float: left;
	font-size: 1.2rem;
	font-weight: bold;
}
.check_li {
	width: 21.333333%;
	padding: 0% 2% 0% 0%;
	line-height: 50px;
	margin: 0 auto;
	float: left;
	font-size: 1rem;
}
.check_li > input, label {
	display: inline;
} 
.board_list {
	margin: 0px 0% 0px 2%;
	width: 96%;
	height: auto;
}
.board_list li {
	margin: 2% 2% 2% 0px;
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
						<li><a href="#">- 글쓰기</a></li>
					</ul>
				</div>
			</div><!-- accordion_navi 끝 -->
		</aside>
		
		<!-- 본문 -->
		<article>
			<div class="search_area">
				<form action="/secondProject/gallery/index" method="POST">
					<div class="search_ctn">
						<div class="search_div1">
							<ul>
								<li class="search_li">
									주제 :
								</li>
								<li class="check_li">
									<input type="checkbox" id="t1" name="attract" value="1001" /><label for="t1">맛집</label> 
								</li>
								<li class="check_li">
									<input type="checkbox" id="t2" name="attract" value="1002" /><label for="t2">명소</label>
								</li>
								<li class="check_li">
									<input type="checkbox" id="t3" name="attract" value="1003" /><label for="t3">숙소</label>
								</li>
							</ul>
						</div>

						<div class="search_div2">
							<ul>
								<li class="search_li">
									지역 :
								</li>
							</ul>
							<ul>
								<li>
									<input type="checkbox" id="r1" name="area" value="2001" /> <label for="r1">서울</label>
								</li>
								<li> 
								    <input type="checkbox" id="r2" name="area" value="2002" /> <label for="r2">인천</label> 
						        </li>
						        <li>
								    <input type="checkbox" id="r3" name="area" value="2003" /> <label for="r3">대전</label> 
								</li>
							</ul>
							<ul>
								<li>
								    <input type="checkbox" id="r4" name="area" value="2004" /> <label for="r4">광주</label> 
								</li>
								<li>
								    <input type="checkbox" id="r5" name="area" value="2005" /> <label for="r5">부산</label> 
								</li>
								<li>
								    <input type="checkbox" id="r6" name="area" value="2006" /> <label for="r6">대구</label>
							 	 </li>
							 </ul>
							 <ul>
								 <li> 
									<input type="checkbox" id="r7" name="area" value="2007" /> <label for="r7">경기</label> 
								</li>
								<li>
									<input type="checkbox" id="r8" name="area" value="2008" /> <label for="r8">강원</label> 
								</li>
								<li>
									<input type="checkbox" id="r9" name="area" value="2009" /> <label for="r9">충청</label> 
								</li>
							</ul>
							<ul>
								<li>
									<input type="checkbox" id="r10" name="area" value="2010" /> <label for="r10">호남</label>
								</li>
								<li> 
									<input type="checkbox" id="r11" name="area" value="2011" /> <label for="r11">영남</label>
								</li>
								<li> 
									<input type="checkbox" id="r12" name="area" value="2012" /> <label for="r12">제주</label>
								</li>
							</ul>
						</div>

					</div><!-- search_ctn END -->
					
					
					<div class="sc_submit">
						<button>SEARCH</button>
					</div>


				<div class="search_box">
					<select name="searchType">
						<option value="">선택</option>
						<option value="1">ID</option>
						<option value="2">제목</option>
					</select>
					<input type="text" class="searchbox" name="searchWord" />
					<button class="btn" type="submit">
						<i class="fas fa-search-plus" style="color: skyblue"></i>
					</button>
				</form>
				</div><!-- search_box -->
</div><!-- search_area END -->
		
<div class="container gallery-container">
	<div class="tz-gallery">
		<div class="row">
		<c:forEach var="board" items="${boardList}">
            <div class="col-sm-6 col-md-4">
                <div class="thumbnail">
                
                <c:set var="loop_flag" value="false" />
                <c:forEach var="image" items="${imageList}">
                <c:if test="${not loop_flag }">
                <c:if test="${board.boardNo == image.boardNo}">
                    <a class="lightbox" href="/secondProject/galleryImg${image.path}/${image.sysName}">
                        <img src="/secondProject/thumb/${image.sysName}">
                    </a>
                     <c:set var="loop_flag" value="true" />
                </c:if>
                   </c:if>
                </c:forEach>   
                    
                <div class="caption">
                    <h4>${board.title}</h4>
                    <p>${board.editordata}</p>
                    <p>photo by ${board.id}</p>
                </div>
                </div>
            </div>
        </c:forEach>
		</div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.js"></script>
<script>
    baguetteBox.run('.tz-gallery');
</script>
            
<div class="sc_submit">
	<button onclick="location.href ='writeForm'">WRITE</button>
</div>
</article>


</div><!-- wrap END -->
</body>
</html>