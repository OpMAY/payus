package com.mvsolutions.payus.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.basic.UserNotificationJson;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Log4j2
public class JsonObjectTypeHandler<T extends Object> extends BaseTypeHandler<T> {
    private Class<T> tClass;

    public JsonObjectTypeHandler(Class<T> tClass) {
        if (tClass == null) throw new IllegalArgumentException("Type argument cannot be null");
        this.tClass = tClass;
    }

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, T t, JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, new Gson().toJson(t));
    }

    @Override
    public T getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return convertToObject(resultSet.getString(s));
    }

    @Override
    public T getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return convertToObject(resultSet.getString(i));
    }

    @Override
    public T getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return convertToObject(callableStatement.getString(i));
    }

    private T convertToObject(String jsonString) {
        try {
            // 둘다 가능
//            return new Gson().fromJson(jsonString, tClass);
            return new ObjectMapper().readValue(jsonString, tClass);
        } catch (Exception e) {
            log.error("JSONTypeHandler failed to convert jsonString to list, JSON String : " + jsonString, e);
        }
        return null;
    }
}
