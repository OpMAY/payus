package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.StoreOptionMapper;
import com.mvsolutions.payus.model.rest.basic.Goods;
import com.mvsolutions.payus.model.rest.basic.StoreInformation;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreOptionResponse;
import com.mvsolutions.payus.model.rest.basic.StoreService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StoreOptionDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    private StoreOptionMapper initMapper() {
        return sqlSession.getMapper(StoreOptionMapper.class);
    }

    public StoreOptionResponse getStoreOption(int store_no) {
        List<StoreService> serviceList = initMapper().getStoreServiceList(store_no);
        List<StoreInformation> informationList = initMapper().getStoreInformationList(store_no);
        List<Goods> goodsList = initMapper().getStoreGoodsList(store_no);
        StoreOptionResponse response = new StoreOptionResponse();
        response.setStore_no(store_no);
        response.setService_list(serviceList);
        response.setInformation(informationList);
        response.setGoods_list(goodsList);
        return response;
    }

//    private RoomMapper mapper = sqlSession.getMapper(RoomMapper.class);
}
