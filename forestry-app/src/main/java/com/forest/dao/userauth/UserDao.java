package com.forest.dao.userauth;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.forest.entity.userauth.OperationUser;

@Repository
public interface UserDao {

	 public List<OperationUser> findUserList(OperationUser u);
	 
	 public OperationUser findForLogin(String username);
	 
	 public void insertUserInfo(OperationUser u);
	 
	 public void updateUserRole(OperationUser u);
	 
	 public void insertUserRole(OperationUser u);
	 
	 public void updateUserInfo(OperationUser u);
	 
	 
	 public void deleteUserInfo(int u);
}
