package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.User;

@WebServlet("/namechange")
public class NameChange extends HttpServlet {

	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String newname = req.getParameter("newname");
			int userid = Integer.parseInt(req.getParameter("userid"));
			Dao dao  = new Dao();
			try {
				int res = dao.namechange( userid, newname);
				
				if(res>0)
				{
					HttpSession session = req.getSession();
					User user = (User)session.getAttribute("user");
					user.setUsername(newname);
					req.setAttribute("tasks", dao.getAllTasks(user.getUserid()));
					
					req.getRequestDispatcher("home.jsp").include(req, resp);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
}
