package com.tap.model;

public class OrderItem {
    // Declaring private instance variables
    private int orderItemId; // ID of the order item
    private int orderTableId; // ID of the order table to which the item belongs
    private int menuId; // ID of the menu item ordered
    private int Quantity; // Quantity of the menu item ordered
    private double Price; // Price per unit of the menu item
    private String name; // Name of the menu item
    private double totalPrice; // Total price for the order item
    
    // Default constructor
    public OrderItem() {
        // TODO Auto-generated constructor stub
    }

    // Parameterized constructor with all fields
    public OrderItem(int orderItemId, int orderTableId, int menuId, int quantity, double price, String name,
            double totalPrice) {
        super();
        this.orderItemId = orderItemId;
        this.orderTableId = orderTableId;
        this.menuId = menuId;
        Quantity = quantity;
        Price = price;
        this.name = name;
        this.totalPrice = totalPrice;
    }

    // Getter and setter methods for private variables
    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderTableId() {
        return orderTableId;
    }

    public void setOrderTableId(int orderTableId) {
        this.orderTableId = orderTableId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int quantity) {
        Quantity = quantity;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double price) {
        Price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    // Overriding toString method to display order item information
    @Override
    public String toString() {
        return "OrderItem [orderItemId=" + orderItemId + ", orderTableId=" + orderTableId + ", menuId=" + menuId
                + ", Quantity=" + Quantity + ", Price=" + Price + ", name=" + name + ", totalPrice=" + totalPrice + "]";
    }
}
