<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Log In</title>
	<style>
		body{
			background-color: #990033;
		}
		form{
			text-align: center;
			background-color: #f5f5f0;
			margin-right: 500px;
			margin-left: 500px;
			padding: 30px;
		}
		div{
			padding: 10px;
		}
		form input{
			padding: 7px;
			width: 200px;
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
	<form method="POST" action="/devpro-java09-perform_login">

<%-- 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
		<c:if test="${not empty param.login_error}">
			<script>
				alert("Tên tài khoản hoặc mật khẩu không chính xác");
			</script>
		</c:if>
		
		<div>
			<input type="text" name="username" placeholder="Tên tài khoản">
		</div>
		<div>
			<input type="password" name="password" placeholder="Mật khẩu">
		</div>
		<div>
			<input type="submit" name="" value="Đăng nhập">
		</div>
		<br>
		<a href="#">Quên mật khẩu?</a>
		
		<hr width="75%">
		<input type="button" class="btn-signin" value="Tạo tài khoản mới" onclick="dangki()"/>  
	</form>
</body>
<script>
	function dangki(){
		window.location.href= "${pageContext.request.contextPath}/devpro-register";
	}
</script>
</html>