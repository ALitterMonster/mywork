package com.forest.dao.prevention;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlan;
import com.forest.entity.prevention.ForestryFirePreventionRecord;

public interface ForestryFirePreventionRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryFirePreventionRecord record);

    int insertSelective(ForestryFirePreventionRecord record);

    ForestryFirePreventionRecord selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryFirePreventionRecord record);

    int updateByPrimaryKey(ForestryFirePreventionRecord record);
    
    int getFirePreventionRecordCount(Map<String,Object> map);
    List<ForestryFirePreventionRecord> queryRecordListPage(Map<String,Object> map);
}