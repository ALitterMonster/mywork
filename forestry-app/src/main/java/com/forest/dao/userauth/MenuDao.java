package com.forest.dao.userauth;

import java.util.List;

import com.forest.entity.userauth.OperationMenu;

public interface MenuDao {
	
	public List<OperationMenu> getMenuList(int userId);
	
	public List<OperationMenu> menuList(OperationMenu u);
	
	public void insertMenuInfo(OperationMenu u);
 
	public void updateMenuInfo(OperationMenu u);
 
	public void deleteMenuInfo(int u);

}
