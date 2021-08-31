package com.boot.demo.service;

import com.boot.demo.dao.TestDao;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Log4j
@Service
public class HomeService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private TestDao testDao;

    public void sqlRollbackTest(){
        testDao.setSqlSession(sqlSession);
        testDao.sqlRollbackTest();
    }
}
