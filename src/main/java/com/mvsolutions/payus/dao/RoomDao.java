package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.RoomMapper;
import com.mvsolutions.payus.model.demo.Room;
import com.mvsolutions.payus.model.demo.response.detail.StoreRoomComponents;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoomDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public void insertRoom(List<Room> roomList) {
        RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
        roomMapper.insertRoom(roomList);
    }

    public List<StoreRoomComponents> getRoomsForDetail(int store_no){
        RoomMapper roomMapper = sqlSession.getMapper(RoomMapper.class);
        return roomMapper.getRoomsForDetail(store_no);
    }
}
