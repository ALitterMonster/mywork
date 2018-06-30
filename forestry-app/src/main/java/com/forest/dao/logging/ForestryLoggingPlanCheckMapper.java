package com.forest.dao.logging;

import com.forest.entity.logging.ForestryLoggingPlanCheck;

public interface ForestryLoggingPlanCheckMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryLoggingPlanCheck record);

    int insertSelective(ForestryLoggingPlanCheck record);

    ForestryLoggingPlanCheck selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryLoggingPlanCheck record);

    int updateByPrimaryKey(ForestryLoggingPlanCheck record);
}