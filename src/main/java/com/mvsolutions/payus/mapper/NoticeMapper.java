package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.NoticeResponse;

import java.util.List;

public interface NoticeMapper {
    Integer getLatestNoticeNo();

    boolean checkNoticeExists(int last_index);

    List<NoticeResponse> getNoticeList(int last_index);
}
