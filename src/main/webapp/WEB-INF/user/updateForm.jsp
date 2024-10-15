<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../css/update.css">
</head>
<body>
<a href="/spring/"><img src="../image/aa.jpg" alt="artist" width="75" height="75"/></a>

<form id="updateForm" name="updateForm">
<h3 align="center">회원정보수정</h3>
	<table border="1">
		<tr>
	        <th width="100">이름</th>
	        <td>
	        	<input type="hidden" id="pg" value="${pg }" />
	        	<input type="text" name="name" id="name" value="${userDTO.name}" >
	        	<div id="nameDiv"></div>
	        </td>
	    </tr>	    
	    <tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" value="${userDTO.id}" readonly>
	        	<div id="idDiv"></div>
	        </td>
	    </tr>
	    <tr>
	        <th>비밀번호</th>
	        <td>
	        	<input type="password" name="pwd" id="pwd">
	        	<div id="pwdDiv"></div>
	        </td>
	    </tr>
	    <tr>
	    	<th colspan="2">
	    		<button type="button" onclick="location.href='/spring/user/list?pg='+${pg}">목록</button>
		    	<button type="button" id="updateBtn">회원정보수정</button>
		    	<button type="button" id="deleteBtn">회원탈퇴</button>
				<button type="reset" id="resetBtn">초기화</button>
	    	</th>
	    </tr>
	</table>
</form>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/update.js"></script>
</body>
</html>