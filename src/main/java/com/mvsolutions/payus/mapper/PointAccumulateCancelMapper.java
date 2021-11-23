package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.suppointpage.VendorPointCancelRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointRejectReasonResponse;

public interface PointAccumulateCancelMapper {

    void insertPointCancelRequest(VendorPointCancelRequest request);

    String getPointAccumulateCancelReason(int content_no);

    UserPointRejectReasonResponse getUserPointAccumulateCancelReason(int content_no);
}
