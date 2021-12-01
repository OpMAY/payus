package com.mvsolutions.payus.model.web.vendor.response.storemanagement;

import com.mvsolutions.payus.model.rest.basic.StoreInformation;
import com.mvsolutions.payus.model.rest.basic.StoreService;
import lombok.Data;

import java.util.List;

@Data
public class VendorStoreManagementStoreDetailInfo {
    private int store_no;
    private int class_first;
    private int class_second;
    private String explain;
    private List<StoreService> service_list;
    private List<StoreInformation> information;
}
