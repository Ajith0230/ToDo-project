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
margin-left: 300px;
}
#a2
{
margin-top: 10px;
margin-left: 300px;
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
margin-left: 300px;
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
button
{
background: black;
color: white;
width: 200px;
padding: 10px;
font-size: 20px;
}
button:hover
{
 background: white;
 color: black;
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
	
	<img id="a3" class="a" alt="" src="data:image/jpeg;base64,<%=image%>" height="250" width="250">
	<h3><a id="b1" href="addtask.jsp"><button>Add task</button></a><br><br><br></h3>
	
	
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
	<td><input type="text" value="<%= task.getTasktitle() %>"></td>
	<td><input type="text" value="<%= task.getTaskdescription() %>"></td>
	<td><input type="text" value="<%= task.getTaskpriority() %>"></td>
	<td><input type="text" value="<%= task.getTaskduedate() %>"></td>
	<td><input type="text" value="<%= task.getTaskstatus() %>"></td>
	
	<td><a href="edittask?task<%session.setAttribute("taskvalue", task);%>">update</a></td>
	
	<td><a href="deletetask?taskid=<%=task.getTaskid()%>"> Delete</a> </td>
	</tr>
	<% num +=1; %>
	<% } %>
	
	</table>
         
    
</body>
</html>
