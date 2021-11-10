package com.mvsolutions.payus.restcontroller;

import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserLoginRequest;
import com.mvsolutions.payus.model.rest.request.loginpage.user.UserRegisterRequest;
import com.mvsolutions.payus.model.rest.request.loginpage.vendor.VendorLoginRequest;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageReloadingRequest;
import com.mvsolutions.payus.model.rest.request.mainpage.MainPageRequest;
import com.mvsolutions.payus.model.rest.request.suphomepage.VendorHomeRequest;
import com.mvsolutions.payus.model.rest.response.mainpage.GeoCodeCoordinateRequest;
import com.mvsolutions.payus.service.MainPageService;
import com.mvsolutions.payus.service.UserService;
import com.mvsolutions.payus.service.VendorService;
import lombok.extern.log4j.Log4j;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.net.URISyntaxException;

@RestController
@Log4j
public class PayUsRestController {
    @Autowired
    private MainPageService mainPageService;

    @Autowired
    private UserService userService;

    @Autowired
    private VendorService vendorService;

    /**
     * PreHome#001
     **/
    @RequestMapping(value = "/api/geocode/coordinate", method = RequestMethod.POST)
    public ResponseEntity GetGeoCodeCoordinate(@RequestBody String body) throws JSONException, IOException, URISyntaxException {
        GeoCodeCoordinateRequest request = new Gson().fromJson(body, GeoCodeCoordinateRequest.class);
        return mainPageService.getGeoCodeCoordinates(request);
    }

    /**
     * MainPage#001
     **/
    @RequestMapping(value = "/api/main", method = RequestMethod.GET)
    public ResponseEntity GetMain(@RequestParam("user_no") int user_no,
                                  @RequestParam("address") String address) throws JSONException, IOException, URISyntaxException {
        MainPageRequest request = new MainPageRequest(user_no, address);
        return mainPageService.getMainPage(request);
    }

    /**
     * MainPage#002 - 리로딩
     **/
    @RequestMapping(value = "/api/main/reload", method = RequestMethod.GET)
    public ResponseEntity GetMainReload(@RequestParam("address") String address,
                                        @RequestParam("class_first") int class_first,
                                        @RequestParam("last_index") int last_index) throws JSONException, IOException, URISyntaxException {
        MainPageReloadingRequest request = new MainPageReloadingRequest(address, class_first, last_index);
        return mainPageService.getMainReload(request);
    }

    /**
     * UserLoginPage#001
     **/
    @RequestMapping(value = "/api/user/login", method = RequestMethod.POST)
    public ResponseEntity LoginUser(@RequestBody String body) throws JSONException {
        UserLoginRequest request = new Gson().fromJson(body, UserLoginRequest.class);
        return userService.loginUser(request);
    }

    /**
     * UserLoginPage#002
     **/
    @RequestMapping(value = "/api/user/register", method = RequestMethod.POST)
    public ResponseEntity RegisterUser(@RequestBody String body) throws JSONException {
        UserRegisterRequest request = new Gson().fromJson(body, UserRegisterRequest.class);
        return userService.registerUser(request);
    }

    /**
     * SupLoginPage#001
     **/
    @RequestMapping(value = "/api/vendor/login", method = RequestMethod.POST)
    public ResponseEntity LoginVendor(@RequestBody String body) throws JSONException {
        VendorLoginRequest request = new Gson().fromJson(body, VendorLoginRequest.class);
        return vendorService.loginVendor(request);
    }

    /**
     * SupHomePage#001
     **/
    @RequestMapping(value = "/api/vendor/home", method = RequestMethod.GET)
    public ResponseEntity VendorHome(@RequestParam("vendor_no") int vendor_no) throws JSONException {
        VendorHomeRequest request = new VendorHomeRequest(vendor_no);
        return vendorService.getVendorHome(request);
    }
}
