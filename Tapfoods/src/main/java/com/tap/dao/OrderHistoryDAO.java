package com.tap.dao;

import java.util.List;
import com.tap.model.OrderHistory;

public interface OrderHistoryDAO {
    void addOrderHistory(OrderHistory orderHistory);
    OrderHistory getOrderHistory(int orderHistoryId);
    void updateOrderHistory(OrderHistory orderHistory);
    void deleteOrderHistory(int orderHistoryId);
    List<OrderHistory> getAllOrderHistorysByUser(int userId);
    List<OrderHistory> getAllOrderHistories(); // Added method to get all order histories
}
