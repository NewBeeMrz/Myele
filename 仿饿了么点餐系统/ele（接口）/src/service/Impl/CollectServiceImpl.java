package service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.CollectDao;
import entity.Collect;
import service.CollectService;

@Service("collectService")
@Transactional
public class CollectServiceImpl implements CollectService{
	@Autowired
	private CollectDao collectDao;

	@Override
	public Collect getCollectbyID(Integer s_id, Integer user_id) {
		// TODO Auto-generated method stub
		return this.collectDao.getCollectbyID(s_id, user_id);
	}

	@Override
	public Integer collected(Integer s_id, Integer user_id) {
		// TODO Auto-generated method stub
		return this.collectDao.collected(s_id, user_id);
	}

	@Override
	public Integer cancelCollect(Integer c_id) {
		// TODO Auto-generated method stub
		return this.collectDao.cancelCollect(c_id);
	}

}
