package service;

import java.util.List;

import entity.Store;

public interface StoreService {
	public List<Store> getStoreList();
	public List<Store> searchStore(String search_content);
	public Store getStorebyID(Integer s_id);
	public List<Store> getCollectStore(Integer user_id);
}
