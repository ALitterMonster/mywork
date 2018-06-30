package com.forest.dao.prevention;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;
import com.forest.entity.prevention.ForestryFireRecord;

public interface ForestryFireRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryFireRecord record);

    int insertSelective(ForestryFireRecord record);

    ForestryFireRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryFireRecord record);

    int updateByPrimaryKey(ForestryFireRecord record);
    
    int getFireRecordCount(Map<String,Object> map);
    List<ForestryFireRecord> queryRecordListPage(Map<String,Object> map);
}