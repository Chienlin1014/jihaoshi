<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
 <head>
 <title>Upload_Test.jsp</title>
 <script src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
 </head>
<body>

<h2 id="errorMessage">${errorMessage}</h2> <!-- 見 GlobalExceptionHandler.java(第84行) 或 UploadTest_SpringMVC.java(第38行) -->

<h3>Spring MVC 檔案上傳</h3>
<form action="uploadSpringMVC.do" method="POST" enctype="multipart/form-data">
   <input type="text" name="name" value="peter1吳永志"><p>
   <input id ="upFiles" name="upFiles" type="file" onclick="previewImage()" multiple="multiple" />
   <input type="submit" value="上傳" />
   <input type="hidden" name="requestURL" value="upload/upload_Test">
   <div id="blob_holder" >
       <p>圖片預覽</p>
   </div>
</form>

<!-- JavaScript part -->
<script type="text/javascript">
//清除提示信息
function hideContent(d) {
     document.getElementById(d).style.display = "none";
}

//照片上傳-預覽用
var filereader_support = typeof FileReader != 'undefined';
if (!filereader_support) {
	alert("No FileReader support");
}
acceptedTypes = {
		'image/png' : true,
		'image/jpeg' : true,
		'image/gif' : true
};
function previewImage() {
	var upfile1 = document.getElementById("upFiles");
	upfile1.addEventListener("change", function(event) {
		var files = event.target.files || event.dataTransfer.files;
		for (var i = 0; i < files.length; i++) {
			previewfile(files[i])
		}
	}, false);
}
function previewfile(file) {
	if (filereader_support === true && acceptedTypes[file.type] === true) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var image = new Image();
			image.src = event.target.result;
			image.width = 100;
			image.height = 75;
			image.border = 2;
			if (blob_holder.hasChildNodes()) {
				blob_holder.removeChild(blob_holder.childNodes[0]);
			}
			blob_holder.appendChild(image);
		};
		reader.readAsDataURL(file);
		document.getElementById('submit').disabled = false;
	} else {
		blob_holder.innerHTML = "<div  style='text-align: left;'>" + "● filename: " + file.name
				+ "<br>" + "● ContentTyp: " + file.type
				+ "<br>" + "● size: " + file.size + "bytes"
				+ "<br>" + "● 上傳ContentType限制: <b> <font color=red>image/png、image/jpeg、image/gif </font></b></div>";
		document.getElementById('submit').disabled = true;
	}
}
</script>

<body>