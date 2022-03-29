<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>VIEWBLIND</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
$(() => {
	$('#delPost').click(() => {
		$('#modalBtn').show()
		$('#modal').modal()
	})

	$('#delOkBtn').click(() => {
		$('#modal').modal('hide')
		$.ajax({
			url: 'del/' + '${blind.blindNum}',
			method: 'delete'
		}).done(function() {
			location.href='/blind'	
		})
	})
})
</script>
<style>
.fa-rectangle-list {
	color: black;
}
</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				익명 글 조회
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
		<div  id='mainContent' class='row pt-4'>
			<div class='col-12 border-bottom pb-3'>
				<span class='d-block'>${blind.title}</span>
			</div>
		</div>
		<div class='row p-1 mt-4'>
			<p class='p-2'>
				${blind.contents}
			</p>
		</div>

		<div class='border'>
			<div class='d-flex justify-content-center align-items-center'>
				<div class='btn-group btn-block btnBack p-2'>
					<button type='button' class='btn resBtn btnBack'>
						<i class="fa-regular fa-thumbs-up fa-xl"></i>
					</button>
					<button type='button' class='btn' data-toggle='dropdown'>
						<i class="fa-solid fa-ellipsis-vertical fa-lg"></i>
					</button>
					<div class='dropdown-menu w-50'>
						<a href='blind/edit' class='dropdown-item'>수정</a><hr>
						<button type='button' id='delPost' class='dropdown-item delContent'>삭제</button>
					</div>
				</div>
			</div>
		</div>
		
		<div id='commentArea' class='mt-4 mb-5'>
			<div class='row p-3 border-top'>
				<div id='commentTitle' class='col'>
					<span class='h5'>댓글</span>
				</div>
			</div>
			<form class='row form m-1 justify-content-between  pb-2 border-bottom'>
				<input type='text' class='col-10 form-control' placeholder='댓글을 입력해주세요.'/>
				<button type='button' class='col-2 form-control'>
					<i class="fa-solid fa-paper-plane"></i>
				</button>
			</form>
			<ul id='comment' class='row flex-column pl-3 pr-2 mt-2 list-unstyled align-items-center border-bottom'>
				<li class='col mt-3 border-bottom'>
					<div class='row justify-content-between align-items-center'>
						<div class='col'>
							<time class='time small d-block'>1시간 전</time>
							<p class='mt-2'>
								좋겠다 강아지.....
							</p>
						</div>
						<button id='likeBtn1' type='button' class='btn'>
							<i class="fa-regular fa-thumbs-up"></i>
						</button>
						<button type='button' class='col-1 btn' data-toggle='dropdown'>
							<i class="fa-solid fa-ellipsis-vertical"></i>
						</button>
						<div class='dropdown-menu w-25'>
							<button type='button' class='dropdown-item'>수정</button><hr>
							<button type='button' id='delComment' class='dropdown-item delContent'>삭제</button>
						</div>
					</div>
				</li>
				<li class='col mt-3 border-bottom'>
					<div class='row justify-content-between align-items-center'>
						<div class='col'>
							<time class='time small d-block'>20분 전</time>
							<p class='mt-2'>
								저희 집 강아지도 귀여운데 ㅎㅎ
							</p>
						</div>
						<button id='likeBtn1' type='button' class='btn'>
							<i class="fa-regular fa-thumbs-up"></i>
						</button>
						<button type='button' class='col-1 btn' data-toggle='dropdown'>
							<i class="fa-solid fa-ellipsis-vertical"></i>
						</button>
						<div class='dropdown-menu w-25'>
							<button type='button' class='dropdown-item'>수정</button><hr>
							<button type='button' id='delComment' class='dropdown-item delContent'>삭제</button>
						</div>
					</div>		
				</li>
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
				<a id='blind' href='/blind' class='ml-2'>
					<i class="fa-regular fa-rectangle-list fa-xl"></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='chat' href='../chat' class='ml-2'>
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

	<footer class='container-fulid'>
		<div class='row m-3'>
			<div class='col-sm-3 border d-flex justify-content-center align-items-center'>
				<div>로고이미지</div>
			</div>
			<div class='col text-center m-3 blockquote-footer'>
				<span>중고 RECYLE 경기도 고양시 일산동구 마두동 중앙로11 메트로빌딩 6층 대표이사: 윤승환</span><br>
				<span>사업자등록번호: 123-45-67890 대표전화: 1212-8282(발신자 부담전화)</span><br>
				<span>COPYRIGHT USE RECYLE ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</footer>

	<div class='modal' id='modal' tabindex='-1'>
		<div class='modal-dialog modal-dialog-centered'>
			<div class='modal-content'>
				<div class='modal-body'>
					<p id='modalMsg'>삭제 하시겠습니까?</p>
				</div>
				<div id='modalBtn' class='modal-footer'>
					<button type='button' class='btn btn-light' data-dismiss="modal">아니오</button>
					<button type='button' id='delOkBtn' class='btn yesBtn' data-dismiss="modal">예</button>
				</div>
			</div>
		</div>
	</div>
	<script src='../res/likeBtn.js'></script>
</body>
</html>
