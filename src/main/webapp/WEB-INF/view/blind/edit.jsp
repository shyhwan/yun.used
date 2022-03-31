<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>EDITBLIND</title>
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

	   $('#errMsg').text('')

	   if(field.val() == '상품종류' || field.val() == '거래종류') {
	      errMsg = field.val() + '를 선택하세요.'
	   } else if(!field.val()) {
	      errMsg = field.attr('placeholder') + ' 입력하세요.'
	   } else {
	       isGood = true
	   }

	   if(!isGood) {
	      $('#errMsg').text(errMsg)
	   }

	   return isGood
	}

$(() => {
	$('#fixBtn').click(() => {
	    if(isVal($('#title')) && isVal($('#contents'))) { 
			$.ajax({
	   	    	 url: 'fix',
	   	    	 method: 'put',
	   	    	 data: {
	   	    		 blindNum: '${blind.blindNum}',
	   	    		 userId: '${userId}',
	   	    		 title: $('#title').val(),
	   	    		 contents: $('#contents').val()
	   	    	 }
	   	    }).done(location.href='/blind')
	    }
	})
})
</script>
<style>

</style>
</head>
<body>
<header class='container-fulid border fixed-top'>
		<div class='row justify-content-between align-items-center'>
			<div class='col ml-3 d-flex'>
				<strong>익명 글 수정</strong>
			</div>
			<a class='btn btn-lg mr-3' href='/blind'><i class='fas fa-xmark'></i></a>
		</div>
	</header>

	<div class="container min-vh-100">
		<div id='mainContent' class="row">
			<form class='col form'>
				<div class='row form-group border-top mb-2'>
					<input id='title' type='text' class='form-control input-lg border-0' value='${blind.title}'/>
				</div>
				<div class='row form-group border-top'>
					<textarea id='contents' class='form-control border-0 mt-2' rows='20' 
						placeholder='글내용'>${blind.contents}</textarea>
				</div>

				<div class='row mt-3 p-3 border-top'>
					<button id='fixBtn' type='button' class='btn btn-light border btn-block'>완료</button>
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