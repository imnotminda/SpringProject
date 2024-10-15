<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../css/user.css">
</head>
<body>
<a href="/spring/"><img src="../image/aa.jpg" alt="artist" width="75" height="75"/></a>

<form id="writeForm" name="writeForm">
<h3 align="center">회원가입</h3>
	<table border="1">
		<tr>
	        <th width="100">이름</th>
	        <td>
	        	<input type="text" name="name" id="name" placeholder="이름 입력">
	        	<div id="nameDiv"></div>
	        </td>
	    </tr>	    
	    <tr>
	        <th>아이디</th>
	        <td>
	        	<input type="text" name="id" id="id" placeholder="아이디 입력">
	        	<div id="idDiv"></div>
	        </td>
	    </tr>
	    <tr>
	        <th>비밀번호</th>
	        <td>
	        	<input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
	        	<div id="pwdDiv"></div>
	        </td>
	    </tr>
	    <tr>
	    	<th colspan="2">
		    	<button type="button" id="writeBtn">회원가입</button>
				<button type="reset" id="resetBtn">초기화</button>
	    	</th>
	    </tr>
	</table>
</form>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../js/write.js"></script>
</body>
</html>