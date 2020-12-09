<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="url" value="/admin/news/list"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>List news</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/paging.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>

	<%@include file="/common/admin/header.jsp"%>

	<%@include file="/common/admin/menu.jsp"%>

	<div class="main">

		<h1 style="float:left;">Danh sách bài viết</h1>
		
		<a href="${pageContext.request.contextPath}/admin/news/edit">
			<button style="float:right; margin-top:20px; margin-right:30px;" class="button btn-brown">Thêm bài viết</button>
		</a>
		
		
		
		<table> 
			<tr>
				<th width="80px">Danh mục</th>
				<th>Tiêu đề</th>
				<th>Tóm tát</th>
				<th>Ảnh đại diện</th>
				<th width="80px">Nội dung</th>
				<th width="180px">Thao tác</th>
			</tr>
			<c:forEach var="item" items="${listNews}">	
				<tr>
					<td>${item.category.name }</td>
					<td>${item.title }</td>
					<td>${item.shortDescription }</td>
					<td><img src="${item.thumbnail }" width="90px" height="50px"/></td>
					<td>
						<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
							<button class="button btn-blue">Xem</button>
						</a>
					</td>
					<td>
						<a href="${pageContext.request.contextPath}/admin/news/edit?id=${item.id}">
							<button class="button btn-green">Sửa</button>
						</a>
						
						<a href="${pageContext.request.contextPath}/admin/news/delete?id=${item.id}">
					 		<button class="button btn-red">Xóa</button>
					 	</a>
					 </td>
				</tr>
			</c:forEach>
		</table>
		
	<br>
	<div class="pagination">
		<c:if test="${totalPage < 6}">
			<c:forEach var="i" begin="1" end="${totalPage}">
				 <a href="${url}?page=${i}"
				  	  	 <c:if test="${i==page }">class="active"</c:if>
				  	  >
				  	  		${i}
				  	  </a>	
			</c:forEach>
		</c:if>
		<c:if test="${totalPage >= 6}">
			<c:if test="${page != 1 && page != 2 && page != 3}">
				<a href="${url}?page=1">|&lsaquo; </a>
			</c:if>
			<%-- <c:if test="${page-1 != 0}">
				  <a href="${pageContext.request.contextPath}/admin/news/list?page=${page-1}">&laquo;</a>
			</c:if> --%>
			
			<c:if test="${page != 1 && page !=2 && page != totalPage && page != totalPage-1}">
				<c:set var="begin" value="${page-2}"></c:set>
				<c:set var="end" value="${page+2}"></c:set>
			</c:if>
			<c:if test="${page==1||page==2}">
				<c:set var="begin" value="1"></c:set>
				<c:set var="end" value="5"></c:set>
			</c:if>
			<c:if  test="${page==totalPage || page==totalPage-1}">
				<c:set var="begin" value="${totalPage-4}"></c:set>
				<c:set var="end" value="${totalPage}"></c:set>
			</c:if>
			
			  <c:forEach var="i" begin="${begin }" end="${end }">
			  				
					  	  <a href="${url}?page=${i}"
					  	  	 <c:if test="${i==page }">class="active"</c:if>
					  	  >
					  	  		${i}
					  	  </a>	
			  	  	
			  	
			  </c:forEach>
			  
			<%-- <c:if test="${page != totalPage}">
				  <a href="${pageContext.request.contextPath}/admin/news/list?page=${page+1}">&raquo;</a>
			</c:if> --%>
			<c:if test="${page != totalPage && page != totalPage-1 && page != totalPage-2}">
				<a href="${url}?page=${totalPage}">&rsaquo;|</a>
			</c:if>
		</c:if>
	</div>

		<br><br>
	</div>
	
	<%@include file="/common/admin/footer.jsp"%>
	
</body>
</html>