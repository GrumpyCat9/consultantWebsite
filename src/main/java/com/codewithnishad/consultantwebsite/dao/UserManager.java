package com.codewithnishad.consultantwebsite.dao;

import java.sql.SQLException;
import java.util.List;

import com.codewithnishad.consultantwebsite.model.User;

public interface UserManager {
	
	public boolean addUser(User user) throws SQLException, ClassNotFoundException;
	
	public User loginUser(String email, String password) throws SQLException, ClassNotFoundException;
	
	public boolean editUser(User user) throws SQLException, ClassNotFoundException;
	
	public boolean deleteUser(int userId) throws SQLException, ClassNotFoundException;
	
	public User fetchSingleUser(int userId) throws SQLException, ClassNotFoundException;
	
	public List<User> fetchAllUsers() throws SQLException, ClassNotFoundException;
	
	public List<User> fetchAllConsultants() throws SQLException, ClassNotFoundException;

}
