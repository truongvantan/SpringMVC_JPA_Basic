<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trang đăng nhập</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;1,100;1,300;1,400;1,500&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/resources/css/styles.css" />' />
</head>
<body>
	<div class="container-fluid mt-4">
		<h1 class="text-center">Đăng nhập</h1>
		<p class="text-center text-danger">${errorMessage}</p>
		<div class="row mt-4">
			<div class="col-md-12 d-flex justify-content-center">
				<form action="${contextPath}/checkLogin" method="POST" class="w-50">
					<div class="form-outline mb-4">
						<label class="form-label text-primary font-weight-bold"
							for="username">Tên đăng nhập</label> <input name="username"
							type="text" id="username" class="form-control"
							placeholder="Tên đăng nhập"/>
					</div>
					<div class="form-outline mb-4">
						<label class="form-label text-primary font-weight-bold"
							for="password">Mật khẩu</label> <input name="password"
							type="password" id="password" class="form-control"
							placeholder="Mật khẩu"/>
					</div>
					<input type="submit" class="btn btn-primary w-100"
						value="Đăng nhập" />
				</form>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
</body>
</html>