package com.forest.dao.logging;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlan;

public interface ForestryLoggingPlanMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryLoggingPlan record);

    int insertSelective(ForestryLoggingPlan record);

    ForestryLoggingPlan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryLoggingPlan record);

    int updateByPrimaryKey(ForestryLoggingPlan record);
    
    int getLoggingPlanCount(Map<String,Object> map);
    List<ForestryLoggingPlan> queryPlanListPage(Map<String,Object> map);
}