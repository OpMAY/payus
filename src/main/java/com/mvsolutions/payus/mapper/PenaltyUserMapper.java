package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.loginpage.user.UserPenaltyResponse;

import java.util.List;

public interface PenaltyUserMapper {
    List<UserPenaltyResponse> getUserPenaltyInfo(int user_no);
}
