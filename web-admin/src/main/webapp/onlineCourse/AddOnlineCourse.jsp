<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.online_course.model.*"%>
<!DOCTYPE html>
<%
OnlineCourseVO onlinecourseVO = (OnlineCourseVO) request.getAttribute("onlinecourseVO");
%>



<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>
    <link rel="stylesheet" href="css/normalize.css">
    <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="css/main.css">

	
<style>
        *,
        *:before,
        *:after {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            list-style: none;
        }
        
        .picture_list img {
        	width:300px;
            display: block;
            margin: 20px 40px;
        }

        body {
            font-family: 'Nunito', sans-serif;
            color: #384047;
        }

        form {
            max-width: 300px;
            margin: 10px auto;
            padding: 10px 20px;
            background: #FFFCEC;
            border-radius: 8px;
        }

        h1 {
            margin: 0 0 30px 0;
            text-align: center;
        }

		.input{
			border-radius: 50px;
		}
		

        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="datetime"],
        input[type="email"],
        input[type="number"],
        input[type="search"],
        input[type="tel"],
        input[type="time"],
        input[type="url"],
        textarea,
        select {
            background: rgba(255, 255, 255, 0.1);
            border: none;
            font-size: 16px;
            height: auto;
            margin: 0;
            outline: 0;
            padding: 15px;
            width: 100%;
            background-color: white;
            color: #8a97a0;
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.03) inset;
            margin-bottom: 30px;
        }

        input[type="radio"],
        input[type="checkbox"] {
            margin: 0 4px 8px 0;
        }
        
        textarea {
        	border-radius: 10px;
        }

        select {
            padding: 6px;
            height: 32px;
            border-radius: 2px;
        }

        button {
            padding: 19px 39px 18px 39px;
            color: #FFF;
            background-color: #4bc970;
            font-size: 18px;
            text-align: center;
            font-style: normal;
            border-radius: 5px;
            width: 100%;
            border: 1px solid #3ac162;
            border-width: 1px 1px 3px;
            box-shadow: 0 -1px 0 rgba(255, 255, 255, 0.1) inset;
            margin-bottom: 10px;
        }

        fieldset {
            margin-bottom: 30px;
            border: none;
        }

        legend {
            font-size: 1.4em;
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        label.light {
            font-weight: 300;
            display: inline;
        }

        .number {
            background-color: #d4a373;
            color: #fff;
            height: 30px;
            width: 30px;
            display: inline-block;
            font-size: 0.8em;
            margin-right: 4px;
            line-height: 30px;
            text-align: center;
            text-shadow: 0 1px 0 rgba(255, 255, 255, 0.2);
            border-radius: 100%;
        }

		.submit-input{
			border-radius: 10px; 
			width: 400px; 
			height: 100px; 
			background: #d4a373;
			border: 0 solid; 
			color: white; 
			font-weight: 700; 
			font-size: 1rem;
			margin: auto 5%;
            box-shadow: 5px 7px 5px #333333;
            position: relative;
		}
		
		.submit-input:hover{
			transition: .5s;
			top: 5px;
			left: 5px;
		}
		
		
        @media screen and (min-width: 480px) {

            form {
                max-width: 480px;
            }

        }
        ::placeholder {
                color: #6d6875;
}
   
</style>


</head>

<body>
	<%@ include file="../navbar.file" %>

		 <FORM METHOD="post" ACTION="onlineCourse" name="form1" enctype="multipart/form-data">
	
        <h1>??????????????????</h1>
        
        <div>
		<%-- ???????????? --%>
		<c:if test="${not empty errorMsgs}">
		<font style="color:red">?????????????????????:</font><br>
		<c:forEach var="message" items="${errorMsgs}">
			<span style="color:red">${message}</span><br>
		</c:forEach>
		</c:if>
	</div>	

        <fieldset>
            <legend style="position: relative; top: 10%;"><span class="number">1</span>??????:</legend>
            <label for="name"></label>
            <input class="input" type="text" id="name" name="courseName" placeholder="??????????????????"value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseName()%>" />

            <label for="price"></label>
            <input class="input" type="text" id="price" name="coursePrice" placeholder="??????????????????"value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCoursePrice()%>" />

            <label for="hr"></label>
            <input class="input" type="text" id="hr" name="courseHr" placeholder="1??????30??????" value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseHr()%>" />

            <label for="teacher"></label>
            <input class="input" type="text" id="teacher" name="courseTeacher" placeholder="??????????????????" value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseTeacher()%>" />

            <label for="people"></label>
            <input class="input" type="text" id="people" name="commentPeople" placeholder="????????????" value="0" hidden />

            <label for="score"></label>
            <input class="input" type="text" id="score" name="commentScore" placeholder="????????????" value="0"  hidden />
            
            <label for="videostring"></label>
            <input class="input" type="text" id="videostring" name="courseVideo" placeholder="??????????????????" value="<%=(onlinecourseVO == null) ? "" : onlinecourseVO.getCourseVideo()%>" />
        </fieldset>

        <fieldset>
            <legend style="position: relative; top: 10%;"><span class="number">2</span>??????????????????:</legend>
            <label for="courseInfo" ></label>
            <textarea id="courseInfo" name="courseInfo" placeholder="??????"></textarea>
        </fieldset>

	<div class="photoupload" style="width:100%; margin: 30px auto">
        <tr>		
		<td><input type="file" name="photo" id="the_file" style="width:50%;margin-left:20%"></td>
		<span>????????????</span>
		 <ul class="picture_list"></ul>
		</tr>
	</div>
	
	

	<div class="status" style="width:50%;margin:0 auto;">	
		<td>????????????</td>
	    <td><input type="radio" name="courseStatus" value="0"
		${(onlinecourseVO == null || onlinecourseVO.courseStatus==0)? 'checked':'' } />
	    ?????? <input type="radio" name="courseStatus" value="1"
		${(onlinecourseVO.courseStatus==1)? 'checked':'' } />??????</td>
		</tr>
	</div>	
	
	<div style="width:100%;margin: 5px auto">

	<br>
		<input type="hidden" name="action" value="insert">
		<input class="submit-input" type="submit" value="????????????">
					
	</div>
	
	 <ul class="picture_list"></ul>

    <script>
        window.addEventListener("load", function () {

            var the_file_element = document.getElementById("the_file");
            the_file_element.addEventListener("change", function (e) {


                let my_ul = document.getElementsByClassName("picture_list")[0];
                my_ul.innerHTML = "";
                // ?????????
                // console.log(this.file[0]);

                for (let i = 0; i < this.files.length; i++) {
                    let reader = new FileReader(); // ???????????????????????????

                    reader.readAsDataURL(this.files[i]); // ????????????

                    // ???????????????????????????
                    reader.addEventListener("load", function () {

                        // ???????????? reader.result ?????????????????????????????? Base64 ????????????
                        // console.log(reader.result);
                        // ... other code ...
                        let li_str = '<li><img src="' + reader.result + '" class="preview"></li>'
                        // let li_str = `<li></li>`
                        let ul_el = document.getElementsByClassName("picture_list")[0];

                        ul_el.insertAdjacentHTML("beforeend", li_str);

                    });
                };


            });


        });
    </script>


        
    </form>

				


				

					
				
</body>


</html>