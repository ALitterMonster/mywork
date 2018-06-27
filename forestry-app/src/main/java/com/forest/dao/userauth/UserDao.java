package com.forest.dao.userauth;

import java.util.List;

import com.forest.entity.userauth.OperationUser;


public interface UserDao {

	 public List<OperationUser> findByUsername(OperationUser u);
}
