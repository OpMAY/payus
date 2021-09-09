package com.boot.demo.restcontroller;

import com.boot.demo.model.request.login.user.DemoUserLoginRequest;
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
     * H_001_HomeScreen_Function A
     * method : GET
     * produces : application/json
     * parameters : user_no (not Required), vendor_no (not Required)
     * response Data : User, Vendor, BannerImage, Store(today_payback, event_payback)
     * Status Code : 200
     * Summary : 홈 스크린 정보를 호출하는 URL
     */
    @RequestMapping(value = "/demo/login/user", method = RequestMethod.POST, produces = "application/json")
    public ResponseEntity loginUser(@RequestBody String body) throws JSONException {
        DemoUserLoginRequest request = new Gson().fromJson(body, DemoUserLoginRequest.class);
        return demoService.loginUser(request);
    }
}
