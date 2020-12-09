<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

	<c:url var="url" value="/admin/user/list?role=${param.role }&"></c:url>
	<c:url var="urlSelect" value="/admin/user/list?role="></c:url>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>List user</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/paging.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
<script src="${pageContext.request.contextPath}/admin/js/jquery.min.js"></script>
</head>
<body>

	<%@include file="/common/admin/header.jsp"%>

	<%@include file="/common/admin/menu.jsp"%>
	
	<div class="main">
		<h1>Danh sách bài viết</h1>
		
		<a href="${pageContext.request.contextPath}/admin/user/add">
			<button style="float:right; margin-top:20px; margin-right:30px;" class="button btn-brown">Tạo admin</button>
		</a>
		<div>
			<b>Vai trò:</b>
			<select style="width:30%; height: 30px; margin:20px;" id="selectRole" onchange="selectRole()">
				<option value="0">Tất cả</option>
				<c:forEach var="item" items="${listRole }">
					<option value="${item.id }" <c:if test="${param.role == item.id}">selected</c:if>> ${item.name }</option>
				</c:forEach>
			</select>
		</div>
		<table>
			<tr>
				<th>Ảnh đại diện</th>
				<th>Tên tài khoản</th>
				<th>Mật khẩu</th>
				
				<th>Họ và tên</th>
				<th>Trạng thái</th>
				<th>Thao tác</th>
			</tr>
			<c:forEach var="item" items="${listUser }">
				<tr>
					<td><img src="${item.avatar }" width="73px"></td>
					<td>${item.userName }</td>
					<td>${item.password }</td>
					
					
					<td>${item.fullName }</td>
					<td>
						<c:if test="${item.status ==1 }">
							Hoạt động
						</c:if>
						<c:if test="${item.status !=1 }">
							Đã khóa
						</c:if>
					</td>
		
					<td  width="120px">
						<a href="${pageContext.request.contextPath}/admin/user/lock?id=${item.id}">
							<c:if test="${item.status ==1 && item.id != 2}">
								<button class="button btn-red">
									Khóa
								</button>
							</c:if>
							
						</a>
						<a href="${pageContext.request.contextPath}/admin/user/unlock?id=${item.id}">
							<c:if test="${item.status !=1 }">
								<button class="button btn-green">
									Mở khóa
								</button>
							</c:if>
						</a>
						
					</td>
				</tr>
			</c:forEach>
			
		</table>
		<br>
			<div class="pagination">
		<c:if test="${totalPage < 6}">
			<c:forEach var="i" begin="1" end="${totalPage}">
				 <a href="${url}page=${i}"
				  	  	 <c:if test="${i==page }">class="active"</c:if>
				  	  >
				  	  		${i}
				  	  </a>	
			</c:forEach>
		</c:if>
		<c:if test="${totalPage >= 6}">
			<c:if test="${page != 1 && page != 2 && page != 3}">
				<a href="${url}page=1">|&lsaquo; </a>
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
			  				
					  	  <a href="${url}page=${i}"
					  	  	 <c:if test="${i==page }">class="active"</c:if>
					  	  >
					  	  		${i}
					  	  </a>	
			  	  	
			  	
			  </c:forEach>
			  
			<%-- <c:if test="${page != totalPage}">
				  <a href="${pageContext.request.contextPath}/admin/news/list?page=${page+1}">&raquo;</a>
			</c:if> --%>
			<c:if test="${page != totalPage && page != totalPage-1 && page != totalPage-2}">
				<a href="${url}page=${totalPage}">&rsaquo;|</a>
			</c:if>
		</c:if>
	</div>
	</div>
	<br><br>
	<%@include file="/common/admin/footer.jsp"%>
	<script>
		function selectRole(){
			window.location.href="${urlSelect}"+$("#selectRole").val()+"&page=1";
		}
	</script>
</body>
</html>