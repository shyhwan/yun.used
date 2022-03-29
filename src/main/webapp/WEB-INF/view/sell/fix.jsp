<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang='ko'>
<head>
<title>EDITPOST</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>

function comma(price) {
	var x = price.value;			
	x = x.replace(/,/gi, '');
	var regexp = /^[0-9]*$/;
		if(!regexp.test(x)){ 
		$(price).val(""); 
		} else {
			x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
			$(price).val(x);			
		}

}

function isVal(field) {
	   let img = $('#tradeImgFile')
	   let isGood = false
	   let errMsg

	   $('#errMsg').text('')

	   if(field.val() == img.val() && !img.val()) {
	      errMsg = '사진을 추가해 주세요.'
	   } else if(field.val() == '상품종류' || field.val() == '거래종류') {
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
	   $("#tradeImgFile").on("change", function(event) {
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
	   
	   $('#fixBtn').click(() => {
	       if(isVal($('#tradeImgFile')) &&  isVal($('#title')) && isVal($('#tradeCode')) 
	         && isVal($('#productCode')) && isVal($('#location')) && isVal($('#contents'))) {   
	             $('form').submit()
	      }
	   })
	})

	</script>
<style>

</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row justify-content-between'>
			<div class='col ml-3 d-flex'>
				<strong class='pt-3'>판매 글 수정</strong>
			</div>
			<a class='btn btn-lg mr-3' href='/sell'><i class='fas fa-xmark'></i></a>
		</div>
	</header>

	<div class='container min-vh-100'>
		<div id='mainContent' class='row'>
			<form method='post' action='view?tradeNum=${trade.tradeNum}' class='col form' encType='multipart/form-data'>
				<div id='imgArea' class='row form-group ml-2 filebox'>
					<label for='tradeImgFile'>사 진<br> 추 가</label>
               		<input id='tradeImgFile' name='tradeImgFile' type='file' class='pb-5 form-control' accept='image/*' multiple />
               	
				</div>
				<div class='row form-group border'>
					<input type='text' class='form-control input-lg border-0' id='title' name='title' value='${trade.title}'/>
				</div>
				<div class='row m-1 align-items-center flex-column form-group'>
					<select name='tradeCode' id='tradeCode' class='col mt-1 form-control selectpicker' value='${trade.tradeCode }' >
						<option hidden>구매 / 판매</option>
						<option selected>판 매</option>
						<option>구 매</option>
					</select>
					<select name='productCode' id='productCode' class='col mt-1 form-control selectpicker' value='${trade.productCode}' >
						<option hidden>카테고리</option>
						<option selected>패션/잡화</option>
						<option>육아</option>
						<option>생활</option>
						<option>반려동물</option>
						<option>가구</option>
						<option>자동차</option>
						<option>가전</option>
						<option>여행</option>
						<option>운동</option>
					</select>
					<input class='col mt-1 form-control' type='text' id='location' name='location' placeholder='지역' value='${trade.location}'>
					<input class='col mt-1 form-control' type='text' id='price'name='price' onkeyup='comma(this)'  placeholder='가격' min='0' value='${trade.price}'/>
				</div>
			<div class='row form-group border-top'>
               <textarea id='contents' name='contents' class='col m-1 form-control border-0' rows='8'>${trade.contents}</textarea>
            </div>
				
				<small id='errMsg' class='row justify-content-center msg'></small>
				<div class='row mt-3 p-3 border-top'>
					<button  type='button' class='btn btn-light border btn-block' id='fixBtn' name='fixBtn' href='view?tradeNum=${trade.tradeNum}'>완료</button>
				</div>
			</form>
		</div>
	</div>

	<div class='container-fulid'>
		<nav id='navBar' class='row d-sm-none btn-light fixed-bottom'>
			<div class='col m-3 text-center'>
				<a id='goHome' href='../main.html' class='ml-2'>
					<i class='fa-solid fa-house fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='blind' href='../blind/01.html' class='ml-2'>
					<i class='fa-solid fa-rectangle-list fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='chat' href='../chat/01.html' class='ml-2'>
					<i class='fa-regular fa-comments fa-xl'></i>
				</a>
			</div>
			<div class='col m-3 text-center'>
				<a id='user' href='../user/mypage.html' class='ml-2'>
					<i class='fa-regular fa-user fa-xl'></i>
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

