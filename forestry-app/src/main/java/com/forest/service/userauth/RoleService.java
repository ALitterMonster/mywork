package com.forest.service.userauth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.userauth.RoleDao;
import com.forest.entity.userauth.OperationRole;

@Service
public class RoleService {
	
	@Resource
    private RoleDao roleDao;

	public List<OperationRole> findRoleList(OperationRole u){
		return roleDao.findRoleList(u);
	}
	
	public void insertRoleInfo(OperationRole u){
		roleDao.insertRoleInfo(u);
	}
	 
	public void updateRoleInfo(OperationRole u){
		roleDao.updateRoleInfo(u);
	}
 
	public void deleteRoleInfo(int u){
		roleDao.deleteRoleInfo(u);
	}

	public List<OperationRole> roleComboBox(){
		return roleDao.roleComboBox();
	}
}
