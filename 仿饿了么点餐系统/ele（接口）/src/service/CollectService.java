package service;

import entity.Collect;

public interface CollectService {
	public Collect getCollectbyID(Integer s_id,Integer user_id);
	public Integer collected(Integer s_id,Integer user_id);
	public Integer cancelCollect(Integer c_id);
}
