package com.boot.demo.service;

import com.boot.demo.dao.*;
import com.boot.demo.model.BannerImage;
import com.boot.demo.model.request.login.user.DemoUserLoginRequest;
import com.boot.demo.model.request.login.user.register.DemoUserBankRequest;
import com.boot.demo.model.request.login.vendor.DemoVendorLoginRequest;
import com.boot.demo.model.response.detail.StoreDetailResponse;
import com.boot.demo.model.response.detail.StoreReviewComponents;
import com.boot.demo.model.response.detail.StoreRoomComponents;
import com.boot.demo.model.response.home.HomePaybackStore;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.home.HomeVendor;
import com.boot.demo.model.response.login.user.DemoUserLoginResponse;
import com.boot.demo.model.response.login.user.LoginCheck;
import com.boot.demo.model.response.login.user.UserRegistration;
import com.boot.demo.model.response.login.vendor.VendorLoginResponse;
import com.boot.demo.model.response.main.RecommendedStore;
import com.boot.demo.model.response.main.StoreNoCheck;
import com.boot.demo.model.utility.kakaolocation.KakaoLocationResponse;
import com.boot.demo.response.IntegerRes;
import com.boot.demo.response.Message;
import com.boot.demo.response.StatusCode;
import com.boot.demo.response.StringRes;
import com.boot.demo.util.KakaoLocationService;
import com.boot.demo.util.Time;
import com.google.gson.Gson;
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
import java.util.UUID;

