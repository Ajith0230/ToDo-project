<%@page import="dao.Dao"%>
<%@page import="java.util.*"%>
<%@ page import="controller.Login_check" %>
<%@ page import="dto.*" %>

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
.a
{
display: inline-block;
color: black;
 filter: drop-shadow(10px 10px 2px black);
}
div
{
position: relative;
}
#a1
{
margin-top: 20px;
margin-left: 450px;

}
#a2
{
margin-top: 10px;
margin-left: 450px;
display: inline-block;
}
#a3
{
position: absolute;
left: 120px;
top: 20px;
box-shadow: 5px 5px 10px black;
border-radius: 100%;
transition: 3s;
}
#a3:hover
{
border-radius: 0px;
transform: translatex(900px);

}
#a4
{
margin-top: 0px;
margin-left: 450px;
}
#b1
{
margin-left: 350px;
display: inline-block;
}
#b2
{
color: black;
font-size: 20px;
margin-left: 120px;
}
#b3
{
margin-left: 115px;
width:1300px;
text-align: center;

}
th,tr
{
background-color:black;
padding: 20px;
}
#img1
{
 position: relative;
}
table
{
backdrop-filter: blur(10px);
color: white;
}
#butt
{
background: black;
color: white;
width: 200px;
padding: 10px;
font-size: 20px;
}
#butt:hover
{
 background: white;
 color: black;
 cursor: pointer;
}
input
{
background-color: transparent;
color: white;
}
a
{
color: red;
text-decoration: none;
}
td:hover
{
background-color: orange;
}
th:hover
{
background-color: orange;
}
#selectimg
{
margin-left: 380px;
height: 20px;
width: 30px;
background: white;
}
#newimg {
    display: none;
}
#newimg:target {
    display: block;
    margin-left: 380px;
}
#newname {
    display: none;
}
#newname:target {
    display: block;
    
}
#logoff
{
margin-left: 1420px;
color:black;
font-size: 30px;
border: 1px double black;
padding: 10px;
box-shadow: 10px 10px 5px black;
background-color: red;
}
input
{
text-align: center;
}
.sidebar {
    
    top: 0;
    left: 0;
    height: 100%;
    width: 250px;
    background-color: #333;
    padding-top: 20px; /* Adjust as needed */
    color: white;
    position: absolute;
    overflow: scroll;
 	display: none;
}

.sidebar a {
	
    display: block;
    padding: 10px 20px;
    color: white;
    text-decoration: none;
}

.sidebar a:hover {
    background-color: #555;
}

.main-content {
    padding: 20px;
    position: absolute;
}
#sidebar
{
position: absolute;
}
#sbbtn
{
margin-top: 50px;
margin-left: 20px;
}

</style>

</head>
<body>
 	<%
     User user = (User)request.getSession().getAttribute("user");
     %>
	<% String image = new String(Base64.getEncoder().encode(user.getUserimage()));%>
	<button id="sbbtn" onclick="toggle()"><i class="fa-solid fa-bars"></i></button>
    <div class="sidebar" id="sidebar">
        <img src="data:image/jpeg;base64,<%=image%>" alt="Sidebar Image" style="width: 100px; height: 100px; border-radius: 50%; margin-left: 10px">
        <a href="#"><i class="fa-regular fa-user"></i> Profile</a>
        <a href="#"><i class="fa-solid fa-gear"></i> Setting</a>
        <!-- Add more sidebar links as needed -->
    </div>
    <div class="main-content">
	<h1 id="a1" class="a">Welcome <%= user.getUsername() %></h1><br>
	 
	<h2 id="a2" class="a"><%= user.getUsername()%>
	<button  onclick="location.href='#newname'"><i class="fa-solid fa-pen"></i></button>
		 <form id="newname" action="namechange" method="post">
	 	<input style="display: none;" type="number" name="userid" value="<%=user.getUserid()%>">
        <input type="text" name="newname">
        <input type="submit">
    </form>
</h2>    <br>
	
	<h2 id="a4" class="a"><%= user.getUsermail() %></h2><br>
	
	 <button id="selectimg" onclick="location.href='#newimg'"><i class="fa-solid fa-pen"></i></button>
	 <form id="newimg" action="imgchange" method="post" enctype="multipart/form-data">
	 	<input style="display: none;" type="number" name="userid" value="<%=user.getUserid()%>">
        <input type="file" name="newimg">
        <input type="submit">
    </form>

	<img id="a3" class="a" alt="" src="data:image/jpeg;base64,<%=image%>" height="250" width="250">
	<h3><a id="b1" href="addtask.jsp"><button id="butt">Add task</button></a><br><br><br></h3>
	
	
	<%Dao dao=new Dao();
	List<Task> tasks = dao.getAllTasks(user.getUserid()); %>
	
	
	<h3 id="b2">Tasks</h3>
	
	<table id="b3" border="5px">
	
	<tr>
	<th>s.no</th>
	<th>title</th>
	<th>description</th>
	<th>priority</th>
	<th>due date</th>
	<th>status</th>
	<th>Edit/Update</th>
	<th>Delete</th>
	</tr>
	<% int num = 1; %>
	<% for (Task task: tasks) {%>
	<tr>
	<td><%= num %></td>
	<form action="edittask" method="get">
	<td><input type="text" value="<%= task.getTasktitle() %>" name="title"></td>
	<td><input type="text" value="<%= task.getTaskdescription() %>" name="description"></td>
	<td><input type="text" value="<%= task.getTaskpriority() %>" name="priority"></td>
	<td><input type="date" value="<%= task.getTaskduedate() %>" name="duedate"></td>
	<td><input type="text" value="<%= task.getTaskstatus() %>" name="status"></td>
	<input style="display: none;" value="<%=task.getTaskid()%>" name ="id" >
	<td><input type="submit">to update</td>
	</form>
	<td><a href="deletetask?taskid=<%=task.getTaskid()%>"> Delete</a> </td>
	</tr>
	<% num +=1; %>
	<% } %>
	
	</table>

      <a id="logoff" href="logoff"><i class="fa-solid fa-right-from-bracket"></i></a>   
    </div>
   <script src="https://kit.fontawesome.com/ca63879256.js" crossorigin="anonymous"></script>
<script>
    function toggle() {
        let sidebar = document.getElementById("sidebar");
        let sbbtn = document.getElementById("sbbtn");
        if (sidebar.style.display === "none" || sidebar.style.display === "") {
            sidebar.style.display = "block";
            sbbtn.style.marginLeft = "260px";
        } else {
            sidebar.style.display = "none";
            sbbtn.style.marginLeft = "20px";
        }
    }
</script>
    
    
</body>
</html>
     
