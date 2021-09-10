package com.boot.demo.dao;

import com.boot.demo.mapper.RoomMapper;
import com.boot.demo.model.Room;
import com.boot.demo.model.response.detail.StoreRoomComponents;
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
