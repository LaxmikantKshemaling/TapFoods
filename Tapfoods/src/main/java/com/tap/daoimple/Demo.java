package com.tap.daoimple;

import java.util.List;

import com.tap.model.Menu;

public class Demo {

    public static void main(String[] args) {
        MenuDAOImple menuDAOImple = new MenuDAOImple();

        // Assuming the restaurant ID is 1
        int restaurantId = 1;

        // Call getAllMenusByRestaurant method and store the result
        List<Menu> menuList = menuDAOImple.getAllMenusByRestaurant(restaurantId);

        // Print the retrieved menu items
        if (menuList != null && !menuList.isEmpty()) {
            System.out.println("Retrieved Menu Items:");
            for (Menu menu : menuList) {
                System.out.println(menu);
            }
        } else {
            System.out.println("No menu items found for the specified restaurant.");
        }
    }
}
