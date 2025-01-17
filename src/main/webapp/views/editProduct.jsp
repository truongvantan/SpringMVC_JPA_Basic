<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Trang chỉnh sửa sản phẩm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
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

	<!-- Kiểm tra người dùng đã đăng nhập hay chưa?  -->
	<c:if test="${empty sessionScope.sessionAccount}">
		<c:redirect url="/login?error=1" />
	</c:if>

	<c:import url="/views/header.jsp"></c:import>

	<div class="container-fluid">
		<h2 class="text-center mt-2">Thông tin sản phẩm</h2>
		<p class="text-center text-danger">${errorMessage}</p>
		<div class="row d-flex justify-content-center">
			<form action="${contextPath}/product/edit" method="POST"
				class="w-75 mt-2">
				<div class="row d-flex justify-content-center">
					<div class="form-outline mb-4 w-50 text-center">
						<label
							class="form-label text-center text-primary font-weight-bold"
							for="idProduct">Mã sản phẩm</label> <input type="text"
							value='${empty errorMessage ? product.id : param.idProduct}'
							class="form-control text-center" disabled /> <input
							type="hidden"
							value='${empty errorMessage ? product.id : param.idProduct}'
							name="idProduct" id="idProduct" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-xs-12">
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="productName">Tên sản phẩm</label> <input type="text"
								name="productName" id="productName" class="form-control"
								placeholder="Tên sản phẩm"
								value='${empty errorMessage ? product.productName : param.productName}' />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="listCategories">Thương hiệu</label> <select
								class="form-control d-inline-block" name="categoryId"
								id="listCategories">
								<option value="">Chọn thương hiệu</option>
								<c:forEach var="category" items="${listCategories}">
									<option value="${category.id}">${category.categoryName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="priceIn">Đơn giá nhập</label> <input type="text"
								name="priceIn" id="priceIn" class="form-control"
								placeholder="Đơn giá nhập"
								value='${empty errorMessage ? product.priceIn : param.priceIn}' />
						</div>
					</div>
					<div class="col-md-6 col-xs-12">
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="priceSell">Đơn giá bán</label> <input type="text"
								name="priceSell" id="priceSell" class="form-control"
								placeholder="Đơn giá bán"
								value='${empty errorMessage ? product.priceSell : param.priceSell}' />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="linkImage">Link hình ảnh</label> <input type="text"
								name="linkImage" id="linkImage" class="form-control"
								placeholder="Link hình ảnh"
								value='${empty errorMessage ? product.linkImage : param.linkImage}' />
						</div>
						<div class="form-outline mb-4">
							<label class="form-label text-primary font-weight-bold"
								for="description">Mô tả</label> <input type="text"
								name="description" id="description" class="form-control"
								placeholder="Mô tả"
								value='${empty errorMessage ? product.description : param.description}' />
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<input type="submit" class="btn btn-primary w-25 mr-1"
						value="Cập nhật" /> <input type="reset"
						class="btn btn-secondary w-25" value="Reset" />
				</div>
			</form>
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

	<script>
		$(document)
				.ready(
						function() {
							$('#listCategories')
									.val(
											'${empty errorMessage ? product.category.id : param.categoryId}');
						});
	</script>
</body>
</html>