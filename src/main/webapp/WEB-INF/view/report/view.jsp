<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang='ko'>
<head>
<title>VIEWREPORT</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function commentList() {
	$('#commentList').empty()
	
	$.ajax({
		url: '/comment/list/report/' + ${report.reportNum},
	}).done(comments => {
		if(comments.length) {
			const commentList = []
			
			$.each(comments, (i, comment) => {
				commentList.unshift(
					`<li class='col-12 mt-3 border-bottom'>
						<div class='row justify-content-between align-items-center'>
						<div class='col'>
							<small class='pr-3'>\${comment.userId}</small>
							<time class='border-left small pl-3'>
								\${comment.commentRegDate}
							</time>
							<p class='mt-2 d-block'>
								\${comment.contents}
							</p>
						</div>
					</div>
					</li>`)
			})
			
			$('#commentList').append(commentList.join(''));
		} else {
			$('#commentList').empty()
			$('#commentList').append('<li class="text-center mt-3"><span>댓글을 달아주세요.</span></li>')
		}
	})		
}

$(() => {
	commentList()
	
		$('#addCommentBtn').click(() => {
		if($('#commentText').val() == null) {
			$('#commentText').focus()
		} else {
			$.ajax({
				url: '/comment/add',
				method: 'post',
				contentType: 'application/json', 
				data: JSON.stringify({
					userId: '${userId}',
					reportNum: '${report.reportNum}',
					contents: $('#commentText').val()
				})
			}).done(commentList)
			$('#commentText').val('')
		}
	})
})
</script>
<style>
.image {
	width: 15rem;
	height: 10rem;
}

th {
	background-color: lightgray;
}
</style>
</head>
<body>
    <header class='container-fulid border fixed-top'>
		<div class='row p-3 justify-content-between align-items-center'>
			<strong class='col'>
				신고 글 보기
			</strong>
			<div class='col d-flex justify-content-end align-items-center'>
				<a id='goHome' href='../used' class='ml-3 d-none d-md-inline'>
					<i class='fa-solid fa-house'></i>
					<span class=''>HOME</span>
				</a>
			</div>
		</div>
	</header>

	<div class='container'>
		<div id='mainContent' class='row'>
			<div id='productImg' class='col border m-3 carousel text-center'>
				<div class='row justify-content-center'>
					<img src='<c:url value="/attach/${report.reportImgFileName}"/>' class='w-75 h-auto'/>
				</div>
			</div>
		</div>
		
		<div class='row justify-content-between align-items-center'>
			<div class='col m-2'>
				<strong class='d-block '>${report.title}</strong>
			</div>
		</div>

		<div class='col text-center pt-3 pb-3'>
			<div class='row'>
				<span class='col-4 p-2 border'>신고자</span>
				<span id='userId' class='col p-2 border'>${user.nickName}</span>
			</div>
			<div class='row'>
				<span class='col-4 p-2 border'>피신고자</span>
				<span class='col p-2 border'>${report.accusedName}</span>
			</div>
		</div>

		<div class='row m-2'>
			<p class='mt-2 mb-5'>
				${report.contents}
			</p>
		</div>

		<div id='commentArea' class='container min-vh-100 mt-4 mb-5'>
			<div class='row  border-top'>
				<h5 class='m-3'>댓글</h5>
			</div>
			<form class='row form justify-content-between pb-2 border-bottom'>
				<input id='commentText' type='text' class='col-10 form-control' placeholder='댓글을 입력해주세요.'/>
				<button id='addCommentBtn' type='button' class='col-2 form-control'>
					<i class="fa-solid fa-paper-plane"></i>
				</button>
			</form>
			<ul id='commentList' class='row list-unstyled border-bottom'>
				
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