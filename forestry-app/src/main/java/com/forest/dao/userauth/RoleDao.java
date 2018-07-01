package com.forest.dao.userauth;


import java.util.List;
import java.util.Map;

import com.forest.entity.userauth.OperationRole;
import com.forest.entity.userauth.OperationRoleMenu;

public interface RoleDao {
	
	public List<OperationRole> findRoleList(OperationRole u);
	
	public void insertRoleInfo(OperationRole u);
	public void insertRoleMenu(OperationRoleMenu u);
 
	public void updateRoleInfo(OperationRole u);
	
	public void deleteRoleInfo(int roleId);
	public void removeRoleMenu(int fid);
	
	public List<OperationRole> roleComboBox();
	
	public List<String> selcetTree(String roleId);
	
	public Integer selcetRoleMenu(Map<String,Integer> map);
}
