package com.forest.dao.park;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.park.ForestryPark;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public interface ForestryParkMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryPark record);

    int insertSelective(ForestryPark record);

    ForestryPark selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryPark record);

    int updateByPrimaryKey(ForestryPark record);
    
    int getCount(Map<String,Object> map);
    List<ForestryPark> queryListPage(Map<String,Object> map);
}