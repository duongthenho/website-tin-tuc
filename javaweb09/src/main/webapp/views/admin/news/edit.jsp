<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<c:url var="APIurl" value="/admin/news/api"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit news</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/style.css">
<link
	href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/admin/css/dashboard.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/summernote/summernote.min.css" rel="stylesheet">
</head>
<body>

	<%@include file="/common/admin/header.jsp"%>

	<%@include file="/common/admin/menu.jsp"%>

	<div class="main">
		<c:if test="${empty news.id }">
	  		<h1>Thêm mới bài viết</h1>
	  	</c:if>
	  	<c:if test="${not empty news.id }">
	  		<h1>Cập nhật bài viết</h1>
	  	</c:if>
		
		<form:form id="formSubmit" role="form" method="post" action="/admin/news/edit" modelAttribute="news"
		enctype="multipart/form-data">
			<label for="category">Danh mục:</label>
			<form:select id="category" name="category" style="width:98%; height: 30px;" path="category.id">
				<option>--Chọn danh mục--</option>
				<form:options items="${categories}" itemValue="id" itemLabel="name"/>
				
				
			</form:select> <br><br>

			<label for="title">Tiêu đề:</label>
	  		<form:input type="text" id="title" name="title" path="title"/><br><br>
	  		
	  		
	  		
	  		<label for="shortDescription">Tóm tắt:</label>
	  		<form:input type="text" id="shortDescription" name="shortDescription" path="shortDescription" /><br><br>
	  		
	  		<label for="newsAvatar">Ảnh đại diện :</label>
	  		<input type="file" name="newsAvatar" id="newsAvatar">
			<img src="${news.thumbnail }" id="imgNewsAvatar" class="img-thumbnail" width="200px" style="margin-top:10px;">
	  		
	  		<br><br>
	  		
	  		<label for="content">Nội dung:</label>
	  		<form:textarea rows="50" style="width:98%;" id="content" name="content" path="content" ></form:textarea><br><br>
	  		
	  		
	  		<c:if test="${empty news.id }">
	  			<button class="button btn-green" type="submit" id="btnAddOrUpdateNews">Thêm mới</button>
	  		</c:if>
	  		<c:if test="${not empty news.id }">
	  			<form:input type="hidden" path="id"/>
	  			<button class="button btn-green" type="submit" id="btnAddOrUpdateNews">Cập nhật</button>
	  		</c:if>
	  		
  		</form:form>
	</div>

	<%@include file="/common/admin/footer.jsp"%>
	<script
		src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>

	<script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	


	<!-- summernote -->
	<script src="${pageContext.request.contextPath}/summernote/summernote.min.js"></script>
	
	<c:if test="${not empty message }">
	  		<script>
	  			alert("${message}");
	  		</script>
	</c:if>
<script type="text/javascript">
		$(document).ready(function() {
		  $('#content').summernote();
		});
		
		$("#newsAvatar").change(function() {
			var input = document.getElementById("newsAvatar");			
			var fReader = new FileReader();
			fReader.readAsDataURL(input.files[0]);
			fReader.onloadend = function(event) {
				var img = document.getElementById("imgNewsAvatar");
				img.src = event.target.result;
			}
		});
		
</script>

<script>
	//Start page thi cai nay chay dau tien
// 	var editor ='';
	
// 	$(document).ready(function(){
// 		editor = CKEDITOR.replace('content');
// 	});	
	
// 	$('#btnAddOrUpdateNews').click(function (e) {
//         e.preventDefault();
//         var data = {};
//         var formData = $('#formSubmit').serializeArray();
//         $.each(formData, function (i, v) {
//             data[""+v.name+""] = v.value;
//         });
//         data["content"] = editor.getData();
//        /*  var id = $('#id').val();
//         if (id == "") { */
//             addNews(data);
//        /*  } else {
//             updateNew(data);
//         } */
//     });
//     function addNews(data) {
//         $.ajax({
//             url: '${pageContext.request.contextPath}/admin-news/api',
//             type: 'POST',
//             contentType: 'application/json',
//             data: JSON.stringify(data),
//             dataType: 'json',
//             success: function (result) {
//             	alert(result);
//             },
//             error: function (error) {
//             	alert("that bai");
//             }
//         });
//     }
</script>
</body>
</html>