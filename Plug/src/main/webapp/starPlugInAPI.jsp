<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>별점플러그인</title>
<style>
	/* 1. 별점 5개 초기 색상 회색 */
	/* 2. 별점에 커서를 대면 노랑+손모양으로 변경(별점 선택가능 암시-사용자 경험 향상) */
	/* 3. 커서를 가져다 대면 왼쪽에서 해당 버튼까지 노랑색으로 변경.(커서 떼면 다시 회색으로) */
	/* 4. 클릭시 노랑 별 상태로 유지 */
	
	/* 부모(상위)요소 : 별점평가하는 모든 자식(하위)요소 포괄. 별점 형태 구현 */
	.star-rating {
		display : inline-block; /* 인라인 요소 */
		font-size : 2em; 		/* 별점 크기 : 32px ( 기본값 1em = 16px ) */
		direction : rtl; 		/*오른쪽에서 왼쪽방향으로 읽음.(별점 색 노랑으로 변경위함)*/
	}
	
	/* 별점 선택 버튼 숨김 : 인풋의 타입으로 radio 형식인 동그라미 버튼 숨김 처리 */
	.star-rating input[type="radio"]{ 
		display : none;
	}

	/* 자식(하위)요소 : lable 각각의 별(총점 5점.5개의 별) 스타일 설정 */
	.star-rating label{		
		color : lightgray; 	/* 색상 : 밝은 회색 */
		cursor: pointer; 	/* 커서모양 : 사용자가 특정 요소 위에 커서를 옮겼을 때, 화살표가 손 모양으로 변경  */
		display: inline-block /*인라인 요소로 설정*/
	}
	
	/* star-rating 클래스 내 label 요소는 hover상태일 시 진행(마우스 커서 가져다 대면) */
	/* 마우스 커서 가져다 댄 곳에서 왼쪽방향으로(rtl) label요소인 것 노랑색으로 변경 */
	/* 요약 : 별 5개 중 1번째 별에서 사용자 선택한 별까지 노랑색으로 변경 */
	.star-rating label:hover,
	.star-rating label:hover ~ label {
 	   color: yellow; /* 색상 : 노랑 */
	}
	
	/*radio 버튼 선택 시, 선택 label 색상 변경*/
	/*input(radio포함) 뒤에 label태그를 정의(62~82번라인 참조)*/
	/*checked된 input radio값 뒤에 있는 label(단일)까지 진행*/
	/*input:checked == 선택된 라디오 버튼 요소 (checked == 요소 상태 설정)*/
	/* ~ == "일반 형체" 결합자. 선택된 요소 다음에 오는 형체 요소를 의미 */
	.star-rating input:checked ~ label{
		color : yellow; 
	}
	
	/* radio 버튼 선택 시, 선택 label 이후의 label 색상 모두 변경 */
	/* 사용자가 선택한 별을 기준으로 다음 요소(왼쪽방향)가 input이면서 label요소인 것은 본 컨테이너에 해당 */
	.star-rating input:checked ~ input ~label {
		color : yellow; /* 선택한 별 위치를 기준, 왼쪽방향 별 모두 노랑색으로 변경 */
	}


</style>
</head>
<body>
	<h1>&#9733; 본 작품이 마음에 드셨나요?	작품에 대한 후기를 남겨주세요. &#9733;</h1>
	<hr>
<div class="star-rating">	
	<!-- 자식(하위)요소인 각 별점 5개는 radio 버튼(타입)과 label을 지님 -->
	<!-- 오른쪽에서 왼쪽으로 별을 읽으므로 5,4,3,2,1로 value를 매김 -->
	<!-- 각 별이 지칭하는 바를 사용자에게 안내하기 위해 title 명시 -->
	<!-- 별점에 커서를 가져다 댈 시, title 제목 N stars 안내 => 사용자 경험 향상 -->
	
    <!-- 엔티티 구성 : &(엔터티 시작),#(숫자기반),;(엔터티 종료) 반드시 필요 -->
    <input type ="radio" id ="star5" name = "rating" value ="5"> <!-- 5점 -->
 	<label for = "star5" title = "5 stars">&#9733;</label> 
	
	<input type ="radio" id ="star4" name = "rating" value ="4"> <!-- 4점 -->
 	<label for = "star4" title = "4 stars">&#9733;</label> 
 	
 	<input type ="radio" id ="star3" name = "rating" value ="3"> <!-- 3점 -->
 	<label for = "star3" title = "3 stars">&#9733;</label>
 	
 	<input type ="radio" id ="star2" name = "rating" value ="2"> <!-- 2점 -->
 	<label for = "star2" title = "2 stars">&#9733;</label> 	 
 	
 	<input type ="radio" id ="star1" name = "rating" value ="1"> <!-- 1점 -->
 	<label for = "star1" title = "1 stars">&#9733;</label>
 	 	
</div>
    <script>
        // [1] DOMContentLoaded 이벤트 : 문서의 초기 로딩이 완료되었을 때 발생
        // DOM(Document Object Model) : 웹페이지 구조 표현 객체 모델
        document.addEventListener('DOMContentLoaded', () => {
        	//[1-1] 5개의 별 요소 각각을 참조하는 객체 선언

            	//const : 변수 선언 키워드(상수로, 재할당,변경 불가)
       		 	//.star-rating input[type="radio"] : CSS 선택자
            	//querySelectorAll : 주어진 CSS 선택자와 일치하는 모든 요소를 선택하여 NodeList 객체로 반환(참조(링크) 객체)
             	//=> 정리 : '.star-rating input[type="radio"]'인 요소를 CSS 선택자로 지정하여 NodeList 형태로 저장
            const stars = document.querySelectorAll('.star-rating input[type="radio"]');
            
        	
        	
       // [2] 선택자 별점 5개 모두 라디오 버튼과 관련해 아래 코드 반복 수행.
            stars.forEach(star => {	//선택자 별 5개 stars 이하 반복 수행
            	
                // 각 별점 라디오 버튼에 'change' 이벤트 리스너를 추가
                // 'change' 이벤트는 사용자가 라디오 버튼을 선택했을 때 발생
                star.addEventListener('change', () => {

                	// ('input[name="rating"]:checked').value : input태그 내 name값이 rating이면서 radio가 체크상태인 값을 의미.
                    // querySelector : DOM 요소 선택 메서드
                    //현재 체크된 라디오 버튼의 값을 가져옵니다.
                    const rating = document.querySelector('input[name="rating"]:checked').value;
                    
                    // 선택된 별점 값을 콘솔창에 출력
                    console.log(`Selected rating: ${rating}`);
                });
            });
        });
    </script>

</body>
</html>