package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.usermypage.UserWithdrawRejectReasonResponse;

public interface PointWithdrawRejectMapper {
    UserWithdrawRejectReasonResponse getWithdrawRejectReason(int withdraw_no);
}
