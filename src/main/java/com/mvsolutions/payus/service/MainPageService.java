package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.model.rest.request.GeoCodeAddressRequest;
import com.mvsolutions.payus.model.rest.request.MainPageReloadingRequest;
import com.mvsolutions.payus.model.rest.request.MainPageRequest;
import com.mvsolutions.payus.model.rest.response.*;
import com.mvsolutions.payus.model.utility.kakaolocation.Documents;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.StoreType;
import com.mvsolutions.payus.util.KakaoLocationService;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

/**
 * 설명 : 메인 페이지 관련 서비스
 **/
@Service
@Log4j
public class MainPageService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private KakaoLocationService kakaoLocationService;

    @Autowired
    private UserDao userDao;

    @Autowired
    private AdvertisementBannerDao advertisementBannerDao;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private StoreLodgementDao storeLodgementDao;

    @Autowired
    private NotificationUserDao notificationUserDao;

    @Transactional(readOnly = true)
    public ResponseEntity getMainPage(MainPageRequest request) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        advertisementBannerDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        storeLodgementDao.setSqlSession(sqlSession);
        notificationUserDao.setSqlSession(sqlSession);

        // 로그인 한 상태일 시 (유저 넘버 존재 시) 유저 정보 제공
        if (request.getUser_no() != 0) {
            // 유저 정보
            MainPageUser user = userDao.getUserForMainPage(request.getUser_no());
            message.put("user", user);

            // 읽지 않은 알림에 대한 여부
            boolean notification_uncheck = notificationUserDao.checkUserNotificationUnread(request.getUser_no());
            message.put("notification_uncheck", notification_uncheck);
        } else {
            message.put("notification_uncheck", false);
        }

        // 배너 리스트 제공
        List<MainPageAdvertisementBanner> bannerList = advertisementBannerDao.getBannersForMainPage();
        message.put("banner_list", bannerList);

        // 받은 주소로 좌표 확인
//        String result = kakaoLocationService.getLocationCoordinates(request.getAddress());
//        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
//        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
//        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        double x = 127.070361832869;
        double y = 37.5406780333481;

        // 해당 좌표 내 50KM (OR 100KM) 내의 랜덤 상점 리스트 (30개)를 불러옴
        List<MainPageStore> lodgementStoreList = storeDao.getStoreListForMain(x, y, StoreType.LODGEMENT);
        message.put("store_list1", lodgementStoreList);
        if (lodgementStoreList.size() > 0)
            message.put("last_index1", lodgementStoreList.get(lodgementStoreList.size() - 1).getStore_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getMainPage()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getMainReload(MainPageReloadingRequest request) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);

        if (!storeDao.checkStoreExists(request.getLast_index())) {
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }

        // 받은 주소로 좌표 확인
//        String result = kakaoLocationService.getLocationCoordinates(request.getAddress());
//        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
//        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
//        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        double x = 127.070361832869;
        double y = 37.5406780333481;

        // 받은 last_index, class_first 로 리로딩 작업
        double last_index_distance = storeDao.getDistanceOfLastIndex(x, y, request.getLast_index());
        List<MainPageStore> mainPageStoreList = storeDao.getStoreListForMainReload(request.getClass_first(), last_index_distance, request.getLast_index(), x, y);
        message.put("store_list" + request.getClass_first(), mainPageStoreList);
        if (mainPageStoreList.size() > 0)
            message.put("last_index" + request.getClass_first(), mainPageStoreList.get(mainPageStoreList.size() - 1).getStore_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getMainReload()")), HttpStatus.OK);
    }

    public ResponseEntity getGeoCodeCoordinates(GeoCodeCoordinateRequest request) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        String result = kakaoLocationService.getCoordinateToAddress(request.getX(), request.getY());
        KakaoLocationResponse response = new Gson().fromJson(result, KakaoLocationResponse.class);
        log.info(result);
        log.info(response);
        GeoCodeAddressResponse addressResponse = new GeoCodeAddressResponse();
        if (response.getDocuments().size() > 0) {
            if (response.getDocuments().get(0).getRoad_address() != null)
                addressResponse.setRoad_address(response.getDocuments().get(0).getRoad_address().getAddress_name());
            if (response.getDocuments().get(0).getAddress() != null)
                addressResponse.setJibun_address(response.getDocuments().get(0).getAddress().getAddress_name());
            message.put("address", addressResponse);
        } else {
            return new ResponseEntity(StringRes.res(StatusCode.COORDINATE_ERROR), HttpStatus.OK);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }
}
