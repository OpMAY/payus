package com.boot.demo.mapper;

import com.boot.demo.model.Room;
import com.boot.demo.model.response.detail.StoreRoomComponents;

import java.util.List;

public interface RoomMapper {
    void insertRoom(List<Room> roomList);

    List<StoreRoomComponents> getRoomsForDetail(int store_no);
}
