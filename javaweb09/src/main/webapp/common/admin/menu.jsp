<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/common/taglib.jsp"%>
<div class="menu">
		
		<ul>
			<h3>Tất cả danh mục</h3>
			<a href="${pageContext.request.contextPath}/admin/news/list?page=1"><li>Quản lí bài viết</li></a>
			
			<a href="${pageContext.request.contextPath}/admin/user/list?role=0&page=1"><li>Quản lí tài khoản</li></a>
		</ul>
		
	</div>