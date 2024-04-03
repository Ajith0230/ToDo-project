<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="addtask" method="post">
	
	task id:<input type="number" name="taskid" required="required"><br><br>
	task title:<input type="text" name="tasktitle" required="required"><br><br>
	task description:<input type="text" name="taskdescription"><br><br>
	choose priority:<br>
	<input type="radio" name="taskpriority" value="low">low 
	<input type="radio" name="taskpriority" value="medium"> medium 
	<input type="radio" name="taskpriority" value="high"> High <br><br>
	Due date:<input type="date" name="taskduedate" required="required"><br><br>
	<input type="submit">
	</form>

</body>
</html>