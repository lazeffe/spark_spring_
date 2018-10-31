<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>1</title>
</head>
<body>
<!-- 이미지 지도를 표시할 div 입니다 -->
<div id="staticMap" style="width:500px;height:600px;"></div>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=65ef4303482c34481a1e7944b80a4dc0"></script>
<script>    
// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new daum.maps.LatLng(33.450001, 126.570467), 
        text: '텍스트를 표시할 수 있어요!' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];

var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    

// 이미지 지도를 생성합니다
var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
</script>
</body>
</html>