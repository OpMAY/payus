package com.mvsolutions.payus.restcontroller;

import com.mvsolutions.payus.exception.enums.BusinessExceptionType;
import com.mvsolutions.payus.exception.rest.AuthorizationTokenException;
import com.mvsolutions.payus.model.Test;
import com.mvsolutions.payus.model.file.MFile;
import com.mvsolutions.payus.response.IntegerRes;
import com.mvsolutions.payus.response.Message;
import com.mvsolutions.payus.response.StatusCode;
import com.mvsolutions.payus.service.HomeService;
import com.mvsolutions.payus.util.Constant;
import com.mvsolutions.payus.util.FileUploadUtility;
import com.mvsolutions.payus.util.security.AES256Util;
import com.mvsolutions.payus.util.Decoder;
import com.mvsolutions.payus.util.security.Security;
import lombok.extern.log4j.Log4j;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.*;

@Log4j
@RestController
public class SampleController {

    @Autowired
    private HomeService homeService;

    /**
     * Test Method(PathVariable) GET
     */
    @RequestMapping(value = "/test/{no}", method = RequestMethod.GET)
    public ResponseEntity getTest(@PathVariable int no) throws JSONException {
        Message message = new Message();
        Test test = new Test();
        test.setNo(no);
        test.setTestcol("testcol");
        message.put("test", test);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method(PathVariable) POST
     */
    @RequestMapping(value = "/test/{no}", method = RequestMethod.POST)
    public ResponseEntity postTest(@PathVariable int no) throws JSONException {
        Message message = new Message();
        Test test = new Test();
        test.setNo(no);
        test.setTestcol("testcol");
        message.put("test", test);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    @RequestMapping(value = "/test/sample/store", method = RequestMethod.GET)
    public ResponseEntity sampleStoreData() throws Exception {
        homeService.insertStores(1);
        homeService.insertStores(2);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
    }

    /**
     * Test Method GET Encoding AES
     */
    @RequestMapping(value = "/test/encoding", method = RequestMethod.GET)
    public ResponseEntity getImageURLEncoding() throws JSONException, UnsupportedEncodingException, GeneralSecurityException {
        Message message = new Message();
        AES256Util aes256Util = new AES256Util();
        String image_encoding = aes256Util.encrypt("http://localhost:8080/images/testimage.png");
        message.put("encoding", image_encoding);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method GET Decoding AES
     */
    @RequestMapping(value = "/test/decoding", method = RequestMethod.GET)
    public ResponseEntity getImageURLDecoding() throws JSONException, UnsupportedEncodingException, GeneralSecurityException {
        Message message = new Message();
        AES256Util aes256Util = new AES256Util();
        String decoding = aes256Util.decrypt("RsGxYYmv0Ieo/xp2xbGEcmRX9YJVuXsdF7gUjPqSh/WDo2PkD0tvu3G2haSfewCc");
        message.put("decoding", decoding);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method GET produces
     * Response의 Content-Type을 제어
     */
    @RequestMapping(value = "/test/produces", method = RequestMethod.GET, produces = "application/json")
    public ResponseEntity getProducesProtocol() throws JSONException {
        Message message = new Message();
        message.put("test", "message");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method POST Consumes
     * Request의 Content-Type을 제어
     */
    @RequestMapping(value = "/test/consumes", method = RequestMethod.POST, consumes = "application/json;charset=utf-8")
    public ResponseEntity getConsumesProtocol() throws JSONException {
        Message message = new Message();
        message.put("content", "getConsumesProtocol success");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method POST Consumes
     * Request의 Content-Type을 제어
     */
    @Autowired
    private FileUploadUtility fileUploadUtility;

    @RequestMapping(value = "/test/consumesfile", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity getConsumesFileProtocol(@RequestParam(value = "file", required = true) MultipartFile file, String data) throws JSONException, IOException {
        Message message = new Message();
        message.put("content", "getConsumesFileProtocol success");
        fileUploadUtility.uploadFile(null, file.getOriginalFilename(), file.getBytes(), Constant.LOCAL_SAVE);
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method POST Consumes
     * Request의 Content-Type을 제어
     * List Files
     * Post man
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/Korea_fashion_beauty_model_4K_photo_1366x768.jpg");
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/red-velvet-really-bad-boy-rbb-joy-irene-yeri-seulgi-wendy-s7812.jpg");
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/f89070936a74415f9887a9a12f9b9d1c.jpg");
     */
    @RequestMapping(value = "/test/consumesfiles", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity getConsumesFilesProtocol(@RequestParam(value = "files", required = true) List<MultipartFile> files, String data) throws JSONException {
        Message message = new Message();
        log.info(files);
        message.put("content", "getConsumesFilesProtocol success");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method POST Consumes
     * Request의 Content-Type을 제어
     * List Files
     * Post man
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/Korea_fashion_beauty_model_4K_photo_1366x768.jpg");
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/red-velvet-really-bad-boy-rbb-joy-irene-yeri-seulgi-wendy-s7812.jpg");
     * data.append("files1", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/Korea_fashion_beauty_model_4K_photo_1366x768.jpg");
     * data.append("files1", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/red-velvet-really-bad-boy-rbb-joy-irene-yeri-seulgi-wendy-s7812.jpg");
     * <p>
     * And Normalize And Decoder
     */
    @RequestMapping(value = "/test/consumesmultiplefiles", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity getConsumesMultipleFilesProtocol(@RequestParam(required = true) List<MultipartFile> files, String data) throws JSONException {
        Message message = new Message();
        log.info(files);
        for (MultipartFile multipartFile : files) {
            String fileOriginalName = Decoder.fileNameDecoder(multipartFile.getOriginalFilename());
            log.info(fileOriginalName);
        }
        message.put("content", "getConsumesMultipleFilesProtocol success");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    /**
     * Test Method POST Consumes
     * Request의 Content-Type을 제어
     * List Files
     * Post man
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/Korea_fashion_beauty_model_4K_photo_1366x768.jpg");
     * data.append("files", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/red-velvet-really-bad-boy-rbb-joy-irene-yeri-seulgi-wendy-s7812.jpg");
     * data.append("files1", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/Korea_fashion_beauty_model_4K_photo_1366x768.jpg");
     * data.append("files1", fileInput.files[0], "/C:/Users/zlzld/OneDrive/Desktop/red-velvet-really-bad-boy-rbb-joy-irene-yeri-seulgi-wendy-s7812.jpg");
     */
    @RequestMapping(value = "/test/consumesmultiplekeyfiles", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity getConsumesMultipleFilesGetKeyProtocol(HttpServletRequest request, String data) throws JSONException {
        Message message = new Message();
        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartHttpServletRequest.getFileMap();
        Iterator<String> keys = fileMap.keySet().iterator();
        ArrayList<String> names = new ArrayList<>();
        while (keys.hasNext()) {
            String key = keys.next();
            log.info("Key : " + key);
            /**MFile*/
            MFile mFile = new MFile(fileMap.get(key).getOriginalFilename(),
                    "http://localhost:8080/files/test.png",
                    fileMap.get(key).getContentType(),
                    fileMap.get(key).getSize());
            log.info("File : " + mFile);
            names.add(fileMap.get(key).getOriginalFilename());
        }
        message.put("data", data);
        message.put("content", "getConsumesMultipleFilesGetKeyProtocol success");
        return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap()), HttpStatus.OK);
    }

    @Value("${api.access_key}")
    private String access_key;

    @RequestMapping(value = "/api/auth", method = RequestMethod.GET)
    public ResponseEntity Auth(@RequestParam("secret_key") String secret_key) {
        try {
            if (secret_key.equals(access_key)) {
                String api_access_key = new Security(access_key).createToken();
                Message message = new Message();
                message.put("access_token", api_access_key);
                return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS, message.getHashMap("Auth()")), HttpStatus.OK);
            } else {
                throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
            }
        } catch (JSONException e) {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        }
    }

    @RequestMapping(value = "/api/auth/valid", method = RequestMethod.POST)
    public ResponseEntity ValidateToken(@RequestHeader HttpHeaders headers) {
        String token = headers.getFirst(HttpHeaders.AUTHORIZATION).substring(headers.getFirst(HttpHeaders.AUTHORIZATION).lastIndexOf("bearer ") + 7);
        if (new Security(access_key).validateToken(token)) {
            return new ResponseEntity(IntegerRes.res(StatusCode.SUCCESS), HttpStatus.OK);
        } else {
            throw new AuthorizationTokenException(BusinessExceptionType.AUTHORIZATION_TOKEN_EXCEPTION);
        }
    }
}
