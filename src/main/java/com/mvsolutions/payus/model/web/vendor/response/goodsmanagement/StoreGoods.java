package com.mvsolutions.payus.model.web.vendor.response.goodsmanagement;

import com.mvsolutions.payus.model.rest.basic.Room;
import lombok.Data;

import java.util.List;

@Data
public class StoreGoods {
    private List<Room> roomList;
}
