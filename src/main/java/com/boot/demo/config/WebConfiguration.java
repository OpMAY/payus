package com.boot.demo.config;

import com.boot.demo.interceptor.MvcInterceptor;
import com.boot.demo.interceptor.RestInterceptor;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CommonsRequestLoggingFilter;
import org.springframework.web.servlet.config.annotation.EnableWebMvc; // 시발...이것때문에 안됬었네...ㅠㅠ 몇시간을 날린거야
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.List;

@Configuration
@Log4j
public class WebConfiguration implements WebMvcConfigurer {

    private List<String> rest_interceptor_excluded_urls;
    private List<String> mvc_interceptor_excluded_urls;

    @PostConstruct
    public void WebConfiguration() {
        rest_interceptor_excluded_urls = new ArrayList<>();
        rest_interceptor_excluded_urls.add("/api/auth");
        rest_interceptor_excluded_urls.add("/api/auth");
    }

    public WebConfiguration() {
        log.info("WebConfiguration Initialize");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources");
        log.info("registry swagger-ui.html addResourceHandler");
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/")
                .setCachePeriod(3600);
    }

    @Autowired
    private RestInterceptor restInterceptor;
    @Autowired
    private MvcInterceptor mvcInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(restInterceptor)
                .addPathPatterns("/api/**")
                .excludePathPatterns(rest_interceptor_excluded_urls);
        registry.addInterceptor(mvcInterceptor)
                .addPathPatterns("*.do");
        /*.excludePathPatterns(mvc_interceptor_excluded_urls);*/
    }

    /**Protocol Logging*/
    /*@Bean
    public CommonsRequestLoggingFilter requestLoggingFilter() {
        CommonsRequestLoggingFilter c = new CommonsRequestLoggingFilter();
        c.setIncludeHeaders(true);
        c.setIncludeQueryString(true);
        c.setIncludePayload(true);
        c.setIncludeClientInfo(true);
        c.setMaxPayloadLength(100000);
        return c;
    }*/
}
