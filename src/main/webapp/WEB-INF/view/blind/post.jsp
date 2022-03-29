<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>BLINDBOARD</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function blindList() {
	$('#blindList').empty()
	
	$.ajax({
		url: 'blind/list',
	}).done(blinds => {
		if(blinds.length) {
			const blindList = []
			
			$.each(blinds, (i, blind) => {
				blindList.unshift(
					`<li id='blindContents' onclick='location.href="blind/view?blindNum=\${blind.blindNum}"' class='row justify-content-center align-items-center border-bottom pt-3 pb-3'>
						<input type='text' value='\${blind.blindNum}' name='\${blind.blindNum}' id='blindNum' hidden/>
						<span class='col-1'>\${blind.blindNum}</span>
						<span class='col-8'>\${blind.title}</span>
						<i class="col-1 fa-regular fa-thumbs-up"></i>
						<span class='m-2'>\${blind.blindLikeCount}</span>
					</li>`)
			})
			
			$('#blindList').append(blindList.join(''));
		} else {
			$('#blindList').empty()
			$('#blindList').append('<li class="text-center mt-3">게시된 글이 없습니다.</li>')
		}
	})		
}

$(() => {
	blindList()
	
	$(document).on('click', 'li', function() {
		$.ajax({
			url: 'view',
			contentType: 'application/json',
			data: JOSN.stringify({
				blindNum: $(this).find('#blindNum').val()
			})
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
				익명 게시판
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
		<form id='mainContent' class='row justify-content-center'>
			<div class='form-group ml-1 w-75'>
				<input  class='form-control ' type='text'/>
			</div>
			<div class='form-group ml-1'>
				<button class='btn border form-control'>
					<i class='fa-solid fa-magnifying-glass'></i>
					<span class='ml-2 d-none d-md-inline'>검색</span>
				</button>
			</div>
		</form>
		
		<div class='row m-2 ml-1'>
			<select name="sort" id="sort" class='col-4 form-control selectpicker'>
				<option hidden>정렬</option>
				<option value='최신글'>최신글</option>
				<option value='좋아요'>좋아요</option>
			</select>
			<a href='blind/write' class='col ml-1 btn btn-block blindBtn border'>글 작성</a>
		</div>

		<div class='justify-content-center'>
			<ul id='blindList' class='list-unstyled border-top'>
				
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
				<a id='blind' href='blind' class='ml-2'>
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