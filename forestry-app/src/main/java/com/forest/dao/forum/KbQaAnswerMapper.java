package com.forest.dao.forum;

import java.util.List;
import java.util.Map;

import com.forest.entity.forum.KbQaAnswer;

public interface KbQaAnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(KbQaAnswer record);

    int insertSelective(KbQaAnswer record);

    KbQaAnswer selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(KbQaAnswer record);

    int updateByPrimaryKey(KbQaAnswer record);
    
    int getCount(Map<String,Object> map);
    
    List<KbQaAnswer> queryList(Map<String,Object> map);
}