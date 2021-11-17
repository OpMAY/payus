package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.mapper.AdvertisementStoreMapper;
import com.mvsolutions.payus.model.rest.response.payushome.PayusHomeEventResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdvertisementStoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<PayusHomeEventResponse> getEventStoreList(double x, double y, int class_first) {
        AdvertisementStoreMapper mapper = sqlSession.getMapper(AdvertisementStoreMapper.class);
        return mapper.getEventStoreList(x, y, class_first);
    }

    public int checkStoreOnEvent(int store_no) {
        AdvertisementStoreMapper mapper = sqlSession.getMapper(AdvertisementStoreMapper.class);
        return mapper.checkStoreOnEvent(store_no);
    }

//    private AdvertisementStoreMapper mapper = sqlSession.getMapper(AdvertisementStoreMapper.class);
}
