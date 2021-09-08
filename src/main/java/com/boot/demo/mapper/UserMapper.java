package com.boot.demo.mapper;

import com.boot.demo.model.response.home.HomeUser;

public interface UserMapper {
    HomeUser getUserInfoByUserNoForHome(int user_no);
}
