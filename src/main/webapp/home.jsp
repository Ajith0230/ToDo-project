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
.a
{
display: inline-block;
}
div
{
position: relative;
}
#a1
{
margin-top: 50px;
margin-left: 300px;
}
#a2
{
margin-top: 50px;
margin-left: 300px;
}
#a3
{
position: absolute;
left: 50px;
top: 50px;
}
#b1,h3
{
margin-left: 150px;
display: inline-block;
}
#b2
{
margin-top:100px;
margin-left: 50px;
}
#b3
{
margin-left: 50px;
width:1400px;
text-align: center;
}
th,tr
{
padding: 20px;
}
</style>
</head>
<body>

     <%
     User user = (User)request.getSession().getAttribute("user");
     
     %>
    
	<h1 id="a1" class="a">Welcome <%= user.getUsername() %></h1><br>
	 
	<h3 id="a2" class="a"><%= user.getUsername() %><br>
	<%= user.getUsermail() %>
	</h3><br>
	
	<% String image = new String(Base64.getEncoder().encode(user.getUserimage()));%>
	
	<img id="a3" class="a" alt="" src="data:image/jpeg;base64,<%=image%>" height="250" width="250">
	<h3><a id="b1" href="addtask.jsp">add task</a><br><br><br></h3>
	
	
	<%List<Task> tasks = (List)request.getAttribute("tasks"); %>
	
	
	<h3 id="b2">Tasks</h3>
	
	<table id="b3" border="5px">
	
	<tr>
	<th>id</th>
	<th>title</th>
	<th>description</th>
	<th>priority</th>
	<th>due date</th>
	<th>status</th>
	</tr>
	<% for (Task task: tasks) {%>
	<tr>
	<td><%= task.getTaskid() %></td>
	<td><%= task.getTasktitle() %></td>
	<td><%= task.getTaskdescription() %></td>
	<td><%= task.getTaskpriority() %></td>
	<td><%= task.getTaskduedate() %></td>
	<td><%= task.getTaskstatus() %></td>
	</tr>
	
	<% } %>
		
	</table>
</body>
</html>
