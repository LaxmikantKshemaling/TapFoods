package com.tap.daoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderItemDAO;
import com.tap.model.OrderItem;
import com.tap.util.DBConnectionUtil;

public class OrderItemDAOImple implements OrderItemDAO {

    @Override
    public void addOrderItem(OrderItem orderItem) {
        String sql = "INSERT INTO `orderitem` (`orderTableId`, `Quantity`, `Price`, `name`, `totalPrice`) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItem.getOrderTableId());
            pstmt.setInt(2, orderItem.getQuantity());
            pstmt.setDouble(3, orderItem.getPrice());
            pstmt.setString(4, orderItem.getName());
            pstmt.setDouble(5, orderItem.getTotalPrice());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        String sql = "SELECT * FROM `orderitem` WHERE `orderItemId` = ?";

        OrderItem orderItem = null;

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItemId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    orderItem = extractOrderItemFromResultSet(res);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    @Override
    public void updateOrderItem(OrderItem orderItem) {
        String sql = "UPDATE `orderitem` SET `orderTableId` = ?, `Quantity` = ?, `Price` = ?, `name` = ?, `totalPrice` = ? WHERE `orderItemId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItem.getOrderTableId());
            pstmt.setInt(2, orderItem.getQuantity());
            pstmt.setDouble(3, orderItem.getPrice());
            pstmt.setString(4, orderItem.getName());
            pstmt.setDouble(5, orderItem.getTotalPrice());
            pstmt.setInt(6, orderItem.getOrderItemId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        String sql = "DELETE FROM `orderitem` WHERE `orderItemId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItemId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItem> getAllOrderItemsByOrderTable(int orderTableId) {
        String sql = "SELECT * FROM orderitem WHERE orderTableId = ?";
        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderTableId);
            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    OrderItem orderItem = extractOrderItemFromResultSet(res);
                    orderItems.add(orderItem);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    @Override
    public List<OrderItem> getAllOrderItems() {
        List<OrderItem> orderItemList = new ArrayList<>();
        String query = "SELECT * FROM orderitem";  // Correct table name

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                OrderItem orderItem = new OrderItem();
                orderItem.setOrderItemId(resultSet.getInt("orderItemId"));
                orderItem.setOrderTableId(resultSet.getInt("orderTableId"));
                orderItem.setQuantity(resultSet.getInt("quantity"));
                orderItem.setPrice(resultSet.getDouble("price"));
                orderItem.setName(resultSet.getString("name"));
                orderItem.setTotalPrice(resultSet.getDouble("totalPrice"));

                orderItemList.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();  // Handle the exception as needed
        }
        return orderItemList;
    }

    private OrderItem extractOrderItemFromResultSet(ResultSet res) throws SQLException {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderItemId(res.getInt("orderItemId"));  // Ensure column names match
        orderItem.setOrderTableId(res.getInt("orderTableId"));
        orderItem.setQuantity(res.getInt("quantity"));
        orderItem.setPrice(res.getDouble("price"));
        orderItem.setName(res.getString("name"));
        orderItem.setTotalPrice(res.getDouble("totalPrice")); // Ensure this is correct

        return orderItem;
    }
}