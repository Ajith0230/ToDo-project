package controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/edittask")
public class EditTask extends HttpServlet{

		
		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			
			HttpSession session = req.getSession();
			
			Dao dao = new Dao();
			
			try {
				dao.editTask(Integer.parseInt(req.getParameter("id")),req.getParameter("title"), req.getParameter("description"), req.getParameter("priority"), req.getParameter("duedate"), req.getParameter("status"));
	
				
				User user = (User)session.getAttribute("user");
				
				req.setAttribute("tasks", dao.getAllTasks(user.getUserid()));
				
				req.getRequestDispatcher("home.jsp").include(req, resp);
				
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
