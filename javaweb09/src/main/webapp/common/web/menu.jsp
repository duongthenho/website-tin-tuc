<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<div class="menu">
		
		<ul>
			<h3>Tất cả danh mục</h3>
			<c:forEach var = "item" items="${categories}">
        		<a href="${pageContext.request.contextPath}/news/category/${item.id}?page=1"><li>${item.name}</li></a>
     		 </c:forEach>
			
		</ul>
		
	</div>