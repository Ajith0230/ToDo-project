package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.Task;
import dao.Dao;
import dto.User;

@WebServlet("/addtask")
public class AddTask extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Dao dao = new Dao();
		String tasktitle = req.getParameter("tasktitle");
		String taskdescription = req.getParameter("taskdescription");
		String taskduedate = req.getParameter("taskduedate");
		String taskpriority = dao.taskPriority(taskduedate);
		
		
		User user =(User) req.getSession().getAttribute("user");
		int userid = user.getUserid();
		
		
		try {
		Task task = new Task(dao.getTaskId() ,tasktitle, taskdescription, taskpriority, taskduedate, "pending", userid);
		
			int res = dao.createtask(task);
			
			if(res>0)
			{
				HttpSession session = req.getSession();
				User u = (User)session.getAttribute("user");
				req.setAttribute("tasks", dao.getAllTasks(u.getUserid()));
//				RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
//				dispatcher.include(req, resp);
				resp.sendRedirect("home.jsp");
			}
			else
			{
				resp.getWriter().print("failed");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
