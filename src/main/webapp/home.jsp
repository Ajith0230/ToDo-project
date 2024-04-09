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

background-image: url("https://i.pinimg.com/736x/73/84/eb/7384eb896c87f613f4d36bba5a24108b.jpg");
background-repeat: no-repeat;
background-size: cover;
}
.a
{
display: inline-block;
color: white;
 filter: drop-shadow(10px 10px 2px black);
}
div
{
position: relative;
}
#a1
{
margin-top: 90px;
margin-left: 350px;
}
#a2
{
margin-top: 10px;
margin-left: 350px;
}
#a3
{
position: absolute;
left: 50px;
top: 50px;
box-shadow: 5px 5px 10px black;
border-radius: 100%;
}

#b1
{
margin-left: 350px;
display: inline-block;
}
#b2
{
color: white;
font-size: 20px;
margin-left: 50px;
}
#b3
{
margin-left: 115px;
width:1300px;
text-align: center;

}
th,tr
{
padding: 20px;
}
#img1
{
 position: relative;
}
table
{
background-image: url("https://st5.depositphotos.com/35914836/63547/i/450/depositphotos_635479512-stock-photo-brown-wooden-wall-texture-background.jpg" );
background-repeat: no-repeat;
background-size: cover;
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
}
input
{
background-color: transparent;
color: white;
}
a
{
color: red;
}
td:hover
{
background-color: black;
}
th:hover
{
background-color: black;
}
#selectimg
{
margin-left: 300px;
}
#newimg {
    display: none;
}
#newimg:target {
    display: block;
    margin-left: 300px;
}
</style>
</head>
<body>

     <%
     User user = (User)request.getSession().getAttribute("user");
     %>
    
	<h1 id="a1" class="a">Welcome <%= user.getUsername() %></h1><br>
	 
	<h2 id="a2" class="a"><%= user.getUsername() %><br>
	<%= user.getUsermail() %>
	</h2><br>
	
	<% String image = new String(Base64.getEncoder().encode(user.getUserimage()));%>
	
	 <button id="selectimg" onclick="location.href='#newimg'"><i class="fa-solid fa-pen"></i></button>
	
	
	 <form id="newimg" action="imgchange" method="post" enctype="multipart/form-data">
	 	<%request.setAttribute("userid", user.getUserid()); %>
        <input type="file" name="newimg">
        <input type="submit">
    </form>

	<img id="a3" class="a" alt="" src="data:image/jpeg;base64,<%=image%>" height="250" width="250">
	<h3><a id="b1" href="addtask.jsp"><button id="butt">Add task</button></a><br><br><br></h3>
	
	
	<%List<Task> tasks = (List)request.getAttribute("tasks"); %>
	
	
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

         
    <script src="https://kit.fontawesome.com/ca63879256.js" crossorigin="anonymous"></script>
</body>
</html>
