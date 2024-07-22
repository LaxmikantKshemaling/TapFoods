package com.tap.model;

import java.security.MessageDigest; // Importing MessageDigest class for password encryption

import java.security.NoSuchAlgorithmException; // Importing NoSuchAlgorithmException for handling encryption errors

import java.sql.Date; // Importing Date class for representing dates in SQL

public class User {
    
    // Declaring private instance variables
    private int userId; // User ID
    private String userName; // User's username
    private String email; // User's email address
    private String phoneNo; // User's phone number
    private String Address; // User's address
    private String password; // User's password (encrypted)
    private String role; // User's role (e.g., admin, user)

    // Default constructor
    public User() {
        // TODO Auto-generated constructor stub
    }

    // Parameterized constructor with all fields
    public User(int userId, String userName, String email, String phoneNo, String address, String password,
            String role) {
        super();
        this.userId = userId;
        this.userName = userName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.Address = address;
        this.password = password; // Updated: Encrypted password field
        this.role = role;
    }

    // Parameterized constructor without userId and address
    public User(String userName, String email, String phoneNo, String password) {
        super();
        this.userName = userName;
        this.email = email;
        this.phoneNo = phoneNo;
        this.password = password; // Updated: Encrypted password field
    }

    // Parameterized constructor with only username and password
    public User(String userName, String password) {
        super();
        this.userName = userName;
        this.password = password; // Updated: Encrypted password field
    }

    // Getter and setter methods for private variables

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
