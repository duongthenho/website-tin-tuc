<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Register</title>
	<script src="<c:url value="web/js/jquery.min.js"></c:url>"></script>
	<style>
		body{
			background-color: #990033;
		}
		form{
			text-align: center;
			background-color: #f5f5f0;
			margin-right: 300px;
			margin-left: 300px;
			padding: 30px;
		}
		div{
			padding: 10px;
		}
		form input{
			padding: 7px;
			width: 250px;
		}
		a{
			text-decoration: none;
		}
		
		.home{
			color: white;
			font-size: 30px;
		}
		
		a:hover{
			text-decoration: underline;
			
		}
		h1:hover{
			text-decoration: underline;
			text-decoration-color: white;
		}
		.btn-signin{
			width: 200px;
			padding: 5px;
			background-color: #009933;
			color: white;
			border: none;
		}
	</style>
</head>
<body>
	<div>
		<a class="home" href='<c:url value="/home"></c:url>'>Trang chủ</a>
	</div>
	<form:form id="formSubmit" role="form" method="post" action="/devpro-register" modelAttribute="user"
		enctype="multipart/form-data">

<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>

		<h2>Đăng ký</h2>
		<c:if test="${not empty message}">
			<h3 style="color:red;">${message}</h3>
		</c:if>
		<hr>
		<table style="margin:auto;">
			
			<tr>
				<td>Tên tài khoản</td>
				<td><form:input type="text"  name="userName" path="userName"/></td>
			</tr>
			<tr>
				<td>Mật khẩu</td>
				<td><form:input type="password" name="password" path="password"/></td>
			</tr>
			<tr>
				<td>Nhập lại mật khẩu</td>
				<td><input type="password" name="repeatPassword"/></td>
			</tr>
			<tr>
				<td>Họ và tên</td>
				<td><form:input type="text" name="fullName"  path="fullName"/></td>
			</tr>
			<tr>
				<td>Ảnh đại diện</td>
				<td><input type="file" name="newsAvatar" id="newsAvatar"></td>
			</tr>
		</table>
		<img id="imgAvatar" style="width:300px;"><br><br>
		
		<input type="submit" class="btn-signin" value="Đăng kí" /> <hr> 
		<a href="${pageContext.request.contextPath}/devpro-login">Đăng nhập?</a>
	</form:form>
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