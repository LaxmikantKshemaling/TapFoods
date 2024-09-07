package com.tap.dao;

import com.tap.model.Menu;
import java.util.List;
import java.util.Map;

public interface MenuDAO {
    void addMenu(Menu menu);
    Menu getMenu(int menuId);
    void updateMenu(Menu menu);
    void deleteMenu(int menuId);
    List<Menu> getAllMenusByRestaurant(int restaurantId); // This method gets menus by restaurant ID
    List<Menu> searchMenuByName(String name);
    List<Menu> searchMenuByRating(double rating);
    List<Menu> searchMenuByPrice(double minPrice, Double maxPrice);
    List<Menu> getMenusByRestaurantName(String restaurantName); // Renamed to avoid confusion with overloading
    List<Menu> getAllMenusByCategory(String category);
   
}
