package com.boot.demo.controller;

import com.boot.demo.exception.enums.BusinessExceptionType;
import com.boot.demo.exception.rest.GrantAccessDeniedException;
import com.boot.demo.model.TestModel;
import com.boot.demo.model.UploadForm;
import com.boot.demo.model.User;
import com.boot.demo.response.DefaultRes;
import com.boot.demo.response.Message;
import com.boot.demo.response.ResMessage;
import com.boot.demo.response.StatusCode;
import com.boot.demo.service.HomeService;
import com.boot.demo.util.Constant;
import com.boot.demo.util.FileUploadUtility;
import lombok.*;
import lombok.extern.log4j.Log4j;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Controller
@Log4j
public class HomeController {

    private ModelAndView VIEW;

    @Autowired
    private HomeService homeService;

    @Autowired
    private FileUploadUtility fileUploadUtility;

    public void HomeController() {
        VIEW = new ModelAndView("home");
    }

    @RequestMapping(value = "/home.do", method = RequestMethod.GET)
    public ModelAndView Home() {
        HomeController();
        homeService.sqlRollbackTest();
        return new ModelAndView("home");
    }

    /**
     * Post 하다가 에러가 나서 ErrorHandling에 태웠을 경우
     */
    @RequestMapping(value = "/home.do", method = RequestMethod.POST)
    public ModelAndView homePost() {
        HomeController();
        boolean error = true;
        if (error)
            throw new GrantAccessDeniedException(BusinessExceptionType.GRANT_EXCEPTION);
        return VIEW;
    }

    /**
     * 파라미터 타입은 다르지만 로직은 분리 해야할 때
     * Type parameter same but different values at sample, sample1, sample2
     */
    @RequestMapping(value = "/test/other.do", params = "type=general", method = RequestMethod.GET)
    public ModelAndView sample() {
        HomeController();
        log.info("general");
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/test/other.do", params = "type=report", method = RequestMethod.GET)
    public ModelAndView sample1() {
        HomeController();
        log.info("report");
        return new ModelAndView("home");
    }

    @RequestMapping(value = "/test/other.do", params = "type=update", method = RequestMethod.GET)
    public ModelAndView sample2() {
        HomeController();
        log.info("update");
        return new ModelAndView("home");
    }

    /**
     * 기본값 설정해서 Parameter 받기
     * localhost:8080/default.do?
     * "test" 라는 parameter가 없으면 test에 StringTest를 넣는다.
     * default value setting
     */
    @RequestMapping(value = "/test/default.do", method = RequestMethod.GET)
    public ModelAndView sample3(@RequestParam(value = "test", defaultValue = "StringTest") String test) {
        HomeController();
        log.info(test);
        return new ModelAndView("home");
    }

    /**
     * Exception Method Test
     */
    @RequestMapping(value = "/test/exception.do", method = RequestMethod.GET)
    public ModelAndView exception() {
        HomeController();
        throw new GrantAccessDeniedException(BusinessExceptionType.GRANT_EXCEPTION);
        /*return new ModelAndView("home");*/
    }

    /**
     * Default Value가 있는 Model의 경우
     */
    @RequestMapping(value = "/test/defaultModel.do", method = RequestMethod.GET)
    public ModelAndView defaultValueModel() {
        HomeController();
        TestModel testModel = new TestModel();
        log.info(testModel);
        return new ModelAndView("home");
    }

    /**
     * File Download Logic Test
     * path.properties
     */

    @Value("${path.upload_path}")
    private String path;

    @Autowired
    ResourceLoader resourceLoader;

    @RequestMapping("/download/file.do")
    public ResponseEntity<InputStreamResource> download(@RequestParam("name") String filename) throws FileNotFoundException {
        HomeController();
        File file = new File(path, filename);
        InputStreamResource resource = null;
        resource = new InputStreamResource(new FileInputStream(file));
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getName() + "\"")
                .contentLength(file.length())
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(resource);
    }

    /**
     * File Upload Test Logic
     */
    /*Post File Upload*/
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public ModelAndView upload(UploadForm uploadForm) throws Exception {
        HomeController();
        log.info(uploadForm);
        if (uploadForm.getFile().getSize() != 0) {
            log.info("originalName:" + uploadForm.getFile().getOriginalFilename());
            log.info("size:" + uploadForm.getFile().getSize());
            log.info("ContentType:" + uploadForm.getFile().getContentType());
        }
        String savedName = fileUploadUtility.uploadFile("cdn_path", uploadForm.getFile().getOriginalFilename(), uploadForm.getFile().getBytes(), Constant.LOCAL_SAVE);
        VIEW.addObject("savedName", savedName);
        return VIEW;
    }

    /**
     * Files Upload Test Logic
     * Type <input type="file" multiple="multiple"/>
     * UploadForm -> private List<MultipartFile> files;
     */
    /*Post Files Upload*/
    @RequestMapping(value = "/uploads.do", method = RequestMethod.POST)
    public ModelAndView uploadsMultiple(UploadForm uploadForm) throws Exception {
        HomeController();
        ArrayList<String> names = new ArrayList<>();
        HashMap<String, MultipartFile> hashMap = new HashMap<>();
        for (int i = 0; i < uploadForm.getFiles().size(); i++) {
            hashMap.put("files" + i, uploadForm.getFiles().get(i));
        }
        for (Map.Entry<String, MultipartFile> entry : hashMap.entrySet()) {
            MultipartFile file = entry.getValue();
            if (file.getSize() != 0) {
                log.info("File originalName:" + file.getOriginalFilename());
                log.info("File Size:" + file.getSize());
                log.info("File ContentType:" + file.getContentType());
            }
            String savedName = fileUploadUtility.uploadFile("cdn_path", file.getOriginalFilename(), file.getBytes(), Constant.LOCAL_SAVE);
            names.add(savedName);
        }
        log.info(names);
        VIEW.addObject("savedNames", names);
        return VIEW;
    }

