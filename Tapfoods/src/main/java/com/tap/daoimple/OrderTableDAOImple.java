package com.tap.daoimple;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.dao.OrderTableDAO;
import com.tap.model.OrderTable;
import com.tap.util.DBConnectionUtil;

public class OrderTableDAOImple implements OrderTableDAO {

	@Override
	public int addOrderTable(OrderTable orderTable) {
	    int generatedId = 0;
	    try (Connection conn = DBConnectionUtil.getConnection()) {
	        String sql = "INSERT INTO OrderTable (restaurantId, userId, modeOfPayment, status, orderDate, address, phoneNo, totalAmount) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
	        PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	        pstmt.setInt(1, orderTable.getRestaurantId());
	        pstmt.setInt(2, orderTable.getUserId());
	        pstmt.setString(3, orderTable.getModeOfPayment());
	        pstmt.setString(4, orderTable.getStatus());
	        pstmt.setDate(5, new java.sql.Date(orderTable.getOrderDate().getTime()));
	        pstmt.setString(6, orderTable.getAddress());
	        pstmt.setString(7, orderTable.getPhoneNo());
	        pstmt.setDouble(8, orderTable.getTotalAmount());
	        
	        pstmt.executeUpdate();
	        
	        // Get the generated order ID
	        try (ResultSet rs = pstmt.getGeneratedKeys()) {
	            if (rs.next()) {
	                generatedId = rs.getInt(1);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return generatedId;
	}


    @Override
    public OrderTable getOrderTable(int orderTableId) {
        String sql = "SELECT * FROM `orderTable` WHERE `orderTableId` = ?";

        OrderTable orderTable = null;

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderTableId);
            try (ResultSet res = pstmt.executeQuery()) {
                if (res.next()) {
                    orderTable = extractOrderTableFromResultSet(res);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderTable;
    }

    @Override
    public void updateOrderTable(OrderTable orderTable) {
        String sql = "UPDATE `orderTable` SET `restaurantId` = ?, `userId` = ?, `totalAmount` = ?, `modeOfPayment` = ?, `status` = ?, `orderDate` = ?, `address` = ?, `phoneNo` = ? WHERE `orderTableId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderTable.getRestaurantId());
            pstmt.setInt(2, orderTable.getUserId());
            pstmt.setDouble(3, orderTable.getTotalAmount());
            pstmt.setString(4, orderTable.getModeOfPayment());
            pstmt.setString(5, orderTable.getStatus());
            pstmt.setDate(6, new java.sql.Date(orderTable.getOrderDate().getTime()));
            pstmt.setString(7, orderTable.getAddress());  // Set address
            pstmt.setString(8, orderTable.getPhoneNo());  // Set phone number
            pstmt.setInt(9, orderTable.getOrderTableId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderTable(int orderTableId) {
        String sql = "DELETE FROM `orderTable` WHERE `orderTableId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderTableId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderTable> getAllOrderTablesByUser(int userId) {
        String sql = "SELECT * FROM `orderTable` WHERE `userId` = ?";

        List<OrderTable> orderTables = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, userId);
            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    OrderTable orderTable = extractOrderTableFromResultSet(res);
                    orderTables.add(orderTable);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderTables;
    }

    @Override
    public List<OrderTable> getAllOrderTables() {
        String sql = "SELECT * FROM `orderTable`";
        List<OrderTable> orderTables = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet res = pstmt.executeQuery()) {

            while (res.next()) {
                OrderTable orderTable = extractOrderTableFromResultSet(res);
                orderTables.add(orderTable);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderTables;
    }

    private OrderTable extractOrderTableFromResultSet(ResultSet res) throws SQLException {
        OrderTable orderTable = new OrderTable();

        orderTable.setOrderTableId(res.getInt("orderTableId"));
        orderTable.setRestaurantId(res.getInt("restaurantId"));
        orderTable.setUserId(res.getInt("userId"));
        orderTable.setTotalAmount(res.getDouble("totalAmount"));
        orderTable.setModeOfPayment(res.getString("modeOfPayment"));
        orderTable.setStatus(res.getString("status"));
        orderTable.setOrderDate(res.getDate("orderDate"));
        orderTable.setAddress(res.getString("address"));  // Get address
        orderTable.setPhoneNo(res.getString("phoneNo"));  // Get phone number

        return orderTable;
    }

    @Override
    public int getGeneratedOrderId(OrderTable order) {
        String sql = "SELECT LAST_INSERT_ID() AS orderTableId";
        int orderTableId = 0;

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);
             ResultSet res = pstmt.executeQuery()) {

            if (res.next()) {
                orderTableId = res.getInt("orderTableId");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderTableId;
    }


    @Override
    public List<OrderTable> getOrderTablesByOrderId(int orderId) {
        String sql = "SELECT * FROM `orderTable` WHERE `orderTableId` = ?";
        List<OrderTable> orderTables = new ArrayList<>();

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderId);
            try (ResultSet res = pstmt.executeQuery()) {
                while (res.next()) {
                    OrderTable orderTable = extractOrderTableFromResultSet(res);
                    orderTables.add(orderTable);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderTables;
    }

}
