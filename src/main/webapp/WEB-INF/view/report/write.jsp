<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>WRITEREPORT</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function isVal(field) {
	let img = $('#reportImgFile')
	let isGood = false
	let errMsg

	$('#errMsg').text('')

	
	if(field.val() == img.val() && !img.val()) {
		errMsg = '사진을 추가해 주세요.'
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

$(()=> {
	$("#reportImgFile").on("change", function(event) {
		let img_files = []
	    let files = event.target.files
		let fileArr = Array.prototype.slice.call(files)

		fileArr.forEach(function(file) {
		    const reader = new FileReader() 
			img_files.push(file)
			
		    reader.onload = function(e) {
		    	let imgPreview = "<img id='preview' src=" + e.target.result + " class='ml-1'/>"
		        $("#imgArea").append(imgPreview)
		    }
	
		    reader.readAsDataURL(file)
		})
	})
	
	$('#postBtn').click(() => {
		if(isVal($('#reportImgFile')) && isVal($('#accusedName')) && 
			isVal($('#title')) && isVal($('#contents'))) {		
				$('form').submit()
		}
	})	
})	
</script>
<style>
img {
	width: 7rem;
	height: 7rem;
	border-radius: 8px;
}
</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				신고 글 작성
			</strong>
			<div class='col-2 d-flex justify-content-end align-items-center'>
				<a id='goHome' href='report' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
				<a id='exitReport' href='/report' class='ml-3'>
					<span class='h3'>&times;</span>
				</a>
			</div>
		</div>
	</header>

	<div class="container min-vh-100">
		<div id='mainContent' class="row">
			<form method='post' action='add' class='col form' encType='multipart/form-data'>
				<div id='imgArea' class='row form-group mt-4 ml-2 filebox'>
					<label for='reportImgFile'>사 진<br> 추 가</label>
					<input id='reportImgFile' name='reportImgFile' type='file' class='pt-5 pb-5 form-control' accept='image/*' multiple/>
				</div>
				<div class='row form-group border-top p-2'>
					<input id='accusedName' name='accusedName' type='text' class='form-control input-lg border-0' placeholder='피신고자'/>
				</div>
				
				<div class='row form-group border-top p-2'>
					<input id='title' name='title' type='text' class='form-control input-lg border-0' placeholder='글 제목'/>
				</div>
				<div class='row form-group border-top'>
					<textarea id='contents' name='contents' class='form-control border-0' rows='12' 
						placeholder=' 글 내용 '></textarea>
				</div>
				
				<small id='errMsg' class='row justify-content-center msg'></small>
				<div class='row mt-3 p-3 border-top form-group'>
					<button id='postBtn' type='button' class='btn btn-light border btn-block'>완료</button>
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
				<span>중고 RECYLE 경기도 고양시 일산동구 마두동 중앙로11 메로트빌팅 6층 대표이사: 윤승환</span><br>
				<span>사업자등록번호: 123-45-67890 대표전화: 1212-8282(발신자 부담전화)</span><br>
				<span>COPYRIGHT USE RECYLE ALL RIGHTS RESERVED.</span>
			</div>
		</div>
	</footer>   
</body>
</html>