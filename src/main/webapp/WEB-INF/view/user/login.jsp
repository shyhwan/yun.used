<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>LOGIN</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function isVal(field) {
	let userId = $('#userId')
	let isGood = false
	let errMsg
	$('label').siblings('small').empty()
		
	if(!field.val()) {
		errMsg = field.attr('placeholder') + ' 입력하세요.'
	} else {
		isGood = true
	}


	if(!isGood) {
		$(field).siblings('small').text(errMsg)
	}

	return isGood
}

$(() => {
	$('#loginBtn').click(() => {
		if(isVal($('#userId')) && isVal($('#pw'))) {
			$('form').submit()			
		}	
	})
	
	$('#saveId').change(() => {
		$('#saveIdMsg').toggle()
	})
})
</script>
<style>

</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				로그인
			</strong>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
			</div>
		</div>
	</header>

	<div class='container min-vh-100'>
		<div id='mainContent' class='row'>
			<form action='checkUser' method='post' class='col m-3 mt-5'>
				<div class='form-group'>
					<label for='userId'>아이디 </label>
					<small id='idMsg' class='ml-1 msg d-inline'></small>
					<input id='userId' type='email' class='form-control' placeholder='E-mail' value='' name='userId' required/>
				</div>
				<div class='form-group'>
					<label for='userPw' class='mt-3'>비밀번호 </label>
					<small id='pwMsg' class='ml-1 msg d-inline'></small>
					<input id='pw' type='password' class='form-control mb-2' maxlength='10' name='pw'  placeholder='비밀번호' required/>
				</div>
				<div class='form-group text-center'>
					<small id='loginMsg' class='m-2 msg d-inline'>${errMsg}</small>
					<button id='loginBtn' type='button' class='btn btn-light border mt-2 btn-block'>
						<span>로그인</span>
					</button>
				</div>
				<div class='form-group d-flex justify-content-center'>
					<span><a href='findId' id='findId'>아이디 찾기</a> / <a href='findPw' id='findPw'>비밀번호 찾기</a></span>
				</div>
				<div>
				<small id='saveIdMsg' class='msg' style='display:none'>개인정보 보호를 위해 개인기기에서만 사용하세요.</small>
				</div>
				<div class='form-group p-3 d-flex justify-content-center'>
					<span><small>아직 회원이 아니신가요? &nbsp;<a href='join'>회원가입</a></small></span>
				</div>
			</form>
		</div>
	</div>

	<div class='container-fulid'>
		<nav id='navBar' class='row d-sm-none fixed-bottom border p-2'>
			<div class='col m-3 text-center'>
				<a id='goHome' href='../used' class='ml-2'>
					<i class='fa-solid fa-house fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='blind' href='../blind' class='ml-2'>
					<i class="fa-regular fa-rectangle-list fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='chat' href='../chat' class='ml-2'>
					<i class="fa-regular fa-comments fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='user' href='mypage' class='ml-2'>
					<i class="fa-regular fa-user fa-xl"></i>
				</a>
			</div>
		</nav>
	</div>

	<footer class='container-fulid border mt-5 p-3'>
		<div class='row m-3'>
			<div class='col-sm-3 border d-flex justify-content-center align-items-center'>
				<div>로고이미지</div>
			</div>
			<div class='col text-center m-3'>
				<span>중고 RECYLE 경기도 고양시 일산동구 마두동 중앙로11 메트로빌딩 6층 대표이사: 윤승환</span><br>
				<span>사업자등록번호: 123-45-67890 대표전화: 1212-8282(발신자 부담전화)</span><br>
				<span>COPYRIGHT USE RECYLE ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</footer>
</body>
</html>
