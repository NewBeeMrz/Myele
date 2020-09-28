package service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.UserDao;
import entity.User;
import service.UserService;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	// ×¢ÈëUserDao
	@Autowired
	private UserDao userDao;

	@Override
	public User getUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.getUser(user);
	}

	@Override
	public User getUserbyPhone(User user) {
		// TODO Auto-generated method stub
		return this.userDao.getUserbyPhone(user);
	}

	@Override
	public Integer createUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.createUser(user);
	}

	@Override
	public User getUserbyID(Integer user_id) {
		// TODO Auto-generated method stub
		return this.userDao.getUserbyID(user_id);
	}

	@Override
	public Integer updateUser(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateUser(user);
	}

}
