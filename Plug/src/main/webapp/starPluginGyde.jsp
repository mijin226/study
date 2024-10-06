<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>별점 평가</title>
    <style>
        /* .star-rating 클래스는 별점 요소를 감싸는 컨테이너입니다. */
        .star-rating {
            display: inline-block; /* 별점 컨테이너를 인라인 블록으로 설정하여 텍스트와 같은 라인에서 표시됩니다. */
            font-size: 2em; /* 별점의 크기를 설정합니다. */
            direction: rtl; /* 오른쪽에서 왼쪽으로 읽는 방향으로 설정합니다. 이로 인해 별이 오른쪽에서 왼쪽으로 정렬됩니다. */
        }
        
        /* 라디오 버튼을 숨깁니다. */
        .star-rating input[type="radio"] {
            display: none; /* 기본적으로 라디오 버튼을 숨깁니다. */
        }
        
        /* 레이블 스타일 설정 */
        .star-rating label {
            color: #ddd; /* 기본 별색을 회색으로 설정합니다. */
            cursor: pointer; /* 마우스를 올렸을 때 클릭 가능한 모양으로 커서가 바뀝니다. */
            display: inline-block; /* 레이블을 인라인 블록으로 설정하여 별들이 가로로 나열되도록 합니다. */
        }
        
        /* 체크된 라디오 버튼 이후의 레이블 색상 변경 */
        .star-rating input:checked ~ label {
            color: gold; /* 체크된 별점의 레이블과 그 이후 레이블 색상을 금색으로 변경합니다. */
        }
        
        /* 체크된 라디오 버튼 이후의 레이블 색상 변경 */
        .star-rating input:checked ~ input ~ label {
            color: gold; /* 체크된 별점의 레이블과 그 이후 레이블 색상을 금색으로 변경합니다. */
        }
        
        /* 호버된 레이블 색상 변경 */
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: gold; /* 마우스를 올렸을 때 별의 색상을 금색으로 변경합니다. */
        }
    </style>
</head>
<body>
    <div class="star-rating">
        <!-- 각 별점은 라디오 버튼과 레이블로 구성됩니다. -->
        <input type="radio" id="star5" name="rating" value="5">
        <label for="star5" title="5 stars">&#9733;</label> <!-- 5성급 별점 레이블 -->

        <input type="radio" id="star4" name="rating" value="4">
        <label for="star4" title="4 stars">&#9733;</label> <!-- 4성급 별점 레이블 -->

        <input type="radio" id="star3" name="rating" value="3">
        <label for="star3" title="3 stars">&#9733;</label> <!-- 3성급 별점 레이블 -->

        <input type="radio" id="star2" name="rating" value="2">
        <label for="star2" title="2 stars">&#9733;</label> <!-- 2성급 별점 레이블 -->

        <input type="radio" id="star1" name="rating" value="1">
        <label for="star1" title="1 star">&#9733;</label> <!-- 1성급 별점 레이블 -->
    </div>

    <script>
        // DOMContentLoaded 이벤트는 문서의 초기 로딩이 완료되었을 때 발생합니다.
        document.addEventListener('DOMContentLoaded', () => {
            // '.star-rating input[type="radio"]' 선택자를 사용하여 모든 별점 라디오 버튼을 선택합니다.
            const stars = document.querySelectorAll('.star-rating input[type="radio"]');
            
            // 선택된 모든 별점 라디오 버튼에 대해 반복 작업을 수행합니다.
            stars.forEach(star => {
                // 각 별점 라디오 버튼에 'change' 이벤트 리스너를 추가합니다.
                // 'change' 이벤트는 사용자가 라디오 버튼을 선택했을 때 발생합니다.
                star.addEventListener('change', () => {
                    // 현재 체크된 라디오 버튼의 값을 가져옵니다.
                    // 'input[name="rating"]:checked'는 name 속성이 'rating'인 체크된 라디오 버튼을 의미합니다.
                    const rating = document.querySelector('input[name="rating"]:checked').value;
                    
                    // 선택된 별점 값을 콘솔에 출력합니다.
                    console.log(`Selected rating: ${rating}`);
                });
            });
        });
    </script>
</body>
</html>
