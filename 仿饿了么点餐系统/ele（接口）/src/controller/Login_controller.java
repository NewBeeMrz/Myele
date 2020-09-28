package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import entity.User;
import service.UserService;

@Controller
public class Login_controller {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	/**
	 * 直接返回对象，自动转化为JSON格式
	 * @param teamname
	 * @param request
	 * @return
	 */	
	@CrossOrigin
	@RequestMapping(value="login/getloginuser.action")
	@ResponseBody 
	public User getLoginUser(String user_name,String user_pass,HttpServletRequest request) {
		
		User user = new User();
		user.setUser_name(user_name);
		user.setUser_pass(user_pass);
		User loginUser = this.userService.getUser(user);
		return loginUser;
	}
	
	@CrossOrigin
	@RequestMapping(value="login/getloginuserbyPhone.action")
	@ResponseBody 
	public User getLoginUserbyPhone(String phonenum,String user_pass,HttpServletRequest request) {
		User user = new User();
		user.setPhonenum(phonenum);
		user.setUser_pass(user_pass);
		User loginUser = this.userService.getUserbyPhone(user);
		return loginUser;
	}
	
	@CrossOrigin
	@RequestMapping(value="register/createUser.action")
	@ResponseBody 
	public Integer createUser(User user,HttpServletRequest request) {
		int rows = this.userService.createUser(user);
		return rows;
	}
}
