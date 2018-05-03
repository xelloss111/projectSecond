<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#form {
 text-align: center;
 padding-top: 100px;
}
#birth {
	width: 270px;
	height: 30px;
}
#but {
border: 1px solid #aaa;
padding: 3.5px;
}
</style>
</head>
<body>
	<div class='wrap'>


<div id="form">
<form method="post" action="/secondProject/user/singup">
<h1>Trip Advisor 이용 필수정보</h1>
<h2>-생년월일을 8자리 숫자로 입력해주세요.</h2>
<input type="hidden" name="pass" value=" " />
<input type="hidden" name="email" value="${user.email}" />
<input type="hidden" name="name" value="${user.name}" />
<input type="hidden" name="sex" value="${user.sex}" />
<input type="hidden" name="id" value="${user.id}" />
<input type="text" name="birth" maxlength="8" id="birth"/>
<button id="but">확인</button>
</form>
</div>


</div> <!-- wrap -->

</body>
</html>