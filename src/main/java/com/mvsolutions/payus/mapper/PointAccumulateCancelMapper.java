package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;

public interface PointAccumulateCancelMapper {

    void insertPointCancelRequest(VendorPointCancelRequest request);

    String getPointAccumulateCancelReason(int content_no);
}
