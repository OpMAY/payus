package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.FAQResponse;

import java.util.List;

public interface FAQMapper {
    List<FAQResponse> getFAQList(int faq_type);
}
