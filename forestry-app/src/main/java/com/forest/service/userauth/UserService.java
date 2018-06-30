package com.forest.service.userauth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.userauth.UserDao;
import com.forest.entity.userauth.OperationUser;

@Service
public class UserService {
	
	@Resource
    private UserDao userDao;

	public List<OperationUser> findUserList(OperationUser u){
		return userDao.findUserList(u);
	}
	
	public OperationUser findForLogin(String u){
		return userDao.findForLogin(u);
	}
	
	public void insertUserInfo(OperationUser u){
		userDao.insertUserInfo(u);
	}
	 
	public void updateUserInfo(OperationUser u){
		userDao.updateUserInfo(u);
	}
 
	public void deleteUserInfo(int u){
		userDao.deleteUserInfo(u);
	}
	
	public void insertUserRole(OperationUser u){
		userDao.insertUserRole(u);
	}
	 
	public void updateUserRole(OperationUser u){
		userDao.updateUserRole(u);
	}
	
}
