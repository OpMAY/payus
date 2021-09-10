package com.boot.demo.util;

import com.boot.demo.dao.ReviewDao;
import com.boot.demo.dao.RoomDao;
import com.boot.demo.dao.StoreDao;
import com.boot.demo.dao.UserDao;
import com.boot.demo.model.Review;
import com.boot.demo.model.Room;
import com.boot.demo.model.Store;
import com.boot.demo.model.response.detail.ReviewStoreUpdate;
import com.boot.demo.model.response.home.HomeUser;
import com.boot.demo.model.utility.demoaddress.Item;
import com.boot.demo.model.utility.demoaddress.Root;
import com.boot.demo.response.demostore.DemoStoreCategory;
import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import lombok.extern.log4j.Log4j;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Log4j
@Service
public class DemoStoreAddressService {
    @Autowired
    private StoreDao storeDao;

    @Autowired
    private ReviewDao reviewDao;

    @Autowired
    private RoomDao roomDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private SqlSession sqlSession;

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertStores(int number) throws Exception {
        storeDao.setSqlSession(sqlSession);
        DemoStoreAddressApi api = new DemoStoreAddressApi();
        String urlBuilder = api.urlBuild(number);
        URL url = new URL(urlBuilder);
        HttpResponse res = api.goRequest(url.toString());
        String result = IOUtils.toString(res.getEntity().getContent(), StandardCharsets.UTF_8).trim();
        log.info(result);
        JsonReader reader = new JsonReader(new StringReader(result));
        reader.setLenient(true);
        Root root = new Gson().fromJson(reader, Root.class);
        Random random = new Random();
        String now = Time.TimeFormatHMS();
        List<String> imageList = new ArrayList<>();
        String image1 = "https://image-notepet.akamaized.net/resize/620x-/seimage/20191114%2F6a4c967c5b14197dd5d2c47424ae8e82.jpg";
        String image2 = "http://kormedi.com/wp-content/uploads/2021/01/eab3a0ec9691ec9db4-580x387.jpg";
        String image3 = "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg";
        imageList.add(image1);
        imageList.add(image2);
        imageList.add(image3);
        List<Item> itemList = root.getBody().getItems();
        for (Item item : itemList) {
            String store_name = item.getBizesNm() + item.getBrchNm();
            String store_class = item.getIndsMclsNm();
            String full_address = item.getLnoAdr();
            String full_road_address = item.getRdnmAdr();
            String adrs_1depth = item.getCtprvnNm();
            String adrs_2depth = item.getSignguNm();
            String adrs_3depth = item.getAdongNm();
            String adrs_3depth_h = item.getLdongNm();
            String building_name = item.getBldNm();
            double lon = item.getLon();
            double lat = item.getLat();
            Store store = new Store();
            store.setStore_name(store_name);
            store.setImage_list(imageList.toString());
            if (store_class.contains("모텔")) {
                if (getRandomBoolean())
                    store.setCategory(DemoStoreCategory.MOTEL);
                else
                    store.setCategory(DemoStoreCategory.RENT);
            } else if (store_class.contains("호텔")) {
                store.setCategory(DemoStoreCategory.HOTEL);
            } else if (store_class.contains("펜션")) {
                if (getRandomBoolean())
                    store.setCategory(DemoStoreCategory.PENSION);
                else
                    store.setCategory(DemoStoreCategory.CAMPING);
            } else if (store_class.contains("유스호스텔")) {
                if (getRandomBoolean())
                    store.setCategory(DemoStoreCategory.GUEST_HOUSE);
                else
                    store.setCategory(DemoStoreCategory.RESORT);
            }
            if (getRandomBoolean()) {
                store.setPayback_ratio(10);
            } else {
                store.setPayback_ratio(20);
            }
            store.setExplain("숙소에 대한 간단한 설명이니 잘 참고하시고 테스트 데이터 너무 많아요");
            store.setStar_ratio(0);
            store.setReview_num(0);
            store.setAddress(full_address);
            List<Integer> serviceList = new ArrayList<>();
            for (int i = 1; i < 7; i++) {
                if (getRandomBoolean()) {
                    serviceList.add(i);
                }
            }
            store.setService_list(serviceList.toString());
            store.setInformation("이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다.");
            store.setReg_date(now);
            store.setThumbnail(image1);
            store.setAddress_1depth(adrs_1depth);
            store.setAddress_2depth(adrs_2depth);
            store.setAddress_3depth(adrs_3depth);
            store.setAddress_3depth_h(adrs_3depth_h);
            store.setAddress_x(lon);
            store.setAddress_y(lat);
            store.setShort_address(adrs_1depth + " " + adrs_2depth);
            int price = random.nextInt(15);
            if (price == 0)
                price++;
            store.setPrice(price);
            storeDao.insertStores(store);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updatePrices() {
        storeDao.setSqlSession(sqlSession);
        Random random = new Random();
        for (int i = 1; i <= 38269; i++) {
            int price = random.nextInt(15);
            if (price == 0)
                price++;
            storeDao.updatePrices(price * 10000, i);
        }
    }

    public boolean getRandomBoolean() {
        return Math.random() < 0.5;
        //I tried another approaches here, still the same result
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertReviews() {
        storeDao.setSqlSession(sqlSession);
        roomDao.setSqlSession(sqlSession);
        reviewDao.setSqlSession(sqlSession);
        userDao.setSqlSession(sqlSession);
        HomeUser user = userDao.getUserInfoByUserNoForHome(1);
        Random random = new Random();
        List<Review> reviewList = new ArrayList<>();
        List<Review> reviewList1 = new ArrayList<>();
        List<Review> reviewList2 = new ArrayList<>();
        List<Review> reviewList3 = new ArrayList<>();
        for (int i = 1; i <= 38269; i++) {
            for (int j = 0; j < 4; j++) {
                int tmp = random.nextInt(50);
                if (tmp == 0)
                    tmp++;
                float sRatio = (float) tmp * 0.1f;
                Review review = new Review();
                review.setStore_no(i);
                review.setUser_no(user.getUser_no());
                review.setReg_date(Time.TimeFormatHMS());
                review.setReview_ratio(sRatio);
                List<String> imageList = new ArrayList<>();
                String image1 = "https://image-notepet.akamaized.net/resize/620x-/seimage/20191114%2F6a4c967c5b14197dd5d2c47424ae8e82.jpg";
                String image2 = "http://kormedi.com/wp-content/uploads/2021/01/eab3a0ec9691ec9db4-580x387.jpg";
                String image3 = "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg";
                imageList.add(image1);
                imageList.add(image2);
                imageList.add(image3);
                review.setImage_list(imageList.toString());
                review.setContent(j + "번째 리뷰, 리뷰 테스트 컨텐츠 입니다. 리뷰 테스트 컨텐츠 입니다. 리뷰 테스트 컨텐츠 입니다. 리뷰 테스트 컨텐츠 입니다. 리뷰 테스트 컨텐츠 입니다.");
                review.set_answered(false);
                review.setUser_name(user.getName());
                reviewList.add(review);
            }
        }
        log.info("ReviewList Size : " + reviewList.size());
        for (int i = 0; i < 1000; i++) {
            log.info(i + "번째 try");
            int start_idx = i * 500;
            int last_idx = (i + 1) * 500;
            if (reviewList.size() <= start_idx) {
                break;
            } else if (reviewList.size() <= last_idx) {
                last_idx = reviewList.size() - 1;
            }
            reviewList1 = reviewList.subList(start_idx, last_idx);
            reviewDao.insertReviews(reviewList1);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateStoreByReview(){
        reviewDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        for(int i = 1; i <= 38269; i++){
            List<ReviewStoreUpdate> reviewList = reviewDao.getSimpleReviewList(i);
            int review_num = reviewList.size();
            float avg_star_ratio = 0;
            for(ReviewStoreUpdate review : reviewList){
                avg_star_ratio = avg_star_ratio + review.getReview_ratio();
            }
            avg_star_ratio = avg_star_ratio / reviewList.size();
            storeDao.updateStoreForReview(i, review_num, avg_star_ratio);
        }
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void answerReview() {

    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void updateImages(){
        storeDao.setSqlSession(sqlSession);
        List<String> imageList = new ArrayList<>();
        String image1 = "https://image-notepet.akamaized.net/resize/620x-/seimage/20191114%2F6a4c967c5b14197dd5d2c47424ae8e82.jpg";
        String image2 = "http://kormedi.com/wp-content/uploads/2021/01/eab3a0ec9691ec9db4-580x387.jpg";
        String image3 = "https://t1.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/user/4arX/image/rZ1xSXKCJ4cd-IExOYahRWdrqoo.jpg";
        imageList.add(image1);
        imageList.add(image2);
        imageList.add(image3);
        String json = new Gson().toJson(imageList);
        storeDao.updateImages(json);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertRooms() {
        roomDao.setSqlSession(sqlSession);
        storeDao.setSqlSession(sqlSession);
        Map<Integer, String> roomInfo = new HashMap<>();
        roomInfo.put(0, "Classic Single");
        roomInfo.put(1, "Classic Double");
        roomInfo.put(2, "Deluxe Single");
        roomInfo.put(3, "Deluxe Double");
        roomInfo.put(4, "Deluxe Twin");
        roomInfo.put(5, "Premium Single");
        roomInfo.put(6, "Premium Double");
        roomInfo.put(7, "Suite Room");
        String room_option = "";
        String thumb = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/63/d5/dc/caption.jpg?w=600&h=300&s=1";
        List<Room> roomList = new ArrayList<>();
        List<Room> roomList1 = new ArrayList<>();
        for(int i = 1; i <= 38269; i++) {
            for(int j = 0; j < 8; j++) {
                int price = 0;
                Room room = new Room();
                room.setStore_no(i);
                room.setName(roomInfo.get(j).toUpperCase());
                room.setThumbnail(thumb);
                if(j == 0 || j == 2 || j == 5){
                    room_option = "기준 2인/최대 2인";
                } else if (j == 1 || j == 3||j==4 || j == 6){
                    room_option = "기준 2인/최대 4인";
                } else {
                    room_option = "기준 4인/최대 8인";
                }
                room.setRoom_option(room_option);
                room.setExplain(roomInfo.get(j) + "는 편안한 숙박 환경을 제공합니다.");
                if(roomInfo.get(j).contains("Single")){
                    price = price + 30000;
                } else if (roomInfo.get(j).contains("Double")){
                    price = price + 40000;
                }
                if(roomInfo.get(j).contains("Classic")){
                    price = price + 50000;
                } else if (roomInfo.get(j).contains("Deluxe")) {
                    price = price + 70000;
                } else if (roomInfo.get(j).contains("Premium")) {
                    price = price + 100000;
                } else if (roomInfo.get(j).equals("Suite Room")) {
                    price = price + 250000;
                }
                room.setPrice(price);
                room.setPrice_option("대실 5시간 50,000원");
                room.setReg_date(Time.TimeFormatHMS());
                roomList.add(room);
            }
        }
        for(int i = 0; i < 1000; i++){
            log.info((i+1) + "번째 try");
            int start_idx = i * 500;
            int last_idx = (i + 1) * 500;
            if (roomList.size() <= start_idx) {
                break;
            } else if (roomList.size() <= last_idx) {
                last_idx = roomList.size() - 1;
            }
            log.info("From " + start_idx + " To " + last_idx);
            roomList1 = roomList.subList(start_idx, last_idx);
            roomDao.insertRoom(roomList1);
        }
    }
}
