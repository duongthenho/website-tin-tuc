<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Detail news</title>

<link rel="stylesheet" href='<c:url value="../../web/css/style.css"></c:url>'>
<script src="<c:url value="../../web/js/jquery.min.js"></c:url>"></script>
<style type="text/css">
	.main, .footer {
		margin-right:27%;
	}
	.featuredNews{
 		position: fixed;
 		top: 50px;
 		bottom: 0px;
 		
 		
 	
 		width: 26%;
 		right:0px;
 		background-color: #f5f5f0;
 		overflow: auto;
 		
 		
 	}
 	.featuredNews img{
 	 	border: 1px solid #ddd;
 		 border-radius: 4px;
  		padding: 5px;
  		width:120px;
 	}
	.comment{
			
		display: inline-block;
		background-color: #d6d6c2;
		word-wrap: break-word;
		padding: 10px;
		border-radius: 10px;
		
		}
	.writeCmt{

		background-color: #f5f5f0;
	}
	.opinion{
		
		background-color: #f5f5f0;
		display: block;	
	}
	.imgcmt img{
		border: 1px solid #ddd;
		border-radius: 45%;
		width: 30px;
		height:30px;
		
	}
</style>
</head>
<body>

	<%@include file="/common/web/header.jsp"%>

	<%@include file="/common/web/menu.jsp"%>

	<div class="main">
		<sec:authorize access="hasAuthority('ADMIN')">
			<a href="<c:url value='../../admin/news/edit?id=${news.id}'></c:url>"><button class="button btn-green">Sửa</button></a>
		</sec:authorize>
		<sec:authorize access="hasAuthority('ADMIN')">
			<a href="<c:url value='../../admin/news/delete?id=${news.id}'></c:url>"><button class="button btn-red">Xoá</button></a>
		</sec:authorize>
		${news.content}
		<p align="right">
			<b>${news.createdBy}</b>
			<br>
			<i>${news.createdDate}</i>
		</p>
		<div class="opinion">
			<h3>&nbsp;Bình luận</h3>
			<c:if test="${ empty USER }">
				<span style="color: red;">Bạn phải đăng nhập để bình luận.</span>
			</c:if>
			<hr>
		
		
		<c:forEach var="item" items="${comments }">
			<table>
				<tr>
					<td><div class="imgcmt"><img src="${item.user.avatar}"></div></td>
					<td>
						<div class="comment">
							<div><b>${item.user.fullName }</b></div>
							<div>${item.content }</div>
						</div>
					</td>
				</tr>
			</table>
			
			
		<br>
		</c:forEach>
		
		
		
		<c:if test="${not empty USER }">
			<form action="" class="writeCmt">
				<table >
					<tr>
						<td><span class="imgcmt"><img src="${USER.avatar}"></span></td>
						<td><input type="text" placeholder="Viết bình luận..." id="content"
				style="border-radius:5px; border-style: ridge;border-color: #d6d6c2; padding:7px; margin:10px; width:550px;"></td>
						<td><input type="button" value="Gửi" class="button btn-blue" id="comment"></td>
					</tr>
				</table>
				
				
				
			
			</form>
		</c:if>
		</div>
	</div>
	
	<div class="featuredNews">
		<h2>Tin mới</h2>
		<c:forEach var = "item" items="${listNews}">
        		 <div>
        		 	<table >
        		 		<tr>
        		 			<td rowspan="2"><img src="${item.thumbnail }"/><td>
        		 			<td><b style="font-size:16px;">
        		 				<a href="${pageContext.request.contextPath}/news/detail/${item.id}">
        		 					${item.title}
        		 				</a>
        		 			</b></td>
        		 		</tr>
        		 		
        		 		<tr>
        		 			<td></td>
        		 			<td align="right">
        		 				${item.createdBy} | <br><i>${item.createdDate}</i>
        		 			</td>
        		 		</tr>
        		 	</table>
        		 	
        		 	
        		 </div>
        		 <hr color="#ebebe0">
     	</c:forEach>
		
	</div>
	
	<%@include file="/common/web/footer.jsp"%>
	<script>
		$("#comment").click(function(e){
			e.preventDefault();
			var data = {
					"content": $("#content").val(),
					"idNews": ${news.id}
			};
	//		data["email"] = $('#'+elementIdOfEmail).val();
			
			$.ajax({
				url: "/comment",
				type: "post",
				contentType: "application/json", // d? li?u g?i lên web-service có d?ng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // d? li?u t? web-service tr? v? là json.
				success: function(jsonResult) { // du?c g?i khi web-service tr? v? d? li?u.
					window.location.href = "http://127.0.0.1:8080/news/detail/${news.id}";
				}
			});
		});
	
	</script>
</body>
</html>