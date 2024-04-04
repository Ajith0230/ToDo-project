package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

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
		
		pst.setInt(1,user.getUserid());
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
		PreparedStatement pst = con.prepareStatement("insert into task values(?,?,?,?,?,?,?)");
		pst.setInt(1, task.getTaskid());
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
	public void editTask(Task taskvalue) throws ClassNotFoundException, SQLException
	{
		Connection con = connection();
		PreparedStatement pst = con.prepareStatement("update task Set tasktitle= ?,taskdescription= ?,taskpriority= ?,taskduedate= ?,taskstatus=? where taskid=?");
		pst.setString(1, taskvalue.getTasktitle());
		pst.setString(2, taskvalue.getTaskdescription());
		pst.setString(3, taskvalue.getTaskpriority());
		pst.setString(4, taskvalue.getTaskduedate());
		pst.setString(5, taskvalue.getTaskstatus());
		pst.setInt(6,taskvalue.getTaskid());

	}
}
