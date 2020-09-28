package dao;

import org.apache.ibatis.annotations.Param;

import entity.Collect;

public interface CollectDao {
	public Collect getCollectbyID(@Param(value="s_id")Integer s_id,@Param(value="user_id")Integer user_id);
	public Integer collected(@Param(value="s_id")Integer s_id,@Param(value="user_id")Integer user_id);
	public Integer cancelCollect(Integer c_id);
}
