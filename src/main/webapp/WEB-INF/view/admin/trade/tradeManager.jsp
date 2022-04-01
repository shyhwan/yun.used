<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html lang='ko'>
<head>
<title>ADMIN</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../../res/style.css'>
<link rel='stylesheet' href='../../res/admin.css'>
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
	
	$('#delPost').click(() => {
		$('#modalBtn').show()
		$('#delCommentOkBtn').hide()
		$('#modal').modal()
	})

	$('#delOkBtn').click(() => {
		$('#modal').modal('hide')
		if('${trade.tradeCode}' == '구매') {
			$.ajax({
				url: '/buy/del/' + '${trade.tradeNum}',
				method: 'delete'
			}).done(function() {
				location.href='trade'
			})
		} else {			
			$.ajax({
				url: '/sell/del/' + '${trade.tradeNum}',
				method: 'delete'
			}).done(function() {
				location.href='trade'	
			})
		}
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
#productImg {
    width: 55rem;
    height: 15rem;
	border-radius: 8px;
}

#commentNum {
	visibility: hidden;
	width: 0rem;
}
</style>
</head>
<body>
    <header class='container m-6'>
        <div class='row d-flex justify-content-between align-items-center m-2 pl-2 pr-2'>
            <div class='p-4 border'>
                로고디자인
            </div>
            <span>안녕하세요. 관리자님!</span>
            <a id='logout' href='../../user/logout' class='ml-2'>
                <span class='d-none d-md-inline'>로그아웃</span>
            </a>
        </div>
	</header>

    <div class='container m-6 mt-3 border-top border-bottom'>
        <div class='row'>
            <nav class='nav col-2 d-flex justify-content-center align-items-start border-right text-center'>
                <ul class='row flex-column justify-content-center list-unstyled'>
                    <li class='m-4 text-center'>
                        <a href='../admin'>메인</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/users'>회원 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='trade'>거래 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/report'>신고 관리</a>
                    </li>
                </ul>
            </nav>

            <div class='col m-3'>
             	<div class='row justify-content-between p-2 border-bottom'>
                	<h5>게시판 관리</h5>
                </div>
                <div class='row flex-column justify-content-center'>
	                <div id='productImg' class='col'>
						<div class='row justify-content-center border'>
							<img src='<c:url value="/attach/${trade.tradeImgFileName}"/>' class='w-25 h-auto'/>
						</div>
					</div>

	                <div class='row pt-4 pb-4 pl-2'>
	                    <div class='col-12'>
	                        <strong class='d-block '>${trade.title}</strong>
							<span class='small pr-3'>${trade.traderId}</span>
							<span class='small pl-4 border-left'>${trade.location}</span>
	                    </div>
	                    <div class='col-9 mt-3 '>
	                        <span class=''>${trade.price}</span>
	                    </div>
	                </div>
	
	                <div class='row p-1 mt-4 pl-2'>
	                    <p class='mt-3 ml-1'>
	                       ${trade.contents}
	                    </p>        
	                </div>

	                <div id='commentArea'>
	                    <div id='commentTitle' class='row mt-5 p-3 pl-2 border-top'>
	                        <span class='h6'>댓글</span>
	                    </div>
	                    <form id='addComment' class='row pl-2'>
	                        <div class='form-group w-100 input-group'>
	                            <input id='commentText' type='text' class='col form-control input-lg' placeholder='댓글을 입력하세요.'/>
	                            <input id='addCommentBtn' type='button' class='col-1 form-control input-lg' value='등록'/>
	                        </div>
	                    </form>
	                    <ul id='commentList' class='row list-unstyled border-bottom'>
	                        
	                    </ul>
	                    <div class='row justify-content-end mt-5'>
	                        <button type='button' id='delPost' class='col-2 btn-secondary btn border m-2'>삭제</button>
	                    </div>
	                </div>
                </div>
            </div>
        </div>
    </div>

    <footer class='container-fulid mt-5 p-3'>
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
    <script src='../../res/modal.js'></script>
</body>
</html>