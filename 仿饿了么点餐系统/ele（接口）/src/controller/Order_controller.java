package controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Order;
import service.OrderService;

@Controller
public class Order_controller {
	@Autowired
	@Qualifier("orderService")
	private OrderService orderService;	
	
	@CrossOrigin
	@RequestMapping(value="order/createOrder.action")
	@ResponseBody 
	public Integer createOrder(Order order,HttpServletRequest request) {
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date order_date = new Date(System.currentTimeMillis());
		order.setDate(formatter.format(order_date).toString());
		order.setStatus("Î´ËÍ´ï");
		int rows = this.orderService.createOrder(order);
		return rows;
	}
	
	@CrossOrigin
	@RequestMapping(value="order/getOrderList.action")
	@ResponseBody 
	public List<Order> getOrderList(Integer user_id,HttpServletRequest request) {
		return this.orderService.getOrderList(user_id);
	}
}
