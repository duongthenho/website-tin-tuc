<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Error</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
<style type="text/css">
	
</style>
</head>
<body>
<%@include file="/common/admin/header.jsp"%>
<%@include file="/common/admin/menu.jsp"%>
<div class="main">
	<h1 align="center">Đường dẫn này không tồn tại</h1>
	<h1 align="center">The requested URL [URL] was not found on this server</h1>
	<br><br><br><br>
	<p align="center"><font color="red" size="10px">404</font></p>
	<br><br><br><br><br><br>
</div>
	<%@include file="/common/admin/footer.jsp"%>
</body>
</html>