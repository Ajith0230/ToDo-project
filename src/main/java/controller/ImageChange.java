package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao;
import dto.Task;
import dto.User;

@WebServlet("/imgchange")
@MultipartConfig
public class ImageChange extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part imagePart = req.getPart("newimg");
        byte[] newImage = imagePart.getInputStream().readAllBytes();
        int userId = Integer.parseInt(req.getParameter("userid"));
        
        Dao dao = new Dao();

        try {
            int res = dao.imgupdate(newImage, userId);

            if (res > 0) {
            	
            	HttpSession session = req.getSession();
				User user = (User)session.getAttribute("user");
				user.setUserimage(newImage);
				req.setAttribute("tasks", dao.getAllTasks(user.getUserid()));
				
				req.getRequestDispatcher("home.jsp").include(req, resp);
             
            } else {

                resp.sendRedirect("error.jsp"); 
            }
        } catch (ClassNotFoundException | SQLException e) {
            
            e.printStackTrace();

            resp.sendRedirect("error.jsp");
        }
    }
}
