package com.boot.demo.service;

import com.boot.demo.dao.*;
import com.boot.demo.model.BannerImage;
import com.boot.demo.model.response.home.HomePaybackStore;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.response.home.HomeVendor;
import com.boot.demo.response.Message;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
}
