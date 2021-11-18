package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.mvsolutions.payus.dao.*;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageReloadingRequest;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageRequest;
import com.mvsolutions.payus.model.rest.response.mainpage.*;
import com.mvsolutions.payus.model.rest.response.payushome.PayusHomeEventResponse;
import com.mvsolutions.payus.model.rest.response.payushome.StoreKeywordSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.StoreMapSearchResponse;
import com.mvsolutions.payus.model.rest.response.payushome.SubMainPageStoreResponse;
import com.mvsolutions.payus.model.utility.kakaolocation.KakaoLocationResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.StoreType;
import com.mvsolutions.payus.response.payus.SubMainStoreType;
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
import java.util.List;

/**
 * 설명 : 메인 페이지 + 서브 페이지 관련 서비스
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
    private AdvertisementStoreDao advertisementStoreDao;

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
        String result = kakaoLocationService.getLocationCoordinates(request.getAddress());
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

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
        String result = kakaoLocationService.getLocationCoordinates(request.getAddress());
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // 받은 last_index, class_first 로 리로딩 작업
        double last_index_distance = storeDao.getDistanceOfLastIndex(x, y, request.getLast_index());
        List<MainPageStore> mainPageStoreList = storeDao.getStoreListForMainReload(request.getClass_first(), last_index_distance, request.getLast_index(), x, y);
        message.put("store_list", mainPageStoreList);
        if (mainPageStoreList.size() > 0)
            message.put("last_index", mainPageStoreList.get(mainPageStoreList.size() - 1).getStore_no());

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

    @Transactional(readOnly = true)
    public ResponseEntity getSubMainPageEvents(String address, int class_first) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        advertisementStoreDao.setSqlSession(sqlSession);

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // 100KM 내의 숙소 중 이벤트를 진행 중인 숙소 목록을 받아옴
        List<PayusHomeEventResponse> eventList = advertisementStoreDao.getEventStoreList(x, y, class_first);
        message.put("event", eventList);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getSubMainPageEvents()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getSubMainPageStoreList(String address, int class_first, int order_type) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        advertisementStoreDao.setSqlSession(sqlSession);

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // class_first = 1 -> 숙박
        List<SubMainPageStoreResponse> allStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.ALL);
        List<SubMainPageStoreResponse> motelStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_MOTEL);
        List<SubMainPageStoreResponse> hotelStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_HOTEL);
        List<SubMainPageStoreResponse> pensionStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_PENSION);
        List<SubMainPageStoreResponse> guestHouseStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_GUESTHOUSE);
        List<SubMainPageStoreResponse> glampingStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_GLAMPING);
        List<SubMainPageStoreResponse> etcStoreList = storeDao.getStoreListForSubMain(x, y, class_first, order_type, SubMainStoreType.LODGEMENT_ETC);


        message.put("store0", allStoreList);
        message.put("store1", motelStoreList);
        message.put("store2", hotelStoreList);
        message.put("store3", pensionStoreList);
        message.put("store4", guestHouseStoreList);
        message.put("store5", glampingStoreList);
        message.put("store6", etcStoreList);
        message.put("order_type", order_type);
        // last_index 설정
        if (allStoreList.size() > 0)
            message.put("last_index0", allStoreList.get(allStoreList.size() - 1).getStore_no());
        if (motelStoreList.size() > 0)
            message.put("last_index1", motelStoreList.get(motelStoreList.size() - 1).getStore_no());
        if (hotelStoreList.size() > 0)
            message.put("last_index2", hotelStoreList.get(hotelStoreList.size() - 1).getStore_no());
        if (pensionStoreList.size() > 0)
            message.put("last_index3", pensionStoreList.get(pensionStoreList.size() - 1).getStore_no());
        if (guestHouseStoreList.size() > 0)
            message.put("last_index4", guestHouseStoreList.get(guestHouseStoreList.size() - 1).getStore_no());
        if (glampingStoreList.size() > 0)
            message.put("last_index5", glampingStoreList.get(glampingStoreList.size() - 1).getStore_no());
        if (etcStoreList.size() > 0)
            message.put("last_index6", etcStoreList.get(etcStoreList.size() - 1).getStore_no());


        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getSubMainPageStoreList()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getSubMainPageStoreListReload(String address, int class_first, int class_second, int order_type, int last_index) throws JSONException, IOException, URISyntaxException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        advertisementStoreDao.setSqlSession(sqlSession);
        if (!storeDao.checkStoreExists(last_index)) {
            // 리로딩 문제 : last_index에 해당하는 데이터 없음
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // 페이백률 정렬에 따른 데이터 설정 따로 필요
        List<SubMainPageStoreResponse> storeList = storeDao.getStoreListForSubMainReload(x, y, class_first, class_second, order_type);
        message.put("store", storeList);
        if (storeList.size() > 0)
            message.put("last_index", storeList.get(storeList.size() - 1).getStore_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getSubMainPageStoreListReload()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity searchByKeywords(String address, String keyword, int last_index) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);

        if(last_index != 0 && storeDao.checkStoreExists(last_index)) {
            // 리로딩 문제 : last_index에 해당하는 데이터 없음
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // 검색 결과
        message.put("keyword", keyword);
        List<StoreKeywordSearchResponse> searchList = storeDao.searchByKeywords(x, y, keyword, last_index);
        message.put("result", searchList);
        if (searchList.size() > 0)
            message.put("last_index", searchList.get(searchList.size() - 1).getStore_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("searchByKeywords(" + keyword + ")")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity searchByMap(double x, double y) throws JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        List<StoreMapSearchResponse> searchList = storeDao.searchByMap(x, y);
        if (searchList.size() == 0) {
            return new ResponseEntity(StringRes.res(StatusCode.NO_STORE_FOUND_ON_MAP), HttpStatus.OK);
        }
        message.put("result", searchList);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("searchByMap()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getEventPage(String address, int order_type, int last_index, int class_first) throws IOException, URISyntaxException, JSONException {
        Message message = new Message();
        advertisementStoreDao.setSqlSession(sqlSession);

        if (last_index != 0 && !storeDao.checkStoreExists(last_index)) {
            // 리로딩 할 때 last_index 에 해당하는 데이터 없을 때
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }

        // 받은 주소로 좌표 확인
        String result = kakaoLocationService.getLocationCoordinates(address);
        KakaoLocationResponse kakaoLocationResponse = new Gson().fromJson(result, KakaoLocationResponse.class);
        double x = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getX());
        double y = Double.parseDouble(kakaoLocationResponse.getDocuments().get(0).getY());

        // 이벤트 목록 전송 - 리로딩 포함
        List<PayusHomeEventResponse> eventList = advertisementStoreDao.getEventStorePageList(x, y, order_type, last_index, class_first);
        message.put("event", eventList);
        if (eventList.size() > 0)
            message.put("last_index", eventList.get(eventList.size() - 1).getStore_no());

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getEventPage()")), HttpStatus.OK);
    }
}
