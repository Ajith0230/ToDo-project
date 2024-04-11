package dto;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@WebListener
public class MyServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo-db", "root", "root");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM task");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                LocalDate dueDate = LocalDate.parse(rs.getString(5));
                String priority;
                LocalDate currentDate = LocalDate.now();
                int result  = (int) ChronoUnit.DAYS.between(currentDate, dueDate);
                System.out.println(result);
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
                updateStmt.close(); // Close the prepared statement
            }

            rs.close(); // Close the result set
            pst.close(); // Close the prepared statement
            con.close(); // Close the connection
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup code if needed
    }
}
