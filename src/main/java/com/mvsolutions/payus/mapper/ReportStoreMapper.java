package com.mvsolutions.payus.mapper;

import com.mvsolutions.payus.model.rest.request.storedetailpage.StoreReportRequest;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.UserReportStoreResponse;

import java.util.List;

public interface ReportStoreMapper {
    boolean checkReportAnswered(int user_no);

    List<UserReportStoreResponse> getReportList(int user_no, int report_status);

    List<UserReportStoreResponse> getReportListReload(int user_no, int report_status, int last_index);

    boolean checkReportExists(int last_index);

    void updateReadCheck(List<UserReportStoreResponse> reportList);

    void reportStore(StoreReportRequest reportRequest);

    void updateClickReadCheck(int report_no);
}
