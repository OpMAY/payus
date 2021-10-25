package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.BannerImageMapper;
import com.mvsolutions.payus.model.demo.BannerImage;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class BannerImageDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public List<BannerImage> getBannerImageList(){
        BannerImageMapper bannerImageMapper = sqlSession.getMapper(BannerImageMapper.class);
        return bannerImageMapper.getBannerImageList();
    }
}
