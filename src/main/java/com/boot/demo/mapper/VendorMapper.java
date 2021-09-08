package com.boot.demo.mapper;

import com.boot.demo.model.response.home.HomeVendor;

public interface VendorMapper {
    HomeVendor getUserInfoByUserNoForHome(int vendor_no);
}
