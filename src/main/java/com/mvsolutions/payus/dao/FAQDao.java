package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.FAQMapper;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.FAQResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FAQDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<FAQResponse> getFAQList(int faq_type) {
        FAQMapper mapper = sqlSession.getMapper(FAQMapper.class);
        return mapper.getFAQList(faq_type);
    }

//    private FAQMapper mapper = sqlSession.getMapper(FAQMapper.class);
}
