package com.forest.dao.forum;

import java.util.List;
import java.util.Map;

import com.forest.entity.forum.KbQaQuestion;

public interface KbQaQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(KbQaQuestion record);

    int insertSelective(KbQaQuestion record);

    KbQaQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(KbQaQuestion record);

    int updateByPrimaryKey(KbQaQuestion record);
    
    int getCount(Map<String,Object> map);
    
    List<KbQaQuestion> queryList(Map<String,Object> map);
}