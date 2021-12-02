package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.basic.PointAccumulate;
import com.mvsolutions.payus.model.rest.request.suppointpage.PaybackRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserReviewDeleteRequest;
import com.mvsolutions.payus.model.rest.response.storedetailpage.UserAccumulateCheckResponse;
import com.mvsolutions.payus.model.rest.response.suppointpage.VendorPointAccumulateListResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointAccumulateListResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserReviewPagePreDataResponse;

import java.util.List;

public interface PointAccumulateMapper {
    List<VendorPointAccumulateListResponse> getVendorAccumulateList(int vendor_no);

    List<VendorPointAccumulateListResponse> getVendorAccumulateListReload(int vendor_no, int last_index);

    PointAccumulate getPointAccumulateByAccumulateNo(int accumulate_no);

    boolean checkPointAbleToCancel(int accumulate_no);

    void pointCancelRequestUpdate(int accumulate_no);

    void updateVendorReadCheck(List<VendorPointAccumulateListResponse> accumulateList);

    void requestPayback(PaybackRequest request);

    List<UserPointAccumulateListResponse> getUserPointAccumulateList(int user_no);

    void updateUserReadCheck(List<UserPointAccumulateListResponse> accumulateList);

    List<UserPointAccumulateListResponse> getUserPointAccumulateListReload(int user_no, int last_index);

    void updateAccumulateByReviewDelete(UserReviewDeleteRequest request);

    UserReviewPagePreDataResponse getPreDataForReview(int accumulate_no);

    boolean checkReviewWritten(int accumulate_no);

    void updateAccumulateByUploadReview(int accumulate_no);

    UserAccumulateCheckResponse checkUserAccumulate(int user_no);

    int getStoreNoFromAccumulate(int accumulate_no);

    boolean checkAccumulateCanceled(int content_no);

    boolean checkUserUnreadExists(int user_no);

    void updateUserReadCheckByVendorReviewAnswer(int review_no);
}
