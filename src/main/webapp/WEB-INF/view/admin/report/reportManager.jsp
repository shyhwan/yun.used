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
img {
	width: 10rem;
	height: 10rem;
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
                        <a href='../admin/trade'>거래 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='report'>신고 관리</a>
                    </li> 
                </ul>
            </nav>
            
            <div class='col m-3'>
                <div class='row justify-content-between p-2 border-bottom'>
                    <h5>신고 관리</h5>
                </div>
                <div class='row justify-content-center'>
                    <table class='table m-4 border-bottom'>
                        <tbody>
                            <tr class='row'>
                                <th class='col-2 text-center'>제목</th>
                                <td class='col text-center'>${report.title}</td>
                            </tr>
                            <tr class='row'>
                                <th class='col-2 text-center'>신고자</th>
                                <td class='col text-center'>${report.userId}</td>
                            </tr>
                            <tr class='row'>
                                <th class='col-2 text-center'>피신고자</th>
                                <td class='col text-center'>${report.accusedName}</td>
                            </tr>	
                            <tr class='row'>
                                <th class='col-2 text-center'>내용</th>
                                <td class='col'>
                                    <div class='image border text-center'>
                                    	<img src='<c:url value="/attach/${report.reportImgFileName}"/>' class='w-75 h-auto'/>
                                    </div>
                                    <p class='mt-3'>${report.contents}</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
        
                    <div id='commentArea' class='container mt-4 mb-5'>
                        <ul id='commentList' class='row list-unstyled border-bottom'>
                            
                        </ul>
                        <form id='addComment' class='row'>
                            <div class='form-group w-100 input-group'>
                                <input id='commentText' type='text' class='w-75 form-control input-lg' placeholder=' 댓글을 입력하세요.'/>
                                <input id='addCommentBtn' type='button' class='w-25 form-control btn-secondary input-lg' value='등록'/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<footer class='container border mt-5 p-3'>
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