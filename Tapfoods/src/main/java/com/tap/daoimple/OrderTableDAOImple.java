package com.tap.daoimple;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.tap.dao.OrderTableDAO;
import com.tap.model.OrderTable;
import com.tap.util.DBConnectionUtil;

public class OrderTableDAOImple implements OrderTableDAO {

	@Override
	public void addOrderTable(OrderTable orderTable) {
	    String sql = "INSERT INTO `orderTable` (`orderTableId`, `restaurantId`, `userId`, `totalAmount`, `modeOfPayment`, `status`, `orderDate`) VALUES (?, ?, ?, ?, ?, ?, ?)";

	    try (Connection connection = DBConnectionUtil.getConnection();
	         PreparedStatement pstmt = connection.prepareStatement(sql)) {

	        // Generate a unique OrderTableId based on OrderDate
	        long timestamp = orderTable.getOrderDate().getTime(); // Get the timestamp from OrderDate
	        int orderTableId = generateOrderTableId(timestamp); // Generate integer OrderTableId

	        pstmt.setInt(1, orderTableId);
	        pstmt.setInt(2, orderTable.getRestaurantId());
	        pstmt.setInt(3, orderTable.getUserId());
	        pstmt.setDouble(4, orderTable.getTotalAmount());
	        pstmt.setString(5, orderTable.getModeOfPayment());
	        pstmt.setString(6, orderTable.getStatus());
	        pstmt.setDate(7, new java.sql.Date(orderTable.getOrderDate().getTime())); // Convert java.util.Date to java.sql.Date

	        pstmt.executeUpdate();

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	// Method to generate OrderTableId based on the timestamp
	private int generateOrderTableId(long timestamp) {
	    // Example: Extract integer value from the timestamp
	    return (int) (timestamp % 1000000); // Assuming a 6-digit integer for orderTableId
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
        String sql = "UPDATE `orderTable` SET `restaurantId` = ?, `userId` = ?, `totalAmount` = ?, `modeOfPayment` = ?, `status` = ?, `orderDate` = ? WHERE `orderTableId` = ?";

        try (Connection connection = DBConnectionUtil.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, orderTable.getRestaurantId());
            pstmt.setInt(2, orderTable.getUserId());
            pstmt.setDouble(3, orderTable.getTotalAmount());
            pstmt.setString(4, orderTable.getModeOfPayment());
            pstmt.setString(5, orderTable.getStatus());
            pstmt.setDate(6, new java.sql.Date(orderTable.getOrderDate().getTime())); // Convert java.util.Date to java.sql.Date
            pstmt.setInt(7, orderTable.getOrderTableId());

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

    private OrderTable extractOrderTableFromResultSet(ResultSet res) throws SQLException {
        OrderTable orderTable = new OrderTable();

        orderTable.setOrderTableId(res.getInt("orderTableId"));
        orderTable.setRestaurantId(res.getInt("restaurantId"));
        orderTable.setUserId(res.getInt("userId"));
        orderTable.setTotalAmount(res.getDouble("totalAmount"));
        orderTable.setModeOfPayment(res.getString("modeOfPayment"));
        orderTable.setStatus(res.getString("status"));
        orderTable.setOrderDate(new Date(res.getDate("orderDate").getTime())); // Use getDate for DATE

        return orderTable;
    }

	@Override
	public int getGeneratedOrderId(OrderTable order) {
		// TODO Auto-generated method stub
		return 0;
	}
}