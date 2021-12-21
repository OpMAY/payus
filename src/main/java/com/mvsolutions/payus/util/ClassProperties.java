package com.mvsolutions.payus.util;

import com.mvsolutions.payus.model.ColumnInfo;
import lombok.extern.log4j.Log4j2;

import java.lang.reflect.Field;
import java.util.*;


@Log4j2
public class ClassProperties {
    /**
     주석 생성 날짜 - 2021-09-14, 화, 11:11
     코드 설명 : 특정 클래스에 대해 정보를 받아오는 Util
     특이 사항 : 해당 클래스에 선언된 변수들을 받아옴
     **/
    public static <T> Map<String, Class<?>> getClassComponents(Class<T> object){
        Field[] fields = object.getDeclaredFields();
        Map<String, Class<?>> classComponents = new LinkedHashMap<>();
        for(Field field : fields){
            classComponents.put(field.getName(), field.getType());
        }
        return classComponents;
    }

    /**
     주석 생성 날짜 - 2021-09-14, 화, 11:11
     코드 설명 : 특정 클래스의 변수와 DB의 컬럼 설명을 연동하는 함수
     특이 사항 : Excel 간편 제작 용도
     **/
    public static LinkedHashMap<String, String> getColumnInfoMap(List<ColumnInfo> infoList){
        LinkedHashMap<String, String> column_info = new LinkedHashMap<>();
        for(ColumnInfo info : infoList){
            log.info(info.getColumn_name() + " : " + info.getColumn_comment());
            column_info.put(info.getColumn_name(), info.getColumn_comment());
        }
        return column_info;
    }

    public static <T> String getClassName(Class<T> object){
        return object.getSimpleName();
    }
}
