package com.boot.demo.handler;

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
public class JsonTypeHandler<T> extends BaseTypeHandler<List<T>> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, List<T> ts, JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, new Gson().toJson(ts));
    }

    @Override
    public List<T> getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return convertToList(resultSet.getString(s));
    }

    @Override
    public List<T> getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return convertToList(resultSet.getString(i));
    }

    @Override
    public List<T> getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return convertToList(callableStatement.getString(i));
    }

    private List<T> convertToList(String jsonString){
        try{
            return new ObjectMapper().readValue(jsonString, new TypeReference<List<T>>() {
            });
        } catch (IOException e){
            log.error("JSONTypeHandler failed to convert jsonString to list, JSON String : " + jsonString, e);
        }
        return Collections.emptyList();
    }
}
