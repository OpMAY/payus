package com.boot.demo.mapper;

public interface StoreLikeMapper {
    String checkStoreLikeByUserNo(int store_no, int user_no);

    String checkStoreLikeByVendorNo(int store_no, int vendor_no);
}