@Log4j
@Service
public class DemoService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserDao userDao;

    @Autowired
    private BannerImageDao bannerImageDao;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private RoomDao roomDao;

    @Autowired
    private StoreLikeDao storeLikeDao;

    @Autowired
    private VendorDao vendorDao;

    @Transactional(readOnly = true)
    public ResponseEntity homeScreen(String user_no_param, String vendor_no_param) throws JSONException {
        userDao.setSqlSession(sqlSession);
        vendorDao.setSqlSession(sqlSession);
        bannerImageDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        Message message = new Message();
        if (user_no_param != null) {
            int user_no = Integer.parseInt(user_no_param);
            HomeUser homeUser = userDao.getUserInfoByUserNoForHome(user_no);
            message.put("user", homeUser);
        } else if (vendor_no_param != null) {
            int vendor_no = Integer.parseInt(vendor_no_param);
            HomeVendor homeVendor = vendorDao.getUserInfoByUserNoForHome(vendor_no);
            message.put("vendor", homeVendor);
        }
        List<BannerImage> bannerImageList = bannerImageDao.getBannerImageList();
        List<HomePaybackStore> today_payback = storeDao.getStoreRandomListForHome();
        List<HomePaybackStore> event_payback = storeDao.getStoreListOrderByPaybackRatioForHome();
        message.put("banner_image", bannerImageList);
        message.put("today_payback", today_payback);
        message.put("event_payback", event_payback);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity loginUser(DemoUserLoginRequest request) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        String access_token = request.getUser().getAccess_token();
        String sns = request.getUser().getSns();
        LoginCheck loginCheck = userDao.getUserLogin(access_token, sns);
        boolean is_register = loginCheck == null;
        message.put("is_register", is_register);
        UUID uuid = UUID.randomUUID();
        if (is_register) {
            // Register
            UserRegistration newUser = new UserRegistration();
            newUser.setName("유저" + uuid.toString().substring(0,5));
            newUser.setAccess_token(access_token);
            newUser.setReg_date(Time.TimeFormatHMS());
            newUser.setSns(sns);
            userDao.registerUser(newUser);
            DemoUserLoginResponse response = new DemoUserLoginResponse();
            response.setUser_no(newUser.getUser_no());
            message.put("user", response);
            return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
        } else {
            // Login
            DemoUserLoginResponse response = new DemoUserLoginResponse();
            response.setUser_no(loginCheck.getUser_no());
            message.put("user", response);
            if (!(loginCheck.getBank_name() != null && loginCheck.getBank_account() != null && loginCheck.getBank_owner() != null)) {
                return new ResponseEntity(StringRes.res(StatusCode.MORE_INFORMATION, message.getHashMap()), HttpStatus.OK);
            } else {
                return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
            }
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity bankUpdate(DemoUserBankRequest request) {
        userDao.setSqlSession(sqlSession);
        userDao.bankUpdate(request.getUser());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity loginVendor(DemoVendorLoginRequest request) throws JSONException {
        Message message = new Message();
        vendorDao.setSqlSession(sqlSession);
        String id = request.getVendor().getId();
        String password = request.getVendor().getPassword();
        VendorLoginResponse response = vendorDao.loginVendor(id, password);
        if (response == null) {
            return new ResponseEntity(StringRes.res(StatusCode.LOGIN_FAILED), HttpStatus.OK);
        } else {
            message.put("vendor", response);
            return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
        }
    }

    @Transactional(readOnly = true)
    public ResponseEntity getDemoMainPage(int category, String location) throws Exception {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        KakaoLocationService locationService = new KakaoLocationService();
        String coordinateResult = locationService.getLocationCoordinates(location);
        KakaoLocationResponse locationResponse = new Gson().fromJson(coordinateResult, KakaoLocationResponse.class);
        String x = locationResponse.getDocuments().get(0).getX();
        String y = locationResponse.getDocuments().get(0).getY();
        List<HomePaybackStore> storeList = storeDao.getStoreRandomListForMain(x, y, category);
        message.put("today_payback", storeList);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getDemoMainPageReload(int category, String location, int last_index) throws Exception {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        StoreNoCheck storeNoCheck = storeDao.checkStoreIsValid(last_index);
        if (last_index != 0) {
            if (storeNoCheck == null) {
                return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
            } else {
                KakaoLocationService locationService = new KakaoLocationService();
                String coordinateResult = locationService.getLocationCoordinates(location);
                KakaoLocationResponse locationResponse = new Gson().fromJson(coordinateResult, KakaoLocationResponse.class);
                String x = locationResponse.getDocuments().get(0).getX();
                String y = locationResponse.getDocuments().get(0).getY();

                double last_distance = storeDao.getDistanceOfLastIndex(x, y, last_index);
                List<RecommendedStore> recommends = storeDao.getStoreRecommendListForMainReload(x, y, category, last_index, last_distance);
                message.put("recommend", recommends);
                if (recommends.size() > 0) {
                    message.put("last_index", recommends.get(recommends.size() - 1).getStore_no());
                }
                return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
            }
        } else {
            KakaoLocationService locationService = new KakaoLocationService();
            String coordinateResult = locationService.getLocationCoordinates(location);
            KakaoLocationResponse locationResponse = new Gson().fromJson(coordinateResult, KakaoLocationResponse.class);
            String x = locationResponse.getDocuments().get(0).getX();
            String y = locationResponse.getDocuments().get(0).getY();
            List<RecommendedStore> recommends = storeDao.getStoreRecommendListForMain(x, y, category);
            message.put("recommend", recommends);
            if (recommends.size() > 0) {
                message.put("last_index", recommends.get(recommends.size() - 1).getStore_no());
            }
            return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
        }
    }

    @Transactional(readOnly = true)
    public ResponseEntity getStoreDetail(String param1, String param2, int store_no) throws JSONException {
        Message message = new Message();
        storeDao.setSqlSession(sqlSession);
        storeLikeDao.setSqlSession(sqlSession);
        reviewDao.setSqlSession(sqlSession);
        roomDao.setSqlSession(sqlSession);
        storeLikeDao.setSqlSession(sqlSession);
        StoreNoCheck storeNoCheck = storeDao.checkStoreIsValid(store_no);
        boolean is_validStore = storeNoCheck == null;
        int user_no = 0;
        int vendor_no = 0;
        if(param1 != null && !param1.equals("undefined")){
            user_no = Integer.parseInt(param1);
        } else if (param2 != null && !param2.equals("undefined")){
            vendor_no = Integer.parseInt(param2);
        }
        if(is_validStore){
            return new ResponseEntity(StringRes.res(StatusCode.DELETED_CONTENT), HttpStatus.OK);
        } else if(storeDao.checkStorePrivate(store_no)){
            return new ResponseEntity(StringRes.res(StatusCode.DENIED_CONTENT), HttpStatus.OK);
        } else {
            StoreDetailResponse response = storeDao.getStoreDetail(store_no);
            List<StoreRoomComponents> roomComponents = roomDao.getRoomsForDetail(store_no);
            List<StoreReviewComponents> reviewComponents = reviewDao.getReviewsForDetail(store_no);
            response.setReview_list(reviewComponents);
            response.setRoom_list(roomComponents);
            message.put("store", response);
            if(user_no != 0){
                boolean is_like = storeLikeDao.checkStoreLikeByUserNo(store_no, user_no);
                message.put("is_like", is_like);
            } else if(vendor_no != 0){
                boolean is_like = storeLikeDao.checkStoreLikeByVendorNo(store_no, vendor_no);
                message.put("is_like", is_like);
            }
            return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
        }
    }
}
