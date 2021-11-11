package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suppointpage.VendorChargeCancelRequest;

public interface PointChargeCancelMapper {
    void insertChargeCancelRequest(VendorChargeCancelRequest request);
}
