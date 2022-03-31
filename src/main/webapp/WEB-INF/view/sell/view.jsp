<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang='ko'>
<head>
<title>VIEWPOST</title>
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
		url: '/comment/list/trede/' + ${trade.tradeNum},
	}).done(comments => {
		if(comments.length) {
			const commentList = []
			
			$.each(comments, (i, comment) => {
				commentList.unshift(
					`<li class='col-12 mt-2 border-bottom'>
						<div class='row justify-content-between align-items-center'>
							<div class='col'>
								<input id='commentNum' value='\${comment.commentNum}'/>
								<small class='pr-3'>\${comment.userId}</small>
								<time class='border-left small pl-3'>
									\${comment.commentRegDate}
								</time>
								<p class='mt-2 d-block'>
									\${comment.contents}
								</p>
							</div>
							<button type='button' class='col-1 btn' data-toggle='dropdown'>
								<i class="fa-solid fa-ellipsis-vertical"></i>
							</button>
							<div class='dropdown-menu w-25'>
								<button type='button' class='dropdown-item'>수정</button><hr>
								<button type='button' id='delComment' class='dropdown-item delContent'>삭제</button> 
							</div>		
		                    <button id='likeBtn1' type='button' class='btn'>
		                        <i class="fa-regular fa-thumbs-up"></i>
		                    </button>
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

function checkWish() {
	let checkWish = $('.fa-heart').hasClass('on')

	if(checkWish) {
		$('.fa-heart').css('color', 'red')
	} else {
		$('.fa-heart').css('color', 'lightgray')
	}
}

function checkRes() {
	$('.resBtn').click(() => {
		$('.resIcon').toggleClass('fa-regular, fa-solid')
	}) 
}

function checkwriter() {
	if('${userId}' != '${trade.traderId}') {
		$('.writerBtn').hide()
	}
}

$(() => {
	checkwriter()
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
					tradeNum: '${trade.tradeNum}',
					contents: $('#commentText').val()
				})
			}).done(commentList)
			$('#commentText').val('')
		}
	})
	
 	$('.goChatBtn').click(() => {
 		if(!'${userId}') {
 			location.href='/user/login'
 		} else {
			$.ajax({
				url: '/chat/add',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify({
					traderId: '${trade.traderId}',
					userId: '${userId}',
					tradeNum: '${trade.tradeNum}'			
				})
			})
		}
	})
	
	$('#checkHeart').click(() => {
        $('.fa-heart').toggleClass('on', 'off')
		checkWish()
	})

	checkRes()
	
	$('#delPost').click(() => {
		$('#modalBtn').show()
		$('#delCommentOkBtn').hide()
		$('#modal').modal()
	})

	$('#delOkBtn').click(() => {
		$('#modal').modal('hide')
		$.ajax({
			url: 'del/' + '${trade.tradeNum}',
			method: 'delete'
		}).done(function() {
			location.href='/sell'	
		})
	})
	
	$(document).on('click', '#delComment', function() {
		const commentNum = $(this).parent().parent().find('#commentNum').val();
		$('#modalBtn').show()
		$('#delOkBtn').hide()
		$('#modal').modal()
		
	
		$('#delCommentOkBtn').click(() => {
			console.log(commentNum);
			$('#modal').modal('hide')
			$.ajax({
				url: '/comment/del/' + commentNum,
				method: 'delete'
			}).done(commentList)
		})
	})
})

</script>
<style>
#chatBtn {
    bottom: 51px;

}

#chatBtnCom {
    bottom: 7rem;
    left: 80rem;
}

img {
	border-radius: 8px;
}

#commentNum {
	visibility: hidden;
	width: 0rem;
}
</style>
</head>
<body>
	<header class='container-fulid border fixed-top'>
		<div class='row justify-content-between align-items-center'>
			<div class='col-4 ml-3 d-flex'>
				<strong>판매 글 조회</strong>
			</div>
			<div class='col text-right mr-3'>
				<a class='btn btn-lg' href='../buy'><i class='fas fa-xmark'></i></a>
			</div>
		</div>
	</header>
<form method='post'>
	<div class='container'>
		<div id='mainContent' class='row'>
			<div id='productImg' class='col'>
				<div class='row justify-content-center'>
					<img src='<c:url value="/attach/${trade.tradeImgFileName}"/>' class='w-75 h-auto'/>
				</div>
			</div>
		</div>>	
		<div class='row pt-4 pb-4'>
			<div class='col-12'>
				<strong class='d-block '>${trade.title}</strong>
				<span class='small pr-3'>${traderNickName}</span>
				<span class='small pl-4 border-left'>${trade.location}</span>
			</div>
			<div class='col-9 mt-3'>
				<span id='price'>${trade.price}</span>
			</div>
			<button type='button' id='checkHeart' class='btn ml-5'>
				<i class="fa-solid fa-heart"></i>
			</button>
		</div>

		<div class='border writerBtn'>
			<div class='d-flex justify-content-center align-items-center'>
				<div class='btn-group btn-block btnBack p-2'>
					<button type='button' class='btn resBtn btnBack'>
						<i class="resIcon fa-regular fa-calendar-check fa-lg"></i>
					</button>
					<button type='button' class='btn' data-toggle='dropdown'>
						<i class="fa-solid fa-ellipsis-vertical fa-lg"></i>
					</button>
					<div class='dropdown-menu w-50'>
						<a class='dropdown-item' href='fix?tradeNum=${trade.tradeNum}'>수정</a><hr>
						<button type='button' id='delPost' class='dropdown-item delContent'>삭제</button><hr>
						<button type='button' class='dropdown-item'>거래완료</button>
					</div>
				</div>
			</div>
		</div>
		<hr>

		<div class='row p-1 mt-4'>
			<div class='col'>
				<div class='media'>
					<div class='media-body'>
						<p>
							${trade.contents}<br>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
	<div id='commentArea' class='container mt-4 mb-5'>
		<div id='commentTitle' class='row p-3'>
			<span class='h5'>댓글</span>
		</div>
		<form class='row form justify-content-between pb-2 border-bottom'>
			<input id='commentText' type='text' class='col-10 form-control' placeholder='댓글을 입력해주세요.'/>
			<button id='addCommentBtn' type='button' class='col-2 form-control'>
				<i class="fa-solid fa-paper-plane"></i>
			</button>
		</form>
		<ul id='commentList' class='row list-unstyled border'>
			
		</ul>
	</div>

	<div  class='container-fulid'>
		<div id='chatBtnCom' class='goChatBtn row fixed-bottom d-none d-md-inline'>		
			<div class='col'>
				<a class='btn p-2'>
					<i class="fa-solid fa-comments fa-xl"></i>
					<strong>채팅 시작하기</strong>
				</a>
			</div>
		</div>
		
		<div id='chatBtn' onclick='location.href="/chat/room"' class='goChatBtn row fixed-bottom d-sm-none'>		
			<div class='col'>
				<a  class='btn btn-block p-2'>
					<i class="fa-solid fa-comments fa-xl"></i>
					<strong class='ml-3'>채팅 시작하기</strong>
				</a>
			</div>
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

    <div class='modal' id='modal' tabindex='-1'>
		<div class='modal-dialog modal-dialog-centered'>
			<div class='modal-content'>
				<div class='modal-body'>
					<p id='modalMsg'>삭제 하시겠습니까?</p>
				</div>
				<div id='modalBtn' class='modal-footer'>
					<button type='button' class='btn btn-light' data-dismiss="modal">아니오</button>
					<button type='button' id='delOkBtn' class='btn yesBtn' data-dismiss="modal">예</button>
					<button type='button' id='delCommentOkBtn' class='btn yesBtn' data-dismiss="modal">예</button>
				</div>
			</div>
		</div>
	</div>
	<script src='../res/likeBtn.js'></script>
</body>
</html>
