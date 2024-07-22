package com.tap.daoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.util.DBConnectionUtil;

public class RestaurantDAOImple implements RestaurantDAO {

	@Override
	public void addRestaurant(Restaurant restaurant) {

		String sql = "INSERT INTO `restaurant` (`restaurantId`, `name`, `imagePath`, `rating`, `deliveryTime`, `cuisineType`, `Address`, `isActive`, `restaurantAdmin`) VALUES (?,?,?,?,?,?,?,?,?)";

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, restaurant.getRestauranId());
			pstmt.setString(2, restaurant.getName());
			pstmt.setString(3, restaurant.getImagePath());
			pstmt.setDouble(4, restaurant.getRating());
			pstmt.setInt(5, restaurant.getDeliveryTime());
			pstmt.setString(6, restaurant.getCuisineType());
			pstmt.setString(7, restaurant.getAddress());
			pstmt.setBoolean(8, restaurant.isActive());
			pstmt.setInt(9, restaurant.getRestaurantAdmin());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		String sql = "SELECT * FROM `restaurant` WHERE `restaurantId` = ?";

		Restaurant restaurant = null;

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, restaurantId);
			try (ResultSet res = pstmt.executeQuery()) {
				if (res.next()) {
					restaurant = extractRestaurantFromResultSet(res);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}

		return restaurant;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {

		String sql = "UPDATE `restaurant` SET `name` = ?, `imagePath` = ?, `rating` = ?, `deliveryTime` = ?, `cuisineType` = ?, `Address` = ?, `isActive` = ?, `restaurantAdmin` = ? WHERE `restaurantId` = ?";

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getImagePath());
			pstmt.setDouble(3, restaurant.getRating());
			pstmt.setInt(4, restaurant.getDeliveryTime());
			pstmt.setString(5, restaurant.getCuisineType());
			pstmt.setString(6, restaurant.getAddress());
			pstmt.setBoolean(7, restaurant.isActive());
			pstmt.setInt(8, restaurant.getRestaurantAdmin());
			pstmt.setInt(9, restaurant.getRestauranId());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		String sql = "DELETE FROM `restaurant` WHERE `restaurantId` = ?";

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql)) {

			pstmt.setInt(1, restaurantId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}
	}

	@Override
	public List<Restaurant> getAllRestaurants() {

		String sql = "SELECT * FROM `restaurant`";

		List<Restaurant> restaurants = new ArrayList<>();

		try (Connection connection = DBConnectionUtil.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(sql);
				ResultSet res = pstmt.executeQuery()) {

			while (res.next()) {
				Restaurant restaurant = extractRestaurantFromResultSet(res);
				restaurants.add(restaurant);
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Replace with more robust error handling
		}

		return restaurants;
	}

	private Restaurant extractRestaurantFromResultSet(ResultSet res) throws SQLException {
	    Restaurant restaurant = new Restaurant();

	    restaurant.setRestauranId(res.getInt("restaurantId"));
	    restaurant.setName(res.getString("name"));
	    restaurant.setImagePath(res.getString("imagePath"));
	    restaurant.setRating(res.getDouble("rating"));
	    restaurant.setDeliveryTime(res.getInt("deliveryTime"));
	    restaurant.setCuisineType(res.getString("cuisineType"));
	    restaurant.setAddress(res.getString("Address"));
	    restaurant.setActive(res.getBoolean("isActive"));
	    restaurant.setRestaurantAdmin(res.getInt("RestaurantAdmin"));

	    return restaurant;
	}
}