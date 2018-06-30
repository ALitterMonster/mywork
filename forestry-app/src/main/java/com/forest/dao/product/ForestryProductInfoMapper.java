package com.forest.dao.product;

import java.util.List;
import java.util.Map;

import com.forest.dto.product.ProductQueryReusltDTO;
import com.forest.entity.product.ForestryProductInfo;

public interface ForestryProductInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ForestryProductInfo record);

    int insertSelective(ForestryProductInfo record);

    ForestryProductInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ForestryProductInfo record);

    int updateByPrimaryKey(ForestryProductInfo record);
    
    int getProductCount(Map<String,Object> map);
    
    List<ForestryProductInfo> queryListPage(Map<String,Object> map);
}