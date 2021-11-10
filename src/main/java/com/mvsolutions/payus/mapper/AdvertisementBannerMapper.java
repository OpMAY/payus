package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.mainpage.MainPageAdvertisementBanner;

import java.util.List;

public interface AdvertisementBannerMapper {
    List<MainPageAdvertisementBanner> getBannersForMainPage();
}
