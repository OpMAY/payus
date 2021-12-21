package com.mvsolutions.payus.service;

import com.google.gson.Gson;
import com.google.gson.stream.JsonReader;
import com.mvsolutions.payus.dao.StoreDao;
import com.mvsolutions.payus.dao.StoreLodgementDao;
import com.mvsolutions.payus.model.ColumnInfo;
import com.mvsolutions.payus.model.rest.basic.Room;
import com.mvsolutions.payus.model.rest.basic.Store;
import com.mvsolutions.payus.model.rest.basic.StoreLodgement;
import com.mvsolutions.payus.model.rest.basic.StoreService;
import com.mvsolutions.payus.model.utility.demoaddress.Item;
import com.mvsolutions.payus.model.utility.demoaddress.Root;
import com.mvsolutions.payus.response.payus.LodgementType;
import com.mvsolutions.payus.response.payus.StoreType;
import com.mvsolutions.payus.util.ClassProperties;
import com.mvsolutions.payus.util.DemoStoreAddressApi;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.StringReader;
import java.lang.reflect.Field;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.*;

@Log4j2
@Service
public class HomeService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private StoreLodgementDao storeLodgementDao;

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertStores(int number) throws Exception {
        storeDao.setSqlSession(sqlSession);
        storeLodgementDao.setSqlSession(sqlSession);
        DemoStoreAddressApi api = new DemoStoreAddressApi();
        String urlBuilder = api.urlBuild(number);
        URL url = new URL(urlBuilder);
        HttpResponse res = api.goRequest(url.toString());
        String result = IOUtils.toString(res.getEntity().getContent(), StandardCharsets.UTF_8).trim();
        JsonReader reader = new JsonReader(new StringReader(result));
        reader.setLenient(true);
        Root root = new Gson().fromJson(reader, Root.class);
        String now = Time.TimeFormatHMS();
        List<String> imageList = new ArrayList<>();
        String image1 = "http://okiwi.gabia.io/images/sample_hotle_img_1.png";
        String image2 = "http://okiwi.gabia.io/images/sample_hotle_img_2.png";
        String image3 = "http://okiwi.gabia.io/images/sample_hotle_img_3.png";
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
            store.setClass_first(StoreType.LODGEMENT);
            store.setName(store_name);
            store.setImg_list(new Gson().toJson(imageList));
            if (store_class.contains("모텔")) {
                    store.setClass_second(LodgementType.MOTEL);
            } else if (store_class.contains("호텔")) {
                store.setClass_second(LodgementType.HOTEL);
            } else if (store_class.contains("펜션")) {
                if (getRandomBoolean())
                    store.setClass_second(LodgementType.PENSION);
                else
                    store.setClass_second(LodgementType.GLAMPING);
            } else if (store_class.contains("유스호스텔")) {
                if (getRandomBoolean())
                    store.setClass_second(LodgementType.GUESTHOUSE);
            }
            if (getRandomBoolean()) {
                store.setPayback_rate(10);
            } else {
                store.setPayback_rate(20);
            }
            store.setExplain("숙소에 대한 간단한 설명이니 잘 참고하시고 테스트 데이터 너무 많아요");
            store.setStar_rate(0);
            store.setReview_num(0);
            store.setAddress(full_address);
            store.setExplain("가게 간단 설명입니다.");
            store.setPhone("010-4993-8620");
            store.setReg_date(now);
            store.setThumbnail(image1);
            store.setAddress_road(full_road_address);
            store.setAddress_1depth(adrs_1depth);
            store.setAddress_2depth(adrs_2depth);
            store.setAddress_3depth(adrs_3depth);
            store.setAddress_x(lon);
            store.setAddress_y(lat);
            store.setAddress_short(adrs_1depth + " " + adrs_2depth);
            store.setVendor_no(1);
            storeDao.insertStore(store);

            List<StoreService> storeServiceList = new ArrayList<>();
            for(int i = 0; i < 5; i++){
                StoreService storeService = new StoreService();
                storeService.setTitle("서비스" + (i + 1));
                storeService.setContent("서비스 내용");
                storeServiceList.add(storeService);
            }

            StoreLodgement storeLodgement = new StoreLodgement();
            storeLodgement.setService_list(new Gson().toJson(storeServiceList));
            storeLodgement.setStore_no(store.getStore_no());
            storeLodgement.setInformation("이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다. 이용 안내에 관한 부분입니다.");
            List<String> roomNameList = new ArrayList<>();
            List<Room> roomList = new ArrayList<>();
            roomNameList.add("Classic Single");
            roomNameList.add("Classic Double");
            roomNameList.add("Deluxe Single");
            roomNameList.add("Deluxe Double");
            roomNameList.add("Deluxe Twin");
            roomNameList.add("Premium Single");
            roomNameList.add("Premium Double");
            roomNameList.add("Suite Room");
            for(String str : roomNameList) {
                Room room = new Room();
                room.setName(str);
                room.setPrice(50000);
                room.setRoom_explain("기준 2인/최대 2인");
                room.setRoom_img(image3);
                roomList.add(room);
            }
            storeLodgement.setRoom_options(new Gson().toJson(roomList));
            storeLodgementDao.insertLodgement(storeLodgement);
        }
    }


    public boolean getRandomBoolean() {
        return Math.random() < 0.5;
        //I tried another approaches here, still the same result
    }

//    public void sqlColumnNameTest() {
//        testDao.setSqlSession(sqlSession);
//        List<ColumnInfo> infoList = testDao.sqlColumnNameTest();
//        Map<String, String> map = ClassProperties.getColumnInfoMap(infoList);
//    }

    public <T> void doTest(Map<String, String> column_info, Map<String, Class<?>> components, List<Object> objectList, Class<T> objectClass) {
        try {
            log.info(column_info);
            log.info(components);
            String className = ClassProperties.getClassName(objectClass);
            log.info(className);
            if (className.equals("Artist")) {
                log.info("Artist class");
                /*List<Artist> artistList =
                        objectList.stream()
                                .filter(element -> element instanceof Artist)
                                .map(element -> (Artist) element)
                                .collect(Collectors.toList());*/

                Field field = objectList.get(0).getClass().getDeclaredField("artist_name");
                field.setAccessible(true);
                Object value = field.get(objectList.get(0));
                log.info(value);
            }
        } catch (Exception e) {
            log.error("", e);
        }
    }
}
