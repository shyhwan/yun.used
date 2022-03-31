<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang='ko'>
<head>
<title>ADMIN</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='http://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css'/>
<link rel='stylesheet' href='../../res/style.css'>
<link rel='stylesheet' href='../../res/admin.css'>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/449f39a7b2.js' crossorigin='anonymous'></script>
<script>
$(() => {

})   
</script>
<style>
#productImg {
    width: 55rem;
    height: 15rem;
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
            <a id='logout' href='../../main.html' class='ml-2'>
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
                        <a href='../admin/trade'>게시판 관리</a>
                    </li>
                    <li class='m-4 text-center'>
                        <a href='../admin/report'>신고 관리</a>
                    </li>
                </ul>
            </nav>

            <div class='col m-3'>
                <div class='row justify-content-between m-3'>
                    <h5 class='mb-4'>게시판 관리</h5>
                    <div id='productImg' class='row align-items-center border'>
                        <div class='col carousel text-center'>
                                옷 이미지
                        </div>
                    </div>
                </div>

                <div class='row pt-4 pb-4 pl-2'>
                    <div class='col-12'>
                        <strong class='d-block mb-2'>아디다스 후드집업 팔아요!! 완전 새 상품!</strong>
                        <span class='small pr-3'>구름이</span>
                        <span class='small pl-4 border-left'>마포구</span>
                    </div>
                    <div class='col-9 mt-3 '>
                        <span class=''>90,000</span>
                    </div>
                </div>

                <div class='row p-1 mt-4 pl-2'>
                    <p class='mt-3 ml-1'>
                        착샷 찍으려고 집에서 딱 한번 입어봤어요!!<br>
                        사이즈는 L입니다.
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
                    <ul id='comment' class='row list-unstyled border-bottom'>
                        <li class='col-12 mt-3 border-bottom h6'>
                            <div class='row justify-content-between align-items-center'>
                                <div class='col'>
                                    <span class='pr-3'>닉네임</span>
                                    <time class='border-left pl-3'>2시간전</time>
                                    <p class='mt-2 d-block'>금액은 얼마인가요?</p>
                                </div>
                                <button id='likeBtn' type='button' class='btn'>
                                    <i class="fa-regular fa-thumbs-up"></i>
                                </button>
                                <button type='button' id='delComment' class='col-1 btn-secondary btn border'>삭제</button>
                            </div>
                        </li>
                        <li class='col-12 mt-3'>
                            <div class='row justify-content-between align-items-center'>
                                <div class='col'>
                                    <span class='pr-3'>닉네임</span>
                                    <time class='border-left pl-3'>5분 전</time>
                                    <p class='mt-2 d-block'>채팅 드렸어요 확인요</p>
                                </div>
                                <button id='likeBtn' type='button' class='btn'>
                                    <i class="fa-regular fa-thumbs-up"></i>
                                </button>
                                <button type='button' id='delComment' class='col-1 btn-secondary btn border'>삭제</button>
                            </div>
                        </li>
                    </ul>
                    <div class='row justify-content-end mt-5'>
                        <button type='button' id='delPost' class='col-2 btn-secondary btn border m-2'>삭제</button>
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

        <div class='modal' id='modal' tabindex='-1'>
            <div class='modal-dialog modal-dialog-centered'>
                <div class='modal-content'>
                    <div class='modal-body'>
                        <p id='modalMsg'>삭제 하시겠습니까?</p>
                    </div>
                    <div id='modalBtn' class='modal-footer'>
                        <button type='button' class='btn btn-light' data-dismiss="modal">아니오</button>
                        <button type='button' id='delOkBtn' class='btn btn-secondary' data-dismiss="modal">예</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src='../../res/modal.js'></script>
</body>
</html>