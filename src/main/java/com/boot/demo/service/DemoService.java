package com.boot.demo.service;

import com.boot.demo.dao.*;
import com.boot.demo.model.BannerImage;
import com.boot.demo.model.request.login.user.DemoUserLoginRequest;
import com.boot.demo.model.response.home.HomePaybackStore;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.home.HomeVendor;
import com.boot.demo.model.response.login.DemoUserLoginResponse;
import com.boot.demo.model.response.login.LoginCheck;
import com.boot.demo.model.response.login.UserRegistration;
import com.boot.demo.response.IntegerRes;
import com.boot.demo.response.Message;
import com.boot.demo.response.StatusCode;
import com.boot.demo.response.StringRes;
import com.boot.demo.util.Time;
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
    public Message homeScreen(String user_no_param, String vendor_no_param) {
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
        return message;
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
        if(is_register){
            // Register
            UserRegistration newUser = new UserRegistration();
            newUser.setName("유저" + newUser.getUser_no());
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
            if(!(loginCheck.getBank_name() != null && loginCheck.getBank_account() != null && loginCheck.getBank_owner() != null)){
                return new ResponseEntity(StringRes.res(StatusCode.MORE_INFORMATION, message.getHashMap()), HttpStatus.OK);
            } else {
                return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
            }
        }
    }
}
