package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Store;
import entity.food;


public interface StoreDao {
	public List<Store> getStoreList();
	public List<Store> searchStore(@Param(value="search_content") String search_content);
	public Store getStorebyID(Integer s_id);
	public List<food> getfoodlist(Integer s_id);
	public List<Store> getCollectStore(Integer user_id);
}
