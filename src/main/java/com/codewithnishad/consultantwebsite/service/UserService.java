package com.codewithnishad.consultantwebsite.service;

import java.sql.SQLException;
import java.util.List;

import com.codewithnishad.consultantwebsite.dao.UserManager;
import com.codewithnishad.consultantwebsite.dao.UserManagerImpl;
import com.codewithnishad.consultantwebsite.model.User;

public class UserService {

	private static UserService userServiceObj;

	private UserService() {

	}

	public synchronized static UserService getUserService() {
		if (userServiceObj == null) {
			userServiceObj = new UserService();
		}
		return userServiceObj;
	}

	private UserManager getUserManager() {
		return new UserManagerImpl();
	}

	public boolean addUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().addUser(user);
	}

	public User loginUser(String email, String password) throws ClassNotFoundException, SQLException {
		return getUserManager().loginUser(email, password);
	}

	public boolean editUser(User user) throws ClassNotFoundException, SQLException {
		return getUserManager().editUser(user);
	}

	public boolean deleteUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().deleteUser(userId);
	}

	public User fetchSingleUser(int userId) throws ClassNotFoundException, SQLException {
		return getUserManager().fetchSingleUser(userId);
	}

	public List<User> fetchAllUsers() throws ClassNotFoundException, SQLException {
		return getUserManager().fetchAllUsers();
	}
	
	public List<User> fetchAllConsultants() throws ClassNotFoundException, SQLException {
		return getUserManager().fetchAllConsultants();
	}
}
