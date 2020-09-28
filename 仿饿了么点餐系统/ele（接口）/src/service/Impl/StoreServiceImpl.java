package service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.StoreDao;
import entity.Store;
import service.StoreService;

@Service("storeService")
@Transactional
public class StoreServiceImpl implements StoreService{
	@Autowired
	private StoreDao storeDao;
	
	
	@Override
	public List<Store> getStoreList() {
		// TODO Auto-generated method stub
		return this.storeDao.getStoreList();
	}


	@Override
	public List<Store> searchStore(String search_content) {
		// TODO Auto-generated method stub
		return this.storeDao.searchStore(search_content);
	}


	@Override
	public Store getStorebyID(Integer s_id) {
		// TODO Auto-generated method stub
		Store store = this.storeDao.getStorebyID(s_id);
		store.setFoodList(this.storeDao.getfoodlist(s_id));
		return store;
	}


	@Override
	public List<Store> getCollectStore(Integer user_id) {
		// TODO Auto-generated method stub
		return this.storeDao.getCollectStore(user_id);
	}

}
