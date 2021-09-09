package com.boot.demo.restcontroller;

import com.boot.demo.model.request.login.user.DemoUserLoginRequest;
import com.boot.demo.model.request.login.user.register.DemoUserBankRequest;
import com.boot.demo.response.IntegerRes;
import com.boot.demo.response.Message;
import com.boot.demo.response.StatusCode;
import com.boot.demo.service.DemoService;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@Log4j
@RestController
public class DemoController {
    @Autowired
    private DemoService demoService;

    /**
     * H_001_HomeScreen_Function A
     * method : GET
     * produces : application/json
     * parameters : user_no (not Required), vendor_no (not Required)
     * response Data : User, Vendor, BannerImage, Store(today_payback, event_payback)
     * Status Code : 200
     * Summary : 홈 스크린 정보를 호출하는 URL
     */
    @RequestMapping(value = "/demo/home", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getDemoHomePage(@RequestParam(value = "user_no", required = false)String user_no,
                                          @RequestParam(value = "vendor_no", required = false)String vendor_no) throws JSONException {
        Message message = demoService.homeScreen(user_no, vendor_no);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * L_001_LoginScreen_Function A
     * method : Post
     * produces : application/json
     * body : User(String access_token, String sns)
     * response Data : User(int user_no), boolean is_register
     * Status Code : 200, L426
     * Summary : 일반 유저 로그인을 호출하는 URL
     */
    @RequestMapping(value = "/demo/login/user", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity loginUser(@RequestBody String body) throws JSONException {
        DemoUserLoginRequest request = new Gson().fromJson(body, DemoUserLoginRequest.class);
        return demoService.loginUser(request);
    }

    /**
     * R_001_RegisterScreen_Function A
     * method : Post
     * produces : application/json
     * body : User(int user_no, String bank_name, String bank_account, String bank_owner)
     * response Data : X
     * Status Code : 200
     * Summary : 일반 유저 회원가입 후 은행 정보를 추가하는 URL
     */
    @RequestMapping(value = "/demo/login/user/bank", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity bankUpdate(@RequestBody String body){
        DemoUserBankRequest request = new Gson().fromJson(body, DemoUserBankRequest.class);
        return demoService.bankUpdate(request);
    }
}
