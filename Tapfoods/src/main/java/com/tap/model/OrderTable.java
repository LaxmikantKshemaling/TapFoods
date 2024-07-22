package com.tap.model;

import java.util.Date; // Importing Date class for representing dates

public class OrderTable {
    // Declaring private instance variables
    private int orderTableId; // Order table ID
    private int restaurantId; // ID of the restaurant where the order was placed
    private int userId; // ID of the user who placed the order
    private double totalAmount; // Total amount of the order
    private String modeOfPayment; // Mode of payment for the order
    private String status; // Status of the order (e.g., pending, delivered)
    private Date orderDate; // Timestamp representing the date and time when the order was placed
    
    // Default constructor
    public OrderTable() {
        // Default constructor
    }

    // Parameterized constructor with all fields
    public OrderTable(int orderTableId, int restaurantId, int userId, double totalAmount, String modeOfPayment,
            String status, Date orderDate) {
        super();
        this.orderTableId = orderTableId;
        this.restaurantId = restaurantId;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.modeOfPayment = modeOfPayment;
        this.status = status;
        this.orderDate = orderDate;
    }

    // Getter and setter methods for private variables
    public int getOrderTableId() {
        return orderTableId;
    }

    public void setOrderTableId(int orderTableId) {
        this.orderTableId = orderTableId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getModeOfPayment() {
        return modeOfPayment;
    }

    public void setModeOfPayment(String modeOfPayment) {
        this.modeOfPayment = modeOfPayment;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    // Overriding toString method to display order information
    @Override
    public String toString() {
        return "OrderTable [orderTableId=" + orderTableId + ", restaurantId=" + restaurantId + ", userId=" + userId
                + ", totalAmount=" + totalAmount + ", modeOfPayment=" + modeOfPayment + ", status=" + status
                + ", orderDate=" + orderDate + "]";
    }
}
