package com.tap.dao;

import com.tap.model.Menu;
import java.util.List;

public interface MenuDAO {
    void addMenu(Menu menu); // Add a new menu item
    Menu getMenu(int menuId); // Get a single menu item by ID
    boolean updateMenu(Menu menu); // Update a menu item
    void deleteMenu(int menuId); // Delete a menu item by ID
    List<Menu> getAllMenusByRestaurant(int restaurantId); // Get menus by restaurant ID
    List<Menu> searchMenuByName(String name); // Search menu by name
    List<Menu> searchMenuByRating(double rating); // Search menu by rating
    List<Menu> searchMenuByPrice(double minPrice, Double maxPrice); // Search menu by price
    List<Menu> getMenusByRestaurantName(String restaurantName); // Get menus by restaurant name
    List<Menu> getAllMenusByCategory(String category); // Get menus by category
}
