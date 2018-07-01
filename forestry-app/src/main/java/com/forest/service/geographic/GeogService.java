package com.forest.service.geographic;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.forest.dao.geographic.GeogDao;
import com.forest.dto.geoinfo.GeoInfoQueryResultDTO;
import com.forest.entity.geographic.GeogInfo;

@Service
public class GeogService {
	
	@Resource
    private GeogDao geogDao;

	public List<GeogInfo> getMenuList(int roleId){
		return geogDao.getGeogList(roleId);
	}
	
	public GeoInfoQueryResultDTO geogList(GeogInfo u){
		GeoInfoQueryResultDTO resultDTO = new GeoInfoQueryResultDTO();
		int total = geogDao.getCount(u);
		resultDTO.setTotal(total);
		List<GeogInfo> result = geogDao.geogList(u);
		resultDTO.setData(result);
		return resultDTO;
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
