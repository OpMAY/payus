package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.GrantAccessDeniedException;
import com.mvsolutions.payus.model.rest.request.storedetailpage.StoreReportRequest;
import com.mvsolutions.payus.model.rest.request.storedetailpage.UserInsertStoreFavoriteRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserFavoriteDeleteRequest;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreDetailLodgementResponse;
import com.mvsolutions.payus.model.rest.response.storedetailpage.StoreDetailPageResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserFavoriteListPageResponse;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.StoreType;
import com.mvsolutions.payus.util.KakaoLocationService;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.net.URISyntaxException;
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

    @Autowired
    private KakaoLocationService kakaoLocationService;

    @Autowired
    private AdvertisementStoreDao advertisementStoreDao;

    @Autowired
    private ReportStoreDao reportStoreDao;


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


    @Transactional(readOnly = true)
    public ResponseEntity getStoreDetailPage(int store_no, int user_no, String address) throws JSONException, IOException, URISyntaxException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        favoriteDao.setSqlSession(sqlSession);
        advertisementStoreDao.setSqlSession(sqlSession);

        if (!storeDao.checkStoreExists(store_no)) {
            // 해당 상점 없을 때 S404
            return new ResponseEntity(StringRes.res(StatusCode.NO_STORE_FOUND), HttpStatus.OK);
        }

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        StoreDetailPageResponse storeDetail = storeDao.getStoreDetailPage(store_no, x, y);
        switch (storeDetail.getClass_first()) {
            case StoreType.LODGEMENT:
                storeLodgementDao.setSqlSession(sqlSession);
                StoreDetailLodgementResponse lodgementDetail = storeLodgementDao.getLodgementData(store_no);
                message.put("lodgement", lodgementDetail);
                break;
            case StoreType.RESTAURANT:
                // 미개발 상점들
                throw new GrantAccessDeniedException(BusinessExceptionType.NOT_ALLOWED_STORE);
            case StoreType.HOSPITAL:
                throw new GrantAccessDeniedException(BusinessExceptionType.NOT_ALLOWED_STORE);
            case StoreType.GROCERY:
                throw new GrantAccessDeniedException(BusinessExceptionType.NOT_ALLOWED_STORE);
            case StoreType.SHOPPING:
                throw new GrantAccessDeniedException(BusinessExceptionType.NOT_ALLOWED_STORE);
            default:
                throw new GrantAccessDeniedException(BusinessExceptionType.NOT_ALLOWED_STORE);
        }
        if (user_no != 0)
            message.put("favorite", favoriteDao.checkUserFavoriteStatus(user_no, store_no));

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getStoreDetailPage()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity userInsertStoreFavorite(UserInsertStoreFavoriteRequest request) {
        favoriteDao.setSqlSession(sqlSession);
        request.setReg_date(Time.TimeFormatHMS());
        if (!storeDao.checkStoreExists(request.getStore_no())) {
            // 상점 없을 때
            return new ResponseEntity(StringRes.res(StatusCode.NO_STORE_FOUND), HttpStatus.OK);
        }
        if (favoriteDao.checkUserFavoriteStatus(request.getUser_no(), request.getStore_no())) {
            // 즐겨찾기 했을 때
            favoriteDao.deleteUserFavoriteByUserAndStoreNo(request.getUser_no(), request.getStore_no());
        } else // 즐겨찾기 안했을 때
            favoriteDao.userInsertStoreFavorite(request);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity reportStore(StoreReportRequest reportRequest) {
        reportStoreDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        if (!storeDao.checkStoreExists(reportRequest.getStore_no())) {
            return new ResponseEntity(StringRes.res(StatusCode.NO_STORE_FOUND), HttpStatus.OK);
        }
        reportStoreDao.reportStore(reportRequest);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

}
