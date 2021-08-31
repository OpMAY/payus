package com.boot.demo.util;


import com.boot.demo.model.utility.businessvalidation.BusinessStatusRequest;
import com.boot.demo.model.utility.businessvalidation.BusinessValidation;
import com.boot.demo.model.utility.businessvalidation.BusinessValidationRequest;
import lombok.extern.log4j.Log4j;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;

@Log4j
@Service
public class BusinessValidationService {
    public String statusVerify(BusinessStatusRequest request) throws IOException {
        log.info(request.getB_no());
        BusinessApi api = new BusinessApi();
        HttpResponse res = api.getBusinessStatus(request);
        return IOUtils.toString(res.getEntity().getContent(), StandardCharsets.UTF_8);
    }

    public String validationVerify(BusinessValidationRequest validation) throws Exception {
        log.info(validation);
        BusinessApi api = new BusinessApi();
        HttpResponse res = api.getBusinessValidation(validation);
        return IOUtils.toString(res.getEntity().getContent(), StandardCharsets.UTF_8);
    }
}
