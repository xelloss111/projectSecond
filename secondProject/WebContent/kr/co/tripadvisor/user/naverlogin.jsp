<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- (1) LoginWithNaverId Javscript SDK -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "TFVjBEkov7Mxr3z9S3wC",
			callbackUrl: "http://192.168.0.4/secondProject/kr/co/tripadvisor/user/naverlogin.jsp",
			isPopup: false,
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();


/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			console.dir(naverLogin.user);
			/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
			var email = naverLogin.user.getEmail();
			var name = naverLogin.user.getName();
			var id = naverLogin.user.getId();
				
// 			var birth = naverLogin.user.getBirthday();
			var sex = naverLogin.user.getGender();
			console.log(email, name, id, birth, sex);
			
			if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
			naverLogin.reprompt();
				return;
			}
			if( name == undefined || name == null) {
				alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
			naverLogin.reprompt();
				return;
			}
			if( id == undefined || id == null) {
				alert("아이디는 필수정보입니다. 정보제공을 동의해주세요.");
			naverLogin.reprompt();
				return;
			}
			if( sex == undefined || sex == null) {
				alert("성별은 필수정보입니다. 정보제공을 동의해주세요.");
			naverLogin.reprompt();
				return;
			}
			
            post_to_url('http://192.168.0.4/secondProject/kr/co/tripadvisor/user/naversign', {'email':email, 'name':name, 'id':id, 'sex':sex});
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});

function post_to_url(path, params, method) {
    method = method || "post";
    var form = document.createElement("form");
    form.setAttribute("method", method);
    form.setAttribute("action", path);
    for(var key in params) {
        var hiddenField = document.createElement("input");
        hiddenField.setAttribute("type", "hidden");
        hiddenField.setAttribute("name", key);
        hiddenField.setAttribute("value", params[key]);
        form.appendChild(hiddenField);
    }
    document.body.appendChild(form);
    form.submit();
}


</script>
</body>
</html>