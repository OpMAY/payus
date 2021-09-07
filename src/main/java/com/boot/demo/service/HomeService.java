package com.boot.demo.service;

import com.boot.demo.dao.ArtistDao;
import com.boot.demo.dao.TestDao;
import com.boot.demo.model.Artist;
import com.boot.demo.model.ColumnInfo;
import com.boot.demo.util.ClassProperties;
import com.boot.demo.util.ExcelMaker;
import com.boot.demo.util.Time;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Log4j
@Service
public class HomeService {

    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private TestDao testDao;

    @Autowired
    private ArtistDao artistDao;

    public void sqlRollbackTest() {
        testDao.setSqlSession(sqlSession);
        testDao.sqlRollbackTest();
    }

    public void sqlColumnNameTest() {
        testDao.setSqlSession(sqlSession);
        List<ColumnInfo> infoList = testDao.sqlColumnNameTest();
        Map<String, String> map = ClassProperties.getColumnInfoMap(infoList);
    }

    public void excelTest() {
        artistDao.setSqlSession(sqlSession);
        List<ColumnInfo> columnInfoList = artistDao.getArtistColumnInfo();
        log.info(columnInfoList);
        List<Artist> artistList = artistDao.getArtistList();
        LinkedHashMap<String, String> map = ClassProperties.getColumnInfoMap(columnInfoList);
        Map<String, Class<?>> classComponents = ClassProperties.getClassComponents(Artist.class);
        List<Object> objectList = new ArrayList<Object>(artistList);
        ExcelMaker excelMaker = new ExcelMaker();
        String time = Time.TimeForFile();
        excelMaker.makeExcel(map, classComponents, objectList, "test" + time, "test");
    }

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
            e.printStackTrace();
        }
    }
}
