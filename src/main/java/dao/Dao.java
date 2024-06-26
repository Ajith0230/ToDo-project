package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

import dto.Task;
import dto.User;

public class Dao {
	
	User user = new User();
	public static Connection connection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");//not necessary
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo-db","root","root");
		return con;
	}
	
	public static int saveUser(User user) throws ClassNotFoundException, SQLException
	{
		Connection con = connection();
		
		PreparedStatement pst = con.prepareStatement("insert into userinfo values(?,?,?,?,?,?)");
		Dao dao = new Dao();
		pst.setInt(1, dao.getUserId());
		pst.setString(2, user.getUsername());
		pst.setString(3, user.getUsermail());
		pst.setLong(4, user.getUsercontact());
		pst.setString(5, user.getUserpassword());
		pst.setBlob(6,  new SerialBlob(user.getUserimage()));
		
		int result = pst.executeUpdate();
		return result;
	}
	
	public User logincheck(String email) throws ClassNotFoundException, SQLException
	{
		Connection con = connection();
		
		PreparedStatement pst = con.prepareStatement("select * from userinfo where useremail=?");
		pst.setString(1, email);
		ResultSet result = pst.executeQuery();
		if(result.next())
		{
			User user = new User();
			user.setUserid(result.getInt(1));
			user.setUsername(result.getString(2));
			user.setUsermail(result.getString(3));
			user.setUsercontact(result.getLong(4));
			user.setUserpassword(result.getString(5));
			//convert blog image to byte[].
			Blob imageBlob = result.getBlob(6);
			byte[] image = imageBlob.getBytes(1, (int)imageBlob.length());
			
			user.setUserimage(image);
			
			return user;
		}
		else
		{
		return null;
		}
		
	}
	
	public int createtask(Task task) throws ClassNotFoundException, SQLException
	{
		
		Connection con = connection();
		Dao dao = new Dao();
		PreparedStatement pst = con.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		pst.setInt(1, dao.getTaskId());
		pst.setString(2, task.getTasktitle());
		pst.setString(3, task.getTaskdescription());
		pst.setString(4, task.getTaskpriority());
		pst.setString(5, task.getTaskduedate());
		pst.setString(6, task.getTaskstatus());
		pst.setInt(7, task.getUserid());
		
		int res = pst.executeUpdate();
		return res;
		
	}
	
	public List<Task> getAllTasks(int userid) throws ClassNotFoundException, SQLException
	{
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("select * from task where userid = ?");
		pst.setInt(1, userid);
		ResultSet rs = pst.executeQuery();
		List<Task> tasks = new ArrayList<Task>();
		
		while( rs.next())
		{
			Task task = new Task(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getInt(7));
			tasks.add(task);
		}
		return tasks;
	}
	
	public int deleting(int taskid) throws SQLException, ClassNotFoundException
	{
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("delete from task where taskid ="+ taskid);
		
		int res = pst.executeUpdate();
		return res;
		
	}
	public int getTaskId() throws ClassNotFoundException, SQLException {
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("SELECT max(taskid) from task");
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	}

	
	public int getUserId() throws ClassNotFoundException, SQLException {
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("SELECT max(userid) from user");
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			int id = rs.getInt(1);
			return id+1;
		}
		else {
			return 1;
		}
	} 
	public void editTask(int id,String title, String description, String priority, String duedate, String status) throws ClassNotFoundException, SQLException
	{
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("update task Set tasktitle=?,taskdescription=?,taskpriority=?,taskduedate=?,taskstatus=? where taskid=?");
		pst.setString(1,title);
		pst.setString(2, description);
		pst.setString(3, priority);
		pst.setString(4, duedate);
		pst.setString(5, status);
		pst.setInt(6,id);
		pst.executeUpdate();
	}

	public int imgupdate(byte[] newimg,int userid) throws SerialException, SQLException, ClassNotFoundException
	{
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("update userinfo set userimg=? where userid=?");
	
		pst.setBlob(1, new SerialBlob(newimg));
		pst.setInt(2, userid);
		
		return pst.executeUpdate();
	}
	public Task findtaskById(int taskid) throws ClassNotFoundException, SQLException {
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("SELECT * from task where taskid = ?");
		pst.setInt(1, taskid);
		ResultSet rs = pst.executeQuery();
		rs.next();
		Task task = new Task(taskid, rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
		return task;
	}

	public int namechange(int userid,String newname) throws ClassNotFoundException, SQLException {
		
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("Update userinfo set username=? where userid=?");
		pst.setString(1, newname);
		pst.setInt(2, userid);
		return pst.executeUpdate();
	}
	
	public String taskPriority(String duedate)
	{
		
		LocalDate dueDate = LocalDate.parse(duedate);
        String priority;
        LocalDate currentDate = LocalDate.now();
        int result  = (int) ChronoUnit.DAYS.between(currentDate, dueDate);
       
        if (result > 5) {
            priority = "low";
        } else if (result >= 3) {
            priority = "medium";
        } else {	
            priority = "high";
        }
		return priority;
		
	}
}
