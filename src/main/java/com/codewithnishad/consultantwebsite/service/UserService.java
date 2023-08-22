package com.codewithnishad.consultantwebsite.service;

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

	public boolean addUser(User user) {
		return getUserManager().addUser(user);
	}

	public boolean editUser(User user) {
		return getUserManager().editUser(user);
	}

	public boolean deleteUser(int userId) {
		return getUserManager().deleteUser(userId);
	}

	public User fetchSingleUser(int userId) {
		return getUserManager().fetchSingleUser(userId);
	}

	public List<User> fetchAllUsers() {
		return getUserManager().fetchAllUsers();
	}
}
