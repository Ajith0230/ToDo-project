package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Dao;
import dto.User;

@WebServlet("/imgchange")
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
                // Update user's session with new image data
                HttpSession session = req.getSession();
                User user = (User) session.getAttribute("user");
                user.setUserimage(newImage);
                session.setAttribute("user", user);

                // Redirect to home.jsp
                resp.sendRedirect("home.jsp");
            } else {
                // Handle the case when the image update fails
                // Provide appropriate feedback to the user
                resp.sendRedirect("error.jsp"); // For example, redirect to an error page
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Log the exception
            e.printStackTrace();

            // Redirect to an error page
            resp.sendRedirect("error.jsp");
        }
    }
}
