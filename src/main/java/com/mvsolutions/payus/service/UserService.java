package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.NoticeDao;
import com.mvsolutions.payus.dao.PenaltyUserDao;
import com.mvsolutions.payus.dao.ReportStoreDao;
import com.mvsolutions.payus.dao.UserDao;
import com.mvsolutions.payus.model.rest.basic.User;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserLoginRequest;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserRegisterRequest;
import com.mvsolutions.payus.model.rest.request.usermypage.UserPersonalDataEditRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserLoginResponse;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserPenaltyResponse;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserRegisterResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPagePersonalDataResponse;
import com.mvsolutions.payus.model.rest.response.usermypage.UserMyPageResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
import com.mvsolutions.payus.response.payus.point.PaybackRule;
import com.mvsolutions.payus.response.payus.user.UserPersonalDataEditType;
import com.mvsolutions.payus.util.Time;
import lombok.extern.log4j.Log4j;
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
@Log4j
public class UserService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserDao userDao;

    @Autowired
    private PenaltyUserDao penaltyUserDao;

    @Autowired
    private ReportStoreDao reportStoreDao;

    @Autowired
    private NoticeDao noticeDao;

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity loginUser(UserLoginRequest request) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        // 유저 존재하는지 체크
        if (userDao.checkUserExists(request.getSns(), request.getAccess_token())) {
            // 유저 정보 반환 (user_no)
            UserLoginResponse response = userDao.getUserForLogin(request.getSns(), request.getAccess_token());
            message.put("user", response);
            // 정지된 유저 체크
            if (userDao.checkUserPenalty(response.getUser_no())) {
                penaltyUserDao.setSqlSession(sqlSession);
                List<UserPenaltyResponse> penaltyList = penaltyUserDao.getUserPenaltyInfo(response.getUser_no());
                // 정지 정보 반환
                UserPenaltyResponse penaltyResponse = penaltyList.get(0);
                String name = userDao.getUserName(response.getUser_no());
                penaltyResponse.setName(name);
                message.put("penalty", penaltyResponse);
            }

            // FCM 토큰 업데이트
            if (request.getFcm_token() != null) {
                userDao.updateUserFcmToken(response.getUser_no(), request.getFcm_token());
            }
        } else {
            // 없을 시 회원 가입 유도 (동의 체크 해야함)
            return new ResponseEntity(StringRes.res(StatusCode.REGISTER_REQUIRED), HttpStatus.OK);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("loginUser()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity registerUser(UserRegisterRequest request) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        if (userDao.checkUserExists(request.getSns(), request.getAccess_token())) {
            // 유저가 존재하는데 접근한 경우
            return new ResponseEntity(IntegerRes.res(StatusCode.BAD_REQUEST), HttpStatus.OK);
        } else if (request.getAccess_token() == null) {
            // Access Token 누락 시
            return new ResponseEntity(IntegerRes.res(StatusCode.BAD_REQUEST), HttpStatus.OK);
        }
        // 유저 세팅
        User user = new User();
        user.setSns(request.getSns());
        user.setAccess_token(request.getAccess_token());
        user.setFcm_token(request.getFcm_token());
        user.setReg_date(Time.TimeFormatHMS());
        user.setMarketing_agree(request.isMarketing_agree());
        user.setEvent_push(request.isMarketing_agree());
        userDao.registerUser(user);
        // 닉네임 업데이트
        String nickname = "사용자" + user.getUser_no();
        user.setNickname(nickname);
        userDao.updateUserName(user.getUser_no(), nickname);
        UserRegisterResponse response = new UserRegisterResponse();
        response.setUser_no(user.getUser_no());
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("registerUser()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserMyPageData(int user_no) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        UserMyPageResponse response = userDao.getUserMyPageData(user_no);
        if (response == null) {
            // 유저 없을 때 U404
            return new ResponseEntity(StringRes.res(StatusCode.NO_USER_DETECTED), HttpStatus.OK);
        }
        // 유저 코드 서버에서 계산해서 반환
        response.setUser_code(PaybackRule.UserCodeCalculation(response.getUser_no(), true));
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserMyPageData()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getCustomCenterData(int user_no) throws JSONException {
        Message message = new Message();
        reportStoreDao.setSqlSession(sqlSession);
        noticeDao.setSqlSession(sqlSession);
        int recent_no = noticeDao.getLatestNoticeNo();
        // 가장 최신 공지사항의 notice_no
        message.put("latest_notice", recent_no);
        if (user_no != 0) {
            // 읽지 않은(답변 달렸는데) 문의 내역 있는지
            boolean answerStatus = reportStoreDao.checkReportAnswered(user_no);
            message.put("has_answer", answerStatus);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getCustomCenterData()")), HttpStatus.OK);
    }

    @Transactional(readOnly = true)
    public ResponseEntity getUserMyPagePersonalData(int user_no) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        // 유저 정보 수정 페이지에서 데이터 수정
        UserMyPagePersonalDataResponse response = userDao.getUserMyPagePersonalData(user_no);
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("getUserMyPagePersonalData()")), HttpStatus.OK);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public ResponseEntity editUserPersonalData(UserPersonalDataEditRequest request) throws JSONException {
        Message message = new Message();
        userDao.setSqlSession(sqlSession);
        if (!userDao.checkUserExistsByUserNo(request.getUser_no())) {
            return new ResponseEntity(StringRes.res(StatusCode.NO_USER_DETECTED), HttpStatus.OK);
        }
        switch (request.getType()) {
            case UserPersonalDataEditType
                    .NICKNAME:
                if (userDao.checkUserNickNameExists(request.getData())) {
                    return new ResponseEntity(StringRes.res(StatusCode.NICKNAME_EXISTS), HttpStatus.OK);
                }
                userDao.editUserNickName(request.getUser_no(), request.getData());
                break;
            case UserPersonalDataEditType
                    .PHONE:
                userDao.editUserPhone(request.getUser_no(), request.getData());
                break;
            case UserPersonalDataEditType
                    .BANK_NAME:
                userDao.editUserBankName(request.getUser_no(), request.getData());
                break;
            case UserPersonalDataEditType
                    .BANK_ACCOUNT:
                userDao.editUserBankAccount(request.getUser_no(), request.getData());
                break;
            case UserPersonalDataEditType
                    .BANK_OWNER:
                userDao.editUserBankOwner(request.getUser_no(), request.getData());
                break;
            case UserPersonalDataEditType
                    .EVENT_PUSH:
                message.put("event_push", userDao.updateUserEventPush(request.getUser_no()));
                break;
            case UserPersonalDataEditType
                    .REVIEW_PUSH:
                message.put("review_push", userDao.updateUserReviewPush(request.getUser_no()));
                break;
            case UserPersonalDataEditType
                    .POINT_PUSH:
                message.put("point_push", userDao.updateUserPointPush(request.getUser_no()));
                break;
            case UserPersonalDataEditType
                    .REPORT_PUSH:
                message.put("report_push", userDao.updateUserReportPush(request.getUser_no()));
                break;
            case UserPersonalDataEditType
                    .MARKETING_AGREE:
                // 마케팅 및 이벤트 Push 이용 동의 이므로 이 값에 따라 event_push 동일 적용
                message.put("marketing_agree", userDao.updateMarketingAgree(request.getUser_no()));
                break;
            default:
                return new ResponseEntity(StringRes.res(StatusCode.USER_EDIT_TYPE_ERROR), HttpStatus.OK);
        }
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("editUserPersonalData()")), HttpStatus.OK);
    }
}
