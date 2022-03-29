<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>MYPAGE</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
$(() => {
	$('#logout').click(() => {
		$.ajax({
			url: 'logout'
		})
	})
})
</script>
<style>
.fa-user {
	color: black;
}

.fa-bell-concierge
 {
    color: #Fcce77;
}

.fa-cart-arrow-down,
.fa-calendar-check,
.fa-user-gear {
    color: #53787d;
}

.fa-circle-plus {
	color: lightgrey;
}
</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				마이 페이지
			</strong>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
                <a id='logout' href='../used' class='ml-3'>
					<i class='fa-solid fa-power-off'></i>
					<span class='d-none d-md-inline'>로그아웃</span>
				</a>
			</div>
		</div>
	</header>
	
	<div class='container min-vh-100'>
		<div id='mainContent' class='row border-bottom'>
			<div id='notificationArea' class='col mt-3 p-4 text-center'>
				<span class='row justify-content-center'>
					안녕하세요.&nbsp;&nbsp;&nbsp; <strong class='h5'>${nickName}</strong>님!
				</span>
				<p class='row mt-2 justify-content-center'>
					오늘도 즐거운 중고 거래 되세요!<br>
					남을 괴롭히거나, 광고성인 글과 댓글은<br> 
					삭제 될 수 있습니다.
				</p>
			</div>
		</div>
			
		<div id='userOption' class='row m-2 row-cols-2 row-cols-md-4'>
			<div class='col mt-5 text-center'>
				<a id='tradeList' class='mt-1' href='../sell/'>
					<i class="fa-solid fa-cart-arrow-down fa-2xl"></i>
					<span class='mt-4 d-block'>거래 내역</span>
				</a>
			</div>
			<div class='col mt-5 text-center'>
				<a id='wishList' class='mt-1' href='../sell/'>
					<i id='heart' class="fa-solid fa-heart fa-2xl"></i>
					<span class='mt-4 d-block'>찜 목록</span>
				</a>
			</div>
			<div class='col mt-5 text-center'>
				<a id='regList' class='mt-1' href='../buy/'>
					<i class="fa-solid fa-calendar-check fa-2xl"></i>
					<span class='mt-4 d-block'>예약 내역</span>
				</a>
			</div>
			<div class='col mt-5 text-center'>
				<a id='reportList' class='mt-1' href='../report'>
					<i class="fa-solid fa-bell-concierge fa-2xl"></i>
					<span class='mt-4 d-block'>신고 내역</span>
				</a>
			</div>
			<div class='col mt-5 text-center'>
				<a id='userInfo' class='mt-1' href='profile'>
					<i class="fa-solid fa-user-gear fa-2xl"></i>
					<span class='mt-4 d-block'>정보 수정</span>
				</a>
			</div>
			<div class='col mt-5 text-center'>
				<a id='noService' class='mt-1' href='#'>
					<i class="fa-solid fa-circle-plus fa-2xl"></i>
					<span class='mt-4 d-block'>서비스 예정</span>
				</a>
			</div>
		</div>
	</div>

	<!--navigation 모바일 화면에서만 보입니다. -->
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
