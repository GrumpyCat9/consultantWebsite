package com.codewithnishad.consultantwebsite.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;

import com.codewithnishad.consultantwebsite.model.User;

import org.junit.jupiter.api.Test;
import java.sql.SQLException;
import java.util.List;

class UserServiceTest {
	
	private int addedUserId;

	@Test
	@Order(0)
	void testGetUserService() {
		UserService userService;

		userService = UserService.getUserService();

		assertNotNull(userService);
	}

	@Test
	@Order(1)
	void testAddUser_DuplicateEmail() throws ClassNotFoundException, SQLException {
		UserService userService = UserService.getUserService();

		User testUser = new User();
		testUser.setFirstName("John");
		testUser.setLastName("Doe");
		testUser.setAge(30);
		testUser.setGender("Male");
		testUser.setRole("Consultant");
		testUser.setEmail("joe@example.com");
		testUser.setPassword("password123");
		testUser.setPhoneNumber("1234567890");

		boolean result = userService.addUser(testUser);

		assertFalse(result);

	}

	@Test
	@Order(2)
	void testDeleteUser_IncorrectId() throws ClassNotFoundException, SQLException {
		UserService userService = UserService.getUserService();

		boolean result = userService.deleteUser(addedUserId);

		assertFalse(result);

	}

	@Test
	void testLoginUser() throws ClassNotFoundException, SQLException {

		UserService userService = UserService.getUserService();

		User loggedInUser = userService.loginUser("nishadsheriffdeen@gmail.com", "123456");

		assertNotNull(loggedInUser);
		assertEquals("Nishad", loggedInUser.getFirstName());
		assertEquals("Sheriffdeen", loggedInUser.getLastName());
		assertEquals(21, loggedInUser.getAge());
		assertEquals("Male", loggedInUser.getGender());
		assertEquals("Admin", loggedInUser.getRole());
		assertEquals("721582789", loggedInUser.getPhoneNumber());
	}

	@Test
	void testFetchSingleUser() throws ClassNotFoundException, SQLException {
		UserService userService = UserService.getUserService();

		User fetchedUser = userService.fetchSingleUser(21);

		assertNotNull(fetchedUser);
		assertEquals("Nishad", fetchedUser.getFirstName());
		assertEquals("Sheriffdeen", fetchedUser.getLastName());
		assertEquals(21, fetchedUser.getAge());
		assertEquals("Male", fetchedUser.getGender());
		assertEquals("Admin", fetchedUser.getRole());
		assertEquals("721582789", fetchedUser.getPhoneNumber());
	}

}
