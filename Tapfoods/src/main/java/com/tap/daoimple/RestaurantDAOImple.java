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
        String sql = "INSERT INTO `restaurant` (`restaurantName`, `imagePath`, `rating`, `deliveryTime`, `cuisineType`, `Address`, `isActive`, `restaurantAdmin`) VALUES (?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, restaurant.getRestaurantName());
            pstmt.setString(2, restaurant.getImagePath());
            pstmt.setDouble(3, restaurant.getRating());
            pstmt.setInt(4, restaurant.getDeliveryTime());
            pstmt.setString(5, restaurant.getCuisineType());
            pstmt.setString(6, restaurant.getAddress());
            pstmt.setBoolean(7, restaurant.isActive());
            pstmt.setInt(8, restaurant.getRestaurantAdmin());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with proper logging
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
            e.printStackTrace(); // Replace with proper logging
        }

        return restaurant;
    }

    @Override
    public boolean updateRestaurant(Restaurant restaurant) {
        String sql = "UPDATE `restaurant` SET `restaurantName` = ?, `imagePath` = ?, `rating` = ?, `deliveryTime` = ?, `cuisineType` = ?, `Address` = ?, `isActive` = ?, `restaurantAdmin` = ? WHERE `restaurantId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, restaurant.getRestaurantName());
            pstmt.setString(2, restaurant.getImagePath());
            pstmt.setDouble(3, restaurant.getRating());
            pstmt.setInt(4, restaurant.getDeliveryTime());
            pstmt.setString(5, restaurant.getCuisineType());
            pstmt.setString(6, restaurant.getAddress());
            pstmt.setBoolean(7, restaurant.isActive());
            pstmt.setInt(8, restaurant.getRestaurantAdmin());
            pstmt.setInt(9, restaurant.getRestauranId());
            

            int affectedRows = pstmt.executeUpdate();

            return affectedRows > 0; // Return true if update was successful

        } catch (SQLException e) {
            e.printStackTrace(); // Replace with proper logging
            return false; // Return false if update failed
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
            e.printStackTrace(); // Replace with proper logging
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
            e.printStackTrace(); // Replace with proper logging
        }

        return restaurants;
    }

    @Override
    public List<Restaurant> searchRestaurantsByrestaurantName(String restaurantName) {
        String sql = "SELECT * FROM `restaurant` WHERE `restaurantName` LIKE ?";
        List<Restaurant> restaurants = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%" + restaurantName + "%"); // Use '%' to match any characters before and after the search term
            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Restaurant restaurant = extractRestaurantFromResultSet(res);
                    restaurants.add(restaurant);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Replace with proper logging
        }

        return restaurants;
    }

    private Restaurant extractRestaurantFromResultSet(ResultSet res) throws SQLException {
        Restaurant restaurant = new Restaurant();

        restaurant.setRestauranId(res.getInt("restaurantId"));
        restaurant.setRestaurantName(res.getString("restaurantName"));
        restaurant.setImagePath(res.getString("imagePath"));
        restaurant.setRating(res.getDouble("rating"));
        restaurant.setDeliveryTime(res.getInt("deliveryTime"));
        restaurant.setCuisineType(res.getString("cuisineType"));
        restaurant.setAddress(res.getString("Address"));
        restaurant.setActive(res.getBoolean("isActive"));
        restaurant.setRestaurantAdmin(res.getInt("restaurantAdmin"));

        return restaurant;
    }
}
