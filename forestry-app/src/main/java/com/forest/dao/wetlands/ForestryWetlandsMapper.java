package com.forest.dao.wetlands;

import java.util.List;
import java.util.Map;

import com.forest.entity.wetlands.ForestryWetlands;

public interface ForestryWetlandsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryWetlands record);

    int insertSelective(ForestryWetlands record);

    ForestryWetlands selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryWetlands record);

    int updateByPrimaryKey(ForestryWetlands record);
    
    int getCount(Map<String,Object> map);
    List<ForestryWetlands> queryListPage(Map<String,Object> map);
    
}