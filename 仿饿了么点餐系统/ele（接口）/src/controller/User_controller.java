package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.User;
import service.UserService;

@Controller
public class User_controller {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@CrossOrigin
	@RequestMapping(value="profile/getUserbyID.action")
	@ResponseBody 
	public User getLoginUser(String user_id,HttpServletRequest request) {
		User user = this.userService.getUserbyID(Integer.parseInt(user_id));
		return user;
	}
	
	@CrossOrigin
	@RequestMapping(value="profile/updateUser.action")
	@ResponseBody 
	public Integer updateUser(User user,HttpServletRequest request) {
		int rows = this.userService.updateUser(user);
		return rows;
	}
}
