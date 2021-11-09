package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.AdvertisementBannerMapper;
import com.mvsolutions.payus.model.rest.basic.AdvertisementBanner;
import com.mvsolutions.payus.model.rest.response.MainPageAdvertisementBanner;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdvertisementBannerDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<MainPageAdvertisementBanner> getBannersForMainPage() {
        AdvertisementBannerMapper mapper = sqlSession.getMapper(AdvertisementBannerMapper.class);
        return mapper.getBannersForMainPage();
    }
}
