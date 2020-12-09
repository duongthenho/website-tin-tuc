<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="url" value="../../news/category/${listNews[0].category.id}"></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Category news</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/web/css/paging.css">
<link rel="stylesheet" href='<c:url value="../../web/css/style.css"></c:url>'>
<script src="<c:url value="../../web/js/jquery.min.js"></c:url>"></script>


</head>
<body>

	<%@include file="/common/web/header.jsp"%>

	<%@include file="/common/web/menu.jsp"%>

	<div class="main">
		
		<c:forEach var = "item" items="${listNews}">
        		 <div>
        		 	<table >
        		 		<tr>
        		 			<td rowspan="3">
        		 				<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
        		 					<img src="${item.thumbnail }"/>
        		 				</a>
        		 			<td>
        		 			<td><b style="font-size:26px;">
        		 				<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
        		 					${item.title}
        		 				</a>
        		 			</b></td>
        		 		</tr>
        		 		<tr>
        		 			<td></td>
        		 			<td>${item.shortDescription}</td>
        		 		</tr>
        		 		<tr>
        		 			<td></td>
        		 			<td align="right">
        		 				<b>${item.createdBy}</b> |
        		 				<i>${item.createdDate}</i>
        		 			</td>
        		 		</tr>
        		 	</table>
        		 	
        		 	
        		 </div>
     	</c:forEach>
     	
     	<div class="pagination">
		<c:if test="${totalPage < 6}">
			<c:forEach var="i" begin="1" end="${totalPage}">
				 <a href="${url }?page=${i}"
				  	  	 <c:if test="${i==page }">class="active"</c:if>
				  	  >
				  	  		${i}
				  	  </a>	
			</c:forEach>
		</c:if>
		<c:if test="${totalPage >= 6}">
			<c:if test="${page != 1 && page != 2 && page != 3}">
				<a href="${url }?page=1">|&lsaquo; </a>
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
			  				
					  	  <a href="${url }?page=${i}"
					  	  	 <c:if test="${i==page }">class="active"</c:if>
					  	  >
					  	  		${i}
					  	  </a>	
			  	  	
			  	
			  </c:forEach>
			  
			<%-- <c:if test="${page != totalPage}">
				  <a href="${pageContext.request.contextPath}/admin/news/list?page=${page+1}">&raquo;</a>
			</c:if> --%>
			<c:if test="${page != totalPage && page != totalPage-1 && page != totalPage-2}">
				<a href="${url }?page=${totalPage}">&rsaquo;|</a>
			</c:if>
		</c:if>
	</div>
	<br><br>
	</div>

	<%@include file="/common/web/footer.jsp"%>
	<script>
		
	</script>
</body>
</html>