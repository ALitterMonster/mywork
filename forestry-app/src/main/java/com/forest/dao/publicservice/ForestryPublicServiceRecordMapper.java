package com.forest.dao.publicservice;

import java.util.List;
import java.util.Map;

import com.forest.entity.publicservice.ForestryPublicServiceRecord;

public interface ForestryPublicServiceRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryPublicServiceRecord record);

    int insertSelective(ForestryPublicServiceRecord record);

    ForestryPublicServiceRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryPublicServiceRecord record);

    int updateByPrimaryKey(ForestryPublicServiceRecord record);
    
    int getCount(Map<String,Object> map);
    List<ForestryPublicServiceRecord> queryListPage(Map<String,Object> map);
    
}