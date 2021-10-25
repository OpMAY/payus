package com.mvsolutions.payus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication(scanBasePackages = "com.mvsolutions.payus.*")
@ComponentScan(basePackages = "com.mvsolutions.payus.*") //Test Controller 할때 반드시 적용해줘야함
public class PayusApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(PayusApplication.class);
    }

    public static void main(String[] args) {
        SpringApplication.run(PayusApplication.class, args);
    }

}
