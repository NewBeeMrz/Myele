package service;

import java.util.List;

import entity.Order;
import entity.Store;

public interface OrderService {
	public Integer createOrder(Order order);
	public List<Order> getOrderList(Integer user_id);
}
