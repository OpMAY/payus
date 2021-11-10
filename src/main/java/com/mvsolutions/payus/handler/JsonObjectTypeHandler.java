package com.mvsolutions.payus.handler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@Log4j
public class JsonObjectTypeHandler<T> extends BaseTypeHandler<T> {

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

    private T convertToObject(String jsonString){
        try{
            return new ObjectMapper().readValue(jsonString, new TypeReference<T>() {
            });
        } catch (IOException e){
            log.error("JSONTypeHandler failed to convert jsonString to list, JSON String : " + jsonString, e);
        }
        return null;
    }
}
