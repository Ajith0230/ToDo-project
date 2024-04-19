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
section
{
border:1px solid white;
border-radius: 10px;
width:400px;
height:500px;
margin-left: 150px;
margin-top: 150px;
backdrop-filter: blur(10px);
background-image: url(https://33.media.tumblr.com/ef8cb843f59ef5d012d77ec4718b35ab/tumblr_nvnvatCOHU1sk6vtao1_400.gif);
background-repeat: no-repeat;
backdrop-filter: blur(100px);
background-size: cover;
}
form
{
text-align: center;
margin-top: 100px;
color:white;
font-size: 20px;
}
input
{
width: 250px;
height: 25px;
background: transparent;
box-shadow: 5px 5px 5px white;
border:2px solid white;
color: white;
}
#butt
{
color:white;
width:100px;
border-radius: 10px;
background-color: black;
}
#butt:hover
{
color:black;
background-color: white;
box-shadow: -5px -5px 5px orangered;
}
h1
{
width:400px;
text-align: center;
color:white;
}
#icon
{
color: white;

}
</style>
<script src="https://kit.fontawesome.com/ca63879256.js" crossorigin="anonymous"></script>
<script type="text/javascript">
window.onload = function() {
    let id = document.getElementById("res");
    id.style.display = "none";
    let res = id.textContent.trim();
    console.log(res);
    if (res === "null" || res === "") {
        id.style.display = "none";
    } else {
        id.style.display = "block";
    }
}

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
	<h1>Log-In</h1>
	<hr>
	<form action="logincheck" method="post">
	Email :<br><input type="text" name="email"><br><br><br>
	Password :<br>
	 <input type="password" name="password"><i id="icon" class="fa-solid fa-eye"></i><br><br><br>
	<input id="butt" type="submit">
	</form>
	<h1 id = "res"><%=request.getAttribute("message") %></h1>
</section>
</body>
</html>
