<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" href="../css/list.css">
</head>
<body>
<a href="/spring/"><img src="../image/aa.jpg" alt="artist" width="75" height="75"/></a>

	<div id="listContainer">
		<div id="section">
		<h3 align="center">회원목록</h3>
			<table border="1">
				<tr>
					<th width="200">이름</th>
					<th width="200">아이디</th>
					<th width="200">비밀번호</th>
				</tr>

				<c:forEach var="userDTO" items="${pageMap.list }">
					<tr>
						<td align="center">${userDTO.name}</td>
						<td align="center"><a href="/spring/user/updateForm?id=${userDTO.id}&pg=${pageMap.pg}">${userDTO.id}</a></td>
						<td align="center">${userDTO.pwd}</td>
					</tr>
				</c:forEach>

			</table>
			<div style="text-align: center; margin-top: 15px;">
				${pageMap.userPaging.pagingHTML}</div>
		</div>
	</div> <!-- id="container" -->

<script type="text/javascript">
function userPaging(pg){
	location.href = '/spring/user/list?pg=' + pg;
}
</script>
	
</body>
</html>