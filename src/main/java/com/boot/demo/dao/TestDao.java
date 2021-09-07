package com.boot.demo.dao;

import com.boot.demo.mapper.TestMapper;
import com.boot.demo.model.ColumnInfo;
import com.boot.demo.model.Test;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TestDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public void sqlRollbackTest() {
        TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
        ArrayList<Test> tests = testMapper.sqlRollbackTest();
    }

    public List<ColumnInfo> sqlColumnNameTest() {
        TestMapper testMapper = sqlSession.getMapper(TestMapper.class);
        return testMapper.sqlColumnNameTest();
    }
}
