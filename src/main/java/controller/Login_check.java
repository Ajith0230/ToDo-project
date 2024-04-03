package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/logincheck")
public class Login_check extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			String email= req.getParameter("email");
			String password= req.getParameter("password");
			
			Dao dao = new Dao();
			try {
				User user = dao.logincheck(email);
				if(user!=null)
				{
					//verify the password
					if(user.getUserpassword().equals(password))
					{
						//login success
						//create session ans set the data
						//get all the tasks related to user id from User
						List<Task> tasks=dao.getAllTasks(user.getUserid());
						req.setAttribute("tasks", tasks);
						
						HttpSession session =req.getSession();
						req.getSession().setAttribute("user", user);
						req.getRequestDispatcher("home.jsp").include(req, resp);
					}
					else
					{
						//password wrong
						req.setAttribute("message", "password is wrong");
						req.getRequestDispatcher("login.jsp").include(req, resp);
					}
				}
				else
				{
					//email is wrong
					req.setAttribute("message", "email id is wrong");
					req.getRequestDispatcher("login.jsp").include(req, resp);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}


