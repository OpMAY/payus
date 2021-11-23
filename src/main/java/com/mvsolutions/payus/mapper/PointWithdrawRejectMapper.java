package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.usermypage.UserPointRejectReasonResponse;

public interface PointWithdrawRejectMapper {
    UserPointRejectReasonResponse getWithdrawRejectReason(int withdraw_no);
}
