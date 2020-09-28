package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Collect;
import entity.User;
import service.CollectService;
import service.UserService;

@Controller
public class Collect_controller {
	@Autowired
	@Qualifier("collectService")
	private CollectService collectService;
	
	@CrossOrigin
	@RequestMapping(value="collect/getCollectbyID.action")
	@ResponseBody 
	public Collect getCollectbyID(Integer user_id,Integer s_id,HttpServletRequest request) {
		Collect collect = this.collectService.getCollectbyID(s_id, user_id);
		return collect;
	}
	
	@CrossOrigin
	@RequestMapping(value="collect/collected.action")
	@ResponseBody 
	public int collected(Integer user_id,Integer s_id,HttpServletRequest request) {
		int rows = this.collectService.collected(s_id, user_id);
		return rows;
	}
	
	@CrossOrigin
	@RequestMapping(value="collect/cancelCollect.action")
	@ResponseBody 
	public int cancelCollect(Integer c_id,HttpServletRequest request) {
		int rows = this.collectService.cancelCollect(c_id);
		return rows;
	}
}
