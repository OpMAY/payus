package com.boot.demo.util;

import com.boot.demo.dao.StoreDao;
import com.boot.demo.model.Store;
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

import java.io.Reader;
import java.io.StringReader;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

@Log4j
@Service
public class DemoStoreAddressService {
    @Autowired
    private StoreDao storeDao;

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
            storeDao.insertStores(store);
        }
    }

    public boolean getRandomBoolean() {
        return Math.random() < 0.5;
        //I tried another approaches here, still the same result
    }
}
