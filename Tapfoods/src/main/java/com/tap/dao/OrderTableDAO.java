package com.tap.dao;

import java.util.List;

import com.tap.model.OrderTable;



public interface OrderTableDAO {
	
	
	
    void  addOrderTable(OrderTable orderTable);
	OrderTable getOrderTable(int orderTableId);
	void updateOrderTable(OrderTable orderTable);
	void deleteOrderTable(int orderTableId);
	List<OrderTable> getAllOrderTablesByUser(int userId);
	int getGeneratedOrderId(OrderTable order);

}
