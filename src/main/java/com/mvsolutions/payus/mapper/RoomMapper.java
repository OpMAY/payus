package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.demo.Room;
import com.mvsolutions.payus.model.demo.response.detail.StoreRoomComponents;

import java.util.List;

public interface RoomMapper {
    void insertRoom(List<Room> roomList);

    List<StoreRoomComponents> getRoomsForDetail(int store_no);
}
