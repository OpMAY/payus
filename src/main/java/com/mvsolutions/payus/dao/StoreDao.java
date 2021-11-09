package com.mvsolutions.payus.dao;


import com.mvsolutions.payus.mapper.StoreMapper;
import com.mvsolutions.payus.model.rest.basic.Store;
import com.mvsolutions.payus.model.rest.response.MainPageStore;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<MainPageStore> getStoreListForMain(double x, double y, int class_first) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreListForMain(x, y, class_first);
    }

    public List<MainPageStore> getStoreListForMainReload(int class_first, double distance, int last_index, double x, double y) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreListForMainReload(class_first, distance, last_index, x, y);
    }

    public double getDistanceOfLastIndex(double x, double y, int last_index) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getDistanceOfLastIndex(x, y, last_index);
    }

    public boolean checkStoreExists(int last_index) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.checkStoreExists(last_index);
    }

    public void insertStore(Store store) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        mapper.insertStore(store);
    }
}
