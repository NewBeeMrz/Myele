package dao;

import java.util.List;

import entity.Order;

public interface OrderDao {
	public Integer createOrder(Order order);
	public List<Order> getOrderList(Integer user_id);
}
