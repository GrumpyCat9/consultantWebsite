package com.codewithnishad.consultantwebsite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.codewithnishad.consultantwebsite.model.User;

public class UserManagerImpl implements UserManager {

	public UserManagerImpl() {

	}

	private Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");

		String url = "jdbc:mysql://127.0.0.1:3306/job_consultant_db";
		String userName = "root";
		String password = "dXsAIgMek0aEFdt";

		Connection connection = DriverManager.getConnection(url, userName, password);

		return connection;
	}

	@Override
	public boolean addUser(User user) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();

		String query = "INSERT INTO users(firstName, lastName, age,gender,role,email,password,phoneNumber) VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = connection.prepareStatement(query);

		ps.setString(1, user.getFirstName());
		ps.setString(2, user.getLastName());
		ps.setInt(3, user.getAge());
		ps.setString(4, user.getGender());
		ps.setString(5, user.getRole());
		ps.setString(6, user.getEmail());
		ps.setString(7, user.getPassword());
		ps.setString(8, user.getPhoneNumber());

		boolean result = false;

		if (ps.executeUpdate() > 0)
			result = true;

		ps.close();
		connection.close();

		return result;

	}

	@Override
	public boolean editUser(User user) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();

		String query = "UPDATE users SET firstName = ?, lastName = ?, age = ?, gender = ?, role = ?, email = ?, password = ?, phoneNumber = ? WHERE userID = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setString(1, user.getFirstName());
		ps.setString(2, user.getLastName());
		ps.setInt(3, user.getAge());
		ps.setString(4, user.getGender());
		ps.setString(5, user.getRole());
		ps.setString(6, user.getEmail());
		ps.setString(7, user.getPassword());
		ps.setString(8, user.getPhoneNumber());
		ps.setInt(9, user.getUserId());

		boolean result = false;

		if (ps.executeUpdate() > 0)
			result = true;

		ps.close();
		connection.close();

		return result;
	}

	@Override
	public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();

		String query = "DELETE FROM users WHERE userId = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, userId);

		boolean result = false;

		if (ps.executeUpdate() > 0)
			result = true;

		ps.close();
		connection.close();

		return result;
	}

	@Override
	public User fetchSingleUser(int userId) throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();

		String query = "SELECT * FROM users WHERE userId = ?";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setInt(1, userId);

		ResultSet rs = ps.executeQuery();

		User user = new User();

		while (rs.next()) {
			user.setUserId(rs.getInt("userId"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
			user.setAge(rs.getInt("age"));
			user.setGender(rs.getString("gender"));
			user.setRole(rs.getString("role"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setPhoneNumber(rs.getString("phoneNumber"));
		}

		ps.close();
		connection.close();

		return user;
	}

	@Override
	public List<User> fetchAllUsers() throws SQLException, ClassNotFoundException {

		Connection connection = getConnection();

		String query = "SELECT * FROM users";

		Statement st = connection.createStatement();

		List<User> userList = new ArrayList<User>();

		ResultSet rs = st.executeQuery(query);

		while (rs.next()) {

			User user = new User();

			user.setUserId(rs.getInt("userId"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
			user.setAge(rs.getInt("age"));
			user.setGender(rs.getString("gender"));
			user.setRole(rs.getString("role"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setPhoneNumber(rs.getString("phoneNumber"));

			userList.add(user);
		}

		st.close();
		connection.close();

		return userList;

	}

}
