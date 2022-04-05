<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>ADMIN</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../res/style.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
function listUsers() {
	$('#userList').empty()
	
	$.ajax({
		url: 'admin/userList'
	}).done(users => {
		if(users.length) {				
			const userArr = []
			
			$.each(users, (i, user) => {
				if(i < 5) {	
					userArr.unshift(
						`<tr id='user' class='row justify-content-between text-center p-3'>
	                         <td class='col-1'>\${++i}</td>
	                         <td id='userId' class='col'>\${user.userId}</td>
	                         <td class='col-2'>\${user.nickName}</td>
	                         <td class='col-2'>\${user.joinDate}</td>
	                     </tr>`		
					)
				}
			})
			
			$('#userList').append(userArr.join(''))
		} else $('#userList').append(
			'<tr><td class=text-center><span>회원이 없습니다.</span></td></tr>')
	}) 
}

function listReport() {
	$('#reportList').empty()
	
	$.ajax({
		url: 'admin/reportList'
	}).done(reports => {
		if(reports.length) {				
			const reportArr = []
			
			$.each(reports, (i, report) => {
				reportArr.unshift(
					`<tr id='report' class='row p-2 '>
                        <td class='col text-center'><span>\${report.title}</span></td>
                        <td class='col-2'>\${report.reportRegDate}</td>
                    </tr>`
				)
			})
			
			$('#reportList').append(reportArr.join(''))
		} else $('#reportList').append(
			'<tr><td class=text-center><span>신고가 없습니다.</span></td></tr>')
	}) 
}

$(() => {
	listUsers()
})

$(listReport)
</script>
<style>
.title {
    background-color: #eee7da;
}
</style>
</head>
<body>
	<header class='container m-6'>
        <div id='main' class='row d-flex justify-content-between align-items-center m-2 pl-2 pr-2'>
            <div class='p-4 border'>
				로고디자인
            </div>
            <span>안녕하세요. 관리자님!</span>
            <a id='logout' href='../user/logout' class='ml-2'>
                <span class='d-none d-md-inline'>로그아웃</span>
            </a>
        </div>
	</header>

    <div class='container m-6 mt-3 border-top border-bottom'>
        <div class='row'>
            <nav class='nav col-2 d-flex justify-content-center align-items-start border-right text-center'>
                <ul class='row flex-column justify-content-center list-unstyled'>
                    <li class='m-4 text-center'>
                        <a id='main' href='admin'>메인</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a id='users' href='admin/users'>회원 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a id='trade' href='admin/trade'>거래 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a id='report' href='admin/report'>신고 관리</a>
                    </li>
                </ul>
            </nav>
            
            <div class='col-8 m-5'>
                <div class='row justify-content-between align-items-end p-2'>
                    <h5>회원목록</h5>
                    <div >
                        <a href='admin/users' class='small'>더보기</a>
                    </div>
                </div>
                <table class='row border-top table-horver border-bottom'>
                    <tbody id='userList' class='col'>
                        
                    </tbody>
                </table>

                <div class='row justify-content-between align-items-end mt-5 p-2'>
                    <h5>신고목록</h5>
                    <div >
                        <a href='admin/report' class='small'>더보기</a>
                    </div>
                </div>
                <table class='row border-top border-bottom'>
                    <tbody id='reportList' class='col'>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
	<footer class='container mt-5 p-3'>
        <div id='footer' class='row m-3'>
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
</html>