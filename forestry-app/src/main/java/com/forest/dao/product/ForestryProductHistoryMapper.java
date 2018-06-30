package com.forest.dao.product;

import com.forest.entity.product.ForestryProductHistory;
import java.util.List;
import java.util.Map;

public interface ForestryProductHistoryMapper {
    long countByExample(Map<String,Object> map);

    int deleteByPrimaryKey(Integer id);

    int insert(ForestryProductHistory record);

    int insertSelective(ForestryProductHistory record);

    List<ForestryProductHistory> selectByExample(Map<String,Object> map);

    ForestryProductHistory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryProductHistory record);

    int updateByPrimaryKey(ForestryProductHistory record);
}