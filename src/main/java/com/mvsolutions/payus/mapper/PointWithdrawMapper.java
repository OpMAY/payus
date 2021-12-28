package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;
import com.mvsolutions.payus.model.rest.response.usermypage.UserPointWithdrawListResponse;

import java.util.List;

public interface PointWithdrawMapper {
    void requestWithdraw(UserPointWithdrawRequest request);

    List<UserPointWithdrawListResponse> getUserPointWithdrawList(int user_no);

    void updateUserReadCheck(List<UserPointWithdrawListResponse> withdrawList);

    List<UserPointWithdrawListResponse> getUserPointWithdrawListReload(int user_no, int last_index);

    boolean checkWithdrawRejected(int withdraw_no);

    boolean checkUserUnreadExists(int user_no);
}
