package dao;

import entity.User;

public interface UserDao {
	public User getUser(User user);
	public User getUserbyPhone(User user);
	public Integer createUser(User user);
	public User getUserbyID(Integer user_id);
	public Integer updateUser(User user);
}
