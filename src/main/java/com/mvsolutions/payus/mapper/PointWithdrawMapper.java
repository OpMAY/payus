package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.usermypage.UserPointWithdrawRequest;

public interface PointWithdrawMapper {
    void requestWithdraw(UserPointWithdrawRequest request);
}
