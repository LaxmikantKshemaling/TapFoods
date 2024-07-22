package com.tap.model;

public class Menu {
    // Declaring private instance variables
    private int menuId; // ID of the menu item
    private String name; // Name of the menu item
    private double price; // Price of the menu item
    private String description; // Description of the menu item
    private String imagePath; // Path to the image of the menu item
    private boolean isAvailable; // Availability status of the menu item
    private int restaurantId; // ID of the restaurant to which the menu item belongs
    private double rating; // Rating of the menu item
    
    // Default constructor
    public Menu() {
        // TODO Auto-generated constructor stub
    }

    // Parameterized constructor with all fields
    public Menu(int menuId, String name, double price, String description, String imagePath, boolean isAvailable,
            int restaurantId, double rating) {
        super();
        this.menuId = menuId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.imagePath = imagePath;
        this.isAvailable = isAvailable;
        this.restaurantId = restaurantId;
        this.rating = rating;
    }

    // Getter and setter methods for private variables
    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    // Overriding toString method to display menu item information
    @Override
    public String toString() {
        return "Menu [menuId=" + menuId + ", name=" + name + ", price=" + price + ", description=" + description
                + ", imagePath=" + imagePath + ", isAvailable=" + isAvailable + ", restaurantId=" + restaurantId
                + ", rating=" + rating + "]";
    }
}
