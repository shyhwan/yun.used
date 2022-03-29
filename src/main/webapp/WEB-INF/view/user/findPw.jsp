<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>FINDPW</title>
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
		if(userId.val().match('@')) {
			isGood = true
		} else {
			errMsg = userId.attr('name') + ' 형식으로 입력해 주세요.'
		}
	}

	if(!isGood) {
		$(field).siblings('small').text(errMsg)
	}

	return isGood
}

function findPw() {
	if(isVal($('#userId')) && isVal($('#phoneNum'))) {
		$('form').submit()
	}
}

$(() => {
	$('#searchBtn').click(() => {
		findPw()
	})

	$('#phoneNum').keydown(e => {
        if(e.keyCode == 13) {
			findPw()
		}
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
				비밀번호 찾기
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
			<form action='checkPw' method='post' class='col m-3'>
				<div class='form-group p-3'>
					<label for='userId'>아이디 </label>
					<small class='m-3 d-inline msg'></small>
					<input id='userId' type='email' class='form-control' placeholder='아이디(E-mail)' name='userId' required/>
				</div>
				<div class='form-group p-3'>
					<label for='nickName'>연락처 </label>
					<small class='m-3 d-inline msg'></small>
					<input id='phoneNum' type='number' maxlength='12' class='form-control' name='phoneNum' placeholder='(-) 제외한 숫자'/>
				</div>
				
				<div class='form-group p-3 text-center'>
					<small id='findMsg' class='m-2 msg d-inline'>${message}</small>
					<button id='searchBtn' type='button' class='mt-3 btn btn-light border btn-block'>
					<span>찾기</span>
					</button>
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
