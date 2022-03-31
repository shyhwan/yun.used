<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>ADMIN</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../../res/style.css'></script>
<link rel='stylesheet' href='../../res/admin.css'></script>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
$(() => {
	
})
</script>
<style>
hr {
    border-color: black;
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
                        <a href='../admin/trade'>게시판 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/report'>신고 관리</a>
                    </li>
                </ul>
            </nav>

            <div class='col m-3'>
                <div class='row justify-content-between m-3'>
                    <h5 class=''>회원 관리</h5>
                </div>
                <hr>
                <div class='row m-5 p-5 border'>
                    <form class='col m-3 text-center border'>
                        <div class='row justify-content-start border-bottom p-3'>
                            <label for='userId' class='col-3'>이름</label>
                            <div class=''>
                                <input id='userName' type='text' class='form-control col' value='${user.userName}' readonly/>
                            </div>
                        </div>
                        <div class='row justify-content-start border-bottom p-3'>
                            <label for='userId' class='col-3'>아이디</label>
                            <div class=''>
                                <input id='userId' type='email' class='form-control col' value='${user.userId}'/>
                            </div>
                        </div>
                        <div class='row justify-content-start border-bottom p-3'>
                            <label for='nickName' class='col-3'>닉네임</label>
                            <div class=''>
                                <input id='nickName' type='text' class='form-control col' value='${user.nickName}'/>
                            </div>
                        </div>
                        <div class='row justify-content-start border-bottom p-3'>
                            <label for='phoneNum' class='col-3'>연락처</label>
                            <div class=''>
                                <input id='phoneNum' type='text' class='form-control' value='${user.phoneNum}'/>
                            </div>
                        </div>
                        <div class='row justify-content-start border-bottom p-3'>
                            <label for='userPw' class='col-3'>비밀번호</label>
                            <div class=''>
                                <input id='userPw' type='text' class='form-control col' value='${user.pw}' readonly/>
                            </div>
                        </div>
                        <div class='row justify-content-end form-group m-2'>
                            <button type='button' onclick='location.href="01.html"' class='col-2 border btn btn-light form-control ml-2'>취소</button>
                            <button type='button' onclick='location.href="01.html"' class='col-2 border btn editBtn form-control text-white'>수정</button>
                        </div>
                    </form>
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