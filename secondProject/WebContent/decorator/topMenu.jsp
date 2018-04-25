<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class='header' style="background-color: skyblue;"><a href="/secondProject/kr/co/tripadvisor/index.jsp" class='nav_logo'><span>tripadvisor</span></a>

	<nav>
		<ul>
			<li class="nav_ui topBotomBordersOut"><a href="/secondProject/kr/co/tripadvisor/board/list"> <i
					class="fas fa-paper-plane"></i> Tip Board
			</a></li>
			<li class="nav_ui topBotomBordersOut"><a href="/secondProject/kr/co/tripadvisor/gallery/list"> <i
					class="fas fa-camera-retro"></i> Gallery
			</a></li>
			<li class="nav_ui topBotomBordersOut"><a href="#"> <i
					class="fas fa-check-circle"></i> Notice
			</a></li>
		</ul>
	</nav>

	<div class='login_ui'>
		<a href="#ex1" rel="modal:open">LOGIN</a> &nbsp; &nbsp; <a href="#ex2"
			rel="modal:open">SIGN UP</a>
	</div>
</header>


<!-- Modal HTML embedded directly into document -->
<form action="" class="login_form modal" id="ex1" style="display: none;">
	<h1>LOGIN</h1>
	<br> <br>
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
<form action="" class="login_form modal" id="ex2" style="display: none;">
	<h1>SIGN UP</h1>
	<br> <br>
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