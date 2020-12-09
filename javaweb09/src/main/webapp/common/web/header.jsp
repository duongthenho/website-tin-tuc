<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- spring taglibs -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
<style>
	.header img {
	border: 1px solid #ddd;
	border-radius: 45%;
	width: 30px;
	height:30px;
	
}

.dropdown {
  position: relative;
  display: inline-block;

}

.dropdown-content {
  display: none;
  position: absolute;

  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);

  z-index: 1;
   color: black;
}

.dropdown:hover .dropdown-content {
  display: block;
}

</style>
</head>
<div class="header">
		<table class="header_table" width="100%">
			<tr>
				<td><a href="${pageContext.request.contextPath}/home">ZIO</a></td>	
				<td><input type="text"></td>
				<td id="date"></td>
				
				<td>
					<sec:authorize access="hasAuthority('ADMIN')">
					  	
					  		<a class="nav-link" href="${pageContext.request.contextPath}/admin/	home">
					  			<button class="button btn-green">
					  				Đến trang Admin
					  			</button>
					  		</a>
				  				
					</sec:authorize>
				</td>
				<td >
				
					<sec:authorize access="isAuthenticated()">
							
								<table>
									<tr>
										<td>
											<img alt="" src="${USER.avatar }">
								 
										</td>
										<td>
											<span>${USER.fullName }</span>
										</td>
									</tr>
								</table>
							
					</sec:authorize>
				</td>
				<td>
					<sec:authorize access="!isAuthenticated()">
						<a href="${pageContext.request.contextPath}/devpro-login">
							Đăng nhập
						</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
				  	<a href="${pageContext.request.contextPath}/perform_logout">
						Đăng xuất
					</a>
					</sec:authorize>
				</td>
			</tr>
		</table>
	</div>
<script>
	n =  new Date();
	y = n.getFullYear();
	m = n.getMonth() + 1;
	d = n.getDate();
	t = n.getDay();
	  weekday = new Array(7);
	  weekday[0] = "Chủ nhật";
	  weekday[1] = "Thứ hai";
	  weekday[2] = "Thứ ba";
	  weekday[3] = "Thứ tư";
	  weekday[4] = "Thứ năm";
	  weekday[5] = "Thứ sáu";
	  weekday[6] = "Thứ bảy";
	document.getElementById("date").innerHTML =weekday[t]+", " + d + "/" + m + "/" + y;
</script>
