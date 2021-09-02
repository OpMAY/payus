package com.boot.demo.util;

import lombok.extern.log4j.Log4j;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;

@Log4j
@Service
public class KakaoLocationService {
    public String getLocationCoordinates(String location) throws Exception {
        log.info("location : " + location);
        KakaoLocationApi api = new KakaoLocationApi();
        HttpResponse response =  api.getLocationCoordinates(location);
        return IOUtils.toString(response.getEntity().getContent(), StandardCharsets.UTF_8);
    }
}
