package com.forest.dao.logging;

import java.util.List;
import java.util.Map;

import com.forest.entity.logging.ForestryLoggingPlanCheck;

public interface ForestryLoggingPlanCheckMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryLoggingPlanCheck record);

    int insertSelective(ForestryLoggingPlanCheck record);

    ForestryLoggingPlanCheck selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryLoggingPlanCheck record);

    int updateByPrimaryKey(ForestryLoggingPlanCheck record);
    
    int getLoggingPlanCheckCount(Map<String,Object> map);
    List<ForestryLoggingPlanCheck> queryPlanCheckListPage(Map<String,Object> map);
    
    int getCheckCount(Map<String,Object> map);
    List<ForestryLoggingPlanCheck> queryList(Map<String,Object> map);
}