package com.tap.model;

import java.sql.Date; // Use java.sql.Date for database interactions

public class OrderHistory {
    private int orderHistoryId;
    private int orderTableId;
    private int userId;
    private int restaurantId;
    private int orderItemId;
    private Date orderDate; // Using java.sql.Date
    private String phoneNo;
    private double totalAmount;

    // Default constructor
    public OrderHistory() {
        // Default constructor
    }

    // Parameterized constructor
    public OrderHistory(int orderHistoryId, int orderTableId, int userId, int restaurantId, int orderItemId,
                        Date orderDate, String phoneNo, double totalAmount) {
        this.orderHistoryId = orderHistoryId;
        this.orderTableId = orderTableId;
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.orderItemId = orderItemId;
        this.orderDate = orderDate;
        this.phoneNo = phoneNo;
        this.totalAmount = totalAmount;
    }

    // Getters and setters
    public int getOrderHistoryId() {
        return orderHistoryId;
    }

    public void setOrderHistoryId(int orderHistoryId) {
        this.orderHistoryId = orderHistoryId;
    }

    public int getOrderTableId() {
        return orderTableId;
    }

    public void setOrderTableId(int orderTableId) {
        this.orderTableId = orderTableId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "OrderHistory [orderHistoryId=" + orderHistoryId + ", orderTableId=" + orderTableId + ", userId="
                + userId + ", restaurantId=" + restaurantId + ", orderItemId=" + orderItemId + ", orderDate="
                + orderDate + ", phoneNo=" + phoneNo + ", totalAmount=" + totalAmount + "]";
    }
}
