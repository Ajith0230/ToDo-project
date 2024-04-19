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
background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20210922/pngtree-abstract-nature-green-and-sunny-defocused-light-background-image_906682.png");
 background-repeat: no-repeat;
 background-size: 1500px 750px;
}
  form
        {
            color: white;
            font-size: 15px;
            font-family: 'Courier New', Courier, monospace;
            
        }
 	.b
        {
        	border: 3px solid black;
            background: transparent;
            color: black;
            box-shadow: 5px 5px 10px white;
            display: inline-block;
            height: 15px;
            width: 250px;
       
            color: white;
        }
        .a
        {
        width: 250px;
        text-align: center;
      	margin-top:20px;
      	font-size: 20px;
      	 font-weight: bolder;
        }
        .rad
        {
        margin-left: 50px;
        }
          h1
        {
            font-size: 25px;
            color: white;
            
            font-family: 'Times New Roman', Times, serif;
            box-shadow: 5px 5px 10px white;
            display: inline-block;
            font-weight: bolder;
        }
        #butt
        {
        height: 25px;
        border-radius: 10px;
        }
        #butt:hover
        {
        background-color: white;
        color: black;
        }
        section
        {
		border:1px solid white;
		border-radius: 10px;
		width:400px;
		height:550px;
		margin-left: 550px;
		margin-top: 115px;
		backdrop-filter: blur(10px);
		background-image: url(https://33.media.tumblr.com/ef8cb843f59ef5d012d77ec4718b35ab/tumblr_nvnvatCOHU1sk6vtao1_400.gif);
		background-repeat: no-repeat;
		backdrop-filter: blur(100px);
		background-size: cover;
		}
</style>

</head>
<body>
<section>
	<h1>Enter the details to add the task</h1>
	<form action="addtask" method="post">
	
	<label class="a" for="tasktitle">task title: </label>
	<input class="b" type="text" name="tasktitle" required="required"><br><br>
	<label class="a" for="taskdescription">task description: </label>
	<input class="b" type="text" name="taskdescription"><br><br>
	<label class="a" for="duedate">due date: </label>
	<input class="b" type="date" name="taskduedate" required="required"><br><br>
	<input id="butt" class="b" type="submit">
	</form>
</section>
</body>
</html>
