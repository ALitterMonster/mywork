package com.forest.service.geographic;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.geographic.GeogDao;
import com.forest.entity.geographic.GeogInfo;

@Service
public class GeogService {
	
	@Resource
    private GeogDao geogDao;

	public List<GeogInfo> getMenuList(int roleId){
		return geogDao.getGeogList(roleId);
	}
	
	public List<GeogInfo> geogList(GeogInfo u){
		return geogDao.geogList(u);
	}
	
	public void insertGeogInfo(GeogInfo u){
		geogDao.insertGeogInfo(u);
	}
	 
	public void updateGeogInfo(GeogInfo u){
		geogDao.updateGeogInfo(u);
	}
 
	public void deleteGeogInfo(int u){
		geogDao.deleteGeogInfo(u);
	}
	
}
