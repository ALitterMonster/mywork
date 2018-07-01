package com.forest.service.userauth;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.userauth.RoleDao;
import com.forest.entity.userauth.OperationRole;
import com.forest.entity.userauth.OperationRoleMenu;

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

	public void removeRoleMenu(int u){
		roleDao.removeRoleMenu(u);
	}
	
	public List<OperationRole> roleComboBox(){
		return roleDao.roleComboBox();
	}
	
	public void insertRoleMenu(OperationRoleMenu u){
		roleDao.insertRoleMenu(u);
	}
	
	public List<String> selcetTree(String u){
		return roleDao.selcetTree(u);
	}
	public Integer selcetRoleMenu(Map<String,Integer> map){
		return roleDao.selcetRoleMenu(map);
	}
	
}
