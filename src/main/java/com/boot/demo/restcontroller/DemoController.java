package com.boot.demo.restcontroller;

import com.boot.demo.model.request.login.user.DemoUserLoginRequest;
import com.boot.demo.model.request.login.user.register.DemoUserBankRequest;
import com.boot.demo.model.request.login.vendor.DemoVendorLoginRequest;
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
     * parameters : user_no (X), vendor_no (X)
     * response Data : User, Vendor, BannerImage, Store(today_payback, event_payback)
     * Status Code : 200
     * Summary : 홈 스크린 정보를 호출하는 URL
     */
    @RequestMapping(value = "/demo/home", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getDemoHomePage(@RequestParam(value = "user_no", required = false)String user_no,
                                          @RequestParam(value = "vendor_no", required = false)String vendor_no) throws JSONException {
        return demoService.homeScreen(user_no, vendor_no);
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
    @RequestMapping(value = "/demo/login/user", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
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

    /**
     * R_100_RegisterScreen_Function A
     * method : Post
     * produces : application/json
     * body : Vendor(String id, String password)
     * response Data : Vendor(int vendor_no)
     * Status Code : 200, L401
     * Summary : 일반 유저 회원가입 후 은행 정보를 추가하는 URL
     */
    @RequestMapping(value = "/demo/login/vendor", method = RequestMethod.POST, produces = "application/json", consumes = "application/json")
    public ResponseEntity loginVendor(@RequestBody String body) throws JSONException {
        DemoVendorLoginRequest request = new Gson().fromJson(body, DemoVendorLoginRequest.class);
        return demoService.loginVendor(request);
    }

    /**
     * CL_001_MainScreen_Function A
     * method : GET
     * produces : application/json
     * parameters : int category, String location
     * response Data : Store(today_payback)
     * Status Code : 200
     * Summary : MainScreen 중 오늘의 페이백을 호출받는 URL
     */
    @RequestMapping(value = "/demo/main/lodgment", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getDemoMainPage(@RequestParam(value = "category") int category,
                                          @RequestParam(value = "location") String location) throws Exception {
        return demoService.getDemoMainPage(category, location);
    }

    /**
     * CL_001_MainScreen_Function B
     * method : GET
     * produces : application/json
     * parameters : int category, String location, int last_index
     * response Data : Store(today_payback), int last_index
     * Status Code : 200
     * Summary : MainScreen 중 추천 숙박을 50개씩 리로딩하는 URL
     */
    @RequestMapping(value = "/demo/main/lodgment/reload", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getDemoMainPageReload(@RequestParam(value = "category") int category,
                                                @RequestParam(value = "location") String location,
                                                @RequestParam(value = "last_index") int last_index) throws Exception {
        return demoService.getDemoMainPageReload(category, location, last_index);
    }

    /**
     * D_001_DetailScreen_Function A
     * method : GET
     * produces : application/json
     * parameters : int store_no, int user_no(X), int vendor_no(X)
     * response Data : Store, is_like
     * Status Code : 200, D404, D501
     * Summary : 숙박 세부 정보를 로딩하는 URL
     */
    @RequestMapping(value = "/demo/detail", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getStoreDetail(@RequestParam(value = "user_no", required = false) String user_no,
                                         @RequestParam(value = "vendor_no", required = false) String vendor_no,
                                         @RequestParam(value = "store_no") int store_no) throws JSONException {
        return demoService.getStoreDetail(user_no, vendor_no, store_no);
    }
}
