package service;

import dao.userDao;
import dao.userDaoImpl;

public class userServiceImpl implements userService{
	private userDao dao;
	
	public userServiceImpl() {
		dao = new userDaoImpl();
	}
	@Override
	public void DBTest() {
		// TODO Auto-generated method stub
		dao.select();
	}

}
