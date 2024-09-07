package com.tap.dao;

import java.util.List;

import com.tap.model.Restaurant;


public interface RestaurantDAO {
	
	void addRestaurant(Restaurant restaurant);
	Restaurant getRestaurant(int restaurantId);
	boolean updateRestaurant(Restaurant restaurant);
	void deleteRestaurant(int restaurantId);
	List<Restaurant> getAllRestaurants();
	List<Restaurant> searchRestaurantsByrestaurantName(String restaurantName);

}
