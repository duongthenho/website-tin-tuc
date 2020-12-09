<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Home</title>

<link rel="stylesheet" href='<c:url value="web/css/style.css"></c:url>'>
<script src="<c:url value="web/js/jquery.min.js"></c:url>"></script>
</head>
<body>

	<%@include file="/common/web/header.jsp"%>

	<%@include file="/common/web/menu.jsp"%>

	<div class="main">
	<div>
		<img src="https://adi.admicro.vn/adt/adn/2020/08/980x9-adx5f44f934099c5.png" style="width: 95%;">
	</div>
		<h2 style="color:#3333cc">Tin mới nhất</h2>
		<c:forEach var="item" items="${topNews}">
			<table style="width:45%; display: inline-block; height:520px">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
							<img src="${item.thumbnail }" style="width:100%;">
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
							<b style="font-size:20px">${item.title }</b>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						${item.shortDescription }
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>${item.createdBy }</b> | <i>${item.createdDate }</i> 
					</td>
				</tr>
			</table>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:forEach>
		
		<hr>
		<h2 style="color:#3333cc">Tin mới nhất theo danh mục</h2>
		<c:forEach var="item" items="${topNewsByCategory }">
			
			<table style="width:31%; display: inline-block; height:480px">
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/news/category/${item.category.id }?page=1">
							<b style="font-size:20px;">${item.category.name }</b>
						</a>
					</td>
				</tr>
				
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
							<img src="${item.thumbnail }" style="width:100%;">
						</a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
							<b style="font-size:20px">${item.title }</b>
						</a>
					</td>
				</tr>
				<tr>
					<td>
						${item.shortDescription }
					</td>
				</tr>
				<tr>
					<td align="right">
						<b>${item.createdBy }</b> | <i>${item.createdDate }</i> 
					</td>
				</tr>
			</table>
				&nbsp;
				
		</c:forEach>
		
	
		
	</div>
	
	<%@include file="/common/web/footer.jsp"%>
	<script>
		
	</script>
</body>
</html>