package com.forest.dao.userauth;


import java.util.List;

import com.forest.entity.userauth.OperationRole;

public interface RoleDao {
	
	public List<OperationRole> findRoleList(OperationRole u);
	
	public void insertRoleInfo(OperationRole u);
 
	public void updateRoleInfo(OperationRole u);
 
	public void deleteRoleInfo(int u);
	
	public List<OperationRole> roleComboBox();
}
