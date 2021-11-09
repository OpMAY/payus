package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.MainPageUser;

public interface UserMapper {

    MainPageUser getUserForMainPage(int user_no);
}
