package com.tap.model;

public class OrderHistory {
    // Declaring private instance variables
    private int orderHistoryId; // ID of the order history entry
    private int orderTableId; // ID of the order table associated with the history entry
    private int userId; // ID of the user associated with the history entry
    
    // Default constructor
    public OrderHistory() {
        // TODO Auto-generated constructor stub
    }

    // Parameterized constructor with all fields
    public OrderHistory(int orderHistoryId, int orderTableId, int userId) {
        super();
        this.orderHistoryId = orderHistoryId;
        this.orderTableId = orderTableId;
        this.userId = userId;
    }

    // Getter and setter methods for private variables
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

    // Overriding toString method to display order history information
    @Override
    public String toString() {
        return "OrderHistory [orderHistoryId=" + orderHistoryId + ", orderTableId=" + orderTableId + ", userId="
                + userId + "]";
    }
}
