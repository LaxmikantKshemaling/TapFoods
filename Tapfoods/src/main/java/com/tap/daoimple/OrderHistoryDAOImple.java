package com.tap.daoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderHistoryDAO;
import com.tap.model.OrderHistory;
import com.tap.util.DBConnectionUtil;

public class OrderHistoryDAOImple implements OrderHistoryDAO {

    @Override
    public void addOrderHistory(OrderHistory orderHistory) {
        String sql = "INSERT INTO `orderhistory` (`orderHistoryId`, `orderTableId`, `userId`) VALUES (?,?,?)";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
   
            pstmt.setInt(1, orderHistory.getOrderHistoryId());
            pstmt.setInt(2, orderHistory.getOrderTableId());
            pstmt.setInt(3, orderHistory.getUserId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderHistory getOrderHistory(int orderHistoryId) {
        String sql = "SELECT * FROM `orderhistory` WHERE `orderHistoryId` = ?";

        OrderHistory orderHistory = null;

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderHistoryId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    orderHistory = extractOrderHistoryFromResultSet(res);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderHistory;
    }

    @Override
    public void updateOrderHistory(OrderHistory orderHistory) {
        String sql = "UPDATE `orderhistory` SET `orderTableId` = ?, `userId` = ? WHERE `orderHistoryId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderHistory.getOrderTableId());
            pstmt.setInt(2, orderHistory.getUserId());
            pstmt.setInt(3, orderHistory.getOrderHistoryId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderHistory(int orderHistoryId) {
        String sql = "DELETE FROM `orderhistory` WHERE `orderHistoryId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderHistoryId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderHistory> getAllOrderHistorysByUser(int userId) {
        String sql = "SELECT * FROM `orderhistory`  WHERE `userId` = ?";

        List<OrderHistory> orderHistories = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet res = pstmt.executeQuery()) {

            while (res.next()) {
                OrderHistory orderHistory = extractOrderHistoryFromResultSet(res);
                orderHistories.add(orderHistory);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderHistories;
    }

    private OrderHistory extractOrderHistoryFromResultSet(ResultSet res) throws SQLException {
        OrderHistory orderHistory = new OrderHistory();

        orderHistory.setOrderHistoryId(res.getInt("orderHistoryId"));
        orderHistory.setOrderTableId(res.getInt("orderTableId"));
        orderHistory.setUserId(res.getInt("userId"));

        return orderHistory;
    }
}