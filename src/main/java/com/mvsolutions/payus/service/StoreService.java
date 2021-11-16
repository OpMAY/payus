package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.model.rest.request.usermypage.UserFavoriteDeleteRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserFavoriteListPageResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.StoreType;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Log4j
@Service
public class StoreService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private FavoriteDao favoriteDao;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private VendorDao vendorDao;

    @Autowired
    private StoreLodgementDao storeLodgementDao;


    @Transactional(readOnly = true)
    public ResponseEntity getUserFavoritePage(int user_no) throws JSONException {
        Message message = new Message();
        favoriteDao.setSqlSession(sqlSession);
        // 전체 즐겨찾기
        List<UserFavoriteListPageResponse> allFavoriteList = favoriteDao.getUserFavorites(user_no, StoreType.ALL);
        // 숙박 즐겨찾기
        List<UserFavoriteListPageResponse> favoriteList1 = favoriteDao.getUserFavorites(user_no, StoreType.LODGEMENT);
        // 식당 즐겨찾기
        List<UserFavoriteListPageResponse> favoriteList2 = favoriteDao.getUserFavorites(user_no, StoreType.RESTAURANT);
        // 병원 즐겨찾기
        List<UserFavoriteListPageResponse> favoriteList3 = favoriteDao.getUserFavorites(user_no, StoreType.HOSPITAL);
        // 식료품 즐겨찾기
        List<UserFavoriteListPageResponse> favoriteList5 = favoriteDao.getUserFavorites(user_no, StoreType.GROCERY);
        // 쇼핑 즐겨찾기
        List<UserFavoriteListPageResponse> favoriteList4 = favoriteDao.getUserFavorites(user_no, StoreType.SHOPPING);
        message.put("favorite0", allFavoriteList);
        message.put("favorite1", favoriteList1);
        message.put("favorite2", favoriteList2);
        message.put("favorite3", favoriteList3);
        message.put("favorite4", favoriteList4);
        message.put("favorite5", favoriteList5);
        // last_index
        if (allFavoriteList.size() > 0)
            message.put("last_index0", allFavoriteList.get(allFavoriteList.size() - 1).getFavorite_no());
        if (favoriteList1.size() > 0)
            message.put("last_index1", favoriteList1.get(favoriteList1.size() - 1).getFavorite_no());
        if (favoriteList2.size() > 0)
            message.put("last_index2", favoriteList2.get(favoriteList2.size() - 1).getFavorite_no());
        if (favoriteList3.size() > 0)
            message.put("last_index3", favoriteList3.get(favoriteList3.size() - 1).getFavorite_no());
        if (favoriteList4.size() > 0)
            message.put("last_index4", favoriteList4.get(favoriteList4.size() - 1).getFavorite_no());
        if (favoriteList5.size() > 0)
            message.put("last_index5", favoriteList5.get(favoriteList5.size() - 1).getFavorite_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserFavoritePage()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserFavoritePageReload(int user_no, int class_first, int last_index) throws JSONException {
        Message message = new Message();
        favoriteDao.setSqlSession(sqlSession);
        if (!favoriteDao.checkFavoriteExists(last_index)) {
            // 리로딩 중 삭제 여부 R400
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<UserFavoriteListPageResponse> favoriteList = favoriteDao.getUserFavoritesReload(user_no, class_first, last_index);
        message.put("favorite", favoriteList);
        if (favoriteList.size() > 0)
            message.put("last_index", favoriteList.get(favoriteList.size() - 1).getFavorite_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserFavoritePageReload()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity deleteUserFavorite(UserFavoriteDeleteRequest request) {
        favoriteDao.setSqlSession(sqlSession);
        favoriteDao.deleteUserFavorite(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }
}
