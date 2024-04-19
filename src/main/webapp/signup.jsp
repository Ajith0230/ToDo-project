
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body
        {
           background-image: url("https://cdn.pixabay.com/photo/2019/04/29/14/32/make-the-day-great-4166221_1280.jpg");
            background-repeat: no-repeat;
            background-size: 1500px 750px;
        }
        form
        {
            color: white;
            font-size: 15px;
            font-family: 'Courier New', Courier, monospace;
            display: grid;
        }
  		h1
  		{
  		margin-left: 80px;
  		color: white;
  		}
        input
        {
        	border: 3px solid black;
            background: transparent;
            color: black;
            box-shadow: 5px 5px 10px white;
            display: inline-block;
            height: 15px;
            width: 250px;
            margin-left: 80px;
            color: white;
            border-color: white;
        }
        .a
        {
        width: 250px;
        text-align: center;
      	font-size: 20px;
      	 font-weight: bolder;
        }
        #sub:hover
        {
        background-color: white;
        color: black;
        }
        #sub
        {
        background-color: black;
        }
        section
        {
		border:1px solid white;
		border-radius: 10px;
		width:400px;
		height:550px;
		margin-left: 150px;
		margin-top: 115px;
		backdrop-filter: blur(10px);
		background-image: url(https://33.media.tumblr.com/ef8cb843f59ef5d012d77ec4718b35ab/tumblr_nvnvatCOHU1sk6vtao1_400.gif);
		background-repeat: no-repeat;
		backdrop-filter: blur(100px);
		background-size: cover;
		}
		#icon
		{
		position:absolute;
		top:335px;
		margin-left: 350px;
		}

    </style>
    <script src="https://kit.fontawesome.com/ca63879256.js" crossorigin="anonymous"></script>
   <script type="text/javascript">
   function addEventListenerToIcon() {
	    let icon = document.getElementById("icon");
	    let i = 0;
	    if (icon) {
	        icon.addEventListener("click", () => {
	            let newpass = document.querySelector('input[name="password"]');
	            if (i == 0) {
	                newpass.type = "text";
	                i++;
	            } else {
	                newpass.type = "password";
	                i--;
	            }
	        });
	    }
	}

	window.onload = function() {
	    addEventListenerToIcon();
	};
   </script>
</head>
<body>
<section>
	<h1>Enter the detail to sign-up</h1>
	<form action="save" method="post" enctype="multipart/form-data">
	<label class="a" for="name">name: </label>
	<input  type="text" name="name"><br><br>
	<label class="a" for="email">email: </label>
	<input type="email" name="email"><br><br>
	<label class="a" for="contact">contact: </label>
	<input type="number" name="contact"><br><br>
	<label class="a" for="password">password: </label>
	<input type="password" name="password"><i id="icon" class="fa-solid fa-eye"></i><br><br>
	<label class="a" for="image">image: </label>
	<input style="height: 20px;" type="file" name="image"><br><br>
	<input id="sub" style="height: 25px;" type="submit">
	</form>
	</section>
</body>
</html>
