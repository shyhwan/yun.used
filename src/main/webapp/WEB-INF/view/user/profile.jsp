<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>PROFILE</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function isVal(field) {
	let isGood = false
	let errMsg

	$('label').find('small').empty()

	if(!field.val()) {
		errMsg = field.attr('placeholder') + ' 입력하세요.'
	} else isGood = true

	if(!isGood) {
		field.prev().find('small').text(errMsg)
	}

	return isGood
}

function fixUser() {
	if(isVal($('#nickName')) && isVal($('#userPw')) && isVal($('#checkUserPw')) && isVal($('#phoneNum'))) {
		$('form').submit()
	}
}

function userProfile() {
	$.ajax({
		url: 'profile',
		method: 'post',
	})
} 

$(() => {
	console.log(user.pw)
	
	$('#userPw').focusout(() => {
		if(isVal($('#userPw'))) {
			$.ajax({
				url: 'checkUserPw',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					pw: $('#userPw').val()
				})
			}).done(user => {
				if(!user) {
					$('#pwMsg').text('비밀번호가 틀렸습니다.')
				} else {
					$('#pwMsg').text('')
				}
			})
		}
	})
	
	$('#changeUserpw').keyup(() => {
		let pw = $('#changeUserpw')
		let pwMsg = $('#changePwMsg')
		
		if(pw.val() == $('#userPw').val()) {
			pwMsg.text('비밀번호가 같습니다. 다른 비밀번호를 입력해 주세요.')
		} else if(pw.length >= 6) {
			pwMsg.text('영어, 숫자포함 6~10자 입력하세요.')
		} else {
			pwMsg.text('')
		}
	})

	$('#changeUserpw').focusout(() => {
		let pwVal = $('#changeUserpw').val()
		const num = pwVal.search(/[0-9]/g)
		const eng = pwVal.search(/[a-z]/ig)
		
		if(pwVal.length <= 6) {
			$('#changePwMsg').text('6~10자 입력하세요.')
		} else if(num < 0 || eng < 0) {
			$('#changePwMsg').text('영어, 숫자 포함 하여 입력하세요.')
		} else {
			$('#changePwMsg').text('')
		}
	})
	
	$('#checkNicknameBtn').click(() => {
		if(isVal($('#nickName'))) {
			$.ajax({
				url: 'checkUserNickName',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					nickName: $('#nickName').val()
				})
			}).done(user => {
				if(!user) {
					$('#checkNickNameMsg').text('사용가능한 닉네임 입니다.').css('color', 'green')
				} else {
					$('#checkNickNameMsg').text('사용 중인 닉네임 입니다.').css('color', '#ff7707')
				}
			})
		}
	})
	
	$('#fixUserBtn').click(() => {
		if($('#userPw')) {
			$.ajax({
				url: 'fixUser',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					userId: $('#userId').val(),
					userName: $('#userName').val(),
					pw: $('#changeUserpw').val(),
					nickName: $('#nickName').val(),
					phoneNum: $('#phoneNum').val()
				})
			}).done(result => {
				location.href='mypage'
			})
		}
	})
	
	$('#delUserBtn').click(() => {
		$('#modal').modal()
		
		$('#delUserOkBtn').click(() => {
			$('#modal').modal('hide')
			$.ajax({
				url: 'delUser/' + $('#userId').val(),
				method: 'delete'
			}).done(result => {
				location.href='../used'
			})
		})
	})
})
</script>
<style>
.fa-user {
	color: black;
}
</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				프로필 수정
			</strong>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
			</div>
		</div>
	</header>

	<div class="container">
		<div id='mainContent' class="row">
			<form action='mypage' class='col m-3'>
				<div class='text-right'>
					<span class='text-right'>가입일 : <span id='joinDate'>${user.joinDate}</span></span>
				</div>
				<div class='form-group'>
					<label for='userName' class='col'>
					<span>이름</span>
					</label>
					<input id='userName' name='userName' type='text' class='form-control' value='${user.userName}' readonly/>
				</div>
				<div class='form-group'>
					<label for='userId' class='col'>아이디 </label>
					<input id='userId' name='userId' type='email' class='form-control' value='${user.userId}' readonly/>
				</div>
				<div class='form-group mt-4'>
					<label for='userPw' class='col'>현재 비밀번호 
						<small id='pwMsg' class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='userPw' name='userPw' type='password' class='form-control mb-2' maxlength='10'  placeholder='비밀번호'/>
					<label for='chageUserPw' class='col'>변경 비밀번호
						<small id='changePwMsg' class='form-text m-3 d-inline msg'></small>
					</label>
					<input id='changeUserpw' name='changeUserpw' type='password' maxlength='10' class='form-control' placeholder='영어, 숫자 포함 6~10글자 이내'/>
				</div>
				<div class='row justify-content-center form-group pr-3 pl-3'>
					<label for='nickName' class='col-12'>닉네임 
						<small id='checkNickNameMsg' class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='nickName' name='nickName' type='text' class='form-control col' value='${user.nickName}'/>
					<button id='checkNicknameBtn' type='button' class='col-4 ml-2 btn btn-light border'>중복확인</button> 
				</div>
				<div class='flex-column form-group'>
					<label for='phoneNum' class='col'>연락처 
						<small class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='phoneNum' name='phoneNum' type='number' class='form-control' maxlength='12' value='${user.phoneNum}'/>
				</div>
				<div class='form-group pt-3'>
					<button id='fixUserBtn' type='button' class='btn btn-light border btn-block'>
						<span>프로필 수정</span>
					</button>
				</div>
				<div class='form-group pt-3'>
					<button id='delUserBtn' type='button' class='btn btn-light border btn-block'
						data-toggle='modal' data-target='#delUser'>
						<span>회원 탈퇴</span>
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
					<i class="fa-solid fa-user fa-xl"></i>
				</a>
			</div>
		</nav>
	</div>

	<footer class='container-fulid border mt-5 p-3 '>
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

	<div class='modal' id='delUser' tabindex='-1'>
		<div class='modal-dialog modal-dialog-centered'>
			<div class='modal-content'>
				<div class='modal-body'>
					<p>탈퇴 하시겠습니까?</p>
				</div>
				<div class='modal-footer'>
					<button type='button' class='btn btn-light border' data-dismiss="modal">아니오</button>
					<button type='button' class='btn yesBtn' data-dismiss="modal" id='delUserOkBtn'>예</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
