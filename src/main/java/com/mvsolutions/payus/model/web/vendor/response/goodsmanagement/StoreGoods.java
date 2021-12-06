package com.mvsolutions.payus.model.web.vendor.response.goodsmanagement;

import com.mvsolutions.payus.model.rest.basic.Room;
import lombok.Data;

import java.util.ArrayList;

@Data
public class StoreGoods {
    private ArrayList<Room> room_options;
}
