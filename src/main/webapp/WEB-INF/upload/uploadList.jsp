<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
th,td {
	padding: 5px;
}

table {
	border-collapse: collapse;
}
#uploadListContainer {
	width: 600px;
    margin: 50px auto;
    padding: 20px;
}
</style>
</head>
<body>
<a href="/spring/"><img src="../image/aa.jpg" alt="artist" width="75" height="75"/></a>

<div id="uploadListContainer">
	<form id="uploadListForm">
		<table border="1" frame="hsides" rules="rows">
			<tr>
				<th width="150"><input type="checkbox" id="selectAll"/>번호</th>
				<th width="250">이미지</th>
				<th width="200">상품명</th>
			</tr>
			
			<c:forEach var="userUploadDTO" items="${list }">
				<tr>
					<td align="center">
					<input type="checkbox" name="check" class="check" value="${userUploadDTO.seq }"/>${userUploadDTO.seq }
					</td>
					<td align="center">
					
					<%-- <img src="http://localhost:8080/spring/storage/${userUploadDTO.imageOriginalFileName }"  --%>
					
					<!-- Object Storage -->
					<a href="/spring/user/uploadView?seq=${userUploadDTO.seq }">
						<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-142/storage/${userUploadDTO.imageOriginalFileName }" 
							  alt="userUploadDTO.imagename" width="50" height="50"/>
					</a>
					</td>
					<td align="center">${userUploadDTO.imageName }</td>
				</tr>	
			</c:forEach>
		</table>
		<div style="margin-top:5px;"></div>
		<input type="button" id="deleteBtn" value="선택삭제"/>
	</form>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadDelete.js"></script>
<script type="text/javascript"></script>
</body>
</html>