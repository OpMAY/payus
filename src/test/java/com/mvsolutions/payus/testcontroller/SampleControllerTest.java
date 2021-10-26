package com.mvsolutions.payus.testcontroller;

import com.mvsolutions.payus.restcontroller.SampleController;
import lombok.extern.log4j.Log4j;
import org.junit.jupiter.api.Test;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * 1. 요청 경로에 대해 적절한 Handler Method가 호출 되는가?
 * 2. 입력 파라미터는 Handler Method에 잘 전달 되는가?
 * 3. Model에 설정한 값은 잘 참조 되는가?
 * 4. 요청 결과 페이지는 잘 연결 되는가?
 * <p>
 * 해당 클래스는 MockMvc Doc에서 확인 가능합니다. 지원하는 메소드는 .perform()입니다.
 * 이 메소드가 리턴하는 객체는 ResultActions라는 인터페이스입니다.
 * this.mockMvc.perform(get("/")) // basic
 * this.mockMvc.perform(post("/")) // send post
 * this.mockMvc.perform(get("/?foo={var}", "1")) // query string
 * this.mockMvc.perform(get("/").param("bar", "2")) // using param
 * this.mockMvc.perform(get("/").accept(MediaType.ALL)) // select media type
 * <p>
 * // status 값이 정상인 경우를 기대하고 만든 체이닝 메소드 중 일부입니다.
 * .andExpect(status().isOk())
 * // contentType을 검증합니다.
 * .andExpect(content().contentType("application/json;charset=utf-8"))
 * <p>
 * mockMvc 객체로 테스트 중 한글이 깨지는 경우
 *
 * @RequestMapping(value = "/", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
 * <p>
 * .andDo(print())
 * 요청에 대한 처리를 합니다. print() 메소드가 일반적입니다.
 * <p>
 * <p>
 * {"message":"val"} 이라는 response를 받았는지 검증하려면 아래처럼 사용하세요.
 * .andExpect(jsonPath("$.message").value("val"))
 * <p>
 * 초기에는 post 제외하고 get
 */
@Log4j
@WebMvcTest(controllers = SampleController.class)
@AutoConfigureMockMvc
class SampleControllerTest {
    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    public MockMvc mockMvc;

    @Before
    public void setup() {
        this.mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    void getTest() throws Exception {
        MvcResult mvcResult = this.mockMvc.perform(get("/test/{no}", 1))
                .andDo(print())
                .andExpect(status().isOk())
                .andExpect(content().string("{\"status\":200,\"data\":{\"test\":{\"no\":1,\"testcol\":\"testcol\"}}}"))
                .andReturn();
    }

    @Test
    void getURLEncoding() throws Exception {
        MvcResult mvcResult = this.mockMvc.perform(get("/test/encoding"))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    void getImageURLDecoding() throws Exception {
        MvcResult mvcResult = this.mockMvc.perform(get("/test/decoding"))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    void getConsumesProtocol() throws Exception {
        MvcResult mvcResult = this.mockMvc.perform(post("/test/consumes").contentType(MediaType.APPLICATION_JSON))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();
    }

    @Test
    void getConsumesFileProtocol() throws Exception {
        MockMultipartFile file = new MockMultipartFile("file", "filename.txt", MediaType.TEXT_PLAIN_VALUE, "filecontents".getBytes());
        MvcResult mvcResult = this.mockMvc.perform(
                MockMvcRequestBuilders.multipart("/test/consumesfile").file(file)
                        .param("data", "testdata")
                        .contentType(MediaType.MULTIPART_FORM_DATA_VALUE))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();
    }


    @Test
    void getConsumesFilesProtocol() throws Exception {
        MockMultipartFile file = new MockMultipartFile("files", "filename.txt", MediaType.TEXT_PLAIN_VALUE, "filecontents".getBytes());
        MvcResult mvcResult = this.mockMvc.perform(MockMvcRequestBuilders.fileUpload("/test/consumesfiles")
                .file(file)
                .file(file)
                .file(file)
                .param("data", "testdata")
                .contentType(MediaType.MULTIPART_FORM_DATA_VALUE))
                .andDo(print())
                .andExpect(status().isOk())
                .andReturn();
    }
}