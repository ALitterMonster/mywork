package com.forest.service.userauth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.userauth.MenuDao;
import com.forest.entity.userauth.OperationMenu;

@Service
public class MenuService {
	
	@Resource
    private MenuDao menuDao;

	public List<OperationMenu> getMenuList(int roleId){
		return menuDao.getMenuList(roleId);
	}
	
	public List<OperationMenu> menuList(OperationMenu u){
		return menuDao.menuList(u);
	}
	
	public void insertMenuInfo(OperationMenu u){
		menuDao.insertMenuInfo(u);
	}
	 
	public void updateMenuInfo(OperationMenu u){
		menuDao.updateMenuInfo(u);
	}
 
	public void deleteMenuInfo(int u){
		menuDao.deleteMenuInfo(u);
	}
	
}
