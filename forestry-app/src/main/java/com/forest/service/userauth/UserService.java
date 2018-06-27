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

	public List<OperationUser> findByUsername(OperationUser u){
		return userDao.findByUsername(u);
	}
}
