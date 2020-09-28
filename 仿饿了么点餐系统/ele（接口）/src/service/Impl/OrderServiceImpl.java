package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CommentDao;
import dao.OrderDao;
import entity.Order;
import entity.Store;
import service.OrderService;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;	

	@Override
	public Integer createOrder(Order order) {
		// TODO Auto-generated method stub
		return this.orderDao.createOrder(order);
	}

	@Override
	public List<Order> getOrderList(Integer user_id) {
		// TODO Auto-generated method stub
		return this.orderDao.getOrderList(user_id);
	}

	

}
