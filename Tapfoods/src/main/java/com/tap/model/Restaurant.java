package com.tap.model;

import com.tap.daoimple.RestaurantDAOImple; // Importing RestaurantDAOImple class

public class Restaurant {
    
    // Declaring private instance variables
    private int restauranId; // Restaurant ID
    private String restaurantName; // Restaurant name
    private String imagePath; // Path to the restaurant image
    private double rating; // Rating of the restaurant
    private int deliveryTime; // Delivery time of the restaurant
    private String cuisineType; // Type of cuisine offered by the restaurant
    private String Address; // Address of the restaurant
    private boolean isActive; // Status of the restaurant (active or inactive)
    private int restaurantAdmin; // Admin ID of the restaurant
    
    // Default constructor
    public Restaurant() {
        // TODO Auto-generated constructor stub
    }

    // Parameterized constructor with all fields
    public Restaurant(int restauranId, String restaurantName, String imagePath, double rating, int deliveryTime,
            String cuisineType, String address, boolean isActive, int restaurantAdmin) {
        super();
        this.restauranId = restauranId;
        this.restaurantName = restaurantName;
        this.imagePath = imagePath;
        this.rating = rating;
        this.deliveryTime = deliveryTime;
        this.cuisineType = cuisineType;
        Address = address;
        this.isActive = isActive;
        this.restaurantAdmin = restaurantAdmin;
    }

    // Getter and setter methods for private variables
    public int getRestauranId() {
        return restauranId;
    }

    public void setRestauranId(int restauranId) {
        this.restauranId = restauranId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(int deliveryTime2) {
        this.deliveryTime = deliveryTime2;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean isActive) {
        this.isActive = isActive;
    }

    public int getRestaurantAdmin() {
        return restaurantAdmin;
    }

    public void setRestaurantAdmin(int restaurantAdmin) {
        this.restaurantAdmin = restaurantAdmin;
    }

    // Overriding toString method to display restaurant information
    @Override
    public String toString() {
        return "Restaurant [restauranId=" + restauranId + ", restaurantName=" + restaurantName + ", imagePath=" + imagePath + ", rating="
                + rating + ", deliveryTime=" + deliveryTime + ", cuisineType=" + cuisineType + ", Address=" + Address
                + ", isActive=" + isActive + ", restaurantAdmin=" + restaurantAdmin + "]";
    }
}
