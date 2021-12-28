package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.FAQDao;
import com.mvsolutions.payus.dao.NoticeDao;
import com.mvsolutions.payus.dao.ReportReviewDao;
import com.mvsolutions.payus.dao.ReportStoreDao;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.FAQResponse;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.NoticeResponse;
import com.mvsolutions.payus.model.rest.response.usercustomcenterpage.UserReportStoreResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.usercustomcenter.FAQType;
import com.mvsolutions.payus.response.payus.usercustomcenter.ReportStoreStatus;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Log4j2
public class CustomerService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private NoticeDao noticeDao;

    @Autowired
    private FAQDao faqDao;

    @Autowired
    private ReportStoreDao reportStoreDao;

    @Autowired
    private ReportReviewDao reportReviewDao;


    @Transactional(readOnly = true)
    public ResponseEntity getNoticeList(int last_index) throws JSONException {
        Message message = new Message();
        noticeDao.setSqlSession(sqlSession);
        if (last_index != 0 && !noticeDao.checkNoticeExists(last_index)) {
            // 리로딩일 때 last_index 데이터 없을 때 R400
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<NoticeResponse> noticeList = noticeDao.getNoticeList(last_index);
        message.put("notice", noticeList);
        if (noticeList.size() > 0)
            message.put("last_index", noticeList.get(noticeList.size() - 1).getNotice_no());
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getNoticeList()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getFAQList() throws JSONException {
        Message message = new Message();
        faqDao.setSqlSession(sqlSession);
        // FAQ 탭 별 전부 호출
        List<FAQResponse> allFAQList = faqDao.getFAQList(FAQType.ALL);
        List<FAQResponse> vendorFAQList = faqDao.getFAQList(FAQType.VENDOR);
        List<FAQResponse> paymentFAQList = faqDao.getFAQList(FAQType.PAYMENT);
        List<FAQResponse> usageFAQList = faqDao.getFAQList(FAQType.USAGE);
        List<FAQResponse> reviewFAQList = faqDao.getFAQList(FAQType.REVIEW);
        List<FAQResponse> paybackFAQList = faqDao.getFAQList(FAQType.PAYBACK);
        List<FAQResponse> etcFAQList = faqDao.getFAQList(FAQType.ETC);
        message.put("faq0", allFAQList);
        message.put("faq1", vendorFAQList);
        message.put("faq2", paymentFAQList);
        message.put("faq3", usageFAQList);
        message.put("faq4", reviewFAQList);
        message.put("faq5", paybackFAQList);
        message.put("faq6", etcFAQList);

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getFAQList()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getReportListPage(int user_no) throws JSONException {
        Message message = new Message();
        reportStoreDao.setSqlSession(sqlSession);
        // 전체, 답변, 미답변
        List<UserReportStoreResponse> allReportList = reportStoreDao.getReportList(user_no, ReportStoreStatus.ALL);
        log.info(1);
        List<UserReportStoreResponse> answeredReportList = reportStoreDao.getReportList(user_no, ReportStoreStatus.ANSWERED);
        log.info(2);
        List<UserReportStoreResponse> notAnsweredReportList = reportStoreDao.getReportList(user_no, ReportStoreStatus.NOT_ANSWERED);
        log.info(3);
        message.put("report0", allReportList);
        message.put("report1", answeredReportList);
        message.put("report2", notAnsweredReportList);
        // Last_index 설정
        if (allReportList.size() > 0) {
            //reportStoreDao.updateReadCheck(allReportList);
            message.put("last_index0", allReportList.get(allReportList.size() - 1).getReport_no());
        }
        if (answeredReportList.size() > 0) {
            //reportStoreDao.updateReadCheck(answeredReportList);
            message.put("last_index1", answeredReportList.get(answeredReportList.size() - 1).getReport_no());
        }
        if (notAnsweredReportList.size() > 0) {
            //reportStoreDao.updateReadCheck(notAnsweredReportList);
            message.put("last_index2", notAnsweredReportList.get(notAnsweredReportList.size() - 1).getReport_no());
        }

        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getReportListPage()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getReportListPageReload(int user_no, int report_status, int last_index) throws JSONException {
        Message message = new Message();
        reportStoreDao.setSqlSession(sqlSession);
        if (!reportStoreDao.checkReportExists(last_index)) {
            // 리로딩 데이터 없을 때 R400
            return new ResponseEntity(StringRes.res(StatusCode.RELOAD_FAILED), HttpStatus.OK);
        }
        List<UserReportStoreResponse> reportList = reportStoreDao.getReportListReload(user_no, report_status, last_index);
        message.put("report", reportList);
        if (reportList.size() > 0) {
            //reportStoreDao.updateReadCheck(reportList);
            message.put("last_index", reportList.get(reportList.size() - 1).getReport_no());
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getReportListPageReload()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity getReportUpdateClick(int report_no) throws JSONException {
        Message message = new Message();
        reportStoreDao.setSqlSession(sqlSession);
        reportStoreDao.updateClickReadCheck(report_no);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }
}
