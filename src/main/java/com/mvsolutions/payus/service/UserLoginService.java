package com.mvsolutions.payus.service;

import com.mvsolutions.payus.dao.PenaltyUserDao;
import com.mvsolutions.payus.dao.UserDao;
import com.mvsolutions.payus.model.rest.basic.User;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserLoginRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserPenaltyResponse;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserRegisterRequest;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserLoginResponse;
import com.mvsolutions.payus.model.rest.response.loginpage.user.UserRegisterResponse;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.response.StringRes;
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
public class UserLoginService {
    @Autowired
    private SqlSession sqlSession;

    @Autowired
    private UserDao userDao;

    @Autowired
    private PenaltyUserDao penaltyUserDao;

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
        if(userDao.checkUserExists(request.getSns(), request.getAccess_token())){
            // 유저가 존재하는데 접근한 경우
            return new ResponseEntity(IntegerRes.res(StatusCode.BAD_REQUEST), HttpStatus.OK);
        } else if (request.getAccess_token() == null){
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
        message.put("user", response);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("registerUser()")), HttpStatus.OK);
    }
}