    /**
     * Files Upload Test Logic
     * Type <input type="file" name="file-1"/>
     * Type <input type="file" name="file-2"/>
     * Type <input type="file" name="file-3"/>
     * Upload
     */
    /*Post Files Upload*/
    @RequestMapping(value = "/uploadsOther.do", method = RequestMethod.POST)
    public ModelAndView uploads(@RequestParam Map<String, MultipartFile> fileMap, UploadForm uploadForm) throws Exception {
        HomeController();
        ArrayList<String> names = new ArrayList<>();
        for (Map.Entry<String, MultipartFile> entry : fileMap.entrySet()) {
            MultipartFile file = entry.getValue();
            if (file.getSize() != 0) {
                log.info("File originalName:" + file.getOriginalFilename());
                log.info("File Size:" + file.getSize());
                log.info("File ContentType:" + file.getContentType());
            }
            String savedName = fileUploadUtility.uploadFile("cdn_path", file.getOriginalFilename(), file.getBytes(), Constant.LOCAL_SAVE);
            names.add(savedName);
        }
        log.info(names);
        VIEW.addObject("savedNames", names);
        return VIEW;
    }

    /**
     * Lombok Annotation Logic
     *
     * @RequiredArgsConstructor -> @NonNull 변수들로 생성자 만듬
     * @NoArgsConstructor -> 파라미터로 아무것도 받지 않는 생성자 (이 경우 @Data 못사용)
     * @AllArgsConstructor -> 전체 파라미터로 받는 생성자 생성 (이 경우 @Data 못사용)
     * @NonNull Annotation을 진행하면 생성자 생성시 해당 변수를 필수로 하는 생성자 생성
     */

    @AllArgsConstructor
    @RequiredArgsConstructor
    @NoArgsConstructor
    @Data //@Getter, @Setter, @RequiredArgsConstructor, @ToString @EqualsAndHashCode
    public class LombokClass1 {
        private String id;
        @NonNull
        private String password;
        private int u_id;
    }

    @RequestMapping(value = "/lombok1.do", method = RequestMethod.GET)
    public ModelAndView lombok1() {
        HomeController();
        LombokClass1 lombokClass1 = new LombokClass1("password");
        return VIEW;
    }

    /**
     * ----------------------------------------------------------------------
     */
    @Data //@Getter, @Setter, @RequiredArgsConstructor, @ToString @EqualsAndHashCode
    public class LombokClass2 {
        private String id;
        @NonNull
        private String password;
        private int u_id;
    }

    @RequestMapping(value = "/lombok2.do", method = RequestMethod.GET)
    public ModelAndView lombok2() {
        HomeController();
        LombokClass2 lombokClass2 = new LombokClass2("password");
        LombokClass2 lombokClass2_1 = new LombokClass2("password");
        log.info("Lombok Boolean Test 1 : " + lombokClass2_1.equals(lombokClass2));
        /*기댓값 true*/

        lombokClass2.setId("id");
        log.info("Lombok Boolean Test 2 : " + lombokClass2_1.equals(lombokClass2));
        /*기댓값 false*/
        return VIEW;
    }

    @Setter
    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @RequiredArgsConstructor
    /*@ToString(exclude = "password")*/ //LombokClass3.toString() 진행 시 password 빼고 로그가 찍힌다.
    @ToString(exclude = {"password", "u_id"}) //LombokClass3.toString() 진행 시 password와 u_id 빼고 로그가 찍힌다.
    public class LombokClass3 {
        private String id;
        @NonNull
        private String password;
        private int u_id;
    }

    @RequestMapping(value = "/lombok3.do", method = RequestMethod.GET)
    public ModelAndView lombok3() {
        HomeController();
        LombokClass3 lombokClass3 = new LombokClass3();
        LombokClass3 lombokClass3_1 = new LombokClass3("password");
        LombokClass3 lombokClass3_2 = new LombokClass3("id", "password", 0);
        log.info(lombokClass3_2.toString());
        /*기댓값 ID만 뽑힘*/
        return VIEW;
    }

    /**
     * ----------------------------------------------------------------------
     */

    /**
     * Ajax Test
     */
    @CrossOrigin(origins = {"http://localhost:8080", "https://[domain]", "http://[domain]"})
    @ResponseBody
    @RequestMapping(value = "/ajax.do", method = RequestMethod.GET)
    public ResponseEntity<String> ajax() throws JSONException {
        HomeController();
        Message message = new Message();
        message.put("test", new User("zlzldntlr@naver.com", "zlzldntlr", "김우식"));
        message.put("test1", "object string test");
        return new ResponseEntity(
                DefaultRes.res(
                        StatusCode.TEST, message.getHashMap("ajax")
                ), HttpStatus.OK
        );
    }

    /**
     * General Filter 임시 차단 URL Test
     */
    @RequestMapping(value = "/block.do", method = RequestMethod.GET)
    public ModelAndView block() {
        HomeController();
        log.info("해당 문자가 찍어야하는데 안찍힘 Filter에서 블락되었기 때문에");
        return VIEW;
    }

    /**
     * 위에서 URL TEST에서 실패할 경우 아래 함수로 들어온다.
     */
    @RequestMapping(value = "/error.do", method = RequestMethod.GET)
    public ModelAndView error() {
        HomeController();
        VIEW.setViewName("error/recover");
        return VIEW;
    }
}