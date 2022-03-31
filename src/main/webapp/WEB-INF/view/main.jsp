<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang='ko'>
<head profile="http://www.w3.org/2005/10/profile">
<title>MAIN</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function checkLogin() {
	let Id = "${userId}"
	
	if(Id) {		
		if(Id == 'admin') {
			$('.loginTab').toggle()
			$('.logoutTab').prepend('<a href="admin" class="ml-2">ADMIN</a>')
			$('.logoutTab').toggle()
		} else {
			$('.loginTab').toggle()
			$('.logoutTab').prepend('<a href="user/mypage" class="ml-2 d-none d-md-inline">마이페이지</a>')
			$('.logoutTab').toggle()		
		}
	}
}

function sellList() {
	$('#sellList').empty()
	
	$.ajax({
		url: 'sell/list',
	}).done(sells => {
		if(sells.length) {
			$('#tradepost').text('')
			$('#tradepost').text('지금 판매중인 상품이에요!')
			const sellList = []

			$.each(sells, (i, sell) => {
				sellList.unshift(
					`<div class='col mt-4 text-center'>
						<a href='sell/view?tradeNum=\${sell.tradeNum}' >
							<img src=<c:url value="/attach/\${sell.tradeImgFileName}"/> class='mx-auto d-block border product'/>
							<span class='text-center mt-1 d-block'>
								<span>\${sell.title}</span>
							</span>
							<span class='text-center mt-1'>
								금액 : <span id='price'>\${sell.price}</span>
							</span>
						</a>
					</div>`)
			})
			
			$('#sellList').append(sellList.join(''));
		} else {
			$('#tradepost').text('')
			$('#tradepost').text('판매중인 상품이 없습니다.')
		}
	})		
}

$(() => {
	checkLogin()
	sellList()
	
	$('#logout').click(() => {
		$.ajax({
			url: 'user/logout'
		})
	})
})
</script>
<style>
.fa-house {
	color: black;
}

#mainContent {
	margin-top: 7rem;
}

img {
	border-radius: 8px;
}
</style>
</head>
<body>
	<header class='container-fulid fixed-top'>
		<div class='row m-3 d-flex justify-content-between align-items-center'>
			<div class='p-4 border'>
				로고이미지
			</div>
			<div class='row align-items-center loginTab'>
				<a href='user/join' class='d-none d-md-inline'>회원가입</a>
				<div class='m-3 d-flex justify-content-between'>
					<a id='login' href='user/login' class='ml-2'>
						<i class='fa-solid fa-power-off'></i>
						<span class='ml-2 d-none d-md-inline'>로그인</span>
					</a>
				</div>
			</div>
			<div class='row align-items-center logoutTab logoutTab' style='display: none'>
				<div class='m-3 d-flex justify-content-between align-items-center '>
					<a id='logout' href='used' class='ml-2'>
						<i class='fa-solid fa-power-off'></i>
						<span class='d-none d-md-inline'>로그아웃</span>
					</a>
				</div>
			</div>
		</div>
	</header>

	<hr class='mt-3'>
	<div  class='container min-vh-100'>
		<form id='mainContent' class='row justify-content-center'>
			<div class='row form-group justify-content-center w-100'>
				<input  class='form-control w-75' type='text' placeholder='찾으시는 제품을 입력하세요.'/>
				<button class='btn ml-2 btn-light border'>
					<i class='fa-solid fa-magnifying-glass'></i>
					<span class='ml-2 d-none d-md-inline'>검색</span>
				</button>
			</div>
		</form>
		
		<div class='row h5 m-2'>
			<button type='button' onclick='location.href="/buy"' class='col btn buyBtn border'>
				<span>삽니다.</span>
			</button>
			<button type='button' onclick='location.href="/sell"' class='col btn sellBtn border ml-2'>
				<span class='text-white'>팝니다.</span>
			</button>
		</div>
		<hr>
		
		<div class='row m-3 h5 justify-content-center'>
			<strong id='tradepost'></strong>
		</div>

		<div id='sellList' class='row m-4 row-cols-2 row-cols-md-4'>
			
		</div>
	</div>
		
	<div class='container-fulid'>
		<nav id='navBar' class='row d-sm-none fixed-bottom border p-2'>
			<div class='col m-3 text-center'>
				<a id='goHome' href='used' class='ml-2'>
					<i class='fa-solid fa-house fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='blind' href='blind' class='ml-2'>
					<i class="fa-regular fa-rectangle-list fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='chat' href='chat' class='ml-2'>
					<i class="fa-regular fa-comments fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='user' href='user/mypage' class='ml-2'>
					<i class="fa-regular fa-user fa-xl"></i>
				</a>
			</div>
		</nav>
	</div>
		
	<footer class='container-fulid  blockquote-footer'>
		<div class='row m-3'>
			<div class='col-sm-3 border d-flex justify-content-center align-items-center'>
				<div>로고이미지</div>
			</div>
			<div class='col text-center m-3'>
				<span>중고 RECYLE 경기도 고양시 일산동구 마두동 중앙로11 메트로빌딩 6층 대표이사: 윤승환</span><br>
				<span>사업자등록번호: 123-45-67890 대표전화: 1212-8282(발신자 부담전화)</span><br>
				<span>COPYRIGHT&copy; USE RECYLE ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</footer>
</body>
</html>