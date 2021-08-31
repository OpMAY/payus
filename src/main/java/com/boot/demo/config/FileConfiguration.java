package com.boot.demo.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class FileConfiguration implements WebMvcConfigurer {

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setDefaultEncoding("UTF-8"); // 파일 인코딩 설정
        multipartResolver.setMaxUploadSize(50 * 1024 * 1024); //Total Multipart Size 50MB
        multipartResolver.setMaxUploadSizePerFile(10 * 1024 * 1024); //File/per 10MB
        return multipartResolver;
    }


}
