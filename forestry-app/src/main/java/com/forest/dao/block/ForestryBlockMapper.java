package com.forest.dao.block;

import java.util.List;
import java.util.Map;

import com.forest.entity.block.ForestryBlock;
import com.forest.entity.park.ForestryPark;

public interface ForestryBlockMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryBlock record);

    int insertSelective(ForestryBlock record);

    ForestryBlock selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryBlock record);

    int updateByPrimaryKey(ForestryBlock record);
    
    int getCount(Map<String,Object> map);
    List<ForestryBlock> queryListPage(Map<String,Object> map);
}