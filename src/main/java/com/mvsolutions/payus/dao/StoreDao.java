package com.mvsolutions.payus.dao;


import com.mvsolutions.payus.mapper.StoreMapper;
import com.mvsolutions.payus.model.rest.basic.Store;
import com.mvsolutions.payus.model.rest.response.mainpage.MainPageStore;
import com.mvsolutions.payus.model.rest.response.payushome.StoreKeywordSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.StoreMapSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.SubMainPageStoreResponse;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreDetailPageResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.PointStoreDataResponse;
import com.mvsolutions.payus.model.web.vendor.request.auth.StoreRegisterRequest;
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

    public PointStoreDataResponse getStorePaybackData(int vendor_no) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStorePaybackData(vendor_no);
    }

    public List<SubMainPageStoreResponse> getStoreListForSubMain(double x, double y, int class_first, int order_type, int class_second) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreListForSubMain(x, y, class_first, order_type, class_second);
    }

    public List<SubMainPageStoreResponse> getStoreListForSubMainReload(double x, double y, int class_first, int class_second, int order_type) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreListForSubMainReload(x, y, class_first, order_type, class_second);
    }

    public List<StoreKeywordSearchResponse> searchByKeywords(double x, double y, String keyword, int last_index) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.searchByKeywords(x, y, keyword, last_index);
    }

    public List<StoreMapSearchResponse> searchByMap(double x, double y) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.searchByMap(x, y);
    }

    public StoreDetailPageResponse getStoreDetailPage(int store_no, double x, double y) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreDetailPage(store_no, x, y);
    }

    public void updateStoreByReview(int store_no, int review_num, float star_rate) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        mapper.updateStoreByReview(store_no, review_num, star_rate);
    }

    public boolean checkPrivate(int store_no) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.checkPrivate(store_no);
    }

    public String getStoreNameByAccumulateNo(int accumulate_no) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        return mapper.getStoreNameByAccumulateNo(accumulate_no);
    }

    public void registerStore(StoreRegisterRequest storeRegisterRequest) {
        StoreMapper mapper = sqlSession.getMapper(StoreMapper.class);
        mapper.registerStore(storeRegisterRequest);
    }
}
