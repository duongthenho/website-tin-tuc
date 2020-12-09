<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

	<c:url var="url" value="/admin/user/list?role=${param.role }&"></c:url>
	<c:url var="urlSelect" value="/admin/user/list?role="></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add admin</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/paging.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>

	<%@include file="/common/admin/header.jsp"%>

	<%@include file="/common/admin/menu.jsp"%>
	
	<div class="main">
	<h1>Tạo admin</h1>
		<form:form action="/admin/user/add" modelAttribute="user" enctype="multipart/form-data">
			<label>Tên tài khoản:</label>
			<form:input type="text" path="userName"/><br><br>
			
			<label>Mật khẩu:</label>
			<form:input type="text" path="password"/><br><br>
			
			<label>Họ và tên:</label>
			<form:input type="text" path="fullName"/><br><br>
			
			<label>Ảnh đại diện: </label>
			<input type="file" name="newsAvatar" id="newsAvatar">
			
			<img id="imgAvatar" style="width:300px;"><br><br>
			<br><br>
			<button  type="submit" class="button btn-green">Tạo tài khoản</button>
		</form:form>
	</div>
	
	<%@include file="/common/admin/footer.jsp"%>
	<c:if test="${not empty message}">
		<script>alert("${message}")</script>
	</c:if>
	
	<script>
		$("#newsAvatar").change(function() {
			var input = document.getElementById("newsAvatar");			
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event) {
				var img = document.getElementById("imgAvatar");
				img.src = event.target.result;
			}
		});
		
	</script>
</body>
</html>