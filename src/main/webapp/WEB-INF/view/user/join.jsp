<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>JOIN</title>
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

	$('label').find('small').empty()

	if(!field.val()) {
		errMsg = field.attr('placeholder') + ' 입력하세요.'
	} else if(userId.val()) {
		if(field.val() == userId.val() && !$('#userId').val().match('@')) {
			errMsg = userId.attr('placeholder') + ' 형식으로 입력해 주세요.'
		} else {
			isGood = true
		}
	} else {
		isGood = true
	}

	if(!isGood) {
		field.prev().find('small').text(errMsg)
	}

	return isGood
}

$(() => {
	$('input').val('')
	$('samll').text('')
		
	$('#checkUserPw').keyup(() => {
		if($('#checkUserPw').val() != $('#userPw').val()) {
			$('#checkPwMsg').text('비밀번호가 일치하지 않습니다.')
		} else {
			$('#checkPwMsg').text('')
		}
	})
	
	$('#userPw').keyup(() => {
		let pw = $('#userPw')
		if(pw.length >= 6) {
			$('#pwMsg').text('영어, 숫자포함 6~10자 입력하세요.')
		} else {
			$('#pwMsg').text('')
		}
	})
	
	$('#userPw').focusout(() => {
		let pwVal = $('#userPw').val()
		const num = pwVal.search(/[0-9]/g)
		const eng = pwVal.search(/[a-z]/ig)
		
		if(pwVal.length <= 6) {
			$('#pwMsg').text('6~10자 입력하세요.')
		} else if(num < 0 || eng < 0) {
			$('#pwMsg').text('영어, 숫자 포함 하여 입력하세요.')
		} else {
			$('#pwMsg').text('')
		}
	})
	
	$('#checkIdBtn').click(() => {
		if(isVal($('#userId'))) {
			$.ajax({
				url: 'checkUserId',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					userId: $('#userId').val()
				})
			}).done(user => {
				if(!user) {
					$('#checkIdMsg').text('사용가능한 아이디 입니다.').css('color', 'green')
				} else {
					$('#checkIdMsg').text('사용 중인 이이디 입니다.').css('color', 'red')
				}
			})
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
	
	$('#joinBtn').click(() => {
		if(isVal($('#userName')) && isVal($('#userId')) && isVal($('#userPw')) 
			&& isVal($('#checkUserPw')) && isVal($('#nickName')) &&isVal($('#phoneNum'))) {
				if(!$('#conditionsAgree').is(':checked')) {
					$('#agreeMsg').text('약관에 동의 해 주세요.')
				} else {
					$.ajax({
						url: 'joinIn',
						method: 'post',
						contentType: 'application/json',
						data: JSON.stringify({
							userId: $('#userId').val(),
							userName: $('#userName').val(),
							pw: $('#checkUserPw').val(),
							nickName: $('#nickName').val(),
							phoneNum: $('#phoneNum').val()
						})
					})
					$('form').submit()
				}
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
				회원가입
			</strong>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
			</div>
		</div>
	</header>

	<div class="container min-vh-100">
		<div id='mainContent' class="row">
			<form action='greeting' class='col m-3'>
				<div class='form-group'>
					<label for='userName' required>이름 
						<small class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='userName' type='text' class='form-control' placeholder='이름'/>
				</div>
				<div class='row justify-content-center form-group pr-3 pl-3'>
					<label for='userId' class='col-12'>아이디 
						<small id='checkIdMsg' class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='userId' type='email' class='form-control col' placeholder='E-mail'/>
					<button type='button' id='checkIdBtn' class='col-4 ml-2 btn btn-light border'>중복확인</button> 
				</div>
				<div class='form-group mt-4'>
					<label for='userPw'>비밀번호 
						<small id='pwMsg' class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='userPw' type='password' class='form-control mb-2' maxlength='10'  placeholder='영어, 숫자포함 6~10자'/>
					<label for='checkUserPw'>비밀번호 확인
						<small id='checkPwMsg' class='form-text m-3 d-inline msg'></small>
					</label>
					<input id='checkUserPw' type='password' maxlength='10' class='form-control' placeholder='비밀번호'/>
				</div>
				<div class='row justify-content-center form-group pr-3 pl-3'>
					<label for='nickName' class='col-12'>닉네임 
						<small id='checkNickNameMsg' class='form-text m-3 d-inline msg'>
							
						</small>
					</label>
					<input id='nickName' type='text' class='form-control col' placeholder='닉네임'/>
					<button type='button' id='checkNicknameBtn' class='col-4 ml-2 btn btn-light border'>중복확인</button>
				</div>
				<div class='flex-column form-group'>
					<label for='phoneNum'>연락처 
						<small class='form-text m-3 d-inline msg'>
						</small>
					</label>
					<input id='phoneNum' type='number' class='form-control' maxlength='12' placeholder='(-) 제외한 숫자'/>
				</div>

				<div class='form-group'>
					<small><textarea class='w-100 text-justify' rows='8' readonly>
안녕하세요?

저희 서비스를 이용해 주셔서 감사합니다. 지역 정보 모바일 서비스 약관을 읽어주시면 감사드리겠습니다.

계정 관련
아래의 경우에는 계정 생성을 승인 하지 않을 수 있습니다.
1. 동일인이 다수의 계정을 생성하려 한 경우

2. 계정 생성시 필요한 정보를 입력하지 않거나 허위 정보는 입력한 경우

3. 다른사람 명의나 개인정보를 이용하여 계정을 생성하려는 경우


사용시 주의 사항
1. 서비스를 영리나 홍보 목적으로 이용하는 행위

2. 음란 정보다 저작권 침해 정보등 법령에 위반되는 내용의 정보등을 발송하거나 게시하는 행위

3. 관련 법령, 서비스 약관 또는 운영 정책을 준수하지 않는 행위


서비스 중단
장비의 유지, 보수를 위한 정기 또는 임시 점검 또는 다른 상당한 이유로 서비스의 제공이 일시 중단 될 수 있으며, 
이때에는 미리 서비스 제공화면에 공지 하겠습니다.


이용계약 해지
사용자가 서비스의 이용을 더 이상 원치 않는 때에는 언제든지 서비스 내 제공되는 메뉴를 이용하여 이용계약의 해지 신청을 할 수 있습니다.
					



개인정보처리방침

저희 서비스는 "정보통신망 이용촉진 및 정보보호에 관한 법률", "개인정보보호법", "통신비밀보호법", "전기통신사업법" 및 "전자상거래 등에서의 소비자 보호레 관한 법률" 등
정보통신서비스 제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 과련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익 보호에 최선을 다하겠습니다.

개인정보 활용처
저희 서비스는 아래와 같은 활용 목적을 가지고 개인정보를 수집합니다.
1. 서비스의 기본 기능이나 특화된 기능을 제공

2. 개별적 공지 필요시

3. 서비스 이용과 관련하여 문의나 분쟁의 해결

4. 서비스 이용

9. 법령 등에 규정된 의무의 이행


수집하는 개인정보
1. 휴대폰 번호

2. 앱 내 채팅 기능을 사용한 채팅내용

3. 이용자의 이름(닉네임)

4. 서비스 이용과정에서 이용자가 작성하는 게시물 기타 콘텐츠 정보


개인정보를 수집하는 방법
다음과 같은 방법을 통해 개인정보를 수집합니다.
1. 회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의를 하고 직접 정보를 입력하는 경우

2.거래 과정에서 이용자가 채팅방에 입력하는 휴대번호, 계좌번호


개인정보 문의처
사용자가 서비스를 이용하면서 발생하는 모든 개인정보보호 관련 문의, 불만, 조언이나 기타 사항은 개인정보 보호책인자 및 담당부서로 연락해 주시기 바랍니다.
					</textarea></small>
					<div class='row flex-column align-items-center p-3'>
						<label class='small' for='conditionsAgree'>
							<input id='conditionsAgree' type='checkbox' class=' m-2' value='agree' name='Agree'/>
							<span class=' m-3 d-inline'>
								이용약관 및 개인정보처리방침에 동의합니다.
							</span>
						</label>
						<small id='agreeMsg' class='form-text m-3 msg'></small>
					</div>			
				</div>
				<div class='form-group mt-4'>
					<button id='joinBtn' type='button' class='btn border btn-block'>
						<span class='h5'>회원 가입</span>
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
</body>
</html>
