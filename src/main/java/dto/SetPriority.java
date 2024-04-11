package dto;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.protocol.Resultset;

public class SetPriority extends HttpServlet  {

	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			
			User user = new User();
			Task task = new Task();
			try {
			    Class.forName("com.mysql.cj.jdbc.Driver");

			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo-db", "root", "root");

			    PreparedStatement selectStmt = con.prepareStatement("SELECT * FROM task");
			    ResultSet rs = selectStmt.executeQuery();

			    while (rs.next()) {
			        LocalDate dueDate = LocalDate.parse(rs.getString(5));
			        String priority;
			        LocalDate currentDate = LocalDate.now();
			        int result = currentDate.compareTo(dueDate);

			        if (result > 5) {
			            priority = "low";
			        } else if (result > 3) {
			            priority = "medium";
			        } else {
			            priority = "high";
			        }

			        PreparedStatement updateStmt = con.prepareStatement("UPDATE task SET taskpriority = ? WHERE taskid = ?");
			        updateStmt.setString(1, priority);
			        updateStmt.setInt(2, rs.getInt(1)); // Assuming taskid is the first column
			        updateStmt.executeUpdate();
			    }

			} catch (ClassNotFoundException | SQLException e) {
			    e.printStackTrace();
			}
		}		
}
