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
        String sql = "INSERT INTO `orderitem` (`orderItemId`, `orderTableId`, `menuId`, `Quantity`, `Price`, `name`, `totalPrice`) VALUES (?,?,?,?,?,?,?)";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItem.getOrderItemId());
            pstmt.setInt(2, orderItem.getOrderTableId());
            pstmt.setInt(3, orderItem.getMenuId());
            pstmt.setInt(4, orderItem.getQuantity());
            pstmt.setDouble(5, orderItem.getPrice());
            pstmt.setString(6, orderItem.getName());
            pstmt.setDouble(7, orderItem.getTotalPrice());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
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
        String sql = "UPDATE `orderitem` SET `orderTableId` = ?, `menuId` = ?, `Quantity` = ?, `Price` = ?, `name` = ?, `totalPrice` = ? WHERE `orderItemId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderItem.getOrderTableId());
            pstmt.setInt(2, orderItem.getMenuId());
            pstmt.setInt(3, orderItem.getQuantity());
            pstmt.setDouble(4, orderItem.getPrice());
            pstmt.setString(5, orderItem.getName());
            pstmt.setDouble(6, orderItem.getTotalPrice());
            pstmt.setInt(7, orderItem.getOrderItemId());

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
        String sql = "SELECT * FROM `orderitem` WHERE `orderTableId` = ?";

        List<OrderItem> orderItems = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet res = pstmt.executeQuery()) {

            while (res.next()) {
                OrderItem orderItem = extractOrderItemFromResultSet(res);
                orderItems.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItems;
    }

    private OrderItem extractOrderItemFromResultSet(ResultSet res) throws SQLException {
        OrderItem orderItem = new OrderItem();

        orderItem.setOrderItemId(res.getInt("OrderItemId"));
        orderItem.setOrderTableId(res.getInt("OrderTableId"));
        orderItem.setMenuId(res.getInt("MenuId"));
        orderItem.setQuantity(res.getInt("Quantity"));
        orderItem.setPrice(res.getDouble("Price"));
        orderItem.setName(res.getString("Name"));
        orderItem.setTotalPrice(res.getDouble("Rating"));

        return orderItem;
    }
}