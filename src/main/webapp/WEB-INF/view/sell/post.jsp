<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang='ko'>
<head>
<title>SELLBOARD</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function sellList() {
	$('#sellList').empty()
	
	$.ajax({
		url: 'sell/list',
	}).done(sells => {
		if(sells.length) {
			const sellList = []
			
			$.each(sells, (i, sell) => {
				sellList.unshift(
					`<li class='row border-bottom pt-3  pb-3 align-items-center'>
						<div class='ml-3 text-center'>
							\${++i}
						</div>
						<div class='col-3 text-center'>
							<img src=<c:url value="/attach/\${sell.tradeImgFileName}"/> class='productMin'/>
						</div>
						<a class='col ml-1' href='sell/view?tradeNum=\${sell.tradeNum}'>
							<strong class='d-block w-100'>[\${sell.tradeCode}] \${sell.title}</strong>
							<span class='d-block'>
								<small class='small pr-3 border-right'>\${sell.location}</small>
								<time class='pl-3'><small>\${sell.tradeRegDate}</small></time>
							</span>
							<span class='price d-block'>\${sell.price}</span>
						</a>
					</li>`)
			})
			
			$('#sellList').append(sellList.join(''));
		} else {
			$('#sellList').empty()
			$('#sellList').append('<li class="text-center mt-3">거래중인 상품이 없습니다.</li>')
		}
	})		
}

$(() => {
	sellList()
	
	if($('#price').text() == null) {
		$('#price').text('미정')
	}
})
</script>
<style>
.productMin{
	width: 5rem;
	height: 5rem;
}

img {
	border-radius: 8px;
}
</style>
</head>
<body>
    <header class='container-fulid border fixed-top'>
		<div class='row p-2 justify-content-between align-items-center'>
			<span class='d-block ml-3 p-2 border'>
				로고 이미지
			</span>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
			</div>
		</div>
	</header>

	<div class='container min-vh-100'>
		<form id='mainContent' class='row justify-content-center ml-1 mr-1'>
			<div class='form-group'>
				<select name='productType' id='productType' class='form-control selectpicker' >
					<option hidden>카테고리</option>
					<option value='p01'>패션/잡화</option>
					<option value='p02'>육아</option>
					<option value='p03'>생활</option>
					<option value='p04'>반려동물</option>
					<option value='p05'>가구</option>
					<option value='p06'>자동차</option>
					<option value='p07'>가전</option>
					<option value='p08'>여행</option>
					<option value='p09'>운동</option>
				</select>
			</div>
			<div class='form-group ml-1 w-50'>
				<input  class='form-control ' type='text'/>
			</div>
			<div class='form-group ml-1'>
				<button class='btn border form-control'>
					<i class='fa-solid fa-magnifying-glass'></i>
					<span class='ml-2 d-none d-md-inline'>검색</span>
				</button>
			</div>
		</form>

		<div class='row m-1 justify-content-between pt-3 border-top'>
			<form class='form'>
				<select name="sort" id="sort" class='form-control selectpicker'>
					<option hidden>정렬</option>
					<option value='최신글'>최신글</option>
					<option value='조회수'>조회수</option>
				</select>
			</form>
			<a href='sell/write' class='btn form-control sellBtn col border ml-2 text-white'>글 작성</a> 
		</div>

		<ul id='sellList' class='col list-unstyled mt-3 border-top'>
			
		</ul>
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

	<footer class='container-fulid '>
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
</body>
</html>
