<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=api_key값을 넣는자리"></script>

<div id="map" style="width: 750px; height: 610px;"></div>

<script type="text/javascript">
    // 지도 생성 및 옵션 설정
    var container = document.getElementById('map'); // 지도를 담을 영역의 DOM 레퍼런스
    var options = { // 지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(37.5665, 127.961), // 초기 지도 중심 좌표 (서울)
        level: 17 // 지도의 레벨(확대, 축소 정도). 숫자가 클수록 확대됨.
    };

    // kakao.maps.Map 객체를 생성하여 'map' 요소에 지도를 추가
    var map = new kakao.maps.Map(container, options);
    
    // GPS API를 사용하여 사용자의 현재 위치를 가져옴
    if (navigator.geolocation) { // 브라우저가 지오로케이션을 지원하는지 확인
        navigator.geolocation.getCurrentPosition(
            (position) => { // 위치 정보를 성공적으로 가져온 경우의 콜백 함수
                // 사용자의 현재 위치 정보를 사용하여 kakao.maps.LatLng 객체 생성
                const userLocation = new kakao.maps.LatLng(
                    position.coords.latitude, // 위도
                    position.coords.longitude // 경도
                );

                // 지도의 중심을 사용자 위치로 이동
                map.setCenter(userLocation);

                // 사용자 위치에 마커를 추가
                new kakao.maps.Marker({
                    position: userLocation, // 마커의 위치를 사용자 위치로 설정
                    map: map, // 마커를 추가할 지도 객체
                    title: 'You are here!', // 마커의 제목 (마우스를 올렸을 때 표시됨)
                    image: new kakao.maps.MarkerImage(
                        'img/고래로고.png', // 사용자 위치에 표시할 아이콘의 URL
                        new kakao.maps.Size(40, 40) // 아이콘의 크기
                    )
                });
            },
            (error) => { // 위치 정보를 가져오는 데 실패한 경우의 콜백 함수
                handleLocationError(true, error.message); // 오류 메시지 처리 함수 호출
            }
        );
    } else {
        // 브라우저가 지오로케이션을 지원하지 않는 경우
        handleLocationError(false); // 지오로케이션 미지원 메시지 처리 함수 호출
    }
    
    // 장소에 대한 정보 배열
    var places = [
        {
            position: new kakao.maps.LatLng(37.5665, 126.978), // 서울의 위도, 경도
            title: '서울 낚시터', // 장소 제목
            link: 'boardDetails.jsp' // 상세 페이지로 이동할 링크
        },
        {
            position: new kakao.maps.LatLng(35.1796, 129.0756), // 부산의 위도, 경도
            title: '부산 낚시터', // 장소 제목
            link: 'boardDetails.jsp' // 상세 페이지로 이동할 링크
        }
        // 추가 장소는 이 배열에 추가하면 됨
    ];

    // 마커와 정보 창을 추가하는 함수
    function addMarkersAndInfoWindows() {
        places.forEach(function(place) {
            // 마커를 생성
            var marker = new kakao.maps.Marker({
                position: place.position, // 마커의 위치
                map: map // 마커를 추가할 지도 객체
            });

            // 마커 클릭 시 해당 장소의 링크로 이동
            kakao.maps.event.addListener(marker, 'click', function() {
                window.location.href = place.link; // 장소 링크로 이동
            });
        });
    }

    // 마커와 정보 창 추가
    addMarkersAndInfoWindows();

    // 위치 오류 처리 함수
    function handleLocationError(browserHasGeolocation, errorMessage) {
        var message = browserHasGeolocation ?
            'Error: ' + errorMessage : // 지오로케이션 지원하지만 오류 발생
            'Error: Your browser does not support geolocation.'; // 지오로케이션 미지원
        alert(message); // 오류 메시지를 알림으로 표시
    }
</script>

		
</body>
</html>