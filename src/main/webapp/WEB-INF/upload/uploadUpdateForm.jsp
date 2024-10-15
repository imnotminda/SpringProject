<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 수정</title>
<link rel="stylesheet" href="../css/update.css">
</head>
<body>
<a href="/spring/"><img src="../image/aa.jpg" alt="artist" width="75" height="75"/></a>

<form id="uploadUpdateForm" name="uploadUpdateForm">
<h3 align="center">파일 수정</h3>
	<input type="text" name="seq" style="visibility: hidden;" value="${userUploadDTO.seq }" />
	
	<table border="1">
		<tr>
			<th>상품명</th>
			<td>
				<input type="text" name="imageName" size="35" value="${userUploadDTO.imageName }">
			</td>
		</tr>	
		
		<tr>
			<td colspan="2">
				<textarea name="imageContent" rows="10" cols="50">${userUploadDTO.imageContent }</textarea>
			</td>
		</tr>
		
		<!-- 한 번에 1개 또는 여러개(드래그)를 선택 => 서버에서 List로 받는다 -->
		<tr>
			<td colspan="2">
				<span id="showImageList">
					<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-142/storage/${userUploadDTO.imageFileName }"
					     alt="${userUploadDTO.imageName }" width="70" height="70" />
				</span>
				<img id="camera" src="../image/camera.png" width="50" height="50" alt="카메라">
				<input type="file" name="img" id="img" style="visibility: hidden;">
			</td>
		</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" value="수정완료" id="uploadUpdateBtn"/>
		<input type="reset" value="다시작성" />
		</td>
	</tr>
	</table>
</form>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadUpdate.js"></script>
<script type="text/javascript">
$('#camera').click(function(){
	$('#img').trigger('click'); //강제 이벤트 발생
});

//이미지 미리보기
$('#img').change(function(){
	$('#showImageList').empty();
	
	for(var i=0; i<this.files.length; i++){
		readURL(this.files[i]);
	}
});

function readURL(file){
	var reader = new FileReader();
	
	var show;
	reader.onload = function(e){
		var img = document.createElement('img');
        img.src = e.target.result;
        img.width = 70;
        img.height = 70;
        $('#showImageList').append(img);
	}
	
	reader.readAsDataURL(file);
}
</script>
</body>
</html>