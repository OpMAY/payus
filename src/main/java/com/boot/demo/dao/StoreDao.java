package com.boot.demo.dao;

import com.boot.demo.mapper.StoreMapper;
import com.boot.demo.model.Store;
import com.boot.demo.model.response.home.HomePaybackStore;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class StoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public List<HomePaybackStore> getStoreRandomListForHome(){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRandomListForHome();
    }

    public List<HomePaybackStore> getStoreListOrderByPaybackRatioForHome(){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreListOrderByPaybackRatioForHome();
    }

    public void insertStores(Store store){
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        storeMapper.insertStores(store);
    }

    public List<HomePaybackStore> getStoreRandomListForMain(String x, String y, int category) {
        StoreMapper storeMapper = sqlSession.getMapper(StoreMapper.class);
        return storeMapper.getStoreRandomListForMain(x, y, category);
    }
}
