package com.mvsolutions.payus.handler;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.basic.Room;
import lombok.extern.log4j.Log4j;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@Log4j
public class JsonRoomTypeHandler extends BaseTypeHandler<List<Room>> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, List<Room> ts, JdbcType jdbcType) throws SQLException {
        preparedStatement.setString(i, new Gson().toJson(ts));
    }

    @Override
    public List<Room> getNullableResult(ResultSet resultSet, String s) throws SQLException {
        return convertToList(resultSet.getString(s));
    }

    @Override
    public List<Room> getNullableResult(ResultSet resultSet, int i) throws SQLException {
        return convertToList(resultSet.getString(i));
    }

    @Override
    public List<Room> getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        return convertToList(callableStatement.getString(i));
    }

    private List<Room> convertToList(String jsonString){
        try{
//            return new Gson().fromJson(jsonString, new TypeToken<ArrayList<Room>>(){}.getType());
            return new ObjectMapper().readValue(jsonString, new TypeReference<List<Room>>() {
            });
        } catch (Exception e){
            log.error("JSONTypeHandler failed to convert jsonString to list, JSON String : " + jsonString, e);
        }
        return Collections.emptyList();
    }
}
