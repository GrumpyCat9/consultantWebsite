package com.codewithnishad.consultantwebsite.dao;

import java.util.List;

import com.codewithnishad.consultantwebsite.model.User;

public interface UserManager {
	
	public boolean addUser(User user);
	
	public boolean editUser(User user);
	
	public boolean deleteUser(int userId);
	
	public User fetchSingleUser(int userId);
	
	public List<User> fetchAllUsers();

}
