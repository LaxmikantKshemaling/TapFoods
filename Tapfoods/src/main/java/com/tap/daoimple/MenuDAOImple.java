package com.tap.daoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tap.dao.MenuDAO;
import com.tap.model.Menu;
import com.tap.util.DBConnectionUtil;

public class MenuDAOImple implements MenuDAO {

    @Override
    public void addMenu(Menu menu) {
        String sql = "INSERT INTO `menu` (`menuId`, `name`, `price`, `description`, `menuImagePath`, `isAvailable`, `restaurantId`, `rating`) VALUES (?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, menu.getMenuId());
            pstmt.setString(2, menu.getName());
            pstmt.setDouble(3, menu.getPrice());
            pstmt.setString(4, menu.getDescription());
            pstmt.setString(5, menu.getMenuimagePath());
            pstmt.setBoolean(6, menu.isAvailable());
            pstmt.setInt(7, menu.getRestaurantId());
            pstmt.setDouble(8, menu.getRating());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {
        String sql = "SELECT * FROM `menu` WHERE `menuId` = ?";

        Menu menu = null;

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, menuId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    menu = extractMenuFromResultSet(res);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public boolean updateMenu(Menu menu) {
        String sql = "UPDATE `menu` SET `name` = ?, `price` = ?, `description` = ?, `menuImagePath` = ?, `isAvailable` = ?, `restaurantId` = ?, `rating` = ? WHERE `menuId` = ?";
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, menu.getName());
            pstmt.setDouble(2, menu.getPrice());
            pstmt.setString(3, menu.getDescription());
            pstmt.setString(4, menu.getMenuimagePath());
            pstmt.setBoolean(5, menu.isAvailable());
            pstmt.setInt(6, menu.getRestaurantId());
            pstmt.setDouble(7, menu.getRating());
            pstmt.setInt(8, menu.getMenuId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return true;
    }

    @Override
    public void deleteMenu(int menuId) {
        String sql = "DELETE FROM `menu` WHERE `menuId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, menuId);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {
        String sql = "SELECT * FROM `menu` WHERE `restaurantId` = ?";
        List<Menu> menuList = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, restaurantId);

            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }


    @Override
    public List<Menu> getMenusByRestaurantName(String restaurantName) {  // Renamed method to avoid overload confusion
        String sql = "SELECT * FROM `menu` WHERE `restaurantId` IN (SELECT `restaurantId` FROM `restaurant` WHERE `name` = ?)";

        List<Menu> menuList = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, restaurantName);

            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> searchMenuByName(String name) {
        String sql = "SELECT * FROM `menu` WHERE `name` LIKE ?";

        List<Menu> menuList = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%" + name + "%");

            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> searchMenuByRating(double rating) {
        String sql = "SELECT * FROM `menu` WHERE `rating` >= ?";

        List<Menu> menuList = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setDouble(1, rating);

            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> searchMenuByPrice(double minPrice, Double maxPrice) {
        String sql = (maxPrice != null) ? 
            "SELECT * FROM `menu` WHERE `price` BETWEEN ? AND ?" :
            "SELECT * FROM `menu` WHERE `price` >= ?";

        List<Menu> menuList = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            if (maxPrice != null) {
                pstmt.setDouble(1, minPrice);
                pstmt.setDouble(2, maxPrice);
            } else {
                pstmt.setDouble(1, minPrice);
            }

            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public List<Menu> getAllMenusByCategory(String category) {
        String sql = "SELECT * FROM menu WHERE category = ?";
        List<Menu> menuList = new ArrayList<>();
        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, category);
            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    Menu menu = extractMenuFromResultSet(res);
                    menuList.add(menu);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuList;
    }

    
    private Menu extractMenuFromResultSet(ResultSet res) throws SQLException {
        Menu menu = new Menu();
        menu.setMenuId(res.getInt("menuId"));
        menu.setName(res.getString("name"));
        menu.setPrice(res.getDouble("price"));
        menu.setDescription(res.getString("description"));
        menu.setMenuimagePath(res.getString("menuImagePath"));
        menu.setAvailable(res.getBoolean("isAvailable"));
        menu.setRestaurantId(res.getInt("restaurantId"));
        menu.setRating(res.getDouble("rating"));
        return menu;
    }
}
