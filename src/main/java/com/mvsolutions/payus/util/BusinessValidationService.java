package com.mvsolutions.payus.util;


import com.mvsolutions.payus.model.utility.businessvalidation.BusinessStatusRequest;
import com.mvsolutions.payus.model.utility.businessvalidation.BusinessValidationRequest;
import lombok.extern.log4j.Log4j;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Service;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Log4j
@Service
public class BusinessValidationService {
    /**
        주석 생성 날짜 - 2021-09-14, 화, 11:22
        코드 설명 : 사업자 등록 번호 조회하는 API
    **/
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
