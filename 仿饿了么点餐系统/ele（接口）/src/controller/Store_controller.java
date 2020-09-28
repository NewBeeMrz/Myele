package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Store;
import service.StoreService;

@Controller
public class Store_controller {
	@Autowired
	@Qualifier("storeService")
	private StoreService storeService;
	
	@CrossOrigin
	@RequestMapping(value="store/getStoreList.action")
	@ResponseBody 
	public List<Store> getStoreList(HttpServletRequest request) {
		List<Store>  stores= this.storeService.getStoreList();
		return stores;
	}
	
	@CrossOrigin
	@RequestMapping(value="store/searchStore.action")
	@ResponseBody 
	public List<Store> searchStore(String search_content,HttpServletRequest request) {
		List<Store>  stores= this.storeService.searchStore(search_content);
		return stores;
	}
	
	@CrossOrigin
	@RequestMapping(value="store/getStorebyID.action")
	@ResponseBody 
	public Store getStorebyID(Integer s_id,HttpServletRequest request) {
		Store  store= this.storeService.getStorebyID(s_id);
		return store;
	}
	
	@CrossOrigin
	@RequestMapping(value="store/getCollectStore.action")
	@ResponseBody 
	public List<Store> getCollectStore(Integer user_id,HttpServletRequest request) {
		List<Store> stores = this.storeService.getCollectStore(user_id);
		return stores;
	}
}
