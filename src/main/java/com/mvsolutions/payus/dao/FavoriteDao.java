package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.FavoriteMapper;
import com.mvsolutions.payus.model.rest.request.storedetailpage.UserInsertStoreFavoriteRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserFavoriteDeleteRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserFavoriteListPageResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FavoriteDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession) {
        if (this.sqlSession == null) {
            this.sqlSession = sqlSession;
        }
    }

    public List<UserFavoriteListPageResponse> getUserFavorites(int user_no, int class_first) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        return mapper.getUserFavorites(user_no, class_first);
    }

    public boolean checkFavoriteExists(int last_index) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        return mapper.checkFavoriteExists(last_index);
    }

    public List<UserFavoriteListPageResponse> getUserFavoritesReload(int user_no, int class_first, int last_index) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        return mapper.getUserFavoritesReload(user_no, class_first, last_index);
    }

    public void deleteUserFavorite(UserFavoriteDeleteRequest request) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        mapper.deleteUserFavorite(request);
    }

    public boolean checkUserFavoriteStatus(int user_no, int store_no) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        return mapper.checkUserFavoriteStatus(user_no, store_no);
    }

    public void userInsertStoreFavorite(UserInsertStoreFavoriteRequest request) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        mapper.userInsertStoreFavorite(request);
    }

    public void deleteUserFavoriteByUserAndStoreNo(int user_no, int store_no) {
        FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
        mapper.deleteUserFavoriteByUserAndStoreNo(user_no, store_no);
    }

//    private FavoriteMapper mapper = sqlSession.getMapper(FavoriteMapper.class);
}
