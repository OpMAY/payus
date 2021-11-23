package com.mvsolutions.payus.dao;

import com.mvsolutions.payus.mapper.ReportStoreMapper;
import com.mvsolutions.payus.mapper.UserMapper;
import com.mvsolutions.payus.model.rest.request.storedetailpage.StoreReportRequest;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.UserReportStoreResponse;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReportStoreDao {
    private SqlSession sqlSession;

    public void setSqlSession(SqlSession sqlSession){
        if(this.sqlSession==null){
            this.sqlSession = sqlSession;
        }
    }

    public boolean checkReportAnswered(int user_no) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        return mapper.checkReportAnswered(user_no);
    }

    public List<UserReportStoreResponse> getReportList(int user_no, int report_status) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        System.out.println("status" + report_status);
        return mapper.getReportList(user_no, report_status);
    }

    public void updateReadCheck(List<UserReportStoreResponse> reportList) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        mapper.updateReadCheck(reportList);
    }

    public List<UserReportStoreResponse> getReportListReload(int user_no, int report_status, int last_index) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        return mapper.getReportListReload(user_no, report_status, last_index);
    }

    public boolean checkReportExists(int last_index) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        return mapper.checkReportExists(last_index);
    }

    public void reportStore(StoreReportRequest reportRequest) {
        ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
        mapper.reportStore(reportRequest);
    }

//    private ReportStoreMapper mapper = sqlSession.getMapper(ReportStoreMapper.class);
}
