package com.tap.daoimple;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.tap.dao.UserDAO;
import com.tap.model.User;
import com.tap.util.DBConnectionUtil;

public class UserDAOImple implements UserDAO {

	@Override
	public void addUser(User user) {

		String sql = "INSERT INTO user (userId, userName, email, phoneNo, Address,Password,role) VALUES (?,?,?,?,?,?,?)";

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, user.getUserId());
			pstmt.setString(2, user.getUserName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhoneNo());
			pstmt.setString(5, user.getAddress());
			pstmt.setString(6, user.getPassword());
			pstmt.setString(7,user.getRole());
			

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override
	public User getUser(int userId) {
		String sql = "SELECT * FROM user WHERE userId = ?";

		User user = null;

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			try (ResultSet res = pstmt.executeQuery()) {
				if (res.next()) {
					user = extractUserFromResultSet(res);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}

		return user;
	}

	@Override
	public void updateUser(User user) {

		String sql = "UPDATE user SET userName = ?, email = ?, phoneNo = ?, Address = ?, password = ? ,role = ? WHERE userID = ?";
		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhoneNo());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getRole());
			pstmt.setInt(7, user.getUserId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override

	public void deleteUser(int userId) {

		String sql = "DELETE FROM user WHERE userId = ?";

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, userId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override
	public List<User> getAllUsers() {

		String sql = "SELECT * FROM user";

		List<User> users = new ArrayList<>();

		try (Connection connection = DBConnectionUtil.getConnection();
				Statement pstmt = connection.createStatement();
				ResultSet res = pstmt.executeQuery(sql)) {

			while (res.next()) {
				User user = extractUserFromResultSet(res);
				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}

		return users;
	}

	
	
	private User extractUserFromResultSet(ResultSet res) throws SQLException {

		User user = new User();
		
		

		user.setUserId(res.getInt("UserID"));
		user.setUserName(res.getString("UserName"));
		user.setEmail(res.getString("Email"));
		user.setPhoneNo(res.getString("PhoneNo"));
		user.setAddress(res.getString("Address"));
		user.setPassword(res.getString("Password"));
		user.setRole(res.getString("Role"));
		

		return user;
	}

	@Override
	public void addUserSignup(User user) {
	    String sql = "INSERT INTO user ( userName, email, phoneNo, Password) VALUES (?,?,?,?)";

	    try (Connection connection = DBConnectionUtil.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(sql)) {

	        pstmt.setString(1, user.getUserName());
	        pstmt.setString(2, user.getEmail());
	        pstmt.setString(3, user.getPhoneNo());
	        
	        // Encrypt the password before storing it
	        String encryptedPassword = encription(user.getPassword());
	        pstmt.setString(4, encryptedPassword);

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace(); // Replace with more robust error handling
	    }
	}

	@Override
	public User getUserByUsernameAndPassword(String username, String password) {
	    String sql = "SELECT * FROM user WHERE userName = ? AND password = ?";
	    User user = null;
	    
	    try (Connection connection = DBConnectionUtil.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(sql)) {

	        pstmt.setString(1, username);
	        // Encrypt the entered password before comparing
	        String encryptedPassword = encription(password);
	        pstmt.setString(2, encryptedPassword);

	        try (ResultSet res = pstmt.executeQuery()) {
	            if (res.next()) {
	                user = extractUserFromResultSet(res);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // Replace with more robust error handling
	    }
	    
	    return user;
	}

	// Method to encrypt the password
	public static String encription(String s) {
	    String t="";
	    for(int i=0;i<s.length();i++) {
	        char c=s.charAt(i);
	        c=(char)(c+1);
	        t=t+c;
	    }
	    
	    return t;
	}

	// Method to decrypt the password
	public static String decription(String s) {
	    String t="";
	    for(int i=0;i<s.length();i++) {
	        char c=s.charAt(i);
	        c=(char)(c-1);
	        t=t+c;
	    }
	    
	    return t;
	}
}