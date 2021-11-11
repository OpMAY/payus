package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.PointAccumulate;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointAccumulateListResponse;

import java.util.List;

public interface PointAccumulateMapper {
    List<VendorPointAccumulateListResponse> getVendorAccumulateList(int vendor_no);

    List<VendorPointAccumulateListResponse> getVendorAccumulateListReload(int vendor_no, int last_index);

    PointAccumulate getPointAccumulateByAccumulateNo(int accumulate_no);

    boolean checkPointAbleToCancel(int accumulate_no);

    void pointCancelRequestUpdate(int accumulate_no);

    void updateVendorReadCheck(List<VendorPointAccumulateListResponse> accumulateList);

    void requestPayback(PaybackRequest request);
}
