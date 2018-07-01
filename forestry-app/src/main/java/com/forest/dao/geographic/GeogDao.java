package com.forest.dao.geographic;

import java.util.List;

import com.forest.entity.geographic.GeogInfo;

public interface GeogDao {
	
	public List<GeogInfo> getGeogList(int userId);
	
	public List<GeogInfo> geogList(GeogInfo u);
	public int  getCount(GeogInfo u);
	
	public void insertGeogInfo(GeogInfo u);
 
	public void updateGeogInfo(GeogInfo u);
 
	public void deleteGeogInfo(int u);

}
