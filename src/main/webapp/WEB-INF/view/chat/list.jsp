<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>CHATLIST</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function chatList() {
	$('#chatList').empty()
	
	$.ajax({
		url: 'chat/list',
	}).done(chats => {
		if(chats.length) {
			const chatList = []
			
			$.each(chats, (i, chat) => {
				chatList.unshift(
					`<li class='border-bottom'>
						<div class='row align-items-center p-3'>
							<span>
								\${++i}
							</span>
							<a class='col' href='chat/room?roomNum=\${chat.roomNum}'>
								<span class='d-block'>\${chats.message}</span>
								<small class='userNick'>\${chats.userId}</small>
							</a>
							<div class=''>
								<i class="fa-regular fa-bell" style='color:orangered'></i>
							</div>
						</div>
					</li>`)
			})
			
			$('#chatList').append(chatList.join(''));
		} else {
			$('#chatList').empty()
			$('#chatList').append('<li class="text-center">거래중인 채팅이 없습니다.</li>')
		}
	})		
}

function checkLogin() {
	if(!'${userId}') {
		location.href='user/login'
	}
}
	
$(() => {
	checkLogin()
	
	chatList()
})
</script>
<style>
.fa-comments {
    color: black;
}
</style>
</head>
<body>
    <header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				채팅 목록
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
		<div id='mainContent' class="row justify-content-center">
			<ul id='chatList' class='col list-unstyled p-4'>
	
			</ul>
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
				<a id='chat' href='list' class='ml-2'>
					<i class="fa-regular fa-comments fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='user' href='../user/mypage' class='ml-2'>
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