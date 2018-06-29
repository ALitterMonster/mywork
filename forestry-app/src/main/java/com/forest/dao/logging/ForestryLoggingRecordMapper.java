package com.forest.dao.logging;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.logging.ForestryLoggingRecord;

public interface ForestryLoggingRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryLoggingRecord record);

    int insertSelective(ForestryLoggingRecord record);

    ForestryLoggingRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryLoggingRecord record);

    int updateByPrimaryKey(ForestryLoggingRecord record);
    
    int getLoggingRecordCount(Map<String,Object> map);
    
    List<ForestryLoggingRecord> queryRecordListPage(Map<String,Object> map);
}