package com.mvsolutions.payus.restcontroller;

import com.google.gson.Gson;
import com.mvsolutions.payus.model.rest.request.GeoCodeAddressRequest;
import com.mvsolutions.payus.model.rest.request.MainPageReloadingRequest;
import com.mvsolutions.payus.model.rest.request.MainPageRequest;
import com.mvsolutions.payus.model.rest.response.GeoCodeCoordinateRequest;
import com.mvsolutions.payus.service.MainPageService;
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

    /** PreHome#001 **/
    @RequestMapping(value = "/api/geocode/coordinate", method = RequestMethod.POST)
    public ResponseEntity GetGeoCodeCoordinate(@RequestBody String body) throws JSONException, IOException, URISyntaxException {
        GeoCodeCoordinateRequest request = new Gson().fromJson(body, GeoCodeCoordinateRequest.class);
        return mainPageService.getGeoCodeCoordinates(request);
    }

    /** MainPage#001 **/
    @RequestMapping(value = "/api/main", method = RequestMethod.GET)
    public ResponseEntity GetMain(@RequestParam(value = "user_no", required = false) int user_no,
                                  @RequestParam("address") String address) throws JSONException, IOException, URISyntaxException {
        MainPageRequest request = new MainPageRequest(user_no, address);
        return mainPageService.getMainPage(request);
    }

    /** MainPage#002 - 리로딩 **/
    @RequestMapping(value = "/api/main/reload", method = RequestMethod.GET)
    public ResponseEntity GetMainReload(@RequestParam("address") String address,
                                        @RequestParam("class_first") int class_first,
                                        @RequestParam("last_index") int last_index) throws JSONException, IOException, URISyntaxException {
        MainPageReloadingRequest request = new MainPageReloadingRequest(address, class_first, last_index);
        return mainPageService.getMainReload(request);
    }
}
