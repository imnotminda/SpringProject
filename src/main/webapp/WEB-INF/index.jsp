<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
<h2>*** 메인화면 ***</h2>
<h3>
	<p><a href="/spring/user/writeForm">입력</a></p>
	<p><a href="/spring/user/list">출력</a></p> <!-- pg=1일때는 생략 -->
	<br>
	<p><a href="/spring/user/uploadForm">파일 업로드</a></p>
	<p><a href="/spring/user/uploadAJaxForm">파일 업로드 AJax</a></p>
	<br>
	<p><a href="/spring/user/uploadList">이미지 출력</a></p>
</h3>
</body>
</html>

<!-- 
Spring Framework + Maven + MySQL + MyBatis(@Mapper 사용) + JSP(jQuery) + NCP

Project : SpringProject
	src/main/java	
		com.controller.SpringProject
			MainController.java
		spring.conf
			NaverSpringConfiguration.java	
			SpringConfiguration.java
		user.bean
			UserDTO.java
			UserPaging.java
			UserUploadDTO.java	
		user.controller
			UserController.java
			UserUploadController.java
		user.dao
			UserDAO.java (Interface)
			UserUploadDAO.java (Interface)
		user.service
			UserService.java (Interface)
			ObjectStorageService.java (Interface)
			UserUploadService.java (Interface)
		user.service.impl
			UserServiceImpl.java
			NCPObjectStorageService.java
			UserUploadServiceImpl.java
		user.dao.impl
			UserMybatisDAO.java =====> 제거

	src/main/resources
		mapper
			userMapper.xml
			userUploadMapper.xml
		spring
			mybatis-config.xml => 제거
			db.properties
			naver.properties
		sql
			usertable.sql
			userUpload.sql
	
	src/main/webapp
		resources
			css
				write.css
				list.css
				user.css
			js
				write.js
				update.js
				uploadAJax.js
			image
				*.jpg				
			storage (가상주소, 업로드)
			
		WEB-INF			
			user
				list.jsp
				updateForm.jsp
				writeForm.jsp
			upload
				uploadForm.jsp
				uploadAJaxForm.jsp
				uploadList.jsp
			spring
				appServlet
					servlet-context.xml
				root-context.xml
			index.jsp
			web.xml
 -->