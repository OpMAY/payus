package com.boot.demo.util;

import com.boot.demo.model.ColumnInfo;
import lombok.extern.log4j.Log4j;

import java.lang.reflect.Field;
import java.util.*;

@Log4j
public class ClassProperties {
    public static <T> Map<String, Class<?>> getClassComponents(Class<T> object){
        Field[] fields = object.getDeclaredFields();
        Map<String, Class<?>> classComponents = new LinkedHashMap<>();
        for(Field field : fields){
            classComponents.put(field.getName(), field.getType());
        }
        return classComponents;
    }

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
