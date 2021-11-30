package com.mvsolutions.payus.model.web.vendor.response.storemanagement;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementStoreInfo {
    private int store_no;
    private List<String> image_list;
    private String store_name;
    private String explain;
    private String address;
    private double address_x;
    private double address_y;
    private String address_road;
    private String phone;
    private int class_first;
    private int class_second;
    private int payback_rate;
}
