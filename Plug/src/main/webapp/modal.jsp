<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모달창 연습</title>
<style>
	.modal { /*모달창 내용을 감싸는 CSS*/
		position: absolute; /*기존 화면 위 특정요소를 원하는 위치에 배치(일종의 덮어쓰기)*/
		display: none; /*모달창이 보이지 않도록 기본 설정*/
		justify-content: center; /*flexbox-모달의 자식 요소(모달바디)를 중앙배치 */
		top: 0; /*화면 상단 배치*/
		left: 0; /*화면 왼쪽 위치*/
		width: 100%; /*회면 너비 차지 비율*/
		height: 100%; /*화면 높이 차지 비율*/
		background-color: rgba(0, 0, 0, 0.8); /*회색 배경 20%투명도*/
	}

	.modal_body {
		position: absolute; /*기존 화면 위 특정요소를 원하는 위치에 배치(일종의 덮어쓰기)*/
		top: 50%; /*모달을 화면 가운데에 놓기(중앙정렬)*/
		width: 400px; /*모달 너비 400픽셀 설정*/
		height: 200px; /*모달 높이 600픽셀 설정*/
		padding: 40px; /*내부여백 40픽셀 설정*/
		text-align: center; /*모달 내 텍스트 x축 중앙정렬*/
		background-color: rgba(255, 255, 255, 0.95); /*모달바디 배경 흰색*/
		border-radius: 15px; /*모달 테두리 10픽셀만큼 둥글게 설정*/
		box-shadow: 0 2px 2px 0 rgba(255, 255, 0, 1);
		/*그림자 수평이동, 수직이동, 투명도, 크기조절, 색상 노랑*/
		transform: translateY(-50%); /*y축 중앙정렬 : 현재 위치한 높이에서 50% 위로 이동*/
	}
</style>
</head>
<body>
	<div class="modal">
		<div class="modal_body">
			<h2>회원탈퇴 확인</h2>
			<p>정말 회원탈퇴하시겠습니까?</p>
			<input type="text" name="member_Delete" required placeholder="회원탈퇴 입력해주세요.">
		</div>
	</div>
	<h3 align="center">회원탈퇴</h3>
	<div style="text-align: center; margin-top: 50px;">
   		<button align="center" class="btn-open-modal">회원탈퇴</button>
	</div>
	<script>
		//modal 변수 선언 : 현재 선택한 요소가 .madal 요소일때 변수에 저장
        const modal = document.querySelector('.modal');
		//btnOpenModal 변수 선언 : 현재 선택한 요소가 .btn-open-modal 요소일때 변수에 저장
        const btnOpenModal=document.querySelector('.btn-open-modal');
		//btnOpenModal 버튼이 눌렸을 때(이벤트리스너 발생 시) 
        btnOpenModal.addEventListener("click",function(){
        	//modal 스타일 요소 실행.(modal_body포함)
            modal.style.display="flex";
        });
		//modal 클릭 시, 이벤트함수 발생
        modal.addEventListener("click", function(event) {
            // 클릭한 대상이 모달 자체인 경우
            if (event.target === modal) {//강력비교 ===
                // 모달창을 닫음.(숨김)
                modal.style.display = "none";
            }
        });
    </script>
</body>
</html>