package com.tap.dao;

import java.util.List;
import com.tap.model.OrderTable;

public interface OrderTableDAO {

    int addOrderTable(OrderTable orderTable);
    OrderTable getOrderTable(int orderTableId);
    void updateOrderTable(OrderTable orderTable);
    void deleteOrderTable(int orderId);
    List<OrderTable> getAllOrderTablesByUser(int userId);
    List<OrderTable> getAllOrderTables();
    int getGeneratedOrderId(OrderTable order);
	
    List<OrderTable> getOrderTablesByOrderId(int orderId);

   
}
