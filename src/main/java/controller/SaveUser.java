package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;
import dto.User;

@WebServlet("/save")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class SaveUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("name");
		String mail = req.getParameter("email");
		long contact = Long.parseLong(req.getParameter("contact"));
		String password = req.getParameter("password");
		
		Part imagepart = req.getPart("image");
		byte[] image = imagepart.getInputStream().readAllBytes();
		
		Dao dao = new Dao();
		try {
		User user = new User(dao.getUserId(), name, mail, contact, password, image);
			int res = dao.saveUser(user);
			if(res > 0)
			{
				resp.sendRedirect("login.jsp");
			}
			else
			{
				resp.sendRedirect("signup.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
}
