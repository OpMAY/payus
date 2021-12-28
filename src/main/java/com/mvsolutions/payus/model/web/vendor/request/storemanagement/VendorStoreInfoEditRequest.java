package com.mvsolutions.payus.model.web.vendor.request.storemanagement;

import lombok.Data;

import java.util.List;

@Data
public class VendorStoreInfoEditRequest {
    private int vendor_no;
    private int store_no;
    private String road_address;
    private String jibun_address;
    private String store_name;
    private String store_explain;
    private String store_phone;
    private int payback_rate;
    private List<Integer> deleted_img_index;
    private double x;
    private double y;
    private List<String> new_imgs;
    private String address_1depth;
    private String address_2depth;
    private String address_3depth;
    private String address_short;
    private String image_list;
}
