package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointChargeRequest;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointChargeListResponse;

import java.util.List;

public interface PointChargeMapper {
    void insertNewPointChargeRequest(VendorPointChargeRequest request, String now);

    List<VendorPointChargeListResponse> getVendorChargeList(int vendor_no);

    List<VendorPointChargeListResponse> getVendorChargeListReload(int vendor_no, int last_index);

    boolean checkChargeAbleToCancel(int charge_no);

    void chargeCancelRequestUpdate(int charge_no);

    void updateReadCheck(List<VendorPointChargeListResponse> chargeList);

    int checkVendorChargeStatus(int content_no);
}
