<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
function listUsers() {
	$('#users').empty()
	
	$.ajax({
		url: 'userList'
	}).done(users => {
		if(users.length) {				
			const userArr = []

			$.each(users, (i, user) => {
				userArr.unshift(
					`<tr id='user' class='row justify-content-between text-center p-3' onclick='location.href="userManager?userId=\${user.userId}"'>
                         <td class='col-2'>\${++i}</td>
                         <td id='userId' class='col-3'>\${user.userId}</td>
                         <td class='col'>\${user.userName}</td>
                         <td class='col'>\${user.nickName}</td>
                         <td class='col'>\${user.joinDate}</td>
                     </tr>`		
				)
			})
			
			$('#users').append(userArr.join(''))
		} else $('#users').append(
			'<tr><td colspan=4 class=text-center>회원이 없습니다.</td></tr>')
	}) 
}

$(() => {
	listUsers()
})
</script>
<style>
.title {
    background-color: #eee7da;
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
            <a id='logout' href='../../used' class='ml-2'>
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
                        <a href='users'>회원 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/trade'>거래 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/report'>신고 관리</a>
                    </li>
                </ul>
            </nav>

            <div class='col m-3'>
                <div class='row justify-content-between align-items-end m-2'>
                    <h5>회원 목록</h5>
                    <div class='row form'>
                        <input type='text' class='col form-control'>
                        <button type='button' class='col-3 form-control btn border ml-2'>검색</button>
                    </div>
                </div>
                <table class='col table-hover'>
                    <thead class='col h6 p-2'>
                        <tr class='row text-center'>
                            <th class='col'>회원번호</th>
                            <th class='col'>아이디</th>
                            <th class='col'>이름</th>
                            <th class='col'>닉네임</th>
                            <th class='col'>가입일</th>
                        </tr>
                    </thead>
                    <tbody id='users' class='col border-bottom'>
                        
                    </tbody>
                </table>

                <div class='row mt-5 justify-content-center'>
                    <span class='col'></span>
                    <span class='col'></span>
                    <span class='col'></span>
                    <span class='col'>
                        <i class='fa-solid fa-angle-left'></i>
                    </span>
                    <span class='col'>1</span>
                    <span class='col'>2</span>
                    <span class='col'>3</span>
                    <span class='col'>4</span>
                    <span class='col'>5</span>
                    <span class='col'>
                        <i class='fa-solid fa-angle-right'></i>
                    </span>
                    <span class='col'></span>
                    <span class='col'></span>
                    <span class='col'></span>
                </div>
            </div>
        </div>
    </div>

    <footer class='container mt-5 p-3'>
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